-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
-- Date        : Sat Jan 18 18:54:48 2020
-- Host        : TomsDesktop running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               C:/Users/Tom/Documents/Projects/Scopy_MVP_Platform/scopy-fpga/logic/logic.srcs/sources_1/ip/clk_wiz_1_idelay_refclk/clk_wiz_1_idelay_refclk_stub.vhdl
-- Design      : clk_wiz_1_idelay_refclk
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z014sclg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clk_wiz_1_idelay_refclk is
  Port ( 
    clk_out1 : out STD_LOGIC;
    reset : in STD_LOGIC;
    power_down : in STD_LOGIC;
    locked : out STD_LOGIC;
    clk_in1 : in STD_LOGIC
  );

end clk_wiz_1_idelay_refclk;

architecture stub of clk_wiz_1_idelay_refclk is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk_out1,reset,power_down,locked,clk_in1";
begin
end;