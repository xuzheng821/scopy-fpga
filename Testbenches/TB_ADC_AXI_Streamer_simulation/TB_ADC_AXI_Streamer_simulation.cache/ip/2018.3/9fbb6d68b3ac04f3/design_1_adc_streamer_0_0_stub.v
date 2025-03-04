// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Thu Jan 23 11:19:01 2020
// Host        : TomsDesktop running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_adc_streamer_0_0_stub.v
// Design      : design_1_adc_streamer_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z014sclg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "adc_test_streamer_v2_0,Vivado 2018.3" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(m00_axis_tdata, m00_axis_tstrb, 
  m00_axis_tlast, m00_axis_tvalid, m00_axis_tready, adc_bus, adc_data_clk, adc_data_valid, 
  adc_fifo_full, adc_fifo_reset, adc_eof, m00_axis_aclk, m00_axis_aresetn)
/* synthesis syn_black_box black_box_pad_pin="m00_axis_tdata[63:0],m00_axis_tstrb[7:0],m00_axis_tlast,m00_axis_tvalid,m00_axis_tready,adc_bus[63:0],adc_data_clk,adc_data_valid,adc_fifo_full,adc_fifo_reset,adc_eof,m00_axis_aclk,m00_axis_aresetn" */;
  output [63:0]m00_axis_tdata;
  output [7:0]m00_axis_tstrb;
  output m00_axis_tlast;
  output m00_axis_tvalid;
  input m00_axis_tready;
  input [63:0]adc_bus;
  input adc_data_clk;
  input adc_data_valid;
  output adc_fifo_full;
  input adc_fifo_reset;
  input adc_eof;
  input m00_axis_aclk;
  input m00_axis_aresetn;
endmodule
