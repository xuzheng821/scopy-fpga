; generated by Component: ARM Compiler 5.05 update 1 (build 106) Tool: ArmCC [4d0efa]
; commandline ArmCC [--c99 --split_sections --debug -c --asm -o.\objects\main.o --depend=.\objects\main.d --cpu=Cortex-M0 --apcs=interwork -O0 --diag_suppress=9931 -IC:\Users\Tom\Documents\Projects\Scopy_MVP_Platform\scopy-fpga\mcuapp_stm32f0\RTE -IC:\Users\Tom\Documents\Projects\Scopy_MVP_Platform\scopy-fpga\mcuapp_stm32f0\RTE\Device\STM32F071VBTx -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\5.4.0\CMSIS\Core\Include -IC:\Keil_v5\ARM\PACK\Keil\STM32F0xx_DFP\2.0.0 -IC:\Keil_v5\ARM\PACK\Keil\STM32F0xx_DFP\2.0.0\Drivers\CMSIS\Device\ST\STM32F0xx\Include -IC:\Keil_v5\ARM\PACK\Keil\STM32F0xx_DFP\2.0.0\Drivers\STM32F0xx_HAL_Driver\Inc -IC:\Keil_v5\ARM\PACK\Keil\STM32F0xx_DFP\2.0.0\Drivers\STM32F0xx_HAL_Driver\Inc\Legacy -D__UVISION_VERSION=514 -D_RTE_ -DSTM32F071xB --omf_browse=.\objects\main.crf main.c]
        THUMB
        REQUIRE8
        PRESERVE8

        AREA ||i.main||, CODE, READONLY, ALIGN=2

main PROC
        PUSH     {r4,lr}
        BL       hal_init
        BL       main_psu_power_on
        BL       raspi_power_on
        BL       zynq_power_on
        BL       hmcad151x_init
        BL       adf435x_init
        BL       adf435x_rf_on
        LDR      r0,|L1.48|
        BL       adf435x_change_frequency
        BL       shell_init
        BL       shell_run
        POP      {r4,pc}
        ENDP

        DCW      0x0000
|L1.48|
        DCD      0x447a0000

        AREA ||.arm_vfe_header||, DATA, READONLY, NOALLOC, ALIGN=2

        DCD      0x00000000

;*** Start embedded assembler ***

#line 1 "main.c"
	AREA ||.rev16_text||, CODE
	THUMB
	EXPORT |__asm___6_main_c_main____REV16|
#line 463 "C:\\Keil_v5\\ARM\\PACK\\ARM\\CMSIS\\5.4.0\\CMSIS\\Core\\Include\\cmsis_armcc.h"
|__asm___6_main_c_main____REV16| PROC
#line 464

 rev16 r0, r0
 bx lr
	ENDP
	AREA ||.revsh_text||, CODE
	THUMB
	EXPORT |__asm___6_main_c_main____REVSH|
#line 478
|__asm___6_main_c_main____REVSH| PROC
#line 479

 revsh r0, r0
 bx lr
	ENDP

;*** End   embedded assembler ***

__ARM_use_no_argv EQU 0

        EXPORT __ARM_use_no_argv
        EXPORT main [CODE]

        IMPORT ||Lib$$Request$$armlib|| [CODE,WEAK]
        IMPORT hal_init [CODE]
        IMPORT main_psu_power_on [CODE]
        IMPORT raspi_power_on [CODE]
        IMPORT zynq_power_on [CODE]
        IMPORT hmcad151x_init [CODE]
        IMPORT adf435x_init [CODE]
        IMPORT adf435x_rf_on [CODE]
        IMPORT adf435x_change_frequency [CODE]
        IMPORT shell_init [CODE]
        IMPORT shell_run [CODE]

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
