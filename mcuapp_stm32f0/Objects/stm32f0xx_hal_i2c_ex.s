; generated by Component: ARM Compiler 5.05 update 1 (build 106) Tool: ArmCC [4d0efa]
; commandline ArmCC [--c99 --split_sections --debug -c --asm -o.\objects\stm32f0xx_hal_i2c_ex.o --depend=.\objects\stm32f0xx_hal_i2c_ex.d --cpu=Cortex-M0 --apcs=interwork -O0 --diag_suppress=9931 -IC:\Users\Tom\Documents\Projects\Scopy_MVP_Platform\scopy-fpga\mcuapp_stm32f0\RTE -IC:\Users\Tom\Documents\Projects\Scopy_MVP_Platform\scopy-fpga\mcuapp_stm32f0\RTE\Device\STM32F071VBTx -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\5.4.0\CMSIS\Core\Include -IC:\Keil_v5\ARM\PACK\Keil\STM32F0xx_DFP\2.0.0 -IC:\Keil_v5\ARM\PACK\Keil\STM32F0xx_DFP\2.0.0\Drivers\CMSIS\Device\ST\STM32F0xx\Include -IC:\Keil_v5\ARM\PACK\Keil\STM32F0xx_DFP\2.0.0\Drivers\STM32F0xx_HAL_Driver\Inc -IC:\Keil_v5\ARM\PACK\Keil\STM32F0xx_DFP\2.0.0\Drivers\STM32F0xx_HAL_Driver\Inc\Legacy -D__UVISION_VERSION=514 -D_RTE_ -DSTM32F071xB --omf_browse=.\objects\stm32f0xx_hal_i2c_ex.crf C:\Keil_v5\ARM\PACK\Keil\STM32F0xx_DFP\2.0.0\Drivers\STM32F0xx_HAL_Driver\Src\stm32f0xx_hal_i2c_ex.c]
        THUMB
        REQUIRE8
        PRESERVE8

        AREA ||i.HAL_I2CEx_ConfigAnalogFilter||, CODE, READONLY, ALIGN=1

HAL_I2CEx_ConfigAnalogFilter PROC
        MOV      r2,r0
        MOVS     r0,#0x41
        LDRB     r0,[r0,r2]
        CMP      r0,#0x20
        BNE      |L1.106|
        NOP      
        MOVS     r0,#0x40
        LDRB     r0,[r0,r2]
        CMP      r0,#1
        BNE      |L1.24|
        MOVS     r0,#2
|L1.22|
        BX       lr
|L1.24|
        MOVS     r3,#1
        MOVS     r0,#0x40
        STRB     r3,[r0,r2]
        NOP      
        MOVS     r3,#0x24
        MOVS     r0,#0x41
        STRB     r3,[r0,r2]
        LDR      r0,[r2,#0]
        LDR      r0,[r0,#0]
        LSRS     r0,r0,#1
        LSLS     r0,r0,#1
        LDR      r3,[r2,#0]
        STR      r0,[r3,#0]
        LDR      r0,[r2,#0]
        LDR      r0,[r0,#0]
        MOVS     r3,#1
        LSLS     r3,r3,#12
        BICS     r0,r0,r3
        LDR      r3,[r2,#0]
        STR      r0,[r3,#0]
        LDR      r0,[r2,#0]
        LDR      r0,[r0,#0]
        ORRS     r0,r0,r1
        LDR      r3,[r2,#0]
        STR      r0,[r3,#0]
        LDR      r0,[r2,#0]
        LDR      r0,[r0,#0]
        MOVS     r3,#1
        ORRS     r0,r0,r3
        LDR      r3,[r2,#0]
        STR      r0,[r3,#0]
        MOVS     r3,#0x20
        MOVS     r0,#0x41
        STRB     r3,[r0,r2]
        NOP      
        MOVS     r3,#0
        MOVS     r0,#0x40
        STRB     r3,[r0,r2]
        NOP      
        MOVS     r0,#0
        B        |L1.22|
|L1.106|
        MOVS     r0,#2
        B        |L1.22|
        ENDP


        AREA ||i.HAL_I2CEx_ConfigDigitalFilter||, CODE, READONLY, ALIGN=1

HAL_I2CEx_ConfigDigitalFilter PROC
        PUSH     {r4,lr}
        MOV      r2,r0
        MOV      r3,r1
        MOVS     r1,#0
        MOVS     r0,#0x41
        LDRB     r0,[r0,r2]
        CMP      r0,#0x20
        BNE      |L2.110|
        NOP      
        MOVS     r0,#0x40
        LDRB     r0,[r0,r2]
        CMP      r0,#1
        BNE      |L2.30|
        MOVS     r0,#2
|L2.28|
        POP      {r4,pc}
|L2.30|
        MOVS     r4,#1
        MOVS     r0,#0x40
        STRB     r4,[r0,r2]
        NOP      
        MOVS     r4,#0x24
        MOVS     r0,#0x41
        STRB     r4,[r0,r2]
        LDR      r0,[r2,#0]
        LDR      r0,[r0,#0]
        LSRS     r0,r0,#1
        LSLS     r0,r0,#1
        LDR      r4,[r2,#0]
        STR      r0,[r4,#0]
        LDR      r0,[r2,#0]
        LDR      r1,[r0,#0]
        MOVS     r4,#0xf
        LSLS     r4,r4,#8
        MOV      r0,r1
        BICS     r0,r0,r4
        MOV      r1,r0
        LSLS     r0,r3,#8
        ORRS     r1,r1,r0
        LDR      r0,[r2,#0]
        STR      r1,[r0,#0]
        LDR      r0,[r2,#0]
        LDR      r0,[r0,#0]
        MOVS     r4,#1
        ORRS     r0,r0,r4
        LDR      r4,[r2,#0]
        STR      r0,[r4,#0]
        MOVS     r4,#0x20
        MOVS     r0,#0x41
        STRB     r4,[r0,r2]
        NOP      
        MOVS     r4,#0
        MOVS     r0,#0x40
        STRB     r4,[r0,r2]
        NOP      
        MOVS     r0,#0
        B        |L2.28|
|L2.110|
        MOVS     r0,#2
        B        |L2.28|
        ENDP


        AREA ||i.HAL_I2CEx_DisableFastModePlus||, CODE, READONLY, ALIGN=2

HAL_I2CEx_DisableFastModePlus PROC
        PUSH     {r3,lr}
        NOP      
        LDR      r1,|L3.44|
        LDR      r1,[r1,#0x18]
        MOVS     r2,#1
        ORRS     r1,r1,r2
        LDR      r2,|L3.44|
        STR      r1,[r2,#0x18]
        MOV      r1,r2
        LDR      r1,[r1,#0x18]
        LSLS     r1,r1,#31
        LSRS     r1,r1,#31
        STR      r1,[sp,#0]
        NOP      
        NOP      
        LDR      r1,|L3.48|
        LDR      r1,[r1,#0]
        BICS     r1,r1,r0
        LDR      r2,|L3.48|
        STR      r1,[r2,#0]
        POP      {r3,pc}
        ENDP

        DCW      0x0000
|L3.44|
        DCD      0x40021000
|L3.48|
        DCD      0x40010000

        AREA ||i.HAL_I2CEx_DisableWakeUp||, CODE, READONLY, ALIGN=1

HAL_I2CEx_DisableWakeUp PROC
        MOV      r1,r0
        MOVS     r0,#0x41
        LDRB     r0,[r0,r1]
        CMP      r0,#0x20
        BNE      |L4.96|
        NOP      
        MOVS     r0,#0x40
        LDRB     r0,[r0,r1]
        CMP      r0,#1
        BNE      |L4.24|
        MOVS     r0,#2
|L4.22|
        BX       lr
|L4.24|
        MOVS     r2,#1
        MOVS     r0,#0x40
        STRB     r2,[r0,r1]
        NOP      
        MOVS     r2,#0x24
        MOVS     r0,#0x41
        STRB     r2,[r0,r1]
        LDR      r0,[r1,#0]
        LDR      r0,[r0,#0]
        LSRS     r0,r0,#1
        LSLS     r0,r0,#1
        LDR      r2,[r1,#0]
        STR      r0,[r2,#0]
        LDR      r0,[r1,#0]
        LDR      r0,[r0,#0]
        MOVS     r2,#1
        LSLS     r2,r2,#18
        BICS     r0,r0,r2
        LDR      r2,[r1,#0]
        STR      r0,[r2,#0]
        LDR      r0,[r1,#0]
        LDR      r0,[r0,#0]
        MOVS     r2,#1
        ORRS     r0,r0,r2
        LDR      r2,[r1,#0]
        STR      r0,[r2,#0]
        MOVS     r2,#0x20
        MOVS     r0,#0x41
        STRB     r2,[r0,r1]
        NOP      
        MOVS     r2,#0
        MOVS     r0,#0x40
        STRB     r2,[r0,r1]
        NOP      
        MOVS     r0,#0
        B        |L4.22|
|L4.96|
        MOVS     r0,#2
        B        |L4.22|
        ENDP


        AREA ||i.HAL_I2CEx_EnableFastModePlus||, CODE, READONLY, ALIGN=2

HAL_I2CEx_EnableFastModePlus PROC
        PUSH     {r3,lr}
        NOP      
        LDR      r1,|L5.44|
        LDR      r1,[r1,#0x18]
        MOVS     r2,#1
        ORRS     r1,r1,r2
        LDR      r2,|L5.44|
        STR      r1,[r2,#0x18]
        MOV      r1,r2
        LDR      r1,[r1,#0x18]
        LSLS     r1,r1,#31
        LSRS     r1,r1,#31
        STR      r1,[sp,#0]
        NOP      
        NOP      
        LDR      r1,|L5.48|
        LDR      r1,[r1,#0]
        ORRS     r1,r1,r0
        LDR      r2,|L5.48|
        STR      r1,[r2,#0]
        POP      {r3,pc}
        ENDP

        DCW      0x0000
|L5.44|
        DCD      0x40021000
|L5.48|
        DCD      0x40010000

        AREA ||i.HAL_I2CEx_EnableWakeUp||, CODE, READONLY, ALIGN=1

HAL_I2CEx_EnableWakeUp PROC
        MOV      r1,r0
        MOVS     r0,#0x41
        LDRB     r0,[r0,r1]
        CMP      r0,#0x20
        BNE      |L6.96|
        NOP      
        MOVS     r0,#0x40
        LDRB     r0,[r0,r1]
        CMP      r0,#1
        BNE      |L6.24|
        MOVS     r0,#2
|L6.22|
        BX       lr
|L6.24|
        MOVS     r2,#1
        MOVS     r0,#0x40
        STRB     r2,[r0,r1]
        NOP      
        MOVS     r2,#0x24
        MOVS     r0,#0x41
        STRB     r2,[r0,r1]
        LDR      r0,[r1,#0]
        LDR      r0,[r0,#0]
        LSRS     r0,r0,#1
        LSLS     r0,r0,#1
        LDR      r2,[r1,#0]
        STR      r0,[r2,#0]
        LDR      r0,[r1,#0]
        LDR      r0,[r0,#0]
        MOVS     r2,#1
        LSLS     r2,r2,#18
        ORRS     r0,r0,r2
        LDR      r2,[r1,#0]
        STR      r0,[r2,#0]
        LDR      r0,[r1,#0]
        LDR      r0,[r0,#0]
        MOVS     r2,#1
        ORRS     r0,r0,r2
        LDR      r2,[r1,#0]
        STR      r0,[r2,#0]
        MOVS     r2,#0x20
        MOVS     r0,#0x41
        STRB     r2,[r0,r1]
        NOP      
        MOVS     r2,#0
        MOVS     r0,#0x40
        STRB     r2,[r0,r1]
        NOP      
        MOVS     r0,#0
        B        |L6.22|
|L6.96|
        MOVS     r0,#2
        B        |L6.22|
        ENDP


        AREA ||.arm_vfe_header||, DATA, READONLY, NOALLOC, ALIGN=2

        DCD      0x00000000

;*** Start embedded assembler ***

#line 1 "C:\\Keil_v5\\ARM\\PACK\\Keil\\STM32F0xx_DFP\\2.0.0\\Drivers\\STM32F0xx_HAL_Driver\\Src\\stm32f0xx_hal_i2c_ex.c"
	AREA ||.rev16_text||, CODE
	THUMB
	EXPORT |__asm___22_stm32f0xx_hal_i2c_ex_c_a642fad8____REV16|
#line 463 "C:\\Keil_v5\\ARM\\PACK\\ARM\\CMSIS\\5.4.0\\CMSIS\\Core\\Include\\cmsis_armcc.h"
|__asm___22_stm32f0xx_hal_i2c_ex_c_a642fad8____REV16| PROC
#line 464

 rev16 r0, r0
 bx lr
	ENDP
	AREA ||.revsh_text||, CODE
	THUMB
	EXPORT |__asm___22_stm32f0xx_hal_i2c_ex_c_a642fad8____REVSH|
#line 478
|__asm___22_stm32f0xx_hal_i2c_ex_c_a642fad8____REVSH| PROC
#line 479

 revsh r0, r0
 bx lr
	ENDP

;*** End   embedded assembler ***

        EXPORT HAL_I2CEx_ConfigAnalogFilter [CODE]
        EXPORT HAL_I2CEx_ConfigDigitalFilter [CODE]
        EXPORT HAL_I2CEx_DisableFastModePlus [CODE]
        EXPORT HAL_I2CEx_DisableWakeUp [CODE]
        EXPORT HAL_I2CEx_EnableFastModePlus [CODE]
        EXPORT HAL_I2CEx_EnableWakeUp [CODE]

        IMPORT ||Lib$$Request$$armlib|| [CODE,WEAK]

        ATTR FILESCOPE
        ATTR SETVALUE Tag_ABI_PCS_wchar_t,2
        ATTR SETVALUE Tag_ABI_enum_size,1
        ATTR SETVALUE Tag_ABI_optimization_goals,6
        ATTR SETSTRING Tag_conformance,"2.06"
        ATTR SETVALUE AV,18,1

        ASSERT {ENDIAN} = "little"
        ASSERT {INTER} = {TRUE}
        ASSERT {ROPI} = {FALSE}
        ASSERT {RWPI} = {FALSE}
        ASSERT {IEEE_FULL} = {FALSE}
        ASSERT {IEEE_PART} = {FALSE}
        ASSERT {IEEE_JAVA} = {FALSE}
        END