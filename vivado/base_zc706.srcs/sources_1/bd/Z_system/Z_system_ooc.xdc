################################################################################

# This XDC is used only for OOC mode of synthesis, implementation
# This constraints file contains default clock frequencies to be used during
# out-of-context flows such as OOC Synthesis and Hierarchical Designs.
# This constraints file is not used in normal top-down synthesis (default flow
# of Vivado)
################################################################################
create_clock -name rgmii_port_0_rxc -period 10 [get_ports rgmii_port_0_rxc]
create_clock -name rgmii_port_1_rxc -period 10 [get_ports rgmii_port_1_rxc]
create_clock -name rgmii_port_2_rxc -period 10 [get_ports rgmii_port_2_rxc]
create_clock -name rgmii_port_3_rxc -period 10 [get_ports rgmii_port_3_rxc]
create_clock -name processing_system7_0_FCLK_CLK0 -period 10 [get_pins processing_system7_0/FCLK_CLK0]
create_clock -name processing_system7_0_FCLK_CLK1 -period 5 [get_pins processing_system7_0/FCLK_CLK1]

################################################################################