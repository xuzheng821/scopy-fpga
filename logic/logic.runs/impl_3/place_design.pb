
�
Command: %s
1870*	planAhead2�
�read_checkpoint -auto_incremental -incremental C:/Users/Tom/Documents/Projects/Scopy_MVP_Platform/scopy-fpga/logic/logic.srcs/utils_1/imports/impl_3/mipi_csi_controller_routed.dcp2default:defaultZ12-2866h px� 
�
�Incremental flow is being run with directive '%s'. This will override place_design, post-place phys_opt_design and route_design directives being called.
3885*	planAhead2$
RuntimeOptimized2default:defaultZ12-8268h px� 
j

Starting %s Task
103*constraints2/
Incremental read checkpoint2default:defaultZ18-103h px� 
�

Phase %s%s
101*constraints2
1 2default:default28
$Process Reference Checkpoint Netlist2default:defaultZ18-101h px� 
f
-Analyzing %s Unisim elements for replacement
17*netlist2
292default:defaultZ29-17h px� 
j
2Unisim Transformation completed in %s CPU seconds
28*netlist2
02default:defaultZ29-28h px� 
�

%s
*constraints2s
_Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.054 . Memory (MB): peak = 2193.762 ; gain = 0.0002default:defaulth px� 
�
f%s is less than the threshold needed to run Incremental flow. Switching to default Implementation flow522*project20
Cell Matching & Net Matching2default:defaultZ1-964h px� 
�

%s
*constraints2o
[Time (s): cpu = 00:00:02 ; elapsed = 00:00:01 . Memory (MB): peak = 2193.762 ; gain = 0.0002default:defaulth px� 
g
BIncremental flow is disabled. No incremental reuse Info to report.423*	vivadotclZ4-1062h px� 
O
*Debug cores have already been implemented
153*	chipscopeZ16-240h px� 
Q
Command: %s
53*	vivadotcl2 
place_design2default:defaultZ4-113h px� 
�
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2"
Implementation2default:default2
xc7z014s2default:defaultZ17-347h px� 
�
0Got license for feature '%s' and/or device '%s'
310*common2"
Implementation2default:default2
xc7z014s2default:defaultZ17-349h px� 
P
Running DRC with %s threads
24*drc2
82default:defaultZ23-27h px� 
V
DRC finished with %s
79*	vivadotcl2
0 Errors2default:defaultZ4-198h px� 
e
BPlease refer to the DRC report (report_drc) for more information.
80*	vivadotclZ4-199h px� 
p
,Running DRC as a precondition to command %s
22*	vivadotcl2 
place_design2default:defaultZ4-22h px� 
P
Running DRC with %s threads
24*drc2
82default:defaultZ23-27h px� 
V
DRC finished with %s
79*	vivadotcl2
0 Errors2default:defaultZ4-198h px� 
e
BPlease refer to the DRC report (report_drc) for more information.
80*	vivadotclZ4-199h px� 
U

Starting %s Task
103*constraints2
Placer2default:defaultZ18-103h px� 
}
BMultithreading enabled for place_design using a maximum of %s CPUs12*	placeflow2
82default:defaultZ30-611h px� 
v

Phase %s%s
101*constraints2
1 2default:default2)
Placer Initialization2default:defaultZ18-101h px� 
�

Phase %s%s
101*constraints2
1.1 2default:default29
%Placer Initialization Netlist Sorting2default:defaultZ18-101h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0132default:default2
2193.7622default:default2
0.0002default:defaultZ17-268h px� 
Z
EPhase 1.1 Placer Initialization Netlist Sorting | Checksum: 4fdba06b
*commonh px� 
�

%s
*constraints2s
_Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.023 . Memory (MB): peak = 2193.762 ; gain = 0.0002default:defaulth px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0152default:default2
2193.7622default:default2
0.0002default:defaultZ17-268h px� 
�

Phase %s%s
101*constraints2
1.2 2default:default2F
2IO Placement/ Clock Placement/ Build Placer Device2default:defaultZ18-101h px� 
g
RPhase 1.2 IO Placement/ Clock Placement/ Build Placer Device | Checksum: 4ce47882
*commonh px� 
�

%s
*constraints2o
[Time (s): cpu = 00:00:04 ; elapsed = 00:00:02 . Memory (MB): peak = 2193.762 ; gain = 0.0002default:defaulth px� 
}

Phase %s%s
101*constraints2
1.3 2default:default2.
Build Placer Netlist Model2default:defaultZ18-101h px� 
P
;Phase 1.3 Build Placer Netlist Model | Checksum: 20198bf64
*commonh px� 
�

%s
*constraints2o
[Time (s): cpu = 00:00:12 ; elapsed = 00:00:06 . Memory (MB): peak = 2193.762 ; gain = 0.0002default:defaulth px� 
z

Phase %s%s
101*constraints2
1.4 2default:default2+
Constrain Clocks/Macros2default:defaultZ18-101h px� 
M
8Phase 1.4 Constrain Clocks/Macros | Checksum: 20198bf64
*commonh px� 
�

%s
*constraints2o
[Time (s): cpu = 00:00:12 ; elapsed = 00:00:06 . Memory (MB): peak = 2193.762 ; gain = 0.0002default:defaulth px� 
I
4Phase 1 Placer Initialization | Checksum: 20198bf64
*commonh px� 
�

%s
*constraints2o
[Time (s): cpu = 00:00:12 ; elapsed = 00:00:06 . Memory (MB): peak = 2193.762 ; gain = 0.0002default:defaulth px� 
q

Phase %s%s
101*constraints2
2 2default:default2$
Global Placement2default:defaultZ18-101h px� 
p

Phase %s%s
101*constraints2
2.1 2default:default2!
Floorplanning2default:defaultZ18-101h px� 
C
.Phase 2.1 Floorplanning | Checksum: 1ca986e5a
*commonh px� 
�

%s
*constraints2o
[Time (s): cpu = 00:00:16 ; elapsed = 00:00:07 . Memory (MB): peak = 2193.762 ; gain = 0.0002default:defaulth px� 
x

Phase %s%s
101*constraints2
2.2 2default:default2)
Global Placement Core2default:defaultZ18-101h px� 
�

Phase %s%s
101*constraints2
2.2.1 2default:default20
Physical Synthesis In Placer2default:defaultZ18-101h px� 
u
7Found %s candidate LUT instances to create LUTNM shape
536*physynth2
6722default:defaultZ32-1018h px� 
�
aEnd %s Pass. Optimized %s %s. Created %s new %s, deleted %s existing %s and moved %s existing %s
415*physynth2
12default:default2
3342default:default2!
nets or cells2default:default2
892default:default2
cells2default:default2
2452default:default2
cells2default:default2
02default:default2
cell2default:defaultZ32-775h px� 
K
)No high fanout nets found in the design.
65*physynthZ32-65h px� 
�
$Optimized %s %s. Created %s new %s.
216*physynth2
02default:default2
net2default:default2
02default:default2
instance2default:defaultZ32-232h px� 
�
aEnd %s Pass. Optimized %s %s. Created %s new %s, deleted %s existing %s and moved %s existing %s
415*physynth2
12default:default2
02default:default2
net or cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:defaultZ32-775h px� 
�
DNet %s could not be optimized because driver %s could not be cloned
117*physynth2�
�nolabel_line119/adc_axi_streamer/inst/adc_streamer_v2_0_M00_AXIS_inst/nolabel_line227/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwas.wsts/ram_full_fb_i_reg_0[0]�nolabel_line119/adc_axi_streamer/inst/adc_streamer_v2_0_M00_AXIS_inst/nolabel_line227/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwas.wsts/ram_full_fb_i_reg_0[0]2default:default2�
�nolabel_line119/adc_axi_streamer/inst/adc_streamer_v2_0_M00_AXIS_inst/nolabel_line227/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwas.wsts/DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_i_5	�nolabel_line119/adc_axi_streamer/inst/adc_streamer_v2_0_M00_AXIS_inst/nolabel_line227/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwas.wsts/DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_i_52default:default8Z32-117h px� 
�
DNet %s could not be optimized because driver %s could not be cloned
117*physynth2�
�nolabel_line119/adc_axi_streamer/inst/adc_streamer_v2_0_M00_AXIS_inst/nolabel_line227/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwas.wsts/WEA[0]�nolabel_line119/adc_axi_streamer/inst/adc_streamer_v2_0_M00_AXIS_inst/nolabel_line227/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwas.wsts/WEA[0]2default:default2�
�nolabel_line119/adc_axi_streamer/inst/adc_streamer_v2_0_M00_AXIS_inst/nolabel_line227/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwas.wsts/DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_i_1__2	�nolabel_line119/adc_axi_streamer/inst/adc_streamer_v2_0_M00_AXIS_inst/nolabel_line227/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwas.wsts/DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_i_1__22default:default8Z32-117h px� 
�
DNet %s could not be optimized because driver %s could not be cloned
117*physynth2�
�nolabel_line119/adc_axi_streamer/inst/adc_streamer_v2_0_M00_AXIS_inst/nolabel_line227/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwas.wsts/ram_full_fb_i_reg_1[0]�nolabel_line119/adc_axi_streamer/inst/adc_streamer_v2_0_M00_AXIS_inst/nolabel_line227/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwas.wsts/ram_full_fb_i_reg_1[0]2default:default2�
�nolabel_line119/adc_axi_streamer/inst/adc_streamer_v2_0_M00_AXIS_inst/nolabel_line227/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwas.wsts/DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_i_1__4	�nolabel_line119/adc_axi_streamer/inst/adc_streamer_v2_0_M00_AXIS_inst/nolabel_line227/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwas.wsts/DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_i_1__42default:default8Z32-117h px� 
�
DNet %s could not be optimized because driver %s could not be cloned
117*physynth2�
Qnolabel_line119/adc_receiver_core_0/inst/nolabel_line57/asi2_mod_inst7/adc_bus[0]Qnolabel_line119/adc_receiver_core_0/inst/nolabel_line57/asi2_mod_inst7/adc_bus[0]2default:default2�
Ynolabel_line119/adc_receiver_core_0/inst/nolabel_line57/asi2_mod_inst7/adc_bus[56]_INST_0	Ynolabel_line119/adc_receiver_core_0/inst/nolabel_line57/asi2_mod_inst7/adc_bus[56]_INST_02default:default8Z32-117h px� 
�
DNet %s could not be optimized because driver %s could not be cloned
117*physynth2�
Qnolabel_line119/adc_receiver_core_0/inst/nolabel_line57/asi2_mod_inst7/adc_bus[3]Qnolabel_line119/adc_receiver_core_0/inst/nolabel_line57/asi2_mod_inst7/adc_bus[3]2default:default2�
Ynolabel_line119/adc_receiver_core_0/inst/nolabel_line57/asi2_mod_inst7/adc_bus[59]_INST_0	Ynolabel_line119/adc_receiver_core_0/inst/nolabel_line57/asi2_mod_inst7/adc_bus[59]_INST_02default:default8Z32-117h px� 
�
DNet %s could not be optimized because driver %s could not be cloned
117*physynth2�
Qnolabel_line119/adc_receiver_core_0/inst/nolabel_line57/asi2_mod_inst7/adc_bus[1]Qnolabel_line119/adc_receiver_core_0/inst/nolabel_line57/asi2_mod_inst7/adc_bus[1]2default:default2�
Ynolabel_line119/adc_receiver_core_0/inst/nolabel_line57/asi2_mod_inst7/adc_bus[57]_INST_0	Ynolabel_line119/adc_receiver_core_0/inst/nolabel_line57/asi2_mod_inst7/adc_bus[57]_INST_02default:default8Z32-117h px� 
�
DNet %s could not be optimized because driver %s could not be cloned
117*physynth2�
Qnolabel_line119/adc_receiver_core_0/inst/nolabel_line57/asi2_mod_inst7/adc_bus[2]Qnolabel_line119/adc_receiver_core_0/inst/nolabel_line57/asi2_mod_inst7/adc_bus[2]2default:default2�
Ynolabel_line119/adc_receiver_core_0/inst/nolabel_line57/asi2_mod_inst7/adc_bus[58]_INST_0	Ynolabel_line119/adc_receiver_core_0/inst/nolabel_line57/asi2_mod_inst7/adc_bus[58]_INST_02default:default8Z32-117h px� 
�
DNet %s could not be optimized because driver %s could not be cloned
117*physynth2�
Qnolabel_line119/adc_receiver_core_0/inst/nolabel_line57/asi2_mod_inst7/adc_bus[7]Qnolabel_line119/adc_receiver_core_0/inst/nolabel_line57/asi2_mod_inst7/adc_bus[7]2default:default2�
Ynolabel_line119/adc_receiver_core_0/inst/nolabel_line57/asi2_mod_inst7/adc_bus[63]_INST_0	Ynolabel_line119/adc_receiver_core_0/inst/nolabel_line57/asi2_mod_inst7/adc_bus[63]_INST_02default:default8Z32-117h px� 
�
DNet %s could not be optimized because driver %s could not be cloned
117*physynth2�
Qnolabel_line119/adc_receiver_core_0/inst/nolabel_line57/asi2_mod_inst7/adc_bus[5]Qnolabel_line119/adc_receiver_core_0/inst/nolabel_line57/asi2_mod_inst7/adc_bus[5]2default:default2�
Ynolabel_line119/adc_receiver_core_0/inst/nolabel_line57/asi2_mod_inst7/adc_bus[61]_INST_0	Ynolabel_line119/adc_receiver_core_0/inst/nolabel_line57/asi2_mod_inst7/adc_bus[61]_INST_02default:default8Z32-117h px� 
�
DNet %s could not be optimized because driver %s could not be cloned
117*physynth2�
Qnolabel_line119/adc_receiver_core_0/inst/nolabel_line57/asi2_mod_inst7/adc_bus[6]Qnolabel_line119/adc_receiver_core_0/inst/nolabel_line57/asi2_mod_inst7/adc_bus[6]2default:default2�
Ynolabel_line119/adc_receiver_core_0/inst/nolabel_line57/asi2_mod_inst7/adc_bus[62]_INST_0	Ynolabel_line119/adc_receiver_core_0/inst/nolabel_line57/asi2_mod_inst7/adc_bus[62]_INST_02default:default8Z32-117h px� 
�
DNet %s could not be optimized because driver %s could not be cloned
117*physynth2�
Qnolabel_line119/adc_receiver_core_0/inst/nolabel_line57/asi2_mod_inst7/adc_bus[4]Qnolabel_line119/adc_receiver_core_0/inst/nolabel_line57/asi2_mod_inst7/adc_bus[4]2default:default2�
Ynolabel_line119/adc_receiver_core_0/inst/nolabel_line57/asi2_mod_inst7/adc_bus[60]_INST_0	Ynolabel_line119/adc_receiver_core_0/inst/nolabel_line57/asi2_mod_inst7/adc_bus[60]_INST_02default:default8Z32-117h px� 
�
DNet %s could not be optimized because driver %s could not be cloned
117*physynth2�
fnolabel_line119/system_ila_0/inst/ila_lib/inst/ila_core_inst/xsdb_memory_read_inst/read_addr_reg[13]_0fnolabel_line119/system_ila_0/inst/ila_lib/inst/ila_core_inst/xsdb_memory_read_inst/read_addr_reg[13]_02default:default2�
�nolabel_line119/system_ila_0/inst/ila_lib/inst/ila_core_inst/xsdb_memory_read_inst/DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_i_2__1	�nolabel_line119/system_ila_0/inst/ila_lib/inst/ila_core_inst/xsdb_memory_read_inst/DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_i_2__12default:default8Z32-117h px� 
�
DNet %s could not be optimized because driver %s could not be cloned
117*physynth2�
_nolabel_line119/system_ila_0/inst/ila_lib/inst/ila_core_inst/xsdb_memory_read_inst/enb_array[1]_nolabel_line119/system_ila_0/inst/ila_lib/inst/ila_core_inst/xsdb_memory_read_inst/enb_array[1]2default:default2�
�nolabel_line119/system_ila_0/inst/ila_lib/inst/ila_core_inst/xsdb_memory_read_inst/DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_i_2__0	�nolabel_line119/system_ila_0/inst/ila_lib/inst/ila_core_inst/xsdb_memory_read_inst/DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_i_2__02default:default8Z32-117h px� 
�
DNet %s could not be optimized because driver %s could not be cloned
117*physynth2�
�nolabel_line119/system_ila_0/inst/ila_lib/inst/ila_core_inst/xsdb_memory_read_inst/multiple_read_latency.read_enable_out_reg[3]_3�nolabel_line119/system_ila_0/inst/ila_lib/inst/ila_core_inst/xsdb_memory_read_inst/multiple_read_latency.read_enable_out_reg[3]_32default:default2�
�nolabel_line119/system_ila_0/inst/ila_lib/inst/ila_core_inst/xsdb_memory_read_inst/DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_i_1__0	�nolabel_line119/system_ila_0/inst/ila_lib/inst/ila_core_inst/xsdb_memory_read_inst/DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_i_1__02default:default8Z32-117h px� 
�
DNet %s could not be optimized because driver %s could not be cloned
117*physynth2�
fnolabel_line119/system_ila_0/inst/ila_lib/inst/ila_core_inst/xsdb_memory_read_inst/read_addr_reg[13]_1fnolabel_line119/system_ila_0/inst/ila_lib/inst/ila_core_inst/xsdb_memory_read_inst/read_addr_reg[13]_12default:default2�
�nolabel_line119/system_ila_0/inst/ila_lib/inst/ila_core_inst/xsdb_memory_read_inst/DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_i_2__2	�nolabel_line119/system_ila_0/inst/ila_lib/inst/ila_core_inst/xsdb_memory_read_inst/DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_i_2__22default:default8Z32-117h px� 
�
DNet %s could not be optimized because driver %s could not be cloned
117*physynth2�
_nolabel_line119/system_ila_0/inst/ila_lib/inst/ila_core_inst/xsdb_memory_read_inst/enb_array[0]_nolabel_line119/system_ila_0/inst/ila_lib/inst/ila_core_inst/xsdb_memory_read_inst/enb_array[0]2default:default2�
�nolabel_line119/system_ila_0/inst/ila_lib/inst/ila_core_inst/xsdb_memory_read_inst/DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_i_2	�nolabel_line119/system_ila_0/inst/ila_lib/inst/ila_core_inst/xsdb_memory_read_inst/DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_i_22default:default8Z32-117h px� 
�
DNet %s could not be optimized because driver %s could not be cloned
117*physynth2�
�nolabel_line119/adc_axi_streamer/inst/adc_streamer_v2_0_M00_AXIS_inst/nolabel_line227/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/ENB_I�nolabel_line119/adc_axi_streamer/inst/adc_streamer_v2_0_M00_AXIS_inst/nolabel_line227/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/ENB_I2default:default2�
�nolabel_line119/adc_axi_streamer/inst/adc_streamer_v2_0_M00_AXIS_inst/nolabel_line227/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_i_2__0	�nolabel_line119/adc_axi_streamer/inst/adc_streamer_v2_0_M00_AXIS_inst/nolabel_line227/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/rpntr/DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_i_2__02default:default8Z32-117h px� 
�
DNet %s could not be optimized because driver %s could not be cloned
117*physynth2�
�nolabel_line119/adc_axi_streamer/inst/adc_streamer_v2_0_M00_AXIS_inst/nolabel_line227/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/gras.rsts/ENB_I_0�nolabel_line119/adc_axi_streamer/inst/adc_streamer_v2_0_M00_AXIS_inst/nolabel_line227/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/gras.rsts/ENB_I_02default:default2�
�nolabel_line119/adc_axi_streamer/inst/adc_streamer_v2_0_M00_AXIS_inst/nolabel_line227/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/gras.rsts/DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_i_2__1	�nolabel_line119/adc_axi_streamer/inst/adc_streamer_v2_0_M00_AXIS_inst/nolabel_line227/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/gras.rsts/DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_i_2__12default:default8Z32-117h px� 
�
DNet %s could not be optimized because driver %s could not be cloned
117*physynth2�
Qnolabel_line119/adc_receiver_core_0/inst/nolabel_line57/asi2_mod_inst2/adc_bus[3]Qnolabel_line119/adc_receiver_core_0/inst/nolabel_line57/asi2_mod_inst2/adc_bus[3]2default:default2�
Ynolabel_line119/adc_receiver_core_0/inst/nolabel_line57/asi2_mod_inst2/adc_bus[19]_INST_0	Ynolabel_line119/adc_receiver_core_0/inst/nolabel_line57/asi2_mod_inst2/adc_bus[19]_INST_02default:default8Z32-117h px� 
�
DNet %s could not be optimized because driver %s could not be cloned
117*physynth2�
Qnolabel_line119/adc_receiver_core_0/inst/nolabel_line57/asi2_mod_inst2/adc_bus[5]Qnolabel_line119/adc_receiver_core_0/inst/nolabel_line57/asi2_mod_inst2/adc_bus[5]2default:default2�
Ynolabel_line119/adc_receiver_core_0/inst/nolabel_line57/asi2_mod_inst2/adc_bus[21]_INST_0	Ynolabel_line119/adc_receiver_core_0/inst/nolabel_line57/asi2_mod_inst2/adc_bus[21]_INST_02default:default8Z32-117h px� 
�
;Identified %s candidate %s for critical-cell optimization.
46*physynth2
42default:default2
nets2default:defaultZ32-46h px� 
�
Net %s was not replicated418*physynth2G
3nolabel_line119/adc_trigger_0/inst/trig_sub_word[0]2default:defaultZ32-782h px� 
�
9Instance %s has DONT_TOUCH and is preventing optimization416*physynth2=
)nolabel_line119/system_ila_0/inst/ila_lib2default:defaultZ32-780h px� 
�
Net %s was not replicated418*physynth2G
3nolabel_line119/adc_trigger_0/inst/trig_sub_word[1]2default:defaultZ32-782h px� 
�
9Instance %s has DONT_TOUCH and is preventing optimization416*physynth2=
)nolabel_line119/system_ila_0/inst/ila_lib2default:defaultZ32-780h px� 
�
Net %s was not replicated418*physynth2G
3nolabel_line119/adc_trigger_0/inst/trig_sub_word[2]2default:defaultZ32-782h px� 
�
9Instance %s has DONT_TOUCH and is preventing optimization416*physynth2=
)nolabel_line119/system_ila_0/inst/ila_lib2default:defaultZ32-780h px� 
~
Net %s was not replicated418*physynth2?
+nolabel_line119/adc_trigger_0/inst/trig_out2default:defaultZ32-782h px� 
�
9Instance %s has DONT_TOUCH and is preventing optimization416*physynth2=
)nolabel_line119/system_ila_0/inst/ila_lib2default:defaultZ32-780h px� 
�
$Optimized %s %s. Created %s new %s.
216*physynth2
02default:default2
net2default:default2
02default:default2
instance2default:defaultZ32-232h px� 
�
aEnd %s Pass. Optimized %s %s. Created %s new %s, deleted %s existing %s and moved %s existing %s
415*physynth2
12default:default2
02default:default2
net or cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:defaultZ32-775h px� 
j
FNo candidate cells for DSP register optimization found in the design.
274*physynthZ32-456h px� 
�
aEnd %s Pass. Optimized %s %s. Created %s new %s, deleted %s existing %s and moved %s existing %s
415*physynth2
22default:default2
02default:default2
net or cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:defaultZ32-775h px� 
�
aEnd %s Pass. Optimized %s %s. Created %s new %s, deleted %s existing %s and moved %s existing %s
415*physynth2
12default:default2
02default:default2
net or cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:defaultZ32-775h px� 
h
DNo candidate cells for SRL register optimization found in the design349*physynthZ32-677h px� 
�
aEnd %s Pass. Optimized %s %s. Created %s new %s, deleted %s existing %s and moved %s existing %s
415*physynth2
12default:default2
02default:default2
net or cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:defaultZ32-775h px� 
i
ENo candidate cells for BRAM register optimization found in the design297*physynthZ32-526h px� 
�
aEnd %s Pass. Optimized %s %s. Created %s new %s, deleted %s existing %s and moved %s existing %s
415*physynth2
12default:default2
02default:default2
net or cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:defaultZ32-775h px� 
R
.No candidate nets found for HD net replication521*physynthZ32-949h px� 
�
aEnd %s Pass. Optimized %s %s. Created %s new %s, deleted %s existing %s and moved %s existing %s
415*physynth2
12default:default2
02default:default2
net or cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:defaultZ32-775h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0152default:default2
2193.7622default:default2
0.0002default:defaultZ17-268h px� 
B
-
Summary of Physical Synthesis Optimizations
*commonh px� 
B
-============================================
*commonh px� 


*commonh px� 


*commonh px� 
�
�-----------------------------------------------------------------------------------------------------------------------------------------------------------
*commonh px� 
�
�|  Optimization                                     |  Added Cells  |  Removed Cells  |  Optimized Cells/Nets  |  Dont Touch  |  Iterations  |  Elapsed   |
-----------------------------------------------------------------------------------------------------------------------------------------------------------
*commonh px� 
�
�|  LUT Combining                                    |           89  |            245  |                   334  |           0  |           1  |  00:00:00  |
|  Very High Fanout                                 |            0  |              0  |                     0  |           0  |           1  |  00:00:00  |
|  Critical Cell                                    |            0  |              0  |                     0  |           4  |           1  |  00:00:00  |
|  DSP Register                                     |            0  |              0  |                     0  |           0  |           1  |  00:00:00  |
|  Shift Register to Pipeline                       |            0  |              0  |                     0  |           0  |           1  |  00:00:00  |
|  Shift Register                                   |            0  |              0  |                     0  |           0  |           1  |  00:00:00  |
|  BRAM Register                                    |            0  |              0  |                     0  |           0  |           1  |  00:00:00  |
|  Dynamic/Static Region Interface Net Replication  |            0  |              0  |                     0  |           0  |           1  |  00:00:00  |
|  Total                                            |           89  |            245  |                   334  |           4  |           8  |  00:00:01  |
-----------------------------------------------------------------------------------------------------------------------------------------------------------
*commonh px� 


*commonh px� 


*commonh px� 
T
?Phase 2.2.1 Physical Synthesis In Placer | Checksum: 1ab1b0234
*commonh px� 
�

%s
*constraints2o
[Time (s): cpu = 00:01:13 ; elapsed = 00:00:25 . Memory (MB): peak = 2193.762 ; gain = 0.0002default:defaulth px� 
K
6Phase 2.2 Global Placement Core | Checksum: 2102ef2e1
*commonh px� 
�

%s
*constraints2o
[Time (s): cpu = 00:01:18 ; elapsed = 00:00:27 . Memory (MB): peak = 2193.762 ; gain = 0.0002default:defaulth px� 
D
/Phase 2 Global Placement | Checksum: 2102ef2e1
*commonh px� 
�

%s
*constraints2o
[Time (s): cpu = 00:01:18 ; elapsed = 00:00:27 . Memory (MB): peak = 2193.762 ; gain = 0.0002default:defaulth px� 
q

Phase %s%s
101*constraints2
3 2default:default2$
Detail Placement2default:defaultZ18-101h px� 
}

Phase %s%s
101*constraints2
3.1 2default:default2.
Commit Multi Column Macros2default:defaultZ18-101h px� 
P
;Phase 3.1 Commit Multi Column Macros | Checksum: 241781910
*commonh px� 
�

%s
*constraints2o
[Time (s): cpu = 00:01:21 ; elapsed = 00:00:28 . Memory (MB): peak = 2193.762 ; gain = 0.0002default:defaulth px� 


Phase %s%s
101*constraints2
3.2 2default:default20
Commit Most Macros & LUTRAMs2default:defaultZ18-101h px� 
R
=Phase 3.2 Commit Most Macros & LUTRAMs | Checksum: 1901249a1
*commonh px� 
�

%s
*constraints2o
[Time (s): cpu = 00:01:25 ; elapsed = 00:00:29 . Memory (MB): peak = 2193.762 ; gain = 0.0002default:defaulth px� 
y

Phase %s%s
101*constraints2
3.3 2default:default2*
Area Swap Optimization2default:defaultZ18-101h px� 
L
7Phase 3.3 Area Swap Optimization | Checksum: 188f76872
*commonh px� 
�

%s
*constraints2o
[Time (s): cpu = 00:01:26 ; elapsed = 00:00:29 . Memory (MB): peak = 2193.762 ; gain = 0.0002default:defaulth px� 
�

Phase %s%s
101*constraints2
3.4 2default:default22
Pipeline Register Optimization2default:defaultZ18-101h px� 
T
?Phase 3.4 Pipeline Register Optimization | Checksum: 1f78473dd
*commonh px� 
�

%s
*constraints2o
[Time (s): cpu = 00:01:26 ; elapsed = 00:00:29 . Memory (MB): peak = 2193.762 ; gain = 0.0002default:defaulth px� 
t

Phase %s%s
101*constraints2
3.5 2default:default2%
Fast Optimization2default:defaultZ18-101h px� 
G
2Phase 3.5 Fast Optimization | Checksum: 1cb8d4bbe
*commonh px� 
�

%s
*constraints2o
[Time (s): cpu = 00:01:35 ; elapsed = 00:00:36 . Memory (MB): peak = 2193.762 ; gain = 0.0002default:defaulth px� 


Phase %s%s
101*constraints2
3.6 2default:default20
Small Shape Detail Placement2default:defaultZ18-101h px� 
R
=Phase 3.6 Small Shape Detail Placement | Checksum: 2bd4f8471
*commonh px� 
�

%s
*constraints2o
[Time (s): cpu = 00:01:45 ; elapsed = 00:00:42 . Memory (MB): peak = 2193.762 ; gain = 0.0002default:defaulth px� 
u

Phase %s%s
101*constraints2
3.7 2default:default2&
Re-assign LUT pins2default:defaultZ18-101h px� 
H
3Phase 3.7 Re-assign LUT pins | Checksum: 1c6f68e0c
*commonh px� 
�

%s
*constraints2o
[Time (s): cpu = 00:01:46 ; elapsed = 00:00:43 . Memory (MB): peak = 2193.762 ; gain = 0.0002default:defaulth px� 
�

Phase %s%s
101*constraints2
3.8 2default:default22
Pipeline Register Optimization2default:defaultZ18-101h px� 
T
?Phase 3.8 Pipeline Register Optimization | Checksum: 1f0474a8d
*commonh px� 
�

%s
*constraints2o
[Time (s): cpu = 00:01:46 ; elapsed = 00:00:43 . Memory (MB): peak = 2193.762 ; gain = 0.0002default:defaulth px� 
t

Phase %s%s
101*constraints2
3.9 2default:default2%
Fast Optimization2default:defaultZ18-101h px� 
G
2Phase 3.9 Fast Optimization | Checksum: 22a6e20a7
*commonh px� 
�

%s
*constraints2o
[Time (s): cpu = 00:02:00 ; elapsed = 00:00:53 . Memory (MB): peak = 2193.762 ; gain = 0.0002default:defaulth px� 
D
/Phase 3 Detail Placement | Checksum: 22a6e20a7
*commonh px� 
�

%s
*constraints2o
[Time (s): cpu = 00:02:01 ; elapsed = 00:00:53 . Memory (MB): peak = 2193.762 ; gain = 0.0002default:defaulth px� 
�

Phase %s%s
101*constraints2
4 2default:default2<
(Post Placement Optimization and Clean-Up2default:defaultZ18-101h px� 
{

Phase %s%s
101*constraints2
4.1 2default:default2,
Post Commit Optimization2default:defaultZ18-101h px� 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px� 
�

Phase %s%s
101*constraints2
4.1.1 2default:default2/
Post Placement Optimization2default:defaultZ18-101h px� 
V
APost Placement Optimization Initialization | Checksum: 15e65e256
*commonh px� 
u

Phase %s%s
101*constraints2
4.1.1.1 2default:default2"
BUFG Insertion2default:defaultZ18-101h px� 
�
PProcessed net %s, BUFG insertion was skipped due to placement/routing conflicts.32*	placeflow2_
Knolabel_line119/clk_wiz_0/inst/AXI_LITE_IPIF_I/I_SLAVE_ATTACHMENT/rst_reg_02default:defaultZ46-33h px� 
�
�BUFG insertion identified %s candidate nets. Inserted BUFG: %s, Replicated BUFG Driver: %s, Skipped due to Placement/Routing Conflicts: %s, Skipped due to Timing Degradation: %s, Skipped due to Illegal Netlist: %s.43*	placeflow2
12default:default2
02default:default2
02default:default2
12default:default2
02default:default2
02default:defaultZ46-56h px� 
H
3Phase 4.1.1.1 BUFG Insertion | Checksum: 15e65e256
*commonh px� 
�

%s
*constraints2o
[Time (s): cpu = 00:02:09 ; elapsed = 00:00:57 . Memory (MB): peak = 2193.762 ; gain = 0.0002default:defaulth px� 
�
hPost Placement Timing Summary WNS=%s. For the most accurate timing information please run report_timing.610*place2
-4.0112default:defaultZ30-746h px� 
R
=Phase 4.1.1 Post Placement Optimization | Checksum: af8f51b0
*commonh px� 
�

%s
*constraints2o
[Time (s): cpu = 00:02:45 ; elapsed = 00:01:28 . Memory (MB): peak = 2193.762 ; gain = 0.0002default:defaulth px� 
M
8Phase 4.1 Post Commit Optimization | Checksum: af8f51b0
*commonh px� 
�

%s
*constraints2o
[Time (s): cpu = 00:02:45 ; elapsed = 00:01:28 . Memory (MB): peak = 2193.762 ; gain = 0.0002default:defaulth px� 
y

Phase %s%s
101*constraints2
4.2 2default:default2*
Post Placement Cleanup2default:defaultZ18-101h px� 
K
6Phase 4.2 Post Placement Cleanup | Checksum: af8f51b0
*commonh px� 
�

%s
*constraints2o
[Time (s): cpu = 00:02:45 ; elapsed = 00:01:28 . Memory (MB): peak = 2193.762 ; gain = 0.0002default:defaulth px� 
s

Phase %s%s
101*constraints2
4.3 2default:default2$
Placer Reporting2default:defaultZ18-101h px� 
E
0Phase 4.3 Placer Reporting | Checksum: af8f51b0
*commonh px� 
�

%s
*constraints2o
[Time (s): cpu = 00:02:45 ; elapsed = 00:01:28 . Memory (MB): peak = 2193.762 ; gain = 0.0002default:defaulth px� 
z

Phase %s%s
101*constraints2
4.4 2default:default2+
Final Placement Cleanup2default:defaultZ18-101h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0172default:default2
2193.7622default:default2
0.0002default:defaultZ17-268h px� 
L
7Phase 4.4 Final Placement Cleanup | Checksum: d0e05955
*commonh px� 
�

%s
*constraints2o
[Time (s): cpu = 00:02:46 ; elapsed = 00:01:29 . Memory (MB): peak = 2193.762 ; gain = 0.0002default:defaulth px� 
[
FPhase 4 Post Placement Optimization and Clean-Up | Checksum: d0e05955
*commonh px� 
�

%s
*constraints2o
[Time (s): cpu = 00:02:46 ; elapsed = 00:01:29 . Memory (MB): peak = 2193.762 ; gain = 0.0002default:defaulth px� 
=
(Ending Placer Task | Checksum: 8328b0b5
*commonh px� 
�

%s
*constraints2o
[Time (s): cpu = 00:02:46 ; elapsed = 00:01:29 . Memory (MB): peak = 2193.762 ; gain = 0.0002default:defaulth px� 
Z
Releasing license: %s
83*common2"
Implementation2default:defaultZ17-83h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
1322default:default2
152default:default2
1002default:default2
02default:defaultZ4-41h px� 
^
%s completed successfully
29*	vivadotcl2 
place_design2default:defaultZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
place_design: 2default:default2
00:02:502default:default2
00:01:302default:default2
2193.7622default:default2
0.0002default:defaultZ17-268h px� 
~
4The following parameters have non-default value.
%s
395*common2&
general.maxThreads2default:defaultZ17-600h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0132default:default2
2193.7622default:default2
0.0002default:defaultZ17-268h px� 
H
&Writing timing data to binary archive.266*timingZ38-480h px� 
D
Writing placer database...
1603*designutilsZ20-1893h px� 
=
Writing XDEF routing.
211*designutilsZ20-211h px� 
J
#Writing XDEF routing logical nets.
209*designutilsZ20-209h px� 
J
#Writing XDEF routing special nets.
210*designutilsZ20-210h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2)
Write XDEF Complete: 2default:default2
00:00:052default:default2
00:00:022default:default2
2193.7622default:default2
0.0002default:defaultZ17-268h px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2y
eC:/Users/Tom/Documents/Projects/Scopy_MVP_Platform/scopy-fpga/logic/logic.runs/impl_3/main_placed.dcp2default:defaultZ17-1381h px� 
_
%s4*runtcl2C
/Executing : report_io -file main_io_placed.rpt
2default:defaulth px� 
�
kreport_io: Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.063 . Memory (MB): peak = 2193.762 ; gain = 0.000
*commonh px� 
�
%s4*runtcl2t
`Executing : report_utilization -file main_utilization_placed.rpt -pb main_utilization_placed.pb
2default:defaulth px� 
|
%s4*runtcl2`
LExecuting : report_control_sets -verbose -file main_control_sets_placed.rpt
2default:defaulth px� 
�
ureport_control_sets: Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.080 . Memory (MB): peak = 2193.762 ; gain = 0.000
*commonh px� 


End Record