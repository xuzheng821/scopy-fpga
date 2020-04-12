; generated by Component: ARM Compiler 5.05 update 1 (build 106) Tool: ArmCC [4d0efa]
; commandline ArmCC [--c99 --split_sections --debug -c --asm -o.\objects\microrl.o --depend=.\objects\microrl.d --cpu=Cortex-M0 --apcs=interwork -O0 --diag_suppress=9931 -IC:\Users\Tom\Documents\Projects\Scopy_MVP_Platform\scopy-fpga\mcuapp_stm32f0\RTE -IC:\Users\Tom\Documents\Projects\Scopy_MVP_Platform\scopy-fpga\mcuapp_stm32f0\RTE\Device\STM32F071VBTx -IC:\Keil_v5\ARM\PACK\ARM\CMSIS\5.4.0\CMSIS\Core\Include -IC:\Keil_v5\ARM\PACK\Keil\STM32F0xx_DFP\2.0.0 -IC:\Keil_v5\ARM\PACK\Keil\STM32F0xx_DFP\2.0.0\Drivers\CMSIS\Device\ST\STM32F0xx\Include -IC:\Keil_v5\ARM\PACK\Keil\STM32F0xx_DFP\2.0.0\Drivers\STM32F0xx_HAL_Driver\Inc -IC:\Keil_v5\ARM\PACK\Keil\STM32F0xx_DFP\2.0.0\Drivers\STM32F0xx_HAL_Driver\Inc\Legacy -D__UVISION_VERSION=514 -D_RTE_ -DSTM32F071xB --omf_browse=.\objects\microrl.crf microrl\src\microrl.c]
        THUMB
        REQUIRE8
        PRESERVE8

        AREA ||i.escape_process||, CODE, READONLY, ALIGN=1

escape_process PROC
        PUSH     {r4-r6,lr}
        MOV      r4,r0
        MOV      r5,r1
        CMP      r5,#0x5b
        BNE      |L1.18|
        MOVS     r0,#1
        STRB     r0,[r4,#0]
        MOVS     r0,#0
|L1.16|
        POP      {r4-r6,pc}
|L1.18|
        LDRB     r0,[r4,#0]
        CMP      r0,#1
        BNE      |L1.166|
        CMP      r5,#0x41
        BNE      |L1.40|
        MOVS     r1,#0
        MOV      r0,r4
        BL       hist_search
        MOVS     r0,#1
        B        |L1.16|
|L1.40|
        CMP      r5,#0x42
        BNE      |L1.56|
        MOVS     r1,#1
        MOV      r0,r4
        BL       hist_search
        MOVS     r0,#1
        B        |L1.16|
|L1.56|
        CMP      r5,#0x43
        BNE      |L1.100|
        MOVS     r0,#0x85
        LSLS     r0,r0,#2
        LDR      r1,[r0,r4]
        SUBS     r0,r0,#4
        LDR      r0,[r0,r4]
        CMP      r1,r0
        BGE      |L1.96|
        MOVS     r1,#1
        MOV      r0,r4
        BL       terminal_move_cursor
        MOVS     r0,#0x85
        LSLS     r0,r0,#2
        LDR      r0,[r0,r4]
        ADDS     r0,r0,#1
        MOVS     r1,#0x85
        LSLS     r1,r1,#2
        STR      r0,[r1,r4]
|L1.96|
        MOVS     r0,#1
        B        |L1.16|
|L1.100|
        CMP      r5,#0x44
        BNE      |L1.142|
        MOVS     r0,#0x85
        LSLS     r0,r0,#2
        LDR      r0,[r0,r4]
        CMP      r0,#0
        BLE      |L1.138|
        MOVS     r1,#0
        MVNS     r1,r1
        MOV      r0,r4
        BL       terminal_move_cursor
        MOVS     r0,#0x85
        LSLS     r0,r0,#2
        LDR      r0,[r0,r4]
        SUBS     r0,r0,#1
        MOVS     r1,#0x85
        LSLS     r1,r1,#2
        STR      r0,[r1,r4]
|L1.138|
        MOVS     r0,#1
        B        |L1.16|
|L1.142|
        CMP      r5,#0x37
        BNE      |L1.154|
        MOVS     r0,#2
        STRB     r0,[r4,#0]
        MOVS     r0,#0
        B        |L1.16|
|L1.154|
        CMP      r5,#0x38
        BNE      |L1.232|
        MOVS     r0,#3
        STRB     r0,[r4,#0]
        MOVS     r0,#0
        B        |L1.16|
|L1.166|
        CMP      r5,#0x7e
        BNE      |L1.232|
        LDRB     r0,[r4,#0]
        CMP      r0,#2
        BNE      |L1.194|
        MOV      r0,r4
        BL       terminal_reset_cursor
        MOVS     r1,#0
        MOVS     r0,#0x85
        LSLS     r0,r0,#2
        STR      r1,[r0,r4]
        MOVS     r0,#1
        B        |L1.16|
|L1.194|
        LDRB     r0,[r4,#0]
        CMP      r0,#3
        BNE      |L1.232|
        MOVS     r0,#0x21
        LSLS     r0,r0,#4
        LDR      r2,[r0,r4]
        ADDS     r0,r0,#4
        LDR      r0,[r0,r4]
        SUBS     r1,r2,r0
        MOV      r0,r4
        BL       terminal_move_cursor
        MOVS     r0,#0x21
        LSLS     r0,r0,#4
        LDR      r1,[r0,r4]
        ADDS     r0,r0,#4
        STR      r1,[r0,r4]
        MOVS     r0,#1
        B        |L1.16|
|L1.232|
        MOVS     r0,#1
        B        |L1.16|
        ENDP


        AREA ||i.hist_erase_older||, CODE, READONLY, ALIGN=1

hist_erase_older PROC
        MOVS     r2,#0xff
        ADDS     r2,#1
        LDR      r3,[r2,r0]
        LDR      r2,[r2,r0]
        LDRB     r2,[r0,r2]
        ADDS     r2,r3,r2
        ADDS     r1,r2,#1
        CMP      r1,#0xfe
        BLT      |L2.20|
        SUBS     r1,r1,#0xfe
|L2.20|
        MOVS     r2,#0xff
        ADDS     r2,#1
        STR      r1,[r2,r0]
        BX       lr
        ENDP


        AREA ||i.hist_is_space_for_new||, CODE, READONLY, ALIGN=1

hist_is_space_for_new PROC
        MOV      r2,r0
        MOVS     r0,#0xff
        ADDS     r0,#1
        LDR      r0,[r0,r2]
        LDRB     r0,[r2,r0]
        CMP      r0,#0
        BNE      |L3.18|
        MOVS     r0,#1
|L3.16|
        BX       lr
|L3.18|
        MOVS     r0,#0xff
        ADDS     r0,#5
        LDR      r3,[r0,r2]
        SUBS     r0,r0,#4
        LDR      r0,[r0,r2]
        CMP      r3,r0
        BLT      |L3.60|
        MOVS     r0,#0xff
        ADDS     r0,#5
        LDR      r0,[r0,r2]
        MOVS     r3,#0xfe
        SUBS     r3,r3,r0
        MOVS     r0,#0xff
        ADDS     r0,#1
        LDR      r0,[r0,r2]
        ADDS     r0,r3,r0
        SUBS     r0,r0,#1
        CMP      r0,r1
        BLE      |L3.82|
        MOVS     r0,#1
        B        |L3.16|
|L3.60|
        MOVS     r0,#0xff
        ADDS     r0,#1
        LDR      r3,[r0,r2]
        ADDS     r0,r0,#4
        LDR      r0,[r0,r2]
        SUBS     r0,r3,r0
        SUBS     r0,r0,#1
        CMP      r0,r1
        BLE      |L3.82|
        MOVS     r0,#1
        B        |L3.16|
|L3.82|
        MOVS     r0,#0
        B        |L3.16|
        ENDP


        AREA ||i.hist_restore_line||, CODE, READONLY, ALIGN=1

hist_restore_line PROC
        PUSH     {r0-r2,r4-r7,lr}
        SUB      sp,sp,#0x10
        MOV      r4,r0
        MOV      r7,r1
        MOVS     r0,#0
        STR      r0,[sp,#0xc]
        MOVS     r0,#0xff
        ADDS     r0,#1
        LDR      r6,[r0,r4]
        B        |L4.38|
|L4.20|
        LDRB     r0,[r4,r6]
        ADDS     r0,r0,#1
        ADDS     r6,r0,r6
        CMP      r6,#0xfe
        BLT      |L4.32|
        SUBS     r6,r6,#0xfe
|L4.32|
        LDR      r0,[sp,#0xc]
        ADDS     r0,r0,#1
        STR      r0,[sp,#0xc]
|L4.38|
        LDRB     r0,[r4,r6]
        CMP      r0,#0
        BNE      |L4.20|
        LDR      r0,[sp,#0x18]
        CMP      r0,#0
        BNE      |L4.218|
        MOVS     r0,#0xff
        ADDS     r0,r0,#9
        LDR      r1,[r0,r4]
        LDR      r0,[sp,#0xc]
        CMP      r1,r0
        BGT      |L4.216|
        MOVS     r0,#0xff
        ADDS     r0,#1
        LDR      r5,[r0,r4]
        MOVS     r0,#0
        STR      r0,[sp,#8]
        B        |L4.92|
|L4.74|
        LDRB     r0,[r4,r5]
        ADDS     r0,r0,#1
        ADDS     r5,r0,r5
        CMP      r5,#0xfe
        BLT      |L4.86|
        SUBS     r5,r5,#0xfe
|L4.86|
        LDR      r0,[sp,#8]
        ADDS     r0,r0,#1
        STR      r0,[sp,#8]
|L4.92|
        LDRB     r0,[r4,r5]
        CMP      r0,#0
        BEQ      |L4.116|
        LDR      r1,[sp,#8]
        LDR      r0,[sp,#0xc]
        SUBS     r0,r0,r1
        SUBS     r0,r0,#1
        MOVS     r1,#0xff
        ADDS     r1,r1,#9
        LDR      r1,[r1,r4]
        CMP      r0,r1
        BNE      |L4.74|
|L4.116|
        LDRB     r0,[r4,r5]
        CMP      r0,#0
        BEQ      |L4.216|
        MOVS     r0,#0xff
        ADDS     r0,r0,#9
        LDR      r0,[r0,r4]
        ADDS     r0,r0,#1
        MOVS     r1,#0xff
        ADDS     r1,r1,#9
        STR      r0,[r1,r4]
        LDRB     r0,[r4,r5]
        ADDS     r0,r0,r5
        CMP      r0,#0xfe
        BGE      |L4.166|
        MOVS     r1,#0xff
        MOV      r0,r7
        BL       __aeabi_memclr
        LDRB     r2,[r4,r5]
        ADDS     r0,r4,r5
        ADDS     r1,r0,#1
        MOV      r0,r7
        BL       __aeabi_memcpy
        B        |L4.210|
|L4.166|
        MOVS     r0,#0xfe
        SUBS     r0,r0,r5
        SUBS     r0,r0,#1
        STR      r0,[sp,#4]
        MOVS     r1,#0xff
        MOV      r0,r7
        BL       __aeabi_memclr
        ADDS     r0,r4,r5
        ADDS     r1,r0,#1
        MOV      r0,r7
        LDR      r2,[sp,#4]
        BL       __aeabi_memcpy
        LDRB     r3,[r4,r5]
        LDR      r1,[sp,#4]
        SUBS     r2,r3,r1
        ADDS     r0,r7,r1
        MOV      r1,r4
        BL       __aeabi_memcpy
        NOP      
|L4.210|
        LDRB     r0,[r4,r5]
|L4.212|
        ADD      sp,sp,#0x1c
        POP      {r4-r7,pc}
|L4.216|
        B        |L4.360|
|L4.218|
        MOVS     r0,#0xff
        ADDS     r0,r0,#9
        LDR      r0,[r0,r4]
        CMP      r0,#0
        BLE      |L4.356|
        MOVS     r0,#0xff
        ADDS     r0,r0,#9
        LDR      r0,[r0,r4]
        SUBS     r0,r0,#1
        MOVS     r1,#0xff
        ADDS     r1,r1,#9
        STR      r0,[r1,r4]
        MOVS     r0,#0xff
        ADDS     r0,#1
        LDR      r5,[r0,r4]
        MOVS     r0,#0
        STR      r0,[sp,#8]
        B        |L4.272|
|L4.254|
        LDRB     r0,[r4,r5]
        ADDS     r0,r0,#1
        ADDS     r5,r0,r5
        CMP      r5,#0xfe
        BLT      |L4.266|
        SUBS     r5,r5,#0xfe
|L4.266|
        LDR      r0,[sp,#8]
        ADDS     r0,r0,#1
        STR      r0,[sp,#8]
|L4.272|
        LDRB     r0,[r4,r5]
        CMP      r0,#0
        BEQ      |L4.294|
        LDR      r1,[sp,#8]
        LDR      r0,[sp,#0xc]
        SUBS     r1,r0,r1
        MOVS     r0,#0xff
        ADDS     r0,r0,#9
        LDR      r0,[r0,r4]
        CMP      r1,r0
        BNE      |L4.254|
|L4.294|
        LDRB     r0,[r4,r5]
        ADDS     r0,r0,r5
        CMP      r0,#0xfe
        BGE      |L4.316|
        LDRB     r2,[r4,r5]
        ADDS     r0,r4,r5
        ADDS     r1,r0,#1
        MOV      r0,r7
        BL       __aeabi_memcpy
        B        |L4.352|
|L4.316|
        MOVS     r0,#0xfe
        SUBS     r0,r0,r5
        SUBS     r0,r0,#1
        STR      r0,[sp,#4]
        ADDS     r0,r4,r5
        ADDS     r1,r0,#1
        MOV      r0,r7
        LDR      r2,[sp,#4]
        BL       __aeabi_memcpy
        LDRB     r3,[r4,r5]
        LDR      r1,[sp,#4]
        SUBS     r2,r3,r1
        ADDS     r0,r7,r1
        MOV      r1,r4
        BL       __aeabi_memcpy
        NOP      
|L4.352|
        LDRB     r0,[r4,r5]
        B        |L4.212|
|L4.356|
        MOVS     r0,#0
        B        |L4.212|
|L4.360|
        MOVS     r0,#0
        MVNS     r0,r0
        B        |L4.212|
        ENDP


        AREA ||i.hist_save_line||, CODE, READONLY, ALIGN=1

hist_save_line PROC
        PUSH     {r3-r7,lr}
        MOV      r4,r0
        MOV      r7,r1
        MOV      r5,r2
        CMP      r5,#0xfc
        BLE      |L5.14|
|L5.12|
        POP      {r3-r7,pc}
|L5.14|
        B        |L5.22|
|L5.16|
        MOV      r0,r4
        BL       hist_erase_older
|L5.22|
        MOV      r1,r5
        MOV      r0,r4
        BL       hist_is_space_for_new
        CMP      r0,#0
        BEQ      |L5.16|
        MOVS     r0,#0xff
        ADDS     r0,#1
        LDR      r0,[r0,r4]
        LDRB     r0,[r4,r0]
        CMP      r0,#0
        BNE      |L5.54|
        MOVS     r0,#0xff
        ADDS     r0,#1
        LDR      r0,[r0,r4]
        STRB     r5,[r4,r0]
|L5.54|
        MOVS     r0,#0xff
        ADDS     r0,#5
        LDR      r0,[r0,r4]
        MOVS     r1,#0xfe
        SUBS     r0,r1,r0
        SUBS     r0,r0,#1
        CMP      r0,r5
        BLE      |L5.88|
        ADDS     r1,r1,#6
        LDR      r1,[r1,r4]
        ADDS     r1,r1,r4
        ADDS     r0,r1,#1
        MOV      r2,r5
        MOV      r1,r7
        BL       __aeabi_memcpy
        B        |L5.128|
|L5.88|
        MOVS     r0,#0xff
        ADDS     r0,#5
        LDR      r0,[r0,r4]
        MOVS     r1,#0xfe
        SUBS     r0,r1,r0
        SUBS     r6,r0,#1
        ADDS     r1,r1,#6
        LDR      r1,[r1,r4]
        ADDS     r1,r1,r4
        ADDS     r0,r1,#1
        MOV      r2,r6
        MOV      r1,r7
        BL       __aeabi_memcpy
        SUBS     r2,r5,r6
        ADDS     r1,r7,r6
        MOV      r0,r4
        BL       __aeabi_memcpy
        NOP      
|L5.128|
        MOVS     r0,#0xff
        ADDS     r0,#5
        LDR      r0,[r0,r4]
        STRB     r5,[r4,r0]
        MOVS     r0,#0xff
        ADDS     r0,#5
        LDR      r0,[r0,r4]
        ADDS     r0,r0,r5
        ADDS     r0,r0,#1
        MOVS     r1,#0xff
        ADDS     r1,#5
        STR      r0,[r1,r4]
        MOV      r0,r1
        LDR      r0,[r0,r4]
        CMP      r0,#0xfe
        BLT      |L5.168|
        MOV      r0,r1
        LDR      r0,[r0,r4]
        SUBS     r0,r0,#0xfe
        STR      r0,[r1,r4]
|L5.168|
        MOVS     r1,#0
        MOVS     r0,#0xff
        ADDS     r0,#5
        LDR      r0,[r0,r4]
        STRB     r1,[r4,r0]
        MOVS     r0,#0xff
        ADDS     r0,r0,#9
        STR      r1,[r0,r4]
        NOP      
        B        |L5.12|
        ENDP


        AREA ||i.hist_search||, CODE, READONLY, ALIGN=1

hist_search PROC
        PUSH     {r4-r6,lr}
        MOV      r4,r0
        MOV      r6,r1
        MOV      r2,r6
        MOV      r1,r4
        ADDS     r1,r1,#0xff
        ADDS     r1,r1,#0x12
        ADDS     r0,r4,#4
        BL       hist_restore_line
        MOV      r5,r0
        CMP      r5,#0
        BLT      |L6.66|
        MOVS     r1,#0
        MOV      r0,r4
        ADDS     r0,r0,#0xff
        ADDS     r0,r0,#0x12
        STRB     r1,[r0,r5]
        MOVS     r0,#0x21
        LSLS     r0,r0,#4
        STR      r5,[r0,r4]
        ADDS     r0,r0,#4
        STR      r5,[r0,r4]
        MOV      r0,r4
        BL       terminal_reset_cursor
        MOVS     r0,#0x85
        LSLS     r0,r0,#2
        LDR      r2,[r0,r4]
        MOVS     r1,#0
        MOV      r0,r4
        BL       terminal_print_line
|L6.66|
        POP      {r4-r6,pc}
        ENDP


        AREA ||i.microrl_backspace||, CODE, READONLY, ALIGN=2

microrl_backspace PROC
        PUSH     {r4-r6,lr}
        MOV      r4,r0
        MOVS     r0,#0x85
        LSLS     r0,r0,#2
        LDR      r0,[r0,r4]
        CMP      r0,#0
        BLE      |L7.122|
        NOP      
        MOVS     r0,#0x43
        LSLS     r0,r0,#3
        ADDS     r0,r4,r0
        LDR      r1,[r0,#0x10]
        ADR      r0,|L7.124|
        BLX      r1
        NOP      
        MOVS     r3,#0x21
        LSLS     r3,r3,#4
        LDR      r5,[r3,r4]
        ADDS     r3,r3,#4
        LDR      r3,[r3,r4]
        SUBS     r3,r5,r3
        ADDS     r2,r3,#1
        MOVS     r3,#0x85
        LSLS     r3,r3,#2
        LDR      r5,[r3,r4]
        MOV      r3,r4
        ADDS     r3,r3,#0xff
        ADDS     r3,r3,#0x12
        ADDS     r1,r5,r3
        MOVS     r3,#0x85
        LSLS     r3,r3,#2
        LDR      r5,[r3,r4]
        MOV      r3,r4
        ADDS     r3,r3,#0xff
        ADDS     r3,r3,#0x12
        ADDS     r3,r5,r3
        SUBS     r0,r3,#1
        BL       __aeabi_memmove
        MOVS     r0,#0x85
        LSLS     r0,r0,#2
        LDR      r0,[r0,r4]
        SUBS     r0,r0,#1
        MOVS     r1,#0x85
        LSLS     r1,r1,#2
        STR      r0,[r1,r4]
        MOVS     r1,#0
        MOVS     r0,#0x21
        LSLS     r0,r0,#4
        LDR      r2,[r0,r4]
        MOV      r0,r4
        ADDS     r0,r0,#0xff
        ADDS     r0,r0,#0x12
        STRB     r1,[r0,r2]
        MOVS     r0,#0x21
        LSLS     r0,r0,#4
        LDR      r0,[r0,r4]
        SUBS     r0,r0,#1
        MOVS     r1,#0x21
        LSLS     r1,r1,#4
        STR      r0,[r1,r4]
|L7.122|
        POP      {r4-r6,pc}
        ENDP

|L7.124|
        DCB      27,"[D ",27,"[D",0

        AREA ||i.microrl_init||, CODE, READONLY, ALIGN=2

microrl_init PROC
        PUSH     {r4-r6,lr}
        MOV      r4,r0
        MOV      r5,r1
        MOVS     r1,#0xff
        MOV      r0,r4
        ADDS     r0,r0,#0xff
        ADDS     r0,r0,#0x12
        BL       __aeabi_memclr
        MOVS     r1,#0xfe
        ADDS     r0,r4,#4
        BL       __aeabi_memclr4
        MOVS     r1,#0
        MOVS     r0,#0xff
        ADDS     r0,#5
        STR      r1,[r0,r4]
        ADDS     r0,r0,#4
        STR      r1,[r0,r4]
        ADDS     r0,r0,#4
        STR      r1,[r0,r4]
        MOVS     r0,#0
        STRB     r0,[r4,#1]
        MOVS     r0,#0x21
        LSLS     r0,r0,#4
        STR      r1,[r0,r4]
        ADDS     r0,r0,#4
        STR      r1,[r0,r4]
        MOVS     r2,#0x20
        MOV      r1,r5
        ADDS     r0,r0,#4
        ADDS     r0,r4,r0
        BL       __aeabi_memcpy4
        MOVS     r0,#0x43
        LSLS     r0,r0,#3
        LDR      r0,[r0,r4]
        CMP      r0,#0
        BNE      |L8.96|
        ADR      r1,|L8.104|
        MOVS     r0,#0x43
        LSLS     r0,r0,#3
        STR      r1,[r0,r4]
        MOVS     r0,#8
        MOVS     r1,#0x43
        LSLS     r1,r1,#3
        ADDS     r1,r4,r1
        STRB     r0,[r1,#4]
|L8.96|
        MOV      r0,r4
        BL       print_prompt
        POP      {r4-r6,pc}
        ENDP

|L8.104|
        DCB      27,"[97mstm32 >",27,"[0m ",0
        DCB      0
        DCB      0

        AREA ||i.microrl_insert_char||, CODE, READONLY, ALIGN=2

microrl_insert_char PROC
        PUSH     {r0,r1,r4-r6,lr}
        MOV      r4,r0
        LDRB     r0,[r4,#1]
        CMP      r0,#0
        BEQ      |L9.30|
        LDR      r0,[sp,#4]
        UXTB     r1,r0
        MOV      r0,r4
        BL       escape_process
        CMP      r0,#0
        BEQ      |L9.28|
        MOVS     r0,#0
        STRB     r0,[r4,#1]
|L9.28|
        B        |L9.670|
|L9.30|
        LDR      r0,[sp,#4]
        CMP      r0,#0xc
        BEQ      |L9.270|
        BGT      |L9.58|
        MOVS     r3,r0
        BL       __ARM_common_switch8
        DCB      0x0c,0x83,0x84,0x9f
        DCB      0xec,0xfe,0x72,0x8c
        DCB      0x83,0xbc,0x83,0x1f
        DCB      0x65,0x83
|L9.58|
        CMP      r0,#0x15
        BEQ      |L9.114|
        BGT      |L9.82|
        CMP      r0,#0xd
        BEQ      |L9.96|
        CMP      r0,#0xe
        BEQ      |L9.302|
        CMP      r0,#0x10
        BEQ      |L9.304|
        CMP      r0,#0x12
|L9.78|
        BNE      |L9.306|
        B        |L9.442|
|L9.82|
        CMP      r0,#0x17
        BEQ      |L9.148|
        CMP      r0,#0x1b
        BEQ      |L9.108|
        CMP      r0,#0x7f
        BNE      |L9.78|
        B        |L9.418|
|L9.96|
        MOVS     r1,#1
        MOV      r0,r4
        BL       new_line_handler
        B        |L9.668|
        B        |L9.668|
|L9.108|
        MOVS     r0,#1
        STRB     r0,[r4,#1]
        B        |L9.668|
|L9.114|
        B        |L9.122|
|L9.116|
        MOV      r0,r4
        BL       microrl_backspace
|L9.122|
        MOVS     r0,#0x85
        LSLS     r0,r0,#2
        LDR      r0,[r0,r4]
        CMP      r0,#0
        BGT      |L9.116|
        MOVS     r0,#0x85
        LSLS     r0,r0,#2
        LDR      r2,[r0,r4]
        MOVS     r1,#0
        MOV      r0,r4
        BL       terminal_print_line
        B        |L9.668|
|L9.148|
        MOVS     r5,#0
        B        |L9.218|
|L9.152|
        BL       __rt_ctype_table
        LDR      r2,[r0,#0]
        MOVS     r0,#0x85
        LSLS     r0,r0,#2
        LDR      r0,[r0,r4]
        SUBS     r0,r0,#1
        MOV      r1,r4
        ADDS     r1,r1,#0xff
        ADDS     r1,r1,#0x12
        LDRB     r0,[r1,r0]
        LDRB     r0,[r2,r0]
        MOVS     r1,#0x38
        ANDS     r0,r0,r1
        CMP      r0,#0
        BEQ      |L9.186|
        MOVS     r5,#1
|L9.186|
        MOVS     r0,#0x85
        LSLS     r0,r0,#2
        LDR      r0,[r0,r4]
        SUBS     r0,r0,#1
        MOV      r1,r4
        ADDS     r1,r1,#0xff
        ADDS     r1,r1,#0x12
        LDRB     r0,[r1,r0]
        CMP      r0,#0
        BNE      |L9.212|
        CMP      r5,#0
        BEQ      |L9.212|
        B        |L9.228|
|L9.212|
        MOV      r0,r4
        BL       microrl_backspace
|L9.218|
        MOVS     r0,#0x85
        LSLS     r0,r0,#2
        LDR      r0,[r0,r4]
        CMP      r0,#0
        BGT      |L9.152|
|L9.228|
        NOP      
        MOVS     r0,#0x85
        LSLS     r0,r0,#2
        LDR      r2,[r0,r4]
        LDR      r1,[r0,r4]
        MOV      r0,r4
        BL       terminal_print_line
        B        |L9.668|
        MOVS     r0,#0x43
        LSLS     r0,r0,#3
        ADDS     r0,r4,r0
        LDR      r1,[r0,#0x10]
        ADR      r0,|L9.672|
        BLX      r1
        MOVS     r0,#0x85
        LSLS     r0,r0,#2
        LDR      r1,[r0,r4]
        SUBS     r0,r0,#4
        STR      r1,[r0,r4]
        B        |L9.668|
|L9.270|
        B        |L9.476|
        MOVS     r0,#0x21
        LSLS     r0,r0,#4
        LDR      r2,[r0,r4]
        ADDS     r0,r0,#4
        LDR      r0,[r0,r4]
        SUBS     r1,r2,r0
        MOV      r0,r4
        BL       terminal_move_cursor
        MOVS     r0,#0x21
        LSLS     r0,r0,#4
        LDR      r1,[r0,r4]
        ADDS     r0,r0,#4
        STR      r1,[r0,r4]
        B        |L9.668|
|L9.302|
        B        |L9.408|
|L9.304|
        B        |L9.398|
|L9.306|
        B        |L9.612|
        MOV      r0,r4
        BL       terminal_reset_cursor
        MOVS     r1,#0
        MOVS     r0,#0x85
        LSLS     r0,r0,#2
        STR      r1,[r0,r4]
        B        |L9.668|
        MOVS     r0,#0x85
        LSLS     r0,r0,#2
        LDR      r1,[r0,r4]
        SUBS     r0,r0,#4
        LDR      r0,[r0,r4]
        CMP      r1,r0
        BGE      |L9.360|
        MOVS     r1,#1
        MOV      r0,r4
        BL       terminal_move_cursor
        MOVS     r0,#0x85
        LSLS     r0,r0,#2
        LDR      r0,[r0,r4]
        ADDS     r0,r0,#1
        MOVS     r1,#0x85
        LSLS     r1,r1,#2
        STR      r0,[r1,r4]
|L9.360|
        B        |L9.668|
        MOVS     r0,#0x85
        LSLS     r0,r0,#2
        LDR      r0,[r0,r4]
        CMP      r0,#0
        BEQ      |L9.396|
        MOVS     r1,#0
        MVNS     r1,r1
        MOV      r0,r4
        BL       terminal_move_cursor
        MOVS     r0,#0x85
        LSLS     r0,r0,#2
        LDR      r0,[r0,r4]
        SUBS     r0,r0,#1
        MOVS     r1,#0x85
        LSLS     r1,r1,#2
        STR      r0,[r1,r4]
|L9.396|
        B        |L9.668|
|L9.398|
        MOVS     r1,#0
        MOV      r0,r4
        BL       hist_search
        B        |L9.668|
|L9.408|
        MOVS     r1,#1
        MOV      r0,r4
        BL       hist_search
        B        |L9.668|
|L9.418|
        NOP      
        MOV      r0,r4
        BL       microrl_backspace
        MOVS     r0,#0x85
        LSLS     r0,r0,#2
        LDR      r2,[r0,r4]
        LDR      r1,[r0,r4]
        MOV      r0,r4
        BL       terminal_print_line
        B        |L9.668|
|L9.442|
        MOV      r0,r4
        BL       terminal_newline
        MOV      r0,r4
        BL       print_prompt
        MOV      r0,r4
        BL       terminal_reset_cursor
        MOVS     r0,#0x85
        LSLS     r0,r0,#2
        LDR      r2,[r0,r4]
        MOVS     r1,#0
        MOV      r0,r4
        BL       terminal_print_line
        B        |L9.668|
|L9.476|
        MOVS     r0,#0x43
        LSLS     r0,r0,#3
        ADDS     r0,r4,r0
        LDR      r1,[r0,#0x10]
        ADR      r0,|L9.676|
        BLX      r1
        MOV      r0,r4
        BL       print_prompt
        MOV      r0,r4
        BL       terminal_reset_cursor
        MOVS     r0,#0x85
        LSLS     r0,r0,#2
        LDR      r2,[r0,r4]
        MOVS     r1,#0
        MOV      r0,r4
        BL       terminal_print_line
        B        |L9.668|
        MOVS     r0,#0xff
        ADDS     r0,r0,#0x11
        LDRB     r0,[r0,r4]
        CMP      r0,#0
        BEQ      |L9.570|
        MOVS     r0,#0x43
        LSLS     r0,r0,#3
        ADDS     r0,r4,r0
        LDR      r0,[r0,#0x14]
        CMP      r0,#0
        BEQ      |L9.560|
        MOVS     r2,#0x43
        LSLS     r2,r2,#3
        ADDS     r2,r4,r2
        LDR      r0,[r2,#0x1c]
        MOVS     r2,#0x43
        LSLS     r2,r2,#3
        B        |L9.554|
        B        |L9.580|
|L9.554|
        ADDS     r2,r4,r2
        LDR      r1,[r2,#0x14]
        BLX      r1
|L9.560|
        MOVS     r1,#0
        MOVS     r0,#0xff
        ADDS     r0,r0,#0x11
        STRB     r1,[r0,r4]
        B        |L9.578|
|L9.570|
        MOVS     r1,#0
        MOV      r0,r4
        BL       new_line_handler
|L9.578|
        B        |L9.668|
|L9.580|
        MOVS     r0,#0x43
        LSLS     r0,r0,#3
        ADDS     r0,r4,r0
        LDR      r0,[r0,#0x18]
        CMP      r0,#0
        BEQ      |L9.610|
        MOVS     r2,#0x43
        LSLS     r2,r2,#3
        ADDS     r2,r4,r2
        LDR      r0,[r2,#0x1c]
        MOVS     r2,#0x43
        LSLS     r2,r2,#3
        ADDS     r2,r4,r2
        LDR      r1,[r2,#0x18]
        BLX      r1
|L9.610|
        B        |L9.668|
|L9.612|
        LDR      r0,[sp,#4]
        CMP      r0,#0x20
        BNE      |L9.628|
        MOVS     r0,#0x21
        LSLS     r0,r0,#4
        LDR      r0,[r0,r4]
        CMP      r0,#0
        BEQ      |L9.634|
|L9.628|
        LDR      r0,[sp,#4]
        CMP      r0,#0x1f
        BGT      |L9.636|
|L9.634|
        B        |L9.668|
|L9.636|
        MOVS     r2,#1
        ADD      r1,sp,#4
        MOV      r0,r4
        BL       microrl_insert_text
        CMP      r0,#0
        BEQ      |L9.666|
        MOVS     r0,#0x85
        LSLS     r0,r0,#2
        LDR      r2,[r0,r4]
        LDR      r0,[r0,r4]
        SUBS     r1,r0,#1
        MOV      r0,r4
        BL       terminal_print_line
|L9.666|
        NOP      
|L9.668|
        NOP      
|L9.670|
        POP      {r2-r6,pc}
        ENDP

|L9.672|
        DCB      27,"[K",0
|L9.676|
        DCB      27,"[2J",27,"[H",0

        AREA ||i.microrl_insert_text||, CODE, READONLY, ALIGN=1

microrl_insert_text PROC
        PUSH     {r3-r7,lr}
        MOV      r4,r0
        MOV      r7,r1
        MOV      r6,r2
        MOVS     r0,#0x21
        LSLS     r0,r0,#4
        LDR      r0,[r0,r4]
        ADDS     r0,r0,r6
        CMP      r0,#0xff
        BGE      |L10.172|
        MOVS     r0,#0x21
        LSLS     r0,r0,#4
        LDR      r0,[r0,r4]
        MOVS     r3,#0x85
        LSLS     r3,r3,#2
        LDR      r3,[r3,r4]
        SUBS     r2,r0,r3
        MOVS     r0,#0x85
        LSLS     r0,r0,#2
        LDR      r0,[r0,r4]
        MOV      r3,r4
        ADDS     r3,r3,#0xff
        ADDS     r3,r3,#0x12
        ADDS     r1,r0,r3
        MOVS     r0,#0x85
        LSLS     r0,r0,#2
        LDR      r0,[r0,r4]
        ADDS     r0,r0,r3
        ADDS     r0,r0,r6
        STR      r0,[sp,#0]
        BL       __aeabi_memmove
        MOVS     r5,#0
        B        |L10.126|
|L10.68|
        LDRB     r1,[r7,r5]
        MOVS     r0,#0x85
        LSLS     r0,r0,#2
        LDR      r0,[r0,r4]
        ADDS     r2,r0,r5
        MOV      r0,r4
        ADDS     r0,r0,#0xff
        ADDS     r0,r0,#0x12
        STRB     r1,[r0,r2]
        MOVS     r0,#0x85
        LSLS     r0,r0,#2
        LDR      r0,[r0,r4]
        ADDS     r1,r0,r5
        MOV      r0,r4
        ADDS     r0,r0,#0xff
        ADDS     r0,r0,#0x12
        LDRB     r0,[r0,r1]
        CMP      r0,#0x20
        BNE      |L10.124|
        MOVS     r1,#0
        MOVS     r0,#0x85
        LSLS     r0,r0,#2
        LDR      r0,[r0,r4]
        ADDS     r2,r0,r5
        MOV      r0,r4
        ADDS     r0,r0,#0xff
        ADDS     r0,r0,#0x12
        STRB     r1,[r0,r2]
|L10.124|
        ADDS     r5,r5,#1
|L10.126|
        CMP      r5,r6
        BLT      |L10.68|
        MOVS     r0,#0x85
        LSLS     r0,r0,#2
        LDR      r0,[r0,r4]
        ADDS     r1,r0,r6
        MOVS     r0,#0x85
        LSLS     r0,r0,#2
        STR      r1,[r0,r4]
        SUBS     r0,r0,#4
        LDR      r0,[r0,r4]
        ADDS     r1,r0,r6
        MOVS     r0,#0x21
        LSLS     r0,r0,#4
        STR      r1,[r0,r4]
        MOVS     r1,#0
        LDR      r2,[r0,r4]
        MOV      r0,r4
        ADDS     r0,r0,#0xff
        ADDS     r0,r0,#0x12
        STRB     r1,[r0,r2]
        MOVS     r0,#1
|L10.170|
        POP      {r3-r7,pc}
|L10.172|
        MOVS     r0,#0
        B        |L10.170|
        ENDP


        AREA ||i.microrl_set_complete_callback||, CODE, READONLY, ALIGN=1

microrl_set_complete_callback PROC
        MOVS     r2,#0x43
        LSLS     r2,r2,#3
        ADDS     r2,r0,r2
        STR      r1,[r2,#0xc]
        BX       lr
        ENDP


        AREA ||i.microrl_set_execute_callback||, CODE, READONLY, ALIGN=1

microrl_set_execute_callback PROC
        MOVS     r2,#0x43
        LSLS     r2,r2,#3
        ADDS     r2,r0,r2
        STR      r1,[r2,#8]
        BX       lr
        ENDP


        AREA ||i.microrl_set_prompt||, CODE, READONLY, ALIGN=1

microrl_set_prompt PROC
        MOVS     r3,#0x43
        LSLS     r3,r3,#3
        STR      r1,[r3,r0]
        ADDS     r3,r0,r3
        STRB     r2,[r3,#4]
        BX       lr
        ENDP


        AREA ||i.microrl_set_sigint_callback||, CODE, READONLY, ALIGN=1

microrl_set_sigint_callback PROC
        MOVS     r2,#0x43
        LSLS     r2,r2,#3
        ADDS     r2,r0,r2
        STR      r1,[r2,#0x14]
        BX       lr
        ENDP


        AREA ||i.new_line_handler||, CODE, READONLY, ALIGN=2

new_line_handler PROC
        PUSH     {r4-r6,lr}
        SUB      sp,sp,#0x20
        MOV      r4,r0
        MOV      r6,r1
        MOV      r0,r4
        BL       terminal_newline
        CMP      r6,#0
        BEQ      |L15.138|
        MOVS     r0,#0x21
        LSLS     r0,r0,#4
        LDR      r0,[r0,r4]
        CMP      r0,#0
        BLE      |L15.46|
        MOVS     r0,#0x21
        LSLS     r0,r0,#4
        LDR      r2,[r0,r4]
        MOV      r1,r4
        ADDS     r1,r1,#0xff
        ADDS     r1,r1,#0x12
        ADDS     r0,r4,#4
        BL       hist_save_line
|L15.46|
        MOVS     r0,#0x21
        LSLS     r0,r0,#4
        LDR      r1,[r0,r4]
        MOV      r2,sp
        MOV      r0,r4
        BL       split
        MOV      r5,r0
        ADDS     r0,r5,#1
        CMP      r0,#0
        BNE      |L15.92|
        MOVS     r0,#0x43
        LSLS     r0,r0,#3
        ADDS     r0,r4,r0
        LDR      r1,[r0,#0x10]
        ADR      r0,|L15.180|
        BLX      r1
        MOVS     r0,#0x43
        LSLS     r0,r0,#3
        ADDS     r0,r4,r0
        LDR      r1,[r0,#0x10]
        ADR      r0,|L15.204|
        BLX      r1
|L15.92|
        CMP      r5,#0
        BLE      |L15.138|
        MOVS     r0,#0x43
        LSLS     r0,r0,#3
        ADDS     r0,r4,r0
        LDR      r0,[r0,#8]
        CMP      r0,#0
        BEQ      |L15.138|
        MOVS     r1,#1
        MOVS     r0,#0xff
        ADDS     r0,r0,#0x11
        STRB     r1,[r0,r4]
        MOVS     r1,#0x43
        LSLS     r1,r1,#3
        ADDS     r1,r4,r1
        LDR      r0,[r1,#0x1c]
        MOVS     r1,#0x43
        LSLS     r1,r1,#3
        ADDS     r1,r4,r1
        MOV      r2,sp
        LDR      r3,[r1,#8]
        MOV      r1,r5
        BLX      r3
|L15.138|
        MOV      r0,r4
        BL       print_prompt
        MOVS     r1,#0
        MOVS     r0,#0x21
        LSLS     r0,r0,#4
        STR      r1,[r0,r4]
        ADDS     r0,r0,#4
        STR      r1,[r0,r4]
        MOVS     r1,#0xff
        MOV      r0,r4
        ADDS     r0,r0,#0xff
        ADDS     r0,r0,#0x12
        BL       __aeabi_memclr
        MOVS     r1,#0
        MOVS     r0,#0xff
        ADDS     r0,r0,#0xd
        STR      r1,[r0,r4]
        ADD      sp,sp,#0x20
        POP      {r4-r6,pc}
        ENDP

|L15.180|
        DCB      "ERROR:too many tokens",0
        DCB      0
        DCB      0
|L15.204|
        DCB      "\r",0
        DCB      0
        DCB      0

        AREA ||i.print_prompt||, CODE, READONLY, ALIGN=1

print_prompt PROC
        PUSH     {r4,lr}
        MOV      r4,r0
        MOVS     r2,#0x43
        LSLS     r2,r2,#3
        LDR      r0,[r2,r4]
        ADDS     r2,r4,r2
        LDR      r1,[r2,#0x10]
        BLX      r1
        POP      {r4,pc}
        ENDP


        AREA ||i.split||, CODE, READONLY, ALIGN=1

split PROC
        PUSH     {r4-r7,lr}
        MOV      r4,r0
        MOV      r3,r1
        MOV      r5,r2
        MOVS     r2,#0
        MOVS     r1,#0
        B        |L17.96|
|L17.14|
        B        |L17.18|
|L17.16|
        ADDS     r1,r1,#1
|L17.18|
        MOV      r0,r4
        ADDS     r0,r0,#0xff
        ADDS     r0,r0,#0x12
        LDRB     r0,[r0,r1]
        CMP      r0,#0
        BNE      |L17.34|
        CMP      r1,r3
        BLT      |L17.16|
|L17.34|
        CMP      r1,r3
        BLT      |L17.42|
        MOV      r0,r2
|L17.40|
        POP      {r4-r7,pc}
|L17.42|
        MOV      r0,r4
        ADDS     r0,r0,#0xff
        ADDS     r0,r0,#0x12
        ADDS     r6,r0,r1
        MOV      r0,r2
        ADDS     r2,r2,#1
        LSLS     r0,r0,#2
        STR      r6,[r5,r0]
        CMP      r2,#8
        BLT      |L17.68|
        MOVS     r0,#0
        MVNS     r0,r0
        B        |L17.40|
|L17.68|
        B        |L17.72|
|L17.70|
        ADDS     r1,r1,#1
|L17.72|
        MOV      r0,r4
        ADDS     r0,r0,#0xff
        ADDS     r0,r0,#0x12
        LDRB     r0,[r0,r1]
        CMP      r0,#0
        BEQ      |L17.88|
        CMP      r1,r3
        BLT      |L17.70|
|L17.88|
        CMP      r1,r3
        BLT      |L17.96|
        MOV      r0,r2
        B        |L17.40|
|L17.96|
        B        |L17.14|
        ENDP


        AREA ||i.terminal_move_cursor||, CODE, READONLY, ALIGN=2

        REQUIRE _printf_percent
        REQUIRE _printf_d
        REQUIRE _printf_int_dec
terminal_move_cursor PROC
        PUSH     {r0-r6,lr}
        MOV      r5,r0
        MOV      r4,r1
        MOVS     r0,#0
        STR      r0,[sp,#0]
        STR      r0,[sp,#4]
        STR      r0,[sp,#8]
        STR      r0,[sp,#0xc]
        CMP      r4,#0
        BLE      |L18.34|
        MOV      r3,r4
        ADR      r2,|L18.64|
        MOVS     r1,#0x10
        MOV      r0,sp
        BL       __2snprintf
        B        |L18.50|
|L18.34|
        CMP      r4,#0
        BGE      |L18.50|
        RSBS     r3,r4,#0
        ADR      r2,|L18.72|
        MOVS     r1,#0x10
        MOV      r0,sp
        BL       __2snprintf
|L18.50|
        MOVS     r0,#0x43
        LSLS     r0,r0,#3
        ADDS     r0,r5,r0
        LDR      r1,[r0,#0x10]
        MOV      r0,sp
        BLX      r1
        POP      {r0-r6,pc}
        ENDP

|L18.64|
        DCB      27,"[%dC",0
        DCB      0
        DCB      0
|L18.72|
        DCB      27,"[%dD",0
        DCB      0
        DCB      0

        AREA ||i.terminal_newline||, CODE, READONLY, ALIGN=2

terminal_newline PROC
        PUSH     {r4,lr}
        MOV      r4,r0
        MOVS     r0,#0x43
        LSLS     r0,r0,#3
        ADDS     r0,r4,r0
        LDR      r1,[r0,#0x10]
        ADR      r0,|L19.20|
        BLX      r1
        POP      {r4,pc}
        ENDP

        DCW      0x0000
|L19.20|
        DCB      "\r\n",0
        DCB      0

        AREA ||i.terminal_print_line||, CODE, READONLY, ALIGN=2

terminal_print_line PROC
        PUSH     {r3-r7,lr}
        MOV      r4,r0
        MOV      r6,r1
        MOV      r7,r2
        MOVS     r0,#0x43
        LSLS     r0,r0,#3
        ADDS     r0,r4,r0
        LDR      r1,[r0,#0x10]
        ADR      r0,|L20.92|
        BLX      r1
        MOVS     r0,#0
        STR      r0,[sp,#0]
        MOV      r5,r6
        B        |L20.66|
|L20.28|
        MOV      r0,r4
        ADDS     r0,r0,#0xff
        ADDS     r0,r0,#0x12
        LDRB     r1,[r0,r5]
        MOV      r0,sp
        STRB     r1,[r0,#0]
        LDRB     r0,[r0,#0]
        CMP      r0,#0
        BNE      |L20.52|
        MOVS     r0,#0x20
        MOV      r1,sp
        STRB     r0,[r1,#0]
|L20.52|
        MOVS     r0,#0x43
        LSLS     r0,r0,#3
        ADDS     r0,r4,r0
        LDR      r1,[r0,#0x10]
        MOV      r0,sp
        BLX      r1
        ADDS     r5,r5,#1
|L20.66|
        MOVS     r0,#0x21
        LSLS     r0,r0,#4
        LDR      r0,[r0,r4]
        CMP      r0,r5
        BGT      |L20.28|
        MOV      r0,r4
        BL       terminal_reset_cursor
        MOV      r1,r7
        MOV      r0,r4
        BL       terminal_move_cursor
        POP      {r3-r7,pc}
        ENDP

|L20.92|
        DCB      27,"[K",0

        AREA ||i.terminal_reset_cursor||, CODE, READONLY, ALIGN=2

        REQUIRE _printf_percent
        REQUIRE _printf_d
        REQUIRE _printf_int_dec
terminal_reset_cursor PROC
        PUSH     {r4,lr}
        SUB      sp,sp,#0x18
        MOV      r4,r0
        MOVS     r0,#0x43
        LSLS     r0,r0,#3
        ADDS     r0,r4,r0
        LDRB     r0,[r0,#4]
        STR      r0,[sp,#0]
        MOVS     r0,#0x43
        LSLS     r0,r0,#3
        ADDS     r0,r4,r0
        LDRB     r0,[r0,#4]
        ADDS     r3,r0,#7
        ADDS     r3,r3,#0xfa
        ADR      r2,|L21.56|
        MOVS     r1,#0x10
        ADD      r0,sp,#8
        BL       __2snprintf
        MOVS     r0,#0x43
        LSLS     r0,r0,#3
        ADDS     r0,r4,r0
        LDR      r1,[r0,#0x10]
        ADD      r0,sp,#8
        BLX      r1
        ADD      sp,sp,#0x18
        POP      {r4,pc}
        ENDP

        DCW      0x0000
|L21.56|
        DCB      27,"[%dD",27,"[%dC",0
        DCB      0

        AREA ||.arm_vfe_header||, DATA, READONLY, NOALLOC, ALIGN=2

        DCD      0x00000000

        AREA ||i.__ARM_common_switch8||, COMGROUP=__ARM_common_switch8, CODE, READONLY, ALIGN=1

__ARM_common_switch8 PROC
        PUSH     {r4,r5}
        MOV      r4,lr
        SUBS     r4,r4,#1
        LDRB     r5,[r4,#0]
        ADDS     r4,r4,#1
        CMP      r3,r5
        BCC      |L118.24|
|L118.14|
        LDRB     r3,[r4,r5]
        LSLS     r3,r3,#1
        ADDS     r3,r4,r3
        POP      {r4,r5}
        BX       r3
|L118.24|
        MOV      r5,r3
        B        |L118.14|
        ENDP


        EXPORT microrl_init [CODE]
        EXPORT microrl_insert_char [CODE]
        EXPORT microrl_set_complete_callback [CODE]
        EXPORT microrl_set_execute_callback [CODE]
        EXPORT microrl_set_prompt [CODE]
        EXPORT microrl_set_sigint_callback [CODE]
        EXPORT __ARM_common_switch8 [CODE]

        IMPORT ||Lib$$Request$$armlib|| [CODE,WEAK]
        IMPORT __aeabi_memcpy [CODE]
        IMPORT __aeabi_memclr [CODE]
        IMPORT _printf_percent [CODE]
        IMPORT _printf_d [CODE]
        IMPORT _printf_int_dec [CODE]
        IMPORT __2snprintf [CODE]
        IMPORT __aeabi_memclr4 [CODE]
        IMPORT __aeabi_memcpy4 [CODE]
        IMPORT __aeabi_memmove [CODE]
        IMPORT __rt_ctype_table [CODE]

        KEEP escape_process
        KEEP hist_erase_older
        KEEP hist_is_space_for_new
        KEEP hist_restore_line
        KEEP hist_save_line
        KEEP hist_search
        KEEP microrl_backspace
        KEEP microrl_insert_text
        KEEP new_line_handler
        KEEP print_prompt
        KEEP split
        KEEP terminal_move_cursor
        KEEP terminal_newline
        KEEP terminal_print_line
        KEEP terminal_reset_cursor

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