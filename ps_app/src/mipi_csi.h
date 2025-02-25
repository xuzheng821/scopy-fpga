/*
 * mipi_csi.h
 *
 * This file is part of YAOS and is licensed under the MIT License.
 *
 *  Created on: 25 Apr 2020
 *      Author: Tom
 */

#ifndef SRC_MIPI_CSI_H_
#define SRC_MIPI_CSI_H_

#include <stdint.h>

#include "hal.h"
#include "system_control.h"
#include "dma_bd.h"
#include "acquire.h"

#include "queue.h" // Collections-C

#include "xaxidma.h"
#include "xscugic.h"

#define MCSI_QUEUE_SIZE					64		// Max # of entries to support in the CSI queue.  Must be power of two.

#define MCSI_TYPE_UNDEF					0
#define MCSI_TYPE_ALLOC_UNDEF			1
#define MCSI_TYPE_RAW_MEMORY			2
#define MCSI_TYPE_WAVEFORM_RANGE		3
#define MCSI_TYPE_BITPACKED_WAVE		4

#define MCSI_WAVE_ALL					0xffffffff

#define MCSI_AXI_MAX_BD_SIZE			(1 << 18)	// 1 << 23

#define MCSI_FLAG_ERROR_TRANSFER_BUSY	0x0002
#define MCSI_FLAG_ERROR_PARAMETER		0x0004
#define MCSI_FLAG_ERROR_STOP_TIMEOUT	0x0008
#define MCSI_FLAG_TRANSFER_RUNNING		0x0100
#define MCSI_FLAG_QUEUE_EMPTY			0x0200
#define MCSI_FLAG_STOP_DONE				0x0400
#define MCSI_FLAG_CLOCK_IDLE_MODE_2		0x4000		// Clock idles between EoF and next SoF
#define MCSI_FLAG_CLOCK_IDLE_MODE_1		0x8000		// Clock idles between each packet

// Special flags that indicate the state from the CSI peripheral of the DONE and RUN flags
#define MCSI_FLAG_SPECIAL_HW_DSTATE		0x4000
#define MCSI_FLAG_SPECIAL_HW_RSTATE		0x8000

#define MCSI_FLAG_ERROR_MASK			(MCSI_FLAG_ERROR_TRANSFER_BUSY | MCSI_FLAG_ERROR_PARAMETER | MCSI_FLAG_ERROR_STOP_TIMEOUT)

#define MCSI_DEFAULT_LINE_WIDTH			2048
#define MCSI_DEFAULT_LINE_COUNT			8192
#define MCSI_PACKET_MAX_SIZE			(MCSI_DEFAULT_LINE_WIDTH * MCSI_DEFAULT_LINE_COUNT)

#define MCSI_DEFAULT_DATA_TYPE			0x2a
#define MCSI_DEFAULT_WCT				0x0000

#define MCSI_ST_IDLE					0
#define MCSI_ST_WAIT_FOR_XFER			1

#define MCSI_RET_OK						0
#define MCSI_RET_XAXIDMA_ERROR			-1

#define MCSI_WAVES_PAD_TO_NWAVES		0x0001

#define MCSI_MAGIC_HEADER_WAVES			0x50fa005365566157ULL
#define MCSI_HEADER_SIZE				512				// 512 bytes of the allocation are transferred out

#define CSI_TRIM_RATE					(4 * 1048576)	// Approx every 4 seconds we trim any excess BD allocations to keep memory available

#define CSI_TIMEOUT_STOP				1000

#define CSI_DEFAULT_BIT_CLOCK			400				// Specified in MHz, FP values acceptable.  450MHz default, experimentation required to establish max rate.

#define CSIRES_ERROR_WAVES				-1
#define CSIRES_OK						0

struct mipi_csi_stats_t {
	uint64_t data_xfer_bytes;					// Total bytes actually sent
	uint64_t num_bds_created;					// Total BD entries set up
	uint32_t items_queued;						// Items queued in total
	uint32_t items_alloc;						// Items queued that memory has been allocated for
	uint32_t items_freed;						// Items freed in total (should closely match alloc)
	float last_transfer_time_us;				// Last transfer time in microseconds
	float last_transfer_perf_mbs;				// Last transfer rate in MB/s
	uint64_t total_transfer_time_us;			// Total transfer time in microseconds
	float last_sg_total_time_us;				// Total time to prepare the last scatter-gather list
	float last_sg_bd_time_us;					// Time to prepare the last scatter-gather BD list (the O(n) part of the equation)
};

struct mipi_csi_wave_header_t {
	uint64_t magic_header;						// Magic sequence to identify this header
	uint16_t crc;								// CRC of all following bytes, up to the first reserved field
	uint16_t subpkt;							// Sub-packet number, normally '1'
	uint32_t seq;								// Sequence number for this xfer
	uint32_t n_waves_request;					// Number of waves requested
	uint32_t n_waves_done;						// Number of waves captured
	uint32_t start_wave_index;					// Starting wave index
	uint32_t end_wave_index;					// Ending wave index
	uint32_t wave_stride;						// Bytes between each wave
	uint32_t wave_length;						// Length of each wave

	uint32_t wavebuffer_ptr;					// Pointer for the waveform buffer
	uint32_t tagbuffer_ptr;						// Pointer for the waveform tag buffer (trigger indexes)

	struct sysctrl_health_t health;				// Health state
	struct mipi_csi_stats_t stats;				// Statistics

	char reserved1[1024];						// Reserved 1K bytes for data in future
};

struct mipi_csi_sg_config_t {
	uint32_t wave_start;
	uint32_t wave_end;
	uint32_t clip_start;
	uint32_t clip_end;
	uint32_t flags;
	uint32_t seq;
};

struct mipi_csi_stream_queue_item_t {
	int item_type;								// One of MCSI_TYPE_x values
	uint8_t data_type;							// Datatype to be passed to CSI FPGA core (becomes CSI datatype)
	uint16_t wct_header;						// Wordcount header to be passed to CSI FPGA core (becomes SOF/EOF wordcount field)
	uint32_t core_flags;						// Currently ignored, eventually due to be passed to the FPGA
	uint32_t calculated_size;					// Calculated size of any transfer in bytes, after the transfer has been processed and SG list packed
	void *free_done;							// Buffer to free when done.  If set to NULL, this is ignored.
	struct acq_buffer_t *wave_buffer_first;		// Pointer to wave buffer's first entry, if this queue item is a waveform
	struct dma_bd_ring_t *ring;					// Pointer for this configured ring (filled after this entry is processed and all BD entries calculated)
	struct mipi_csi_sg_config_t config;
};

struct mipi_csi_state_t {
	Queue *item_queue;
	XAxiDma mipi_dma;
	XAxiDma_Config *mipi_dma_config;

	// Pointer for the configured dma_bd_ring.
	struct dma_bd_ring_t *bd_ring;

	// State machine
	int state;
	int done : 1;

	// Control/status flags of type MIPI_CSI_FLAG_x.
	uint16_t flags;

	// Working item from the queue.  NULL if no working item.
	struct mipi_csi_stream_queue_item_t *working;

	// Last header
	struct mipi_csi_wave_header_t *header;

	// State of the transfer
	uint32_t transfer_size;
	uint32_t transfer_rem;

	// Default CSI parameters
	uint16_t csi_line_size, csi_line_count, csi_frame_wct;
	uint8_t csi_data_type;

	struct mipi_csi_stats_t stats;

	// Trigger pointer buffer
	uint32_t *trig_buffer_ptr;

	// Bitclock for CSI port in MHz.  Valid range approx 50 ~ 550MHz.
	float csi_bitclock;

	// Last time that a BD trim was performed in microseconds
	uint64_t last_bd_trim;
};

/*
 * MIPI CSI status: returned back to Pi host.
 *
 * Do not modify this structure without considering the changes required on
 * the Pi side first!
 */
struct __attribute__ ((packed)) mipi_csi_status_t {
	uint16_t flags;
	uint32_t data_rem;
	uint16_t queue_size;
};

/*
 * MIPI transfer size response.  Returns byte size of an all-waves
 * transfer, a trigger data transfer and one bitpacked wave transfer.
 *
 * Do not modify this structure without considering the changes required on
 * the Pi side first!
 */
struct __attribute__ ((packed)) mipi_tx_size_resp_t {
	uint32_t all_waves_size;
	uint32_t trigger_data_size;
	uint32_t bitpack_size;
};

extern struct mipi_csi_state_t g_mipi_csi_state;

void mipi_csi_init();
void mipi_csi_process_queue_item(struct mipi_csi_stream_queue_item_t *item);
void mipi_csi_set_datatype_and_frame_wct(uint8_t data_type, uint16_t frame_wct);
//int mipi_csi_generate_sg_list_for_buffer_range(uint32_t addr_start, uint32_t addr_end, struct mipi_csi_stream_queue_item_t *q_item);
int mipi_csi_generate_sg_list_for_waves(struct mipi_csi_stream_queue_item_t *q_item);

void mipi_csi_get_status(struct mipi_csi_status_t *status);
void mipi_csi_get_size_report(struct mipi_tx_size_resp_t *status);
void mipi_csi_tick();
int mcsi_get_task_done();

#endif // SRC_MIPI_CSI_H_
