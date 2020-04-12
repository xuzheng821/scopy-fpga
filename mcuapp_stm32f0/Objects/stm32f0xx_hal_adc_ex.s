; generated by Component: ARM Compiler 5.05 update 1 (build 106) Tool: ArmCC [4d0efa]
; commandline ArmCC [--c99 --split_sections --debug -c --asm -o.\objects\stm32f0xx_hal_adc_ex.o --depend=.\objects\stm32f0xx_hal_adc_ex.d --cpu=Cortex-M0 --apcs=interwork -O0 --diag_suppress=9931 -IC:\Users\Tom\Documents\Projects\Scopy_MVP_Platform\scopy-fpga\mcuapp_stm32f0\RTE -IC:\Users\Tom\Documents\Projects\Scopy_MVP_Platform\scopy-fpga\mcuapp_stm32f0\RTE\Device\STM32F071VBTx -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\5.4.0\CMSIS\Core\Include -IC:\Keil_v5\ARM\PACK\Keil\STM32F0xx_DFP\2.0.0 -IC:\Keil_v5\ARM\PACK\Keil\STM32F0xx_DFP\2.0.0\Drivers\CMSIS\Device\ST\STM32F0xx\Include -IC:\Keil_v5\ARM\PACK\Keil\STM32F0xx_DFP\2.0.0\Drivers\STM32F0xx_HAL_Driver\Inc -IC:\Keil_v5\ARM\PACK\Keil\STM32F0xx_DFP\2.0.0\Drivers\STM32F0xx_HAL_Driver\Inc\Legacy -D__UVISION_VERSION=514 -D_RTE_ -DSTM32F071xB --omf_browse=.\objects\stm32f0xx_hal_adc_ex.crf C:\Keil_v5\ARM\PACK\Keil\STM32F0xx_DFP\2.0.0\Drivers\STM32F0xx_HAL_Driver\Src\stm32f0xx_hal_adc_ex.c]
        THUMB
        REQUIRE8
        PRESERVE8

        AREA ||i.HAL_ADCEx_Calibration_Start||, CODE, READONLY, ALIGN=1

HAL_ADCEx_Calibration_Start PROC
        PUSH     {r3-r7,lr}
        MOV      r4,r0
        MOVS     r5,#0
        MOVS     r6,#0
        MOVS     r7,#0
        NOP      
        MOVS     r0,#0x40
        LDRB     r0,[r0,r4]
        CMP      r0,#1
        BNE      |L1.24|
        MOVS     r0,#2
|L1.22|
        POP      {r3-r7,pc}
|L1.24|
        MOVS     r1,#1
        MOVS     r0,#0x40
        STRB     r1,[r0,r4]
        NOP      
        LDR      r0,[r4,#0]
        LDR      r0,[r0,#8]
        LSLS     r0,r0,#30
        LSRS     r0,r0,#30
        CMP      r0,#1
        BNE      |L1.70|
        LDR      r0,[r4,#0]
        LDR      r0,[r0,#0]
        ANDS     r0,r0,r1
        CMP      r0,#0
        BNE      |L1.66|
        LDR      r0,[r4,#0]
        LDR      r0,[r0,#0xc]
        LSLS     r1,r1,#15
        ANDS     r0,r0,r1
        CMP      r0,r1
        BNE      |L1.70|
|L1.66|
        MOVS     r0,#1
        B        |L1.72|
|L1.70|
        MOVS     r0,#0
|L1.72|
        CMP      r0,#0
        BNE      |L1.204|
        LDR      r0,[r4,#0x44]
        MOVS     r1,#0xff
        ADDS     r1,#1
        BICS     r0,r0,r1
        MOVS     r1,#2
        ORRS     r0,r0,r1
        STR      r0,[r4,#0x44]
        LDR      r0,[r4,#0]
        LDR      r0,[r0,#0xc]
        LSLS     r7,r0,#30
        LSRS     r7,r7,#30
        LDR      r0,[r4,#0]
        LDR      r0,[r0,#0xc]
        LSRS     r0,r0,#2
        LSLS     r0,r0,#2
        LDR      r1,[r4,#0]
        STR      r0,[r1,#0xc]
        LDR      r0,[r4,#0]
        LDR      r0,[r0,#8]
        MOVS     r1,#1
        LSLS     r1,r1,#31
        ORRS     r0,r0,r1
        LDR      r1,[r4,#0]
        STR      r0,[r1,#8]
        BL       HAL_GetTick
        MOV      r6,r0
        B        |L1.168|
|L1.132|
        BL       HAL_GetTick
        SUBS     r0,r0,r6
        CMP      r0,#2
        BLS      |L1.168|
        LDR      r0,[r4,#0x44]
        MOVS     r1,#2
        BICS     r0,r0,r1
        MOVS     r1,#0x10
        ORRS     r0,r0,r1
        STR      r0,[r4,#0x44]
        NOP      
        MOVS     r1,#0
        MOVS     r0,#0x40
        STRB     r1,[r0,r4]
        NOP      
        MOVS     r0,#1
        B        |L1.22|
|L1.168|
        LDR      r0,[r4,#0]
        LDR      r0,[r0,#8]
        LSRS     r0,r0,#31
        LSLS     r0,r0,#31
        CMP      r0,#0
        BNE      |L1.132|
        LDR      r0,[r4,#0]
        LDR      r0,[r0,#0xc]
        ORRS     r0,r0,r7
        LDR      r1,[r4,#0]
        STR      r0,[r1,#0xc]
        LDR      r0,[r4,#0x44]
        MOVS     r1,#2
        BICS     r0,r0,r1
        MOVS     r1,#1
        ORRS     r0,r0,r1
        STR      r0,[r4,#0x44]
        B        |L1.214|
|L1.204|
        LDR      r0,[r4,#0x44]
        MOVS     r1,#0x20
        ORRS     r0,r0,r1
        STR      r0,[r4,#0x44]
        MOVS     r5,#1
|L1.214|
        NOP      
        MOVS     r1,#0
        MOVS     r0,#0x40
        STRB     r1,[r0,r4]
        NOP      
        MOV      r0,r5
        B        |L1.22|
        ENDP


        AREA ||.arm_vfe_header||, DATA, READONLY, NOALLOC, ALIGN=2

        DCD      0x00000000

;*** Start embedded assembler ***

#line 1 "C:\\Keil_v5\\ARM\\PACK\\Keil\\STM32F0xx_DFP\\2.0.0\\Drivers\\STM32F0xx_HAL_Driver\\Src\\stm32f0xx_hal_adc_ex.c"
	AREA ||.rev16_text||, CODE
	THUMB
	EXPORT |__asm___22_stm32f0xx_hal_adc_ex_c_3613cd7f____REV16|
#line 463 "C:\\Keil_v5\\ARM\\PACK\\ARM\\CMSIS\\5.4.0\\CMSIS\\Core\\Include\\cmsis_armcc.h"
|__asm___22_stm32f0xx_hal_adc_ex_c_3613cd7f____REV16| PROC
#line 464

 rev16 r0, r0
 bx lr
	ENDP
	AREA ||.revsh_text||, CODE
	THUMB
	EXPORT |__asm___22_stm32f0xx_hal_adc_ex_c_3613cd7f____REVSH|
#line 478
|__asm___22_stm32f0xx_hal_adc_ex_c_3613cd7f____REVSH| PROC
#line 479

 revsh r0, r0
 bx lr
	ENDP

;*** End   embedded assembler ***

        EXPORT HAL_ADCEx_Calibration_Start [CODE]

        IMPORT ||Lib$$Request$$armlib|| [CODE,WEAK]
        IMPORT HAL_GetTick [CODE]

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