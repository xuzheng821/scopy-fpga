/**
 * This file is part of YAOS and licenced under the MIT licence.
 * Copyright (c) 2020 Thomas Oldbury
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */ 

#ifndef ___SHELL_COMMANDS_H___
#define ___SHELL_COMMANDS_H___

#include "shell.h"

extern struct shell_command_t shell_commands[];

void scmd_help(void);
void scmd_reset(void);
void scmd_volts(void);
void scmd_adc_pwr(void);
void scmd_pll_pwr(void);
void scmd_zynq_pwr(void);
void scmd_raspi_pwr(void);
void scmd_all_off(void);
void scmd_pll_freq(void);
void scmd_pll_tune(void);
void scmd_pll_profile(void);
void scmd_adc_reset(void);
void scmd_adc_test(void);
void scmd_adc_walk(void);
void scmd_adc_lvds_cdrv(void);
void scmd_adc_lvds_fdrv(void);
void scmd_adc_lvds_ddrv(void);
void scmd_adc_lvds_drv(void);
void scmd_adc_lvds_cterm(void);
void scmd_adc_lvds_fterm(void);
void scmd_adc_lvds_dterm(void);
void scmd_adc_lvds_term(void);
void scmd_adc_lvds_adv(void);
void scmd_adc_lvds_phas(void);
void scmd_adc_lvds_def(void);

#endif // ___SHELL_COMMANDS_H___
