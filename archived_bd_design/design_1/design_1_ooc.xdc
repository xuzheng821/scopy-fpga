################################################################################

# This XDC is used only for OOC mode of synthesis, implementation
# This constraints file contains default clock frequencies to be used during
# out-of-context flows such as OOC Synthesis and Hierarchical Designs.
# This constraints file is not used in normal top-down synthesis (default flow
# of Vivado)
################################################################################
create_clock -name ADC_DATA_CLK -period 8 [get_ports ADC_DATA_CLK]
create_clock -name CSI_BRAM_CLKB -period 10 [get_ports CSI_BRAM_CLKB]
create_clock -name processing_system7_0_FCLK_CLK0 -period 5.625 [get_pins processing_system7_0/FCLK_CLK0]

################################################################################