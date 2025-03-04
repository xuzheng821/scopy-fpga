; generated by Component: ARM Compiler 5.05 update 1 (build 106) Tool: ArmCC [4d0efa]
; commandline ArmCC [--c99 --split_sections --debug -c --asm -o.\objects\stm32f0xx_hal_comp.o --depend=.\objects\stm32f0xx_hal_comp.d --cpu=Cortex-M0 --apcs=interwork -O0 --diag_suppress=9931 -IC:\Users\Tom\Documents\Projects\Scopy_MVP_Platform\scopy-fpga\mcuapp_stm32f0\RTE -IC:\Users\Tom\Documents\Projects\Scopy_MVP_Platform\scopy-fpga\mcuapp_stm32f0\RTE\Device\STM32F071VBTx -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\5.4.0\CMSIS\Core\Include -IC:\Keil_v5\ARM\PACK\Keil\STM32F0xx_DFP\2.0.0 -IC:\Keil_v5\ARM\PACK\Keil\STM32F0xx_DFP\2.0.0\Drivers\CMSIS\Device\ST\STM32F0xx\Include -IC:\Keil_v5\ARM\PACK\Keil\STM32F0xx_DFP\2.0.0\Drivers\STM32F0xx_HAL_Driver\Inc -IC:\Keil_v5\ARM\PACK\Keil\STM32F0xx_DFP\2.0.0\Drivers\STM32F0xx_HAL_Driver\Inc\Legacy -D__UVISION_VERSION=514 -D_RTE_ -DSTM32F071xB --omf_browse=.\objects\stm32f0xx_hal_comp.crf C:\Keil_v5\ARM\PACK\Keil\STM32F0xx_DFP\2.0.0\Drivers\STM32F0xx_HAL_Driver\Src\stm32f0xx_hal_comp.c]
        THUMB
        REQUIRE8
        PRESERVE8

        AREA ||i.HAL_COMP_DeInit||, CODE, READONLY, ALIGN=2

HAL_COMP_DeInit PROC
        PUSH     {r4-r6,lr}
        MOV      r4,r0
        MOVS     r6,#0
        MOVS     r5,#0
        CMP      r4,#0
        BEQ      |L1.22|
        LDR      r0,[r4,#0x28]
        MOVS     r1,#0x10
        ANDS     r0,r0,r1
        CMP      r0,#0
        BEQ      |L1.26|
|L1.22|
        MOVS     r6,#1
        B        |L1.80|
|L1.26|
        LDR      r1,|L1.84|
        LDR      r0,[r4,#0]
        CMP      r0,r1
        BNE      |L1.36|
        MOVS     r5,#0x10
|L1.36|
        LDR      r0,|L1.84|
        SUBS     r0,r0,#0x1e
        LDR      r0,[r0,#0x1c]
        LDR      r1,|L1.88|
        LSLS     r1,r1,r5
        BICS     r0,r0,r1
        MOVS     r1,#0
        LSLS     r1,r1,r5
        ORRS     r0,r0,r1
        LDR      r1,|L1.84|
        SUBS     r1,r1,#0x1e
        STR      r0,[r1,#0x1c]
        MOV      r0,r4
        BL       HAL_COMP_MspDeInit
        MOVS     r0,#0
        STR      r0,[r4,#0x28]
        NOP      
        MOVS     r1,#0
        MOVS     r0,#0x24
        STRB     r1,[r0,r4]
        NOP      
|L1.80|
        MOV      r0,r6
        POP      {r4-r6,pc}
        ENDP

|L1.84|
        DCD      0x4001001e
|L1.88|
        DCD      0x00003fff

        AREA ||i.HAL_COMP_GetOutputLevel||, CODE, READONLY, ALIGN=2

HAL_COMP_GetOutputLevel PROC
        PUSH     {r4,lr}
        MOV      r1,r0
        MOVS     r2,#0
        MOVS     r3,#0
        LDR      r4,|L2.48|
        LDR      r0,[r1,#0]
        CMP      r0,r4
        BNE      |L2.18|
        MOVS     r3,#0x10
|L2.18|
        LDR      r0,|L2.48|
        SUBS     r0,r0,#0x1e
        LDR      r0,[r0,#0x1c]
        MOVS     r4,#1
        LSLS     r4,r4,#14
        LSLS     r4,r4,r3
        ANDS     r0,r0,r4
        MOV      r2,r0
        CMP      r2,#0
        BEQ      |L2.44|
        MOVS     r0,#1
        LSLS     r0,r0,#14
|L2.42|
        POP      {r4,pc}
|L2.44|
        MOVS     r0,#0
        B        |L2.42|
        ENDP

|L2.48|
        DCD      0x4001001e

        AREA ||i.HAL_COMP_GetState||, CODE, READONLY, ALIGN=1

HAL_COMP_GetState PROC
        MOV      r1,r0
        CMP      r1,#0
        BNE      |L3.8|
|L3.6|
        BX       lr
|L3.8|
        LDR      r0,[r1,#0x28]
        B        |L3.6|
        ENDP


        AREA ||i.HAL_COMP_IRQHandler||, CODE, READONLY, ALIGN=2

HAL_COMP_IRQHandler PROC
        PUSH     {r4-r6,lr}
        MOV      r4,r0
        LDR      r1,|L4.48|
        LDR      r0,[r4,#0]
        CMP      r0,r1
        BNE      |L4.18|
        MOVS     r0,#1
        LSLS     r0,r0,#21
        B        |L4.22|
|L4.18|
        MOVS     r0,#1
        LSLS     r0,r0,#22
|L4.22|
        MOV      r5,r0
        LDR      r0,|L4.52|
        LDR      r0,[r0,#0x14]
        ANDS     r0,r0,r5
        CMP      r0,#0
        BEQ      |L4.44|
        LDR      r0,|L4.52|
        STR      r5,[r0,#0x14]
        MOV      r0,r4
        BL       HAL_COMP_TriggerCallback
|L4.44|
        POP      {r4-r6,pc}
        ENDP

        DCW      0x0000
|L4.48|
        DCD      0x4001001c
|L4.52|
        DCD      0x40010400

        AREA ||i.HAL_COMP_Init||, CODE, READONLY, ALIGN=2

HAL_COMP_Init PROC
        PUSH     {r3-r7,lr}
        MOV      r4,r0
        MOVS     r6,#0
        MOVS     r5,#0
        CMP      r4,#0
        BEQ      |L5.22|
        LDR      r0,[r4,#0x28]
        MOVS     r1,#0x10
        ANDS     r0,r0,r1
        CMP      r0,#0
        BEQ      |L5.26|
|L5.22|
        MOVS     r6,#1
        B        |L5.170|
|L5.26|
        LDR      r0,[r4,#8]
        CMP      r0,#2
        BNE      |L5.34|
        NOP      
|L5.34|
        LDR      r0,[r4,#0x1c]
        CMP      r0,#0
        BEQ      |L5.42|
        NOP      
|L5.42|
        NOP      
        LDR      r0,|L5.176|
        LDR      r0,[r0,#0x18]
        MOVS     r1,#1
        ORRS     r0,r0,r1
        LDR      r1,|L5.176|
        STR      r0,[r1,#0x18]
        MOV      r0,r1
        LDR      r0,[r0,#0x18]
        LSLS     r0,r0,#31
        LSRS     r0,r0,#31
        STR      r0,[sp,#0]
        NOP      
        NOP      
        MOV      r0,r4
        BL       HAL_COMP_MspInit
        LDR      r0,[r4,#0x28]
        CMP      r0,#0
        BNE      |L5.88|
        MOVS     r1,#0
        MOVS     r0,#0x24
        STRB     r1,[r0,r4]
|L5.88|
        MOVS     r0,#2
        STR      r0,[r4,#0x28]
        LDR      r1,|L5.180|
        LDR      r0,[r4,#0]
        CMP      r0,r1
        BNE      |L5.102|
        MOVS     r5,#0x10
|L5.102|
        LDR      r0,|L5.180|
        SUBS     r0,r0,#0x1e
        LDR      r0,[r0,#0x1c]
        LDR      r1,|L5.184|
        LSLS     r1,r1,r5
        BICS     r0,r0,r1
        LDR      r2,[r4,#8]
        LDR      r1,[r4,#4]
        ORRS     r1,r1,r2
        LDR      r2,[r4,#0xc]
        ORRS     r1,r1,r2
        LDR      r2,[r4,#0x10]
        ORRS     r1,r1,r2
        LDR      r2,[r4,#0x14]
        ORRS     r1,r1,r2
        LDR      r2,[r4,#0x18]
        ORRS     r1,r1,r2
        LSLS     r1,r1,r5
        ORRS     r0,r0,r1
        LDR      r1,|L5.180|
        SUBS     r1,r1,#0x1e
        STR      r0,[r1,#0x1c]
        LDR      r0,[r4,#0x1c]
        CMP      r0,#0
        BEQ      |L5.166|
        MOV      r0,r1
        LDR      r0,[r0,#0x1c]
        LSLS     r1,r1,#7
        ORRS     r0,r0,r1
        LDR      r1,|L5.180|
        SUBS     r1,r1,#0x1e
        STR      r0,[r1,#0x1c]
|L5.166|
        MOVS     r0,#1
        STR      r0,[r4,#0x28]
|L5.170|
        MOV      r0,r6
        POP      {r3-r7,pc}
        ENDP

        DCW      0x0000
|L5.176|
        DCD      0x40021000
|L5.180|
        DCD      0x4001001e
|L5.184|
        DCD      0x00003f7e

        AREA ||i.HAL_COMP_Lock||, CODE, READONLY, ALIGN=2

HAL_COMP_Lock PROC
        PUSH     {r4,lr}
        MOV      r1,r0
        MOVS     r0,#0
        MOVS     r2,#0
        CMP      r1,#0
        BEQ      |L6.22|
        LDR      r3,[r1,#0x28]
        MOVS     r4,#0x10
        ANDS     r3,r3,r4
        CMP      r3,#0
        BEQ      |L6.26|
|L6.22|
        MOVS     r0,#1
        B        |L6.64|
|L6.26|
        LDR      r3,[r1,#0x28]
        MOVS     r4,#0x10
        ORRS     r3,r3,r4
        STR      r3,[r1,#0x28]
        LDR      r4,|L6.68|
        LDR      r3,[r1,#0]
        CMP      r3,r4
        BNE      |L6.44|
        MOVS     r2,#0x10
|L6.44|
        LDR      r3,|L6.68|
        SUBS     r3,r3,#0x1e
        LDR      r3,[r3,#0x1c]
        MOVS     r4,#1
        LSLS     r4,r4,#15
        LSLS     r4,r4,r2
        ORRS     r3,r3,r4
        LDR      r4,|L6.68|
        SUBS     r4,r4,#0x1e
        STR      r3,[r4,#0x1c]
|L6.64|
        POP      {r4,pc}
        ENDP

        DCW      0x0000
|L6.68|
        DCD      0x4001001e

        AREA ||i.HAL_COMP_MspDeInit||, CODE, READONLY, ALIGN=1

HAL_COMP_MspDeInit PROC
        BX       lr
        ENDP


        AREA ||i.HAL_COMP_MspInit||, CODE, READONLY, ALIGN=1

HAL_COMP_MspInit PROC
        BX       lr
        ENDP


        AREA ||i.HAL_COMP_Start||, CODE, READONLY, ALIGN=2

HAL_COMP_Start PROC
        PUSH     {r3-r7,lr}
        MOV      r4,r0
        MOVS     r5,#0
        MOVS     r6,#0
        MOVS     r7,#0
        CMP      r4,#0
        BEQ      |L9.24|
        LDR      r0,[r4,#0x28]
        MOVS     r1,#0x10
        ANDS     r0,r0,r1
        CMP      r0,#0
        BEQ      |L9.28|
|L9.24|
        MOVS     r6,#1
        B        |L9.94|
|L9.28|
        LDR      r0,[r4,#0x28]
        CMP      r0,#1
        BNE      |L9.92|
        LDR      r1,|L9.100|
        LDR      r0,[r4,#0]
        CMP      r0,r1
        BNE      |L9.44|
        MOVS     r7,#0x10
|L9.44|
        LDR      r0,|L9.100|
        SUBS     r0,r0,#0x1e
        LDR      r0,[r0,#0x1c]
        MOVS     r1,#1
        LSLS     r1,r1,r7
        ORRS     r0,r0,r1
        LDR      r1,|L9.100|
        SUBS     r1,r1,#0x1e
        STR      r0,[r1,#0x1c]
        MOVS     r0,#2
        STR      r0,[r4,#0x28]
        LDR      r1,|L9.104|
        LDR      r0,|L9.108|
        LDR      r0,[r0,#0]  ; SystemCoreClock
        BL       __aeabi_uidivmod
        MOVS     r1,#0x3c
        MULS     r0,r1,r0
        MOV      r5,r0
        B        |L9.86|
|L9.84|
        SUBS     r5,r5,#1
|L9.86|
        CMP      r5,#0
        BNE      |L9.84|
        B        |L9.94|
|L9.92|
        MOVS     r6,#1
|L9.94|
        MOV      r0,r6
        POP      {r3-r7,pc}
        ENDP

        DCW      0x0000
|L9.100|
        DCD      0x4001001e
|L9.104|
        DCD      0x000f4240
|L9.108|
        DCD      SystemCoreClock

        AREA ||i.HAL_COMP_Start_IT||, CODE, READONLY, ALIGN=2

HAL_COMP_Start_IT PROC
        PUSH     {r4-r6,lr}
        MOV      r5,r0
        MOVS     r6,#0
        MOVS     r4,#0
        MOV      r0,r5
        BL       HAL_COMP_Start
        MOV      r6,r0
        CMP      r6,#0
        BNE      |L10.118|
        LDR      r1,|L10.124|
        LDR      r0,[r5,#0]
        CMP      r0,r1
        BNE      |L10.34|
        MOVS     r0,#1
        LSLS     r0,r0,#21
        B        |L10.38|
|L10.34|
        MOVS     r0,#1
        LSLS     r0,r0,#22
|L10.38|
        MOV      r4,r0
        MOVS     r0,#0x20
        LDRB     r0,[r0,r5]
        LSLS     r0,r0,#31
        LSRS     r0,r0,#31
        CMP      r0,#0
        BEQ      |L10.64|
        LDR      r0,|L10.128|
        LDR      r0,[r0,#8]
        ORRS     r0,r0,r4
        LDR      r1,|L10.128|
        STR      r0,[r1,#8]
        B        |L10.74|
|L10.64|
        LDR      r0,|L10.128|
        LDR      r0,[r0,#8]
        BICS     r0,r0,r4
        LDR      r1,|L10.128|
        STR      r0,[r1,#8]
|L10.74|
        MOVS     r1,#2
        LDR      r0,[r5,#0x20]
        ANDS     r0,r0,r1
        CMP      r0,#0
        BEQ      |L10.96|
        LDR      r0,|L10.128|
        LDR      r0,[r0,#0xc]
        ORRS     r0,r0,r4
        LDR      r1,|L10.128|
        STR      r0,[r1,#0xc]
        B        |L10.106|
|L10.96|
        LDR      r0,|L10.128|
        LDR      r0,[r0,#0xc]
        BICS     r0,r0,r4
        LDR      r1,|L10.128|
        STR      r0,[r1,#0xc]
|L10.106|
        LDR      r0,|L10.128|
        STR      r4,[r0,#0x14]
        LDR      r0,[r0,#0]
        ORRS     r0,r0,r4
        LDR      r1,|L10.128|
        STR      r0,[r1,#0]
|L10.118|
        MOV      r0,r6
        POP      {r4-r6,pc}
        ENDP

        DCW      0x0000
|L10.124|
        DCD      0x4001001c
|L10.128|
        DCD      0x40010400

        AREA ||i.HAL_COMP_Stop||, CODE, READONLY, ALIGN=2

HAL_COMP_Stop PROC
        PUSH     {r4,lr}
        MOV      r1,r0
        MOVS     r0,#0
        MOVS     r2,#0
        CMP      r1,#0
        BEQ      |L11.22|
        LDR      r3,[r1,#0x28]
        MOVS     r4,#0x10
        ANDS     r3,r3,r4
        CMP      r3,#0
        BEQ      |L11.26|
|L11.22|
        MOVS     r0,#1
        B        |L11.68|
|L11.26|
        LDR      r3,[r1,#0x28]
        CMP      r3,#2
        BNE      |L11.66|
        LDR      r4,|L11.72|
        LDR      r3,[r1,#0]
        CMP      r3,r4
        BNE      |L11.42|
        MOVS     r2,#0x10
|L11.42|
        LDR      r3,|L11.72|
        SUBS     r3,r3,#0x1e
        LDR      r3,[r3,#0x1c]
        MOVS     r4,#1
        LSLS     r4,r4,r2
        BICS     r3,r3,r4
        LDR      r4,|L11.72|
        SUBS     r4,r4,#0x1e
        STR      r3,[r4,#0x1c]
        MOVS     r3,#1
        STR      r3,[r1,#0x28]
        B        |L11.68|
|L11.66|
        MOVS     r0,#1
|L11.68|
        POP      {r4,pc}
        ENDP

        DCW      0x0000
|L11.72|
        DCD      0x4001001e

        AREA ||i.HAL_COMP_Stop_IT||, CODE, READONLY, ALIGN=2

HAL_COMP_Stop_IT PROC
        PUSH     {r4,r5,lr}
        MOV      r4,r0
        MOVS     r5,#0
        LDR      r0,|L12.48|
        LDR      r0,[r0,#0]
        LDR      r2,|L12.52|
        LDR      r1,[r4,#0]
        CMP      r1,r2
        BNE      |L12.24|
        MOVS     r1,#1
        LSLS     r1,r1,#21
        B        |L12.28|
|L12.24|
        MOVS     r1,#1
        LSLS     r1,r1,#22
|L12.28|
        BICS     r0,r0,r1
        LDR      r1,|L12.48|
        STR      r0,[r1,#0]
        MOV      r0,r4
        BL       HAL_COMP_Stop
        MOV      r5,r0
        MOV      r0,r5
        POP      {r4,r5,pc}
        ENDP

        DCW      0x0000
|L12.48|
        DCD      0x40010400
|L12.52|
        DCD      0x4001001c

        AREA ||i.HAL_COMP_TriggerCallback||, CODE, READONLY, ALIGN=1

HAL_COMP_TriggerCallback PROC
        BX       lr
        ENDP


        AREA ||.arm_vfe_header||, DATA, READONLY, NOALLOC, ALIGN=2

        DCD      0x00000000

;*** Start embedded assembler ***

#line 1 "C:\\Keil_v5\\ARM\\PACK\\Keil\\STM32F0xx_DFP\\2.0.0\\Drivers\\STM32F0xx_HAL_Driver\\Src\\stm32f0xx_hal_comp.c"
	AREA ||.rev16_text||, CODE
	THUMB
	EXPORT |__asm___20_stm32f0xx_hal_comp_c_14c096b7____REV16|
#line 463 "C:\\Keil_v5\\ARM\\PACK\\ARM\\CMSIS\\5.4.0\\CMSIS\\Core\\Include\\cmsis_armcc.h"
|__asm___20_stm32f0xx_hal_comp_c_14c096b7____REV16| PROC
#line 464

 rev16 r0, r0
 bx lr
	ENDP
	AREA ||.revsh_text||, CODE
	THUMB
	EXPORT |__asm___20_stm32f0xx_hal_comp_c_14c096b7____REVSH|
#line 478
|__asm___20_stm32f0xx_hal_comp_c_14c096b7____REVSH| PROC
#line 479

 revsh r0, r0
 bx lr
	ENDP

;*** End   embedded assembler ***

        EXPORT HAL_COMP_DeInit [CODE]
        EXPORT HAL_COMP_GetOutputLevel [CODE]
        EXPORT HAL_COMP_GetState [CODE]
        EXPORT HAL_COMP_IRQHandler [CODE]
        EXPORT HAL_COMP_Init [CODE]
        EXPORT HAL_COMP_Lock [CODE]
        EXPORT HAL_COMP_MspDeInit [CODE,WEAK]
        EXPORT HAL_COMP_MspInit [CODE,WEAK]
        EXPORT HAL_COMP_Start [CODE]
        EXPORT HAL_COMP_Start_IT [CODE]
        EXPORT HAL_COMP_Stop [CODE]
        EXPORT HAL_COMP_Stop_IT [CODE]
        EXPORT HAL_COMP_TriggerCallback [CODE,WEAK]

        IMPORT ||Lib$$Request$$armlib|| [CODE,WEAK]
        IMPORT __aeabi_uidivmod [CODE]
        IMPORT SystemCoreClock [DATA]

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
