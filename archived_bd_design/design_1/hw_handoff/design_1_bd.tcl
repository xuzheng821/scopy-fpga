
################################################################
# This is a generated script based on design: design_1
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2019.2
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   catch {common::send_msg_id "BD_TCL-109" "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source design_1_script.tcl

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xc7z014sclg400-1
}


# CHANGE DESIGN NAME HERE
variable design_name
set design_name design_1

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      common::send_msg_id "BD_TCL-001" "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_msg_id "BD_TCL-002" "INFO" "Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   common::send_msg_id "BD_TCL-003" "INFO" "Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   common::send_msg_id "BD_TCL-004" "INFO" "Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

common::send_msg_id "BD_TCL-005" "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   catch {common::send_msg_id "BD_TCL-114" "ERROR" $errMsg}
   return $nRet
}

##################################################################
# DESIGN PROCs
##################################################################



# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder
  variable design_name

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports
  set DDR [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:ddrx_rtl:1.0 DDR ]

  set FIXED_IO [ create_bd_intf_port -mode Master -vlnv xilinx.com:display_processing_system7:fixedio_rtl:1.0 FIXED_IO ]


  # Create ports
  set ACQ_ABORT [ create_bd_port -dir I ACQ_ABORT ]
  set ACQ_AXI_RUN [ create_bd_port -dir I ACQ_AXI_RUN ]
  set ACQ_DATA_LOSS [ create_bd_port -dir O ACQ_DATA_LOSS ]
  set ACQ_DEPTH_A [ create_bd_port -dir I -from 28 -to 0 ACQ_DEPTH_A ]
  set ACQ_DEPTH_B [ create_bd_port -dir I -from 28 -to 0 ACQ_DEPTH_B ]
  set ACQ_DEPTH_MUX [ create_bd_port -dir I ACQ_DEPTH_MUX ]
  set ACQ_DONE [ create_bd_port -dir O ACQ_DONE ]
  set ACQ_HAVE_TRIG [ create_bd_port -dir O ACQ_HAVE_TRIG ]
  set ACQ_RUN [ create_bd_port -dir I ACQ_RUN ]
  set ACQ_TRIG_MASK [ create_bd_port -dir I ACQ_TRIG_MASK ]
  set ACQ_TRIG_RST [ create_bd_port -dir I ACQ_TRIG_RST ]
  set ADC_BUS [ create_bd_port -dir I -from 63 -to 0 ADC_BUS ]
  set ADC_DATA_CLK [ create_bd_port -dir I -type clk -freq_hz 125000000 ADC_DATA_CLK ]
  set ADC_DATA_EOF [ create_bd_port -dir I ADC_DATA_EOF ]
  set ADC_DATA_VALID [ create_bd_port -dir I ADC_DATA_VALID ]
  set ADC_FIFO_RESET [ create_bd_port -dir I ADC_FIFO_RESET ]
  set CFG_BRAM_ADDRB [ create_bd_port -dir I -from 31 -to 0 CFG_BRAM_ADDRB ]
  set CFG_BRAM_BUSYB [ create_bd_port -dir O CFG_BRAM_BUSYB ]
  set CFG_BRAM_CLKB [ create_bd_port -dir I CFG_BRAM_CLKB ]
  set CFG_BRAM_DINB [ create_bd_port -dir I -from 31 -to 0 CFG_BRAM_DINB ]
  set CFG_BRAM_DOUTB [ create_bd_port -dir O -from 31 -to 0 CFG_BRAM_DOUTB ]
  set CFG_BRAM_ENB [ create_bd_port -dir I CFG_BRAM_ENB ]
  set CFG_BRAM_RSTB [ create_bd_port -dir I CFG_BRAM_RSTB ]
  set CFG_BRAM_WEB [ create_bd_port -dir I -from 3 -to 0 CFG_BRAM_WEB ]
  set CSI_BRAM_ADDRB [ create_bd_port -dir I -from 15 -to 0 CSI_BRAM_ADDRB ]
  set CSI_BRAM_CLKB [ create_bd_port -dir I -type clk -freq_hz 100000000 CSI_BRAM_CLKB ]
  set CSI_BRAM_DOUTB [ create_bd_port -dir O -from 63 -to 0 CSI_BRAM_DOUTB ]
  set CSI_BRAM_ENB [ create_bd_port -dir I CSI_BRAM_ENB ]
  set EMIO_I [ create_bd_port -dir I -from 63 -to 0 EMIO_I ]
  set EMIO_O [ create_bd_port -dir O -from 63 -to 0 EMIO_O ]
  set FABCFG_COMMIT_MON [ create_bd_port -dir I FABCFG_COMMIT_MON ]
  set FABCFG_DONE_MON [ create_bd_port -dir I FABCFG_DONE_MON ]
  set FCLK_CLK0 [ create_bd_port -dir O -type clk FCLK_CLK0 ]
  set PL_IRQ [ create_bd_port -dir I -from 3 -to 0 PL_IRQ ]
  set TRIGGER_IN [ create_bd_port -dir I TRIGGER_IN ]
  set TRIGGER_OUT [ create_bd_port -dir O TRIGGER_OUT ]
  set TRIGGER_POS [ create_bd_port -dir O -from 31 -to 0 TRIGGER_POS ]
  set TRIGGER_SUB_WORD [ create_bd_port -dir I -from 2 -to 0 TRIGGER_SUB_WORD ]

  # Create instance: adc_axi_streamer, and set properties
  set adc_axi_streamer [ create_bd_cell -type ip -vlnv xilinx.com:user:adc_streamer:2.0 adc_axi_streamer ]
  set_property -dict [ list \
   CONFIG.C_M00_AXIS_TDATA_WIDTH {64} \
 ] $adc_axi_streamer

  # Create instance: axi_bram_ctrl_0, and set properties
  set axi_bram_ctrl_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_bram_ctrl:4.1 axi_bram_ctrl_0 ]
  set_property USER_COMMENTS.comment_1 "AXI BRAM Controller for Fabric Configuration" [get_bd_cells /axi_bram_ctrl_0]
  set_property -dict [ list \
   CONFIG.DATA_WIDTH {32} \
   CONFIG.ECC_TYPE {Hamming} \
   CONFIG.PROTOCOL {AXI4} \
   CONFIG.SINGLE_PORT_BRAM {1} \
 ] $axi_bram_ctrl_0

  # Create instance: axi_bram_ctrl_1, and set properties
  set axi_bram_ctrl_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_bram_ctrl:4.1 axi_bram_ctrl_1 ]
  set_property -dict [ list \
   CONFIG.DATA_WIDTH {32} \
   CONFIG.ECC_TYPE {Hamming} \
   CONFIG.SINGLE_PORT_BRAM {1} \
 ] $axi_bram_ctrl_1

  # Create instance: axi_dma, and set properties
  set axi_dma [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_dma:7.1 axi_dma ]
  set_property -dict [ list \
   CONFIG.c_include_mm2s {0} \
   CONFIG.c_include_s2mm {1} \
   CONFIG.c_include_s2mm_dre {1} \
   CONFIG.c_include_sg {0} \
   CONFIG.c_m_axi_mm2s_data_width {64} \
   CONFIG.c_m_axi_s2mm_data_width {64} \
   CONFIG.c_mm2s_burst_size {16} \
   CONFIG.c_s2mm_burst_size {16} \
   CONFIG.c_sg_include_stscntrl_strm {0} \
   CONFIG.c_sg_length_width {24} \
 ] $axi_dma

  # Create instance: axi_interconnect_0, and set properties
  set axi_interconnect_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_interconnect_0 ]
  set_property -dict [ list \
   CONFIG.NUM_MI {3} \
 ] $axi_interconnect_0

  # Create instance: axi_mem_intercon, and set properties
  set axi_mem_intercon [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_mem_intercon ]
  set_property -dict [ list \
   CONFIG.ENABLE_ADVANCED_OPTIONS {0} \
   CONFIG.NUM_MI {1} \
   CONFIG.NUM_SI {1} \
 ] $axi_mem_intercon

  # Create instance: blk_mem_gen_0, and set properties
  set blk_mem_gen_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.4 blk_mem_gen_0 ]
  set_property USER_COMMENTS.comment_0 "BRAM for Fabric Configuration" [get_bd_cells /blk_mem_gen_0]
  set_property -dict [ list \
   CONFIG.Algorithm {Minimum_Area} \
   CONFIG.Byte_Size {8} \
   CONFIG.EN_SAFETY_CKT {true} \
   CONFIG.Enable_32bit_Address {true} \
   CONFIG.Enable_B {Use_ENB_Pin} \
   CONFIG.Memory_Type {True_Dual_Port_RAM} \
   CONFIG.Port_B_Clock {100} \
   CONFIG.Port_B_Enable_Rate {100} \
   CONFIG.Port_B_Write_Rate {50} \
   CONFIG.Register_PortA_Output_of_Memory_Primitives {false} \
   CONFIG.Register_PortB_Output_of_Memory_Primitives {false} \
   CONFIG.Use_Byte_Write_Enable {true} \
   CONFIG.Use_RSTA_Pin {true} \
   CONFIG.Use_RSTB_Pin {true} \
   CONFIG.use_bram_block {BRAM_Controller} \
 ] $blk_mem_gen_0

  # Create instance: blk_mem_gen_1, and set properties
  set blk_mem_gen_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.4 blk_mem_gen_1 ]
  set_property USER_COMMENTS.comment_4 "CSI Output BRAM" [get_bd_cells /blk_mem_gen_1]
  set_property -dict [ list \
   CONFIG.Byte_Size {9} \
   CONFIG.EN_SAFETY_CKT {false} \
   CONFIG.Enable_32bit_Address {false} \
   CONFIG.Enable_B {Use_ENB_Pin} \
   CONFIG.Memory_Type {True_Dual_Port_RAM} \
   CONFIG.Operating_Mode_A {NO_CHANGE} \
   CONFIG.Operating_Mode_B {WRITE_FIRST} \
   CONFIG.Port_B_Clock {100} \
   CONFIG.Port_B_Enable_Rate {100} \
   CONFIG.Port_B_Write_Rate {50} \
   CONFIG.Read_Width_A {32} \
   CONFIG.Read_Width_B {64} \
   CONFIG.Register_PortA_Output_of_Memory_Primitives {true} \
   CONFIG.Register_PortB_Output_of_Memory_Primitives {true} \
   CONFIG.Use_Byte_Write_Enable {false} \
   CONFIG.Use_RSTA_Pin {false} \
   CONFIG.Write_Depth_A {32768} \
   CONFIG.Write_Width_B {64} \
   CONFIG.use_bram_block {Stand_Alone} \
 ] $blk_mem_gen_1

  # Create instance: ila_0, and set properties
  set ila_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:ila:6.2 ila_0 ]
  set_property -dict [ list \
   CONFIG.C_DATA_DEPTH {4096} \
   CONFIG.C_ENABLE_ILA_AXI_MON {false} \
   CONFIG.C_MONITOR_TYPE {Native} \
   CONFIG.C_NUM_OF_PROBES {32} \
   CONFIG.C_PROBE27_WIDTH {1} \
   CONFIG.C_PROBE28_WIDTH {1} \
   CONFIG.C_PROBE36_WIDTH {1} \
   CONFIG.C_PROBE37_WIDTH {1} \
   CONFIG.C_PROBE9_WIDTH {1} \
 ] $ila_0

  # Create instance: processing_system7_0, and set properties
  set processing_system7_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:processing_system7:5.5 processing_system7_0 ]
  set_property -dict [ list \
   CONFIG.PCW_ACT_APU_PERIPHERAL_FREQMHZ {666.666687} \
   CONFIG.PCW_ACT_CAN_PERIPHERAL_FREQMHZ {10.000000} \
   CONFIG.PCW_ACT_DCI_PERIPHERAL_FREQMHZ {10.158730} \
   CONFIG.PCW_ACT_ENET0_PERIPHERAL_FREQMHZ {10.000000} \
   CONFIG.PCW_ACT_ENET1_PERIPHERAL_FREQMHZ {10.000000} \
   CONFIG.PCW_ACT_FPGA0_PERIPHERAL_FREQMHZ {177.777771} \
   CONFIG.PCW_ACT_FPGA1_PERIPHERAL_FREQMHZ {10.000000} \
   CONFIG.PCW_ACT_FPGA2_PERIPHERAL_FREQMHZ {10.000000} \
   CONFIG.PCW_ACT_FPGA3_PERIPHERAL_FREQMHZ {10.000000} \
   CONFIG.PCW_ACT_PCAP_PERIPHERAL_FREQMHZ {200.000000} \
   CONFIG.PCW_ACT_QSPI_PERIPHERAL_FREQMHZ {10.000000} \
   CONFIG.PCW_ACT_SDIO_PERIPHERAL_FREQMHZ {10.000000} \
   CONFIG.PCW_ACT_SMC_PERIPHERAL_FREQMHZ {10.000000} \
   CONFIG.PCW_ACT_SPI_PERIPHERAL_FREQMHZ {160.000000} \
   CONFIG.PCW_ACT_TPIU_PERIPHERAL_FREQMHZ {200.000000} \
   CONFIG.PCW_ACT_TTC0_CLK0_PERIPHERAL_FREQMHZ {111.111115} \
   CONFIG.PCW_ACT_TTC0_CLK1_PERIPHERAL_FREQMHZ {111.111115} \
   CONFIG.PCW_ACT_TTC0_CLK2_PERIPHERAL_FREQMHZ {111.111115} \
   CONFIG.PCW_ACT_TTC1_CLK0_PERIPHERAL_FREQMHZ {111.111115} \
   CONFIG.PCW_ACT_TTC1_CLK1_PERIPHERAL_FREQMHZ {111.111115} \
   CONFIG.PCW_ACT_TTC1_CLK2_PERIPHERAL_FREQMHZ {111.111115} \
   CONFIG.PCW_ACT_UART_PERIPHERAL_FREQMHZ {100.000000} \
   CONFIG.PCW_ACT_WDT_PERIPHERAL_FREQMHZ {111.111115} \
   CONFIG.PCW_ARMPLL_CTRL_FBDIV {40} \
   CONFIG.PCW_CAN_PERIPHERAL_DIVISOR0 {1} \
   CONFIG.PCW_CAN_PERIPHERAL_DIVISOR1 {1} \
   CONFIG.PCW_CLK0_FREQ {177777771} \
   CONFIG.PCW_CLK1_FREQ {10000000} \
   CONFIG.PCW_CLK2_FREQ {10000000} \
   CONFIG.PCW_CLK3_FREQ {10000000} \
   CONFIG.PCW_CPU_CPU_PLL_FREQMHZ {1333.333} \
   CONFIG.PCW_CPU_PERIPHERAL_DIVISOR0 {2} \
   CONFIG.PCW_DCI_PERIPHERAL_DIVISOR0 {15} \
   CONFIG.PCW_DCI_PERIPHERAL_DIVISOR1 {7} \
   CONFIG.PCW_DDRPLL_CTRL_FBDIV {32} \
   CONFIG.PCW_DDR_DDR_PLL_FREQMHZ {1066.667} \
   CONFIG.PCW_DDR_PERIPHERAL_DIVISOR0 {2} \
   CONFIG.PCW_DDR_RAM_HIGHADDR {0x0FFFFFFF} \
   CONFIG.PCW_ENET0_PERIPHERAL_DIVISOR0 {1} \
   CONFIG.PCW_ENET0_PERIPHERAL_DIVISOR1 {1} \
   CONFIG.PCW_ENET0_RESET_ENABLE {0} \
   CONFIG.PCW_ENET1_PERIPHERAL_DIVISOR0 {1} \
   CONFIG.PCW_ENET1_PERIPHERAL_DIVISOR1 {1} \
   CONFIG.PCW_ENET1_RESET_ENABLE {0} \
   CONFIG.PCW_ENET_RESET_ENABLE {0} \
   CONFIG.PCW_EN_CLK1_PORT {0} \
   CONFIG.PCW_EN_EMIO_GPIO {1} \
   CONFIG.PCW_EN_EMIO_I2C0 {0} \
   CONFIG.PCW_EN_EMIO_MODEM_UART0 {0} \
   CONFIG.PCW_EN_EMIO_MODEM_UART1 {0} \
   CONFIG.PCW_EN_EMIO_SPI0 {1} \
   CONFIG.PCW_EN_EMIO_SPI1 {0} \
   CONFIG.PCW_EN_EMIO_TTC0 {1} \
   CONFIG.PCW_EN_EMIO_UART0 {0} \
   CONFIG.PCW_EN_GPIO {1} \
   CONFIG.PCW_EN_I2C0 {0} \
   CONFIG.PCW_EN_MODEM_UART0 {0} \
   CONFIG.PCW_EN_MODEM_UART1 {0} \
   CONFIG.PCW_EN_RST0_PORT {1} \
   CONFIG.PCW_EN_SPI0 {1} \
   CONFIG.PCW_EN_SPI1 {0} \
   CONFIG.PCW_EN_TTC0 {1} \
   CONFIG.PCW_EN_UART0 {0} \
   CONFIG.PCW_EN_UART1 {1} \
   CONFIG.PCW_FCLK0_PERIPHERAL_DIVISOR0 {9} \
   CONFIG.PCW_FCLK0_PERIPHERAL_DIVISOR1 {1} \
   CONFIG.PCW_FCLK1_PERIPHERAL_DIVISOR0 {1} \
   CONFIG.PCW_FCLK1_PERIPHERAL_DIVISOR1 {1} \
   CONFIG.PCW_FCLK2_PERIPHERAL_DIVISOR0 {1} \
   CONFIG.PCW_FCLK2_PERIPHERAL_DIVISOR1 {1} \
   CONFIG.PCW_FCLK3_PERIPHERAL_DIVISOR0 {1} \
   CONFIG.PCW_FCLK3_PERIPHERAL_DIVISOR1 {1} \
   CONFIG.PCW_FCLK_CLK1_BUF {FALSE} \
   CONFIG.PCW_FPGA0_PERIPHERAL_FREQMHZ {180} \
   CONFIG.PCW_FPGA1_PERIPHERAL_FREQMHZ {150} \
   CONFIG.PCW_FPGA_FCLK0_ENABLE {1} \
   CONFIG.PCW_FPGA_FCLK1_ENABLE {0} \
   CONFIG.PCW_FPGA_FCLK2_ENABLE {0} \
   CONFIG.PCW_FPGA_FCLK3_ENABLE {0} \
   CONFIG.PCW_GPIO_EMIO_GPIO_ENABLE {1} \
   CONFIG.PCW_GPIO_EMIO_GPIO_IO {64} \
   CONFIG.PCW_GPIO_EMIO_GPIO_WIDTH {64} \
   CONFIG.PCW_GPIO_MIO_GPIO_ENABLE {1} \
   CONFIG.PCW_GPIO_MIO_GPIO_IO {MIO} \
   CONFIG.PCW_I2C0_GRP_INT_ENABLE {0} \
   CONFIG.PCW_I2C0_PERIPHERAL_ENABLE {0} \
   CONFIG.PCW_I2C0_RESET_ENABLE {0} \
   CONFIG.PCW_I2C1_RESET_ENABLE {0} \
   CONFIG.PCW_I2C_PERIPHERAL_FREQMHZ {25} \
   CONFIG.PCW_I2C_RESET_ENABLE {0} \
   CONFIG.PCW_IOPLL_CTRL_FBDIV {48} \
   CONFIG.PCW_IO_IO_PLL_FREQMHZ {1600.000} \
   CONFIG.PCW_IRQ_F2P_INTR {1} \
   CONFIG.PCW_MIO_0_DIRECTION {inout} \
   CONFIG.PCW_MIO_0_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_0_PULLUP {enabled} \
   CONFIG.PCW_MIO_0_SLEW {slow} \
   CONFIG.PCW_MIO_10_DIRECTION {inout} \
   CONFIG.PCW_MIO_10_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_10_PULLUP {enabled} \
   CONFIG.PCW_MIO_10_SLEW {slow} \
   CONFIG.PCW_MIO_11_DIRECTION {inout} \
   CONFIG.PCW_MIO_11_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_11_PULLUP {enabled} \
   CONFIG.PCW_MIO_11_SLEW {slow} \
   CONFIG.PCW_MIO_12_DIRECTION {inout} \
   CONFIG.PCW_MIO_12_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_12_PULLUP {enabled} \
   CONFIG.PCW_MIO_12_SLEW {slow} \
   CONFIG.PCW_MIO_13_DIRECTION {inout} \
   CONFIG.PCW_MIO_13_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_13_PULLUP {enabled} \
   CONFIG.PCW_MIO_13_SLEW {slow} \
   CONFIG.PCW_MIO_14_DIRECTION {inout} \
   CONFIG.PCW_MIO_14_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_14_PULLUP {enabled} \
   CONFIG.PCW_MIO_14_SLEW {slow} \
   CONFIG.PCW_MIO_15_DIRECTION {inout} \
   CONFIG.PCW_MIO_15_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_15_PULLUP {enabled} \
   CONFIG.PCW_MIO_15_SLEW {slow} \
   CONFIG.PCW_MIO_16_DIRECTION {inout} \
   CONFIG.PCW_MIO_16_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_16_PULLUP {enabled} \
   CONFIG.PCW_MIO_16_SLEW {slow} \
   CONFIG.PCW_MIO_17_DIRECTION {inout} \
   CONFIG.PCW_MIO_17_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_17_PULLUP {enabled} \
   CONFIG.PCW_MIO_17_SLEW {slow} \
   CONFIG.PCW_MIO_18_DIRECTION {inout} \
   CONFIG.PCW_MIO_18_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_18_PULLUP {enabled} \
   CONFIG.PCW_MIO_18_SLEW {slow} \
   CONFIG.PCW_MIO_19_DIRECTION {inout} \
   CONFIG.PCW_MIO_19_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_19_PULLUP {enabled} \
   CONFIG.PCW_MIO_19_SLEW {slow} \
   CONFIG.PCW_MIO_1_DIRECTION {inout} \
   CONFIG.PCW_MIO_1_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_1_PULLUP {enabled} \
   CONFIG.PCW_MIO_1_SLEW {slow} \
   CONFIG.PCW_MIO_20_DIRECTION {inout} \
   CONFIG.PCW_MIO_20_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_20_PULLUP {enabled} \
   CONFIG.PCW_MIO_20_SLEW {slow} \
   CONFIG.PCW_MIO_21_DIRECTION {inout} \
   CONFIG.PCW_MIO_21_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_21_PULLUP {enabled} \
   CONFIG.PCW_MIO_21_SLEW {slow} \
   CONFIG.PCW_MIO_22_DIRECTION {inout} \
   CONFIG.PCW_MIO_22_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_22_PULLUP {enabled} \
   CONFIG.PCW_MIO_22_SLEW {slow} \
   CONFIG.PCW_MIO_23_DIRECTION {inout} \
   CONFIG.PCW_MIO_23_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_23_PULLUP {enabled} \
   CONFIG.PCW_MIO_23_SLEW {slow} \
   CONFIG.PCW_MIO_24_DIRECTION {inout} \
   CONFIG.PCW_MIO_24_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_24_PULLUP {enabled} \
   CONFIG.PCW_MIO_24_SLEW {slow} \
   CONFIG.PCW_MIO_25_DIRECTION {inout} \
   CONFIG.PCW_MIO_25_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_25_PULLUP {enabled} \
   CONFIG.PCW_MIO_25_SLEW {slow} \
   CONFIG.PCW_MIO_26_DIRECTION {inout} \
   CONFIG.PCW_MIO_26_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_26_PULLUP {enabled} \
   CONFIG.PCW_MIO_26_SLEW {slow} \
   CONFIG.PCW_MIO_27_DIRECTION {inout} \
   CONFIG.PCW_MIO_27_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_27_PULLUP {enabled} \
   CONFIG.PCW_MIO_27_SLEW {slow} \
   CONFIG.PCW_MIO_28_DIRECTION {inout} \
   CONFIG.PCW_MIO_28_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_28_PULLUP {enabled} \
   CONFIG.PCW_MIO_28_SLEW {slow} \
   CONFIG.PCW_MIO_29_DIRECTION {inout} \
   CONFIG.PCW_MIO_29_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_29_PULLUP {enabled} \
   CONFIG.PCW_MIO_29_SLEW {slow} \
   CONFIG.PCW_MIO_2_DIRECTION {inout} \
   CONFIG.PCW_MIO_2_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_2_PULLUP {disabled} \
   CONFIG.PCW_MIO_2_SLEW {slow} \
   CONFIG.PCW_MIO_30_DIRECTION {inout} \
   CONFIG.PCW_MIO_30_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_30_PULLUP {enabled} \
   CONFIG.PCW_MIO_30_SLEW {slow} \
   CONFIG.PCW_MIO_31_DIRECTION {inout} \
   CONFIG.PCW_MIO_31_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_31_PULLUP {enabled} \
   CONFIG.PCW_MIO_31_SLEW {slow} \
   CONFIG.PCW_MIO_32_DIRECTION {inout} \
   CONFIG.PCW_MIO_32_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_32_PULLUP {enabled} \
   CONFIG.PCW_MIO_32_SLEW {slow} \
   CONFIG.PCW_MIO_33_DIRECTION {inout} \
   CONFIG.PCW_MIO_33_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_33_PULLUP {enabled} \
   CONFIG.PCW_MIO_33_SLEW {slow} \
   CONFIG.PCW_MIO_34_DIRECTION {inout} \
   CONFIG.PCW_MIO_34_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_34_PULLUP {enabled} \
   CONFIG.PCW_MIO_34_SLEW {slow} \
   CONFIG.PCW_MIO_35_DIRECTION {inout} \
   CONFIG.PCW_MIO_35_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_35_PULLUP {enabled} \
   CONFIG.PCW_MIO_35_SLEW {slow} \
   CONFIG.PCW_MIO_36_DIRECTION {inout} \
   CONFIG.PCW_MIO_36_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_36_PULLUP {enabled} \
   CONFIG.PCW_MIO_36_SLEW {slow} \
   CONFIG.PCW_MIO_37_DIRECTION {inout} \
   CONFIG.PCW_MIO_37_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_37_PULLUP {enabled} \
   CONFIG.PCW_MIO_37_SLEW {slow} \
   CONFIG.PCW_MIO_38_DIRECTION {inout} \
   CONFIG.PCW_MIO_38_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_38_PULLUP {enabled} \
   CONFIG.PCW_MIO_38_SLEW {slow} \
   CONFIG.PCW_MIO_39_DIRECTION {inout} \
   CONFIG.PCW_MIO_39_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_39_PULLUP {enabled} \
   CONFIG.PCW_MIO_39_SLEW {slow} \
   CONFIG.PCW_MIO_3_DIRECTION {inout} \
   CONFIG.PCW_MIO_3_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_3_PULLUP {disabled} \
   CONFIG.PCW_MIO_3_SLEW {slow} \
   CONFIG.PCW_MIO_40_DIRECTION {inout} \
   CONFIG.PCW_MIO_40_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_40_PULLUP {enabled} \
   CONFIG.PCW_MIO_40_SLEW {slow} \
   CONFIG.PCW_MIO_41_DIRECTION {inout} \
   CONFIG.PCW_MIO_41_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_41_PULLUP {enabled} \
   CONFIG.PCW_MIO_41_SLEW {slow} \
   CONFIG.PCW_MIO_42_DIRECTION {inout} \
   CONFIG.PCW_MIO_42_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_42_PULLUP {enabled} \
   CONFIG.PCW_MIO_42_SLEW {slow} \
   CONFIG.PCW_MIO_43_DIRECTION {inout} \
   CONFIG.PCW_MIO_43_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_43_PULLUP {enabled} \
   CONFIG.PCW_MIO_43_SLEW {slow} \
   CONFIG.PCW_MIO_44_DIRECTION {inout} \
   CONFIG.PCW_MIO_44_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_44_PULLUP {enabled} \
   CONFIG.PCW_MIO_44_SLEW {slow} \
   CONFIG.PCW_MIO_45_DIRECTION {inout} \
   CONFIG.PCW_MIO_45_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_45_PULLUP {enabled} \
   CONFIG.PCW_MIO_45_SLEW {slow} \
   CONFIG.PCW_MIO_46_DIRECTION {inout} \
   CONFIG.PCW_MIO_46_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_46_PULLUP {enabled} \
   CONFIG.PCW_MIO_46_SLEW {slow} \
   CONFIG.PCW_MIO_47_DIRECTION {inout} \
   CONFIG.PCW_MIO_47_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_47_PULLUP {enabled} \
   CONFIG.PCW_MIO_47_SLEW {slow} \
   CONFIG.PCW_MIO_48_DIRECTION {out} \
   CONFIG.PCW_MIO_48_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_48_PULLUP {enabled} \
   CONFIG.PCW_MIO_48_SLEW {slow} \
   CONFIG.PCW_MIO_49_DIRECTION {in} \
   CONFIG.PCW_MIO_49_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_49_PULLUP {enabled} \
   CONFIG.PCW_MIO_49_SLEW {slow} \
   CONFIG.PCW_MIO_4_DIRECTION {inout} \
   CONFIG.PCW_MIO_4_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_4_PULLUP {disabled} \
   CONFIG.PCW_MIO_4_SLEW {slow} \
   CONFIG.PCW_MIO_50_DIRECTION {inout} \
   CONFIG.PCW_MIO_50_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_50_PULLUP {enabled} \
   CONFIG.PCW_MIO_50_SLEW {slow} \
   CONFIG.PCW_MIO_51_DIRECTION {inout} \
   CONFIG.PCW_MIO_51_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_51_PULLUP {enabled} \
   CONFIG.PCW_MIO_51_SLEW {slow} \
   CONFIG.PCW_MIO_52_DIRECTION {inout} \
   CONFIG.PCW_MIO_52_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_52_PULLUP {enabled} \
   CONFIG.PCW_MIO_52_SLEW {slow} \
   CONFIG.PCW_MIO_53_DIRECTION {inout} \
   CONFIG.PCW_MIO_53_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_53_PULLUP {enabled} \
   CONFIG.PCW_MIO_53_SLEW {slow} \
   CONFIG.PCW_MIO_5_DIRECTION {inout} \
   CONFIG.PCW_MIO_5_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_5_PULLUP {disabled} \
   CONFIG.PCW_MIO_5_SLEW {slow} \
   CONFIG.PCW_MIO_6_DIRECTION {inout} \
   CONFIG.PCW_MIO_6_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_6_PULLUP {disabled} \
   CONFIG.PCW_MIO_6_SLEW {slow} \
   CONFIG.PCW_MIO_7_DIRECTION {out} \
   CONFIG.PCW_MIO_7_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_7_PULLUP {disabled} \
   CONFIG.PCW_MIO_7_SLEW {slow} \
   CONFIG.PCW_MIO_8_DIRECTION {out} \
   CONFIG.PCW_MIO_8_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_8_PULLUP {disabled} \
   CONFIG.PCW_MIO_8_SLEW {slow} \
   CONFIG.PCW_MIO_9_DIRECTION {inout} \
   CONFIG.PCW_MIO_9_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_9_PULLUP {enabled} \
   CONFIG.PCW_MIO_9_SLEW {slow} \
   CONFIG.PCW_MIO_TREE_PERIPHERALS {GPIO#GPIO#GPIO#GPIO#GPIO#GPIO#GPIO#GPIO#GPIO#GPIO#GPIO#GPIO#GPIO#GPIO#GPIO#GPIO#GPIO#GPIO#GPIO#GPIO#GPIO#GPIO#GPIO#GPIO#GPIO#GPIO#GPIO#GPIO#GPIO#GPIO#GPIO#GPIO#GPIO#GPIO#GPIO#GPIO#GPIO#GPIO#GPIO#GPIO#GPIO#GPIO#GPIO#GPIO#GPIO#GPIO#GPIO#GPIO#UART 1#UART 1#GPIO#GPIO#GPIO#GPIO} \
   CONFIG.PCW_MIO_TREE_SIGNALS {gpio[0]#gpio[1]#gpio[2]#gpio[3]#gpio[4]#gpio[5]#gpio[6]#gpio[7]#gpio[8]#gpio[9]#gpio[10]#gpio[11]#gpio[12]#gpio[13]#gpio[14]#gpio[15]#gpio[16]#gpio[17]#gpio[18]#gpio[19]#gpio[20]#gpio[21]#gpio[22]#gpio[23]#gpio[24]#gpio[25]#gpio[26]#gpio[27]#gpio[28]#gpio[29]#gpio[30]#gpio[31]#gpio[32]#gpio[33]#gpio[34]#gpio[35]#gpio[36]#gpio[37]#gpio[38]#gpio[39]#gpio[40]#gpio[41]#gpio[42]#gpio[43]#gpio[44]#gpio[45]#gpio[46]#gpio[47]#tx#rx#gpio[50]#gpio[51]#gpio[52]#gpio[53]} \
   CONFIG.PCW_PCAP_PERIPHERAL_DIVISOR0 {8} \
   CONFIG.PCW_QSPI_PERIPHERAL_DIVISOR0 {1} \
   CONFIG.PCW_SDIO_PERIPHERAL_DIVISOR0 {1} \
   CONFIG.PCW_SMC_PERIPHERAL_DIVISOR0 {1} \
   CONFIG.PCW_SPI0_GRP_SS0_ENABLE {1} \
   CONFIG.PCW_SPI0_GRP_SS0_IO {EMIO} \
   CONFIG.PCW_SPI0_GRP_SS1_ENABLE {1} \
   CONFIG.PCW_SPI0_GRP_SS1_IO {EMIO} \
   CONFIG.PCW_SPI0_GRP_SS2_ENABLE {1} \
   CONFIG.PCW_SPI0_GRP_SS2_IO {EMIO} \
   CONFIG.PCW_SPI0_PERIPHERAL_ENABLE {1} \
   CONFIG.PCW_SPI0_SPI0_IO {EMIO} \
   CONFIG.PCW_SPI1_GRP_SS0_ENABLE {0} \
   CONFIG.PCW_SPI1_GRP_SS1_ENABLE {0} \
   CONFIG.PCW_SPI1_GRP_SS2_ENABLE {0} \
   CONFIG.PCW_SPI1_PERIPHERAL_ENABLE {0} \
   CONFIG.PCW_SPI_PERIPHERAL_DIVISOR0 {10} \
   CONFIG.PCW_SPI_PERIPHERAL_FREQMHZ {166.666666} \
   CONFIG.PCW_SPI_PERIPHERAL_VALID {1} \
   CONFIG.PCW_TPIU_PERIPHERAL_DIVISOR0 {1} \
   CONFIG.PCW_TTC0_CLK0_PERIPHERAL_CLKSRC {CPU_1X} \
   CONFIG.PCW_TTC0_CLK0_PERIPHERAL_FREQMHZ {133.333333} \
   CONFIG.PCW_TTC0_CLK1_PERIPHERAL_FREQMHZ {133.333333} \
   CONFIG.PCW_TTC0_CLK2_PERIPHERAL_FREQMHZ {133.333333} \
   CONFIG.PCW_TTC0_PERIPHERAL_ENABLE {1} \
   CONFIG.PCW_TTC0_TTC0_IO {EMIO} \
   CONFIG.PCW_TTC_PERIPHERAL_FREQMHZ {50} \
   CONFIG.PCW_UART0_GRP_FULL_ENABLE {0} \
   CONFIG.PCW_UART0_PERIPHERAL_ENABLE {0} \
   CONFIG.PCW_UART1_BAUD_RATE {460800} \
   CONFIG.PCW_UART1_GRP_FULL_ENABLE {0} \
   CONFIG.PCW_UART1_PERIPHERAL_ENABLE {1} \
   CONFIG.PCW_UART1_UART1_IO {MIO 48 .. 49} \
   CONFIG.PCW_UART_PERIPHERAL_DIVISOR0 {16} \
   CONFIG.PCW_UART_PERIPHERAL_FREQMHZ {100} \
   CONFIG.PCW_UART_PERIPHERAL_VALID {1} \
   CONFIG.PCW_UIPARAM_ACT_DDR_FREQ_MHZ {533.333374} \
   CONFIG.PCW_UIPARAM_DDR_BANK_ADDR_COUNT {3} \
   CONFIG.PCW_UIPARAM_DDR_BOARD_DELAY0 {0.008} \
   CONFIG.PCW_UIPARAM_DDR_BOARD_DELAY1 {0.008} \
   CONFIG.PCW_UIPARAM_DDR_BOARD_DELAY2 {0.008} \
   CONFIG.PCW_UIPARAM_DDR_BOARD_DELAY3 {0.008} \
   CONFIG.PCW_UIPARAM_DDR_BUS_WIDTH {16 Bit} \
   CONFIG.PCW_UIPARAM_DDR_CL {7} \
   CONFIG.PCW_UIPARAM_DDR_COL_ADDR_COUNT {10} \
   CONFIG.PCW_UIPARAM_DDR_CWL {6} \
   CONFIG.PCW_UIPARAM_DDR_DEVICE_CAPACITY {2048 MBits} \
   CONFIG.PCW_UIPARAM_DDR_DQS_TO_CLK_DELAY_0 {0.0} \
   CONFIG.PCW_UIPARAM_DDR_DQS_TO_CLK_DELAY_1 {0.0} \
   CONFIG.PCW_UIPARAM_DDR_DQS_TO_CLK_DELAY_2 {0.0} \
   CONFIG.PCW_UIPARAM_DDR_DQS_TO_CLK_DELAY_3 {0.0} \
   CONFIG.PCW_UIPARAM_DDR_DRAM_WIDTH {16 Bits} \
   CONFIG.PCW_UIPARAM_DDR_ECC {Disabled} \
   CONFIG.PCW_UIPARAM_DDR_PARTNO {MT41K128M16 JT-125} \
   CONFIG.PCW_UIPARAM_DDR_ROW_ADDR_COUNT {14} \
   CONFIG.PCW_UIPARAM_DDR_SPEED_BIN {DDR3_1066F} \
   CONFIG.PCW_UIPARAM_DDR_T_FAW {40.0} \
   CONFIG.PCW_UIPARAM_DDR_T_RAS_MIN {35.0} \
   CONFIG.PCW_UIPARAM_DDR_T_RC {48.75} \
   CONFIG.PCW_UIPARAM_DDR_T_RCD {7} \
   CONFIG.PCW_UIPARAM_DDR_T_RP {7} \
   CONFIG.PCW_USB0_RESET_ENABLE {0} \
   CONFIG.PCW_USB1_RESET_ENABLE {0} \
   CONFIG.PCW_USB_RESET_ENABLE {0} \
   CONFIG.PCW_USE_DEBUG {0} \
   CONFIG.PCW_USE_FABRIC_INTERRUPT {1} \
   CONFIG.PCW_USE_M_AXI_GP0 {1} \
   CONFIG.PCW_USE_M_AXI_GP1 {0} \
   CONFIG.PCW_USE_S_AXI_GP0 {0} \
   CONFIG.PCW_USE_S_AXI_HP0 {1} \
   CONFIG.PCW_USE_S_AXI_HP1 {0} \
 ] $processing_system7_0

  # Create instance: rst_ps7_0_20M, and set properties
  set rst_ps7_0_20M [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 rst_ps7_0_20M ]

  # Create instance: xlconcat_1, and set properties
  set xlconcat_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 xlconcat_1 ]
  set_property -dict [ list \
   CONFIG.IN0_WIDTH {1} \
   CONFIG.IN1_WIDTH {4} \
   CONFIG.IN2_WIDTH {1} \
   CONFIG.IN3_WIDTH {4} \
   CONFIG.NUM_PORTS {2} \
 ] $xlconcat_1

  # Create interface connections
  connect_bd_intf_net -intf_net adc_axi_streamer_M00_AXIS [get_bd_intf_pins adc_axi_streamer/M00_AXIS] [get_bd_intf_pins axi_dma/S_AXIS_S2MM]
  connect_bd_intf_net -intf_net axi_bram_ctrl_0_BRAM_PORTA [get_bd_intf_pins axi_bram_ctrl_0/BRAM_PORTA] [get_bd_intf_pins blk_mem_gen_0/BRAM_PORTA]
  connect_bd_intf_net -intf_net axi_bram_ctrl_1_BRAM_PORTA [get_bd_intf_pins axi_bram_ctrl_1/BRAM_PORTA] [get_bd_intf_pins blk_mem_gen_1/BRAM_PORTA]
  connect_bd_intf_net -intf_net axi_dma_M_AXI_S2MM [get_bd_intf_pins axi_dma/M_AXI_S2MM] [get_bd_intf_pins axi_mem_intercon/S00_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M00_AXI [get_bd_intf_pins axi_dma/S_AXI_LITE] [get_bd_intf_pins axi_interconnect_0/M00_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M01_AXI [get_bd_intf_pins axi_bram_ctrl_0/S_AXI] [get_bd_intf_pins axi_interconnect_0/M01_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M02_AXI [get_bd_intf_pins axi_bram_ctrl_1/S_AXI] [get_bd_intf_pins axi_interconnect_0/M02_AXI]
  connect_bd_intf_net -intf_net axi_mem_intercon_M00_AXI [get_bd_intf_pins axi_mem_intercon/M00_AXI] [get_bd_intf_pins processing_system7_0/S_AXI_HP0]
  connect_bd_intf_net -intf_net processing_system7_0_DDR [get_bd_intf_ports DDR] [get_bd_intf_pins processing_system7_0/DDR]
  connect_bd_intf_net -intf_net processing_system7_0_FIXED_IO [get_bd_intf_ports FIXED_IO] [get_bd_intf_pins processing_system7_0/FIXED_IO]
  connect_bd_intf_net -intf_net processing_system7_0_M_AXI_GP0 [get_bd_intf_pins axi_interconnect_0/S00_AXI] [get_bd_intf_pins processing_system7_0/M_AXI_GP0]

  # Create port connections
  connect_bd_net -net ACQ_ABORT_1 [get_bd_ports ACQ_ABORT] [get_bd_pins adc_axi_streamer/acq_abort] [get_bd_pins ila_0/probe23]
  connect_bd_net -net ACQ_AXI_RUN_1 [get_bd_ports ACQ_AXI_RUN] [get_bd_pins adc_axi_streamer/acq_axi_run] [get_bd_pins ila_0/probe28]
  connect_bd_net -net ACQ_DEPTH_A_1 [get_bd_ports ACQ_DEPTH_A] [get_bd_pins adc_axi_streamer/acq_depth_a]
  connect_bd_net -net ACQ_DEPTH_B_1 [get_bd_ports ACQ_DEPTH_B] [get_bd_pins adc_axi_streamer/acq_depth_b]
  connect_bd_net -net ACQ_DEPTH_MUX [get_bd_ports ACQ_DEPTH_MUX] [get_bd_pins adc_axi_streamer/acq_depth_mux] [get_bd_pins ila_0/probe26]
  connect_bd_net -net ACQ_RUN_1 [get_bd_ports ACQ_RUN] [get_bd_pins adc_axi_streamer/acq_run] [get_bd_pins ila_0/probe22]
  connect_bd_net -net ACQ_TRIGGER_IN_1 [get_bd_ports TRIGGER_IN] [get_bd_pins adc_axi_streamer/trigger_in] [get_bd_pins ila_0/probe29]
  connect_bd_net -net ACQ_TRIG_MASK_1 [get_bd_ports ACQ_TRIG_MASK] [get_bd_pins adc_axi_streamer/acq_trig_mask] [get_bd_pins ila_0/probe24]
  connect_bd_net -net ACQ_TRIG_RST_1 [get_bd_ports ACQ_TRIG_RST] [get_bd_pins adc_axi_streamer/acq_trig_rst] [get_bd_pins ila_0/probe25]
  connect_bd_net -net ACQ_TRIG_WORD_1 [get_bd_ports TRIGGER_SUB_WORD] [get_bd_pins adc_axi_streamer/trigger_sub_word]
  connect_bd_net -net ADC_BUS_1 [get_bd_ports ADC_BUS] [get_bd_pins adc_axi_streamer/adc_bus] [get_bd_pins ila_0/probe18]
  connect_bd_net -net ADC_DATA_CLK_2 [get_bd_ports ADC_DATA_CLK] [get_bd_pins adc_axi_streamer/adc_data_clk]
  connect_bd_net -net ADC_DATA_EOF_1 [get_bd_ports ADC_DATA_EOF] [get_bd_pins adc_axi_streamer/adc_eof] [get_bd_pins ila_0/probe21]
  connect_bd_net -net ADC_DATA_VALID_1 [get_bd_ports ADC_DATA_VALID] [get_bd_pins adc_axi_streamer/adc_data_valid] [get_bd_pins ila_0/probe19]
  connect_bd_net -net ADC_FIFO_RESET_1 [get_bd_ports ADC_FIFO_RESET] [get_bd_pins adc_axi_streamer/adc_fifo_reset] [get_bd_pins ila_0/probe20]
  connect_bd_net -net CFG_BRAM_ADDR_1 [get_bd_ports CFG_BRAM_ADDRB] [get_bd_pins blk_mem_gen_0/addrb]
  connect_bd_net -net CFG_BRAM_CLKB_1 [get_bd_ports CFG_BRAM_CLKB] [get_bd_pins blk_mem_gen_0/clkb]
  connect_bd_net -net CFG_BRAM_DINB_1 [get_bd_ports CFG_BRAM_DINB] [get_bd_pins blk_mem_gen_0/dinb]
  connect_bd_net -net CFG_BRAM_RSTB_1 [get_bd_ports CFG_BRAM_RSTB] [get_bd_pins blk_mem_gen_0/rstb]
  connect_bd_net -net CFG_BRAM_WEB_1 [get_bd_ports CFG_BRAM_WEB] [get_bd_pins blk_mem_gen_0/web]
  connect_bd_net -net CFG_BRAM_WREN_1 [get_bd_ports CFG_BRAM_ENB] [get_bd_pins blk_mem_gen_0/enb]
  connect_bd_net -net CSI_BRAM_ADDRB_1 [get_bd_ports CSI_BRAM_ADDRB] [get_bd_pins blk_mem_gen_1/addrb]
  connect_bd_net -net CSI_BRAM_CLKB_1 [get_bd_ports CSI_BRAM_CLKB] [get_bd_pins blk_mem_gen_1/clkb]
  connect_bd_net -net CSI_BRAM_ENB_1 [get_bd_ports CSI_BRAM_ENB] [get_bd_pins blk_mem_gen_1/enb]
  connect_bd_net -net EMIO_I_1 [get_bd_ports EMIO_I] [get_bd_pins processing_system7_0/GPIO_I]
  connect_bd_net -net FABCFG_COMMIT_MON_1 [get_bd_ports FABCFG_COMMIT_MON] [get_bd_pins ila_0/probe27]
  connect_bd_net -net FABCFG_DONE_MON_1 [get_bd_ports FABCFG_DONE_MON] [get_bd_pins ila_0/probe31]
  connect_bd_net -net PL_IRQ_1 [get_bd_ports PL_IRQ] [get_bd_pins xlconcat_1/In1]
  connect_bd_net -net adc_axi_streamer_acq_done [get_bd_ports ACQ_DONE] [get_bd_pins adc_axi_streamer/acq_done] [get_bd_pins ila_0/probe13]
  connect_bd_net -net adc_axi_streamer_acq_have_trig [get_bd_ports ACQ_HAVE_TRIG] [get_bd_pins adc_axi_streamer/acq_have_trig] [get_bd_pins ila_0/probe14]
  connect_bd_net -net adc_axi_streamer_adc_fifo_full [get_bd_ports ACQ_DATA_LOSS] [get_bd_pins adc_axi_streamer/acq_full_data_loss] [get_bd_pins ila_0/probe15]
  connect_bd_net -net adc_axi_streamer_dbg_acq_axi_downcounter [get_bd_pins adc_axi_streamer/dbg_acq_axi_downcounter] [get_bd_pins ila_0/probe8]
  connect_bd_net -net adc_axi_streamer_dbg_acq_axi_running [get_bd_pins adc_axi_streamer/dbg_acq_axi_running] [get_bd_pins ila_0/probe6]
  connect_bd_net -net adc_axi_streamer_dbg_acq_axi_upcounter [get_bd_pins adc_axi_streamer/dbg_acq_axi_upcounter] [get_bd_pins ila_0/probe7]
  connect_bd_net -net adc_axi_streamer_dbg_adcstream_state [get_bd_pins adc_axi_streamer/dbg_adcstream_state] [get_bd_pins ila_0/probe4]
  connect_bd_net -net adc_axi_streamer_dbg_axi_rdy [get_bd_pins adc_axi_streamer/dbg_axi_rdy] [get_bd_pins ila_0/probe5]
  connect_bd_net -net adc_axi_streamer_dbg_rd_data_count [get_bd_pins adc_axi_streamer/dbg_rd_data_count] [get_bd_pins ila_0/probe10]
  connect_bd_net -net adc_axi_streamer_dbg_trig_post_fifo [get_bd_pins adc_axi_streamer/dbg_trig_post_fifo] [get_bd_pins ila_0/probe12]
  connect_bd_net -net adc_axi_streamer_dbg_wr_data_count [get_bd_pins adc_axi_streamer/dbg_wr_data_count] [get_bd_pins ila_0/probe11]
  connect_bd_net -net adc_axi_streamer_m00_axis_tdata [get_bd_pins adc_axi_streamer/m00_axis_tdata] [get_bd_pins axi_dma/s_axis_s2mm_tdata] [get_bd_pins ila_0/probe0]
  connect_bd_net -net adc_axi_streamer_m00_axis_tlast [get_bd_pins adc_axi_streamer/m00_axis_tlast] [get_bd_pins axi_dma/s_axis_s2mm_tlast] [get_bd_pins ila_0/probe1]
  connect_bd_net -net adc_axi_streamer_m00_axis_tvalid [get_bd_pins adc_axi_streamer/m00_axis_tvalid] [get_bd_pins axi_dma/s_axis_s2mm_tvalid] [get_bd_pins ila_0/probe2]
  connect_bd_net -net adc_axi_streamer_trigger_out [get_bd_ports TRIGGER_OUT] [get_bd_pins adc_axi_streamer/trigger_out] [get_bd_pins ila_0/probe17]
  connect_bd_net -net adc_axi_streamer_trigger_pos [get_bd_ports TRIGGER_POS] [get_bd_pins adc_axi_streamer/trigger_pos] [get_bd_pins ila_0/probe16]
  connect_bd_net -net axi_dma_s2mm_introut [get_bd_pins axi_dma/s2mm_introut] [get_bd_pins ila_0/probe9] [get_bd_pins xlconcat_1/In0]
  connect_bd_net -net axi_dma_s_axis_s2mm_tready [get_bd_pins adc_axi_streamer/m00_axis_tready] [get_bd_pins axi_dma/s_axis_s2mm_tready] [get_bd_pins ila_0/probe3]
  connect_bd_net -net blk_mem_gen_0_doutb [get_bd_ports CFG_BRAM_DOUTB] [get_bd_pins blk_mem_gen_0/doutb]
  connect_bd_net -net blk_mem_gen_0_rstb_busy [get_bd_ports CFG_BRAM_BUSYB] [get_bd_pins blk_mem_gen_0/rstb_busy]
  connect_bd_net -net blk_mem_gen_1_doutb [get_bd_ports CSI_BRAM_DOUTB] [get_bd_pins blk_mem_gen_1/doutb]
  connect_bd_net -net processing_system7_0_FCLK_CLK0 [get_bd_ports FCLK_CLK0] [get_bd_pins adc_axi_streamer/m00_axis_aclk] [get_bd_pins axi_bram_ctrl_0/s_axi_aclk] [get_bd_pins axi_bram_ctrl_1/s_axi_aclk] [get_bd_pins axi_dma/m_axi_s2mm_aclk] [get_bd_pins axi_dma/s_axi_lite_aclk] [get_bd_pins axi_interconnect_0/ACLK] [get_bd_pins axi_interconnect_0/M00_ACLK] [get_bd_pins axi_interconnect_0/M01_ACLK] [get_bd_pins axi_interconnect_0/M02_ACLK] [get_bd_pins axi_interconnect_0/S00_ACLK] [get_bd_pins axi_mem_intercon/ACLK] [get_bd_pins axi_mem_intercon/M00_ACLK] [get_bd_pins axi_mem_intercon/S00_ACLK] [get_bd_pins ila_0/clk] [get_bd_pins processing_system7_0/FCLK_CLK0] [get_bd_pins processing_system7_0/M_AXI_GP0_ACLK] [get_bd_pins processing_system7_0/S_AXI_HP0_ACLK] [get_bd_pins rst_ps7_0_20M/slowest_sync_clk]
  connect_bd_net -net processing_system7_0_FCLK_RESET0_N [get_bd_pins processing_system7_0/FCLK_RESET0_N] [get_bd_pins rst_ps7_0_20M/ext_reset_in]
  connect_bd_net -net processing_system7_0_GPIO_O [get_bd_ports EMIO_O] [get_bd_pins processing_system7_0/GPIO_O]
  connect_bd_net -net rst_ps7_0_20M_peripheral_aresetn [get_bd_pins adc_axi_streamer/m00_axis_aresetn] [get_bd_pins axi_bram_ctrl_0/s_axi_aresetn] [get_bd_pins axi_bram_ctrl_1/s_axi_aresetn] [get_bd_pins axi_dma/axi_resetn] [get_bd_pins axi_interconnect_0/ARESETN] [get_bd_pins axi_interconnect_0/M00_ARESETN] [get_bd_pins axi_interconnect_0/M01_ARESETN] [get_bd_pins axi_interconnect_0/M02_ARESETN] [get_bd_pins axi_interconnect_0/S00_ARESETN] [get_bd_pins axi_mem_intercon/ARESETN] [get_bd_pins axi_mem_intercon/M00_ARESETN] [get_bd_pins axi_mem_intercon/S00_ARESETN] [get_bd_pins ila_0/probe30] [get_bd_pins rst_ps7_0_20M/peripheral_aresetn]
  connect_bd_net -net xlconcat_1_dout [get_bd_pins processing_system7_0/IRQ_F2P] [get_bd_pins xlconcat_1/dout]

  # Create address segments
  assign_bd_address -offset 0x00000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces axi_dma/Data_S2MM] [get_bd_addr_segs processing_system7_0/S_AXI_HP0/HP0_DDR_LOWOCM] -force
  assign_bd_address -offset 0x40000000 -range 0x00002000 -target_address_space [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs axi_bram_ctrl_0/S_AXI/Mem0] -force
  assign_bd_address -offset 0x42000000 -range 0x00010000 -target_address_space [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs axi_bram_ctrl_1/S_AXI/Mem0] -force
  assign_bd_address -offset 0x40400000 -range 0x00010000 -target_address_space [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs axi_dma/S_AXI_LITE/Reg] -force


  # Restore current instance
  current_bd_instance $oldCurInst

  validate_bd_design
  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


