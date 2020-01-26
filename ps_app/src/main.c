/******************************************************************************
*
* Copyright (C) 2009 - 2014 Xilinx, Inc.  All rights reserved.
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* Use of the Software is limited solely to applications:
* (a) running on a Xilinx device, or
* (b) that interact with a Xilinx device through a bus or interconnect.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
* XILINX  BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
* WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF
* OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
* SOFTWARE.
*
* Except as contained in this notice, the name of the Xilinx shall not be used
* in advertising or otherwise to promote the sale, use or other dealings in
* this Software without prior written authorization from Xilinx.
*
******************************************************************************/

/*
 * main entry point for hacky Scopy tests
 */

#include <stdio.h>
#include <stdarg.h>
#include <ctype.h>

#include "platform.h"
#include "xil_printf.h"
#include "xil_types.h"
#include "xil_cache.h"
#include "xil_io.h"
#include "xil_testmem.h"
#include "xuartps_hw.h"
#include "xgpiops.h"
#include "xaxidma.h"
#include "xscugic.h"
#include "xscutimer.h"
#include "xdebug.h"

uint32_t *mem_addr;
uint32_t *base;

#define PACKET_MAXSIZE			16383

#define INTC					XScuGic
#define INTC_HANDLER			XScuGic_InterruptHandler
#define RESET_TIMEOUT_COUNTER	10000

#define RX_INTR_ID				XPAR_FABRIC_AXIDMA_0_S2MM_INTROUT_VEC_ID
#define TX_INTR_ID				XPAR_FABRIC_AXIDMA_0_MM2S_INTROUT_VEC_ID

#define INTC_DEVICE_ID          XPAR_SCUGIC_SINGLE_DEVICE_ID

static INTC Intc;	/* Instance of the Interrupt Controller */

#define TIMER_TICKS_TO_S		(2.0f / XPAR_PS7_CORTEXA9_0_CPU_CLK_FREQ_HZ)
#define TIMER_TICKS_TO_US		(TIMER_TICKS_TO_S * 1e6)

// These MUST be on 1MB boundaries to allow the cache to be invalidated safely
// and they MUST be integer MB in size
uint8_t rx_buffer[1 << 23] __attribute__((aligned (1048576)));
uint8_t tx_buffer[1 << 23] __attribute__((aligned (1048576)));

//#define MEM_TEST

XAxiDma dma0_pointer;
XAxiDma_Config *dma0_config;
XGpioPs gpio;
XGpioPs_Config *gpio_config;

XScuTimer xscu_timer;
XScuTimer_Config *xscu_timer_cfg;

uint32_t timer0, timer1;
uint32_t tdelta;

volatile uint32_t ioc_flag = 0;
volatile uint32_t err_flag = 0;

#define MARK_UNCACHEABLE	0x701

void debug_printf(char *fmt, ...)
{
	char buffer[1024];

	va_list args;
	va_start(args, fmt);

	vsnprintf(buffer, 1024, fmt, args);
	print(buffer);

	va_end(args);
}

void arb_delay(uint32_t n)
{
	while(n--) {
		__asm__("nop");
	}
}


/*
 * For hacking/test purposes.
 * (C) Xilinx, Inc. https://www.xilinx.com/Attachment/xaxidma_example_sg_intr.c
 */
static void RxIntrHandler(void *Callback)
{
	XAxiDma_BdRing *RxRingPtr = (XAxiDma_BdRing *) Callback;
	u32 IrqStatus;
	u32 AxiStatus;
	int TimeOut;

	/* Read pending interrupts */
	IrqStatus = XAxiDma_BdRingGetIrq(RxRingPtr);

	/* ACK at DMA peripheral. */
	//XAxiDma_IntrAckIrq(&dma0_pointer, XAXIDMA_IRQ_ALL_MASK, XAXIDMA_DMA_TO_DEVICE);

	/* Acknowledge pending interrupts */
	XAxiDma_BdRingAckIrq(RxRingPtr, IrqStatus);

	//debug_printf("irq=0x%08x\r\n", IrqStatus);

	/*
	 * If no interrupt is asserted, we do not do anything
	 */
#if 0
	if (!(IrqStatus & XAXIDMA_IRQ_ALL_MASK)) {
		//debug_printf("NoIRQ?\r\n");
		return;
	}
#endif

	/*
	 * If error interrupt is asserted, raise error flag, reset the
	 * hardware to recover from the error, and return with no further
	 * processing.
	 */
#if 1
	if ((IrqStatus & XAXIDMA_IRQ_ERROR_MASK)) {
		err_flag = 1;
		//debug_printf("ErrorMask?\r\n");

#if 0
		/*
		 * Ignore DataMover error.  It's caused by not handling TLAST correctly which will be fixed in a
		 * later ADC controller version.
		 */
		AxiStatus = XAxiDma_ReadReg(RxRingPtr->ChanBase, XAXIDMA_SR_OFFSET);
		if (AxiStatus & (XAXIDMA_ERR_ALL_MASK & (~XAXIDMA_ERR_INTERNAL_MASK))) {
			XAxiDma_BdRingDumpRegs(RxRingPtr);

			/* Reset could fail and hang
			 * NEED a way to handle this or do not call it??
			 */
			XAxiDma_Reset(&dma0_pointer);

			TimeOut = RESET_TIMEOUT_COUNTER;

			while (TimeOut) {
				if(XAxiDma_ResetIsDone(&dma0_pointer)) {
					break;
				}

				TimeOut -= 1;
			}

			debug_printf("RST timeout=%d\r\n", TimeOut);

			return;
		}
#endif
	}
#endif

	/*
	 * If completion interrupt is asserted, call RX call back function
	 * to handle the processed BDs and then raise the according flag.
	 */
	if ((IrqStatus & (XAXIDMA_IRQ_DELAY_MASK | XAXIDMA_IRQ_IOC_MASK))) {
		//debug_printf("IOC!\r\n");
		ioc_flag = 1;
	}
}

static int SetupIntrSystem(INTC * IntcInstancePtr,
			   XAxiDma * AxiDmaPtr, u16 TxIntrId, u16 RxIntrId)
{
	XAxiDma_BdRing *TxRingPtr = XAxiDma_GetTxRing(AxiDmaPtr);
	XAxiDma_BdRing *RxRingPtr = XAxiDma_GetRxRing(AxiDmaPtr);
	int Status;

	XScuGic_Config *IntcConfig;

	/*
	 * Initialize the interrupt controller driver so that it is ready to
	 * use.
	 */
	IntcConfig = XScuGic_LookupConfig(INTC_DEVICE_ID);
	if (NULL == IntcConfig) {
		return XST_FAILURE;
	}

	Status = XScuGic_CfgInitialize(IntcInstancePtr, IntcConfig,
					IntcConfig->CpuBaseAddress);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}


	//XScuGic_SetPriorityTriggerType(IntcInstancePtr, TxIntrId, 0xA0, 0x3);

	XScuGic_SetPriorityTriggerType(IntcInstancePtr, RxIntrId, 0xA0, 0x3);

	/*
	 * Connect the device driver handler that will be called when an
	 * interrupt for the device occurs, the handler defined above performs
	 * the specific interrupt processing for the device.
	 */
	/*
	Status = XScuGic_Connect(IntcInstancePtr, TxIntrId,
				(Xil_InterruptHandler)TxIntrHandler,
				TxRingPtr);
	if (Status != XST_SUCCESS) {
		return Status;
	}
	*/

	Status = XScuGic_Connect(IntcInstancePtr, RxIntrId,
				(Xil_InterruptHandler)RxIntrHandler,
				RxRingPtr);
	if (Status != XST_SUCCESS) {
		return Status;
	}

	//XScuGic_Enable(IntcInstancePtr, TxIntrId);
	XScuGic_Enable(IntcInstancePtr, RxIntrId);

	/* Enable interrupts from the hardware */

	Xil_ExceptionInit();
	Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT,
			(Xil_ExceptionHandler)INTC_HANDLER,
			(void *)IntcInstancePtr);

	Xil_ExceptionEnable();

	return XST_SUCCESS;
}

void start_timing()
{
	XScuTimer_LoadTimer(&xscu_timer, 0xffffffff);
	XScuTimer_Start(&xscu_timer);

	timer1 = 0;
	timer0 = XScuTimer_GetCounterValue(&xscu_timer);
}

void stop_timing()
{
	timer1 = XScuTimer_GetCounterValue(&xscu_timer);
	tdelta = timer0 - timer1;
}

void dump_timing(char *s)
{
	debug_printf("%s [~%d CPU cycles (~%4.1f us)]\r\n", s, 2 * tdelta, tdelta * TIMER_TICKS_TO_US);
}

int main()
{
	uint32_t counter = 0, tog = 0;
	int32_t error;
	uint32_t t0, t1;
	uint32_t sz, i;
	uint32_t error_ctr = 0, success_ctr = 0;
	uint32_t this_value, last_value, last_error;
	uint32_t *ptr;
	float err_rate = 0.0f;

    init_platform();

	debug_printf("\033[2J\033[0m");
	debug_printf("\r\n\r\nDemoApp v1.0 - DMA controlled transfers\r\n");

	debug_printf("\r\n\r\nPress any key to start\r\n");
	inbyte();

	// Initialize the Scu Private Timer so that it is ready to use.
	xscu_timer_cfg = XScuTimer_LookupConfig(XPAR_PS7_SCUTIMER_0_DEVICE_ID);
	error = XScuTimer_CfgInitialize(&xscu_timer, xscu_timer_cfg, xscu_timer_cfg->BaseAddr);

	if (error != XST_SUCCESS) {
		xil_printf("ERROR: Initialising timer failed\r\n");
		while(1) ;
	}

	debug_printf("Timer ready\r\n");

	// Initialise the GPIO
	gpio_config = XGpioPs_LookupConfig(XPAR_PS7_GPIO_0_DEVICE_ID);
	error = XGpioPs_CfgInitialize(&gpio, gpio_config, gpio_config->BaseAddr);

	if (error != XST_SUCCESS) {
		xil_printf("ERROR: Initialising GPIO failed\r\n");
		while(1) ;
	}

	XGpioPs_SetDirectionPin(&gpio, 9, 1);
	XGpioPs_SetOutputEnablePin(&gpio, 9, 1);
	XGpioPs_WritePin(&gpio, 9, 1);

	XGpioPs_SetDirectionPin(&gpio, 37, 1);
	XGpioPs_SetOutputEnablePin(&gpio, 37, 1);
	XGpioPs_WritePin(&gpio, 37, 1);

	// EMIO ports all as outputs for now.  Inputs unused.
	XGpioPs_SetDirection(&gpio, 2, 0xffffffff);
	XGpioPs_SetDirection(&gpio, 3, 0xffffffff);

	debug_printf("GPIO block configured\r\n");

#if 0
	while(1) {
		XScuTimer_LoadTimer(&xscu_timer, 0xffffffff);
		XScuTimer_Start(&xscu_timer);

		t0 = XScuTimer_GetCounterValue(&xscu_timer);

		//
		while(1) {
			t1 = XScuTimer_GetCounterValue(&xscu_timer);

			//xil_printf("Value=%d\r\n", t0 - t1);

			if((t0 - t1) > 65535) {
				t0 = t1;
				tog = ~tog;
				XGpioPs_WritePin(&gpio, 9, tog);
			}
		}
	}
#endif

	dma0_config = XAxiDma_LookupConfig(XPAR_AXIDMA_0_DEVICE_ID);
	error = XAxiDma_CfgInitialize(&dma0_pointer, dma0_config);

	//debug_printf("XAxiDma_CfgInitialize error=%d\r\n", error);

	//debug_printf("TXBuff Addr=0x%08x\r\n", &tx_buffer);
	//debug_printf("RXBuff Addr=0x%08x\r\n", &rx_buffer);

	// Enable interrupts, we use interrupt mode
	SetupIntrSystem(&Intc, &dma0_pointer, TX_INTR_ID, RX_INTR_ID);


	//debug_printf("OK, done.\r\n");

	while(1) {
		counter = 0;
		sz = (1 << 22);

		debug_printf("\r\n\r\nPress any key to START\r\n");
		inbyte();
		//continue;

		XGpioPs_Write(&gpio, 2, 0x00000000);
		XGpioPs_Write(&gpio, 3, 0x00000000);

		start_timing();
		Xil_DCacheInvalidateRange(rx_buffer, PACKET_MAXSIZE);
		stop_timing();
		dump_timing("Invalidate cache");

		start_timing();
		XAxiDma_Reset(&dma0_pointer);
		stop_timing();
		dump_timing("Reset AXIDMA");

		// Disable IRQ first then enable it.  XAXIDMA_IRQ_ALL_MASK includes errors.  XAXIDMA_IRQ_IOC_MASK for Interrupt-on-Complete only.
		start_timing();
		XAxiDma_IntrDisable(&dma0_pointer, XAXIDMA_IRQ_ALL_MASK, XAXIDMA_DEVICE_TO_DMA);
		XAxiDma_IntrEnable(&dma0_pointer, XAXIDMA_IRQ_ALL_MASK, XAXIDMA_DEVICE_TO_DMA);
		stop_timing();
		dump_timing("Setup interrupts");

		error = XAxiDma_SimpleTransfer(&dma0_pointer, (uint8_t *) rx_buffer, sz, XAXIDMA_DEVICE_TO_DMA);
		//GpioPs_WritePin(&gpio, 37, 1);
		XGpioPs_Write(&gpio, 2, 0xffffffff);
		XGpioPs_Write(&gpio, 3, 0xffffffff);

		debug_printf("Waiting, Err=%d...\r\n", error);

		XGpioPs_WritePin(&gpio, 9, 1);
		start_timing();
		while(!ioc_flag) ;
		ioc_flag = 0;
		stop_timing();
		XGpioPs_WritePin(&gpio, 9, 0);
		dump_timing("Transfer interrupt");

		//arb_delay(1000000);

		debug_printf("TransferRate=%2.2f MiB/s\r\n", (sz * 1e-6) / (tdelta * TIMER_TICKS_TO_S));

		if(err_flag) {
			debug_printf("\033[91mERROR:\033[0m err_flag in interrupt was set\r\n");
		}

		err_flag = 0;
		debug_printf("Starting to verify memory...\r\n");

		// Verify data.
		ptr = rx_buffer;
		last_value = *ptr++;
		error_ctr = 0;
		success_ctr = 0;
		last_error = 0;

		start_timing();
		for(i = 1; i < (sz / 8); i++) {
			this_value = *ptr;

			if(((int32_t)this_value - (int32_t)last_value) != 1) {
				debug_printf("this_value: 0x%08x, last_value: 0x%08x, delta=%d, error_at_word=%d, since_last_error=%d\r\n", \
						this_value, last_value, (int32_t)this_value - (int32_t)last_value, i, i - last_error);
				error_ctr++;
				last_error = i;
			} else {
				success_ctr++;
			}

			/*
			if((i & 16383) == 0) {
				debug_printf("this_value: 0x%08x, last_value: 0x%08x, delta=%d\r\n", this_value, last_value, (int32_t)this_value - (int32_t)last_value);
			}
			*/

			if(1) {
				debug_printf("this_value: 0x%08x, last_value: 0x%08x, delta=%d\r\n", this_value, last_value, (int32_t)this_value - (int32_t)last_value);
			}

			last_value = this_value;
			ptr += 2; // move 8 bytes
		}

		stop_timing();
		dump_timing("Verify process");

		err_rate = (error_ctr * 100.0f) / (error_ctr + success_ctr);

		if(error_ctr > 0) {
			debug_printf("\033[91mERROR:\033[0m %d word errors (%d words OK, %2.5f%% error rate)\r\n", \
					error_ctr, success_ctr, err_rate);
		} else {
			debug_printf("\033[92mPASS: \033[0m %d words OK\r\n", success_ctr);
		}

		ioc_flag = 0;
		//error = XAxiDma_CfgInitialize(&dma0_pointer, dma0_config);

		start_timing();
		XAxiDma_Reset(&dma0_pointer);
		stop_timing();
		dump_timing("Controller reset");

#if 0
		start_timing();
		// Enable interrupts, we use interrupt mode
		//SetupIntrSystem(&Intc, &dma0_pointer, TX_INTR_ID, RX_INTR_ID);

		//XAxiDma_IntrDisable(&dma0_pointer, XAXIDMA_IRQ_ALL_MASK, XAXIDMA_DEVICE_TO_DMA);
		//XAxiDma_IntrEnable(&dma0_pointer, XAXIDMA_IRQ_ALL_MASK, XAXIDMA_DEVICE_TO_DMA);
		stop_timing();
		dump_timing("Interrupt setup");
#endif
	}

    cleanup_platform();

    return 0;
}