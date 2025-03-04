; generated by Component: ARM Compiler 5.05 update 1 (build 106) Tool: ArmCC [4d0efa]
; commandline ArmCC [--c99 --split_sections --debug -c --asm -o.\objects\stm32f0xx_hal_pwr_ex.o --depend=.\objects\stm32f0xx_hal_pwr_ex.d --cpu=Cortex-M0 --apcs=interwork -O0 --diag_suppress=9931 -IC:\Users\Tom\Documents\Projects\Scopy_MVP_Platform\scopy-fpga\mcuapp_stm32f0\RTE -IC:\Users\Tom\Documents\Projects\Scopy_MVP_Platform\scopy-fpga\mcuapp_stm32f0\RTE\Device\STM32F071VBTx -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\5.4.0\CMSIS\Core\Include -IC:\Keil_v5\ARM\PACK\Keil\STM32F0xx_DFP\2.0.0 -IC:\Keil_v5\ARM\PACK\Keil\STM32F0xx_DFP\2.0.0\Drivers\CMSIS\Device\ST\STM32F0xx\Include -IC:\Keil_v5\ARM\PACK\Keil\STM32F0xx_DFP\2.0.0\Drivers\STM32F0xx_HAL_Driver\Inc -IC:\Keil_v5\ARM\PACK\Keil\STM32F0xx_DFP\2.0.0\Drivers\STM32F0xx_HAL_Driver\Inc\Legacy -D__UVISION_VERSION=514 -D_RTE_ -DSTM32F071xB --omf_browse=.\objects\stm32f0xx_hal_pwr_ex.crf C:\Keil_v5\ARM\PACK\Keil\STM32F0xx_DFP\2.0.0\Drivers\STM32F0xx_HAL_Driver\Src\stm32f0xx_hal_pwr_ex.c]
        THUMB
        REQUIRE8
        PRESERVE8

        AREA ||i.HAL_PWREx_DisableVddio2Monitor||, CODE, READONLY, ALIGN=2

HAL_PWREx_DisableVddio2Monitor PROC
        LDR      r0,|L1.40|
        LDR      r0,[r0,#0]
        LSLS     r0,r0,#1
        LSRS     r0,r0,#1
        LDR      r1,|L1.40|
        STR      r0,[r1,#0]
        NOP      
        MOV      r0,r1
        LDR      r0,[r0,#0xc]
        LSLS     r0,r0,#1
        LSRS     r0,r0,#1
        STR      r0,[r1,#0xc]
        MOV      r0,r1
        LDR      r0,[r0,#8]
        LSLS     r0,r0,#1
        LSRS     r0,r0,#1
        STR      r0,[r1,#8]
        NOP      
        BX       lr
        ENDP

        DCW      0x0000
|L1.40|
        DCD      0x40010400

        AREA ||i.HAL_PWREx_EnableVddio2Monitor||, CODE, READONLY, ALIGN=2

HAL_PWREx_EnableVddio2Monitor PROC
        LDR      r0,|L2.28|
        LDR      r0,[r0,#0]
        MOVS     r1,#1
        LSLS     r1,r1,#31
        ORRS     r0,r0,r1
        LDR      r1,|L2.28|
        STR      r0,[r1,#0]
        MOV      r0,r1
        LDR      r0,[r0,#0xc]
        LSLS     r1,r1,#21
        ORRS     r0,r0,r1
        LDR      r1,|L2.28|
        STR      r0,[r1,#0xc]
        BX       lr
        ENDP

|L2.28|
        DCD      0x40010400

        AREA ||i.HAL_PWREx_Vddio2MonitorCallback||, CODE, READONLY, ALIGN=1

HAL_PWREx_Vddio2MonitorCallback PROC
        BX       lr
        ENDP


        AREA ||i.HAL_PWREx_Vddio2Monitor_IRQHandler||, CODE, READONLY, ALIGN=2

HAL_PWREx_Vddio2Monitor_IRQHandler PROC
        PUSH     {r4,lr}
        LDR      r0,|L4.28|
        LDR      r0,[r0,#0x14]
        LSRS     r0,r0,#31
        LSLS     r0,r0,#31
        CMP      r0,#0
        BEQ      |L4.26|
        BL       HAL_PWREx_Vddio2MonitorCallback
        MOVS     r0,#1
        LSLS     r0,r0,#31
        LDR      r1,|L4.28|
        STR      r0,[r1,#0x14]
|L4.26|
        POP      {r4,pc}
        ENDP

|L4.28|
        DCD      0x40010400

        AREA ||i.HAL_PWR_ConfigPVD||, CODE, READONLY, ALIGN=2

HAL_PWR_ConfigPVD PROC
        LDR      r1,|L5.168|
        LDR      r1,[r1,#0]
        MOVS     r2,#0xe0
        BICS     r1,r1,r2
        LDR      r2,[r0,#0]
        ORRS     r1,r1,r2
        LDR      r2,|L5.168|
        STR      r1,[r2,#0]
        LDR      r1,|L5.172|
        LDR      r1,[r1,#4]
        MOVS     r2,#1
        LSLS     r2,r2,#16
        BICS     r1,r1,r2
        LDR      r2,|L5.172|
        STR      r1,[r2,#4]
        MOV      r1,r2
        LDR      r1,[r1,#0]
        MOVS     r2,#1
        LSLS     r2,r2,#16
        BICS     r1,r1,r2
        LDR      r2,|L5.172|
        STR      r1,[r2,#0]
        MOV      r1,r2
        LDR      r1,[r1,#8]
        MOVS     r2,#1
        LSLS     r2,r2,#16
        BICS     r1,r1,r2
        LDR      r2,|L5.172|
        STR      r1,[r2,#8]
        MOV      r1,r2
        LDR      r1,[r1,#0xc]
        MOVS     r2,#1
        LSLS     r2,r2,#16
        BICS     r1,r1,r2
        LDR      r2,|L5.172|
        STR      r1,[r2,#0xc]
        MOVS     r2,#1
        LSLS     r2,r2,#16
        LDR      r1,[r0,#4]
        ANDS     r1,r1,r2
        CMP      r1,r2
        BNE      |L5.94|
        LDR      r1,|L5.172|
        LDR      r1,[r1,#0]
        ORRS     r1,r1,r2
        LDR      r2,|L5.172|
        STR      r1,[r2,#0]
|L5.94|
        MOVS     r2,#1
        LSLS     r2,r2,#17
        LDR      r1,[r0,#4]
        ANDS     r1,r1,r2
        CMP      r1,r2
        BNE      |L5.118|
        LDR      r1,|L5.172|
        LDR      r1,[r1,#4]
        ASRS     r2,r2,#1
        ORRS     r1,r1,r2
        LDR      r2,|L5.172|
        STR      r1,[r2,#4]
|L5.118|
        LDRB     r1,[r0,#4]
        LSLS     r1,r1,#31
        LSRS     r1,r1,#31
        CMP      r1,#0
        BEQ      |L5.142|
        LDR      r1,|L5.172|
        LDR      r1,[r1,#8]
        MOVS     r2,#1
        LSLS     r2,r2,#16
        ORRS     r1,r1,r2
        LDR      r2,|L5.172|
        STR      r1,[r2,#8]
|L5.142|
        MOVS     r2,#2
        LDR      r1,[r0,#4]
        ANDS     r1,r1,r2
        CMP      r1,#2
        BNE      |L5.164|
        LDR      r1,|L5.172|
        LDR      r1,[r1,#0xc]
        LSLS     r2,r2,#15
        ORRS     r1,r1,r2
        LDR      r2,|L5.172|
        STR      r1,[r2,#0xc]
|L5.164|
        BX       lr
        ENDP

        DCW      0x0000
|L5.168|
        DCD      0x40007000
|L5.172|
        DCD      0x40010400

        AREA ||i.HAL_PWR_DisablePVD||, CODE, READONLY, ALIGN=2

HAL_PWR_DisablePVD PROC
        LDR      r0,|L6.16|
        LDR      r0,[r0,#0]
        MOVS     r1,#0x10
        BICS     r0,r0,r1
        LDR      r1,|L6.16|
        STR      r0,[r1,#0]
        BX       lr
        ENDP

        DCW      0x0000
|L6.16|
        DCD      0x40007000

        AREA ||i.HAL_PWR_EnablePVD||, CODE, READONLY, ALIGN=2

HAL_PWR_EnablePVD PROC
        LDR      r0,|L7.16|
        LDR      r0,[r0,#0]
        MOVS     r1,#0x10
        ORRS     r0,r0,r1
        LDR      r1,|L7.16|
        STR      r0,[r1,#0]
        BX       lr
        ENDP

        DCW      0x0000
|L7.16|
        DCD      0x40007000

        AREA ||i.HAL_PWR_PVDCallback||, CODE, READONLY, ALIGN=1

HAL_PWR_PVDCallback PROC
        BX       lr
        ENDP


        AREA ||i.HAL_PWR_PVD_IRQHandler||, CODE, READONLY, ALIGN=2

HAL_PWR_PVD_IRQHandler PROC
        PUSH     {r4,lr}
        LDR      r0,|L9.32|
        LDR      r0,[r0,#0x14]
        MOVS     r1,#1
        LSLS     r1,r1,#16
        ANDS     r0,r0,r1
        CMP      r0,#0
        BEQ      |L9.28|
        BL       HAL_PWR_PVDCallback
        MOVS     r0,#1
        LSLS     r0,r0,#16
        LDR      r1,|L9.32|
        STR      r0,[r1,#0x14]
|L9.28|
        POP      {r4,pc}
        ENDP

        DCW      0x0000
|L9.32|
        DCD      0x40010400

        AREA ||.arm_vfe_header||, DATA, READONLY, NOALLOC, ALIGN=2

        DCD      0x00000000

;*** Start embedded assembler ***

#line 1 "C:\\Keil_v5\\ARM\\PACK\\Keil\\STM32F0xx_DFP\\2.0.0\\Drivers\\STM32F0xx_HAL_Driver\\Src\\stm32f0xx_hal_pwr_ex.c"
	AREA ||.rev16_text||, CODE
	THUMB
	EXPORT |__asm___22_stm32f0xx_hal_pwr_ex_c_0d55f1db____REV16|
#line 463 "C:\\Keil_v5\\ARM\\PACK\\ARM\\CMSIS\\5.4.0\\CMSIS\\Core\\Include\\cmsis_armcc.h"
|__asm___22_stm32f0xx_hal_pwr_ex_c_0d55f1db____REV16| PROC
#line 464

 rev16 r0, r0
 bx lr
	ENDP
	AREA ||.revsh_text||, CODE
	THUMB
	EXPORT |__asm___22_stm32f0xx_hal_pwr_ex_c_0d55f1db____REVSH|
#line 478
|__asm___22_stm32f0xx_hal_pwr_ex_c_0d55f1db____REVSH| PROC
#line 479

 revsh r0, r0
 bx lr
	ENDP

;*** End   embedded assembler ***

        EXPORT HAL_PWREx_DisableVddio2Monitor [CODE]
        EXPORT HAL_PWREx_EnableVddio2Monitor [CODE]
        EXPORT HAL_PWREx_Vddio2MonitorCallback [CODE,WEAK]
        EXPORT HAL_PWREx_Vddio2Monitor_IRQHandler [CODE]
        EXPORT HAL_PWR_ConfigPVD [CODE]
        EXPORT HAL_PWR_DisablePVD [CODE]
        EXPORT HAL_PWR_EnablePVD [CODE]
        EXPORT HAL_PWR_PVDCallback [CODE,WEAK]
        EXPORT HAL_PWR_PVD_IRQHandler [CODE]

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
