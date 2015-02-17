
 add_fsm_encoding \
       {rx_axistream_if__parameterized0.rxs_axistream_current_state} \
       { }  \
       {{00000 00000} {00001 00001} {00010 00010} {00011 00011} {00100 00100} {00101 01010} {00110 00111} {00111 00101} {01000 00110} {01001 01001} {01010 01000} {01011 01011} {01100 01100} {01101 01101} {01110 01110} {01111 01111} {10000 10000} {10001 10001} {10010 10010} {10011 10011} {10100 10100} {10101 10101} {10110 10110} {10111 10111} {11000 11000} {11001 11001} {11010 11010} {11011 11011} }

 add_fsm_encoding \
       {rx_axistream_if__parameterized0.rxd_axistream_current_state} \
       { }  \
       {{0000 0000} {0001 0001} {0010 0010} {0011 0100} {0100 0101} {0101 0110} {0110 0111} {0111 0011} {1000 1000} }

 add_fsm_encoding \
       {rx_emac_if__parameterized0.receive_frame_current_state} \
       { }  \
       {{00000 00000} {00001 00001} {00010 00010} {00011 00011} {00100 00100} {00101 00101} {00110 00110} {00111 00111} {01000 01000} {01001 01111} {01010 01001} {01011 01010} {01100 01011} {01101 01100} {01110 01101} {01111 01110} {10000 10000} }

 add_fsm_encoding \
       {tx_basic_if__parameterized0.txc_wr_cs} \
       { }  \
       {{0000 0000} {0001 0001} {0010 0010} {0011 0011} {0100 0100} {0101 0110} {0110 0101} {0111 0111} {1000 1000} {1001 1010} {1010 1001} {1011 1011} {1100 1101} {1101 1110} {1110 1100} }

 add_fsm_encoding \
       {tx_emac_if__parameterized0.txc_rd_cs} \
       { }  \
       {{000 000} {001 001} {010 010} {011 011} {100 100} {101 101} {110 110} {111 111} }

 add_fsm_encoding \
       {bd_0_eth_mac_0_support_resets.idelay_reset_cnt} \
       { }  \
       {{0000 0001} {0001 0010} {0010 0011} {0011 0100} {0100 0101} {0101 0110} {0110 0111} {0111 1000} {1000 1001} {1001 1010} {1010 1011} {1011 1100} {1100 0000} }

 add_fsm_encoding \
       {bd_0_eth_mac_0_slave_attachment.access_cs} \
       { }  \
       {{000 000} {001 001} {010 011} {011 010} {100 100} {101 101} {110 110} }

 add_fsm_encoding \
       {tri_mode_ethernet_mac_v8_3_tx_axi_intf.tx_state} \
       { }  \
       {{0000 0000} {0001 0001} {0010 0100} {0011 0101} {0100 0111} {0101 0011} {0110 1000} {0111 1010} {1000 0110} {1001 1001} {1010 0010} }

 add_fsm_encoding \
       {tri_mode_ethernet_mac_v8_3_pfc_tx_cntl.legacy_state} \
       { }  \
       {{000 00010} {001 00100} {010 01000} {011 10000} }

 add_fsm_encoding \
       {axi_dma_mm2s_sm.mm2s_cs} \
       { }  \
       {{00 000} {01 001} {10 011} {11 010} }

 add_fsm_encoding \
       {axi_dma_s2mm_sm.GEN_SM_FOR_LENGTH.s2mm_cs} \
       { }  \
       {{000 000} {001 001} {010 010} {011 011} {100 100} {101 101} }

 add_fsm_encoding \
       {bd_1_eth_mac_0_slave_attachment.access_cs} \
       { }  \
       {{000 000} {001 001} {010 011} {011 010} {100 100} {101 101} {110 110} }

 add_fsm_encoding \
       {bd_2_eth_mac_0_slave_attachment.access_cs} \
       { }  \
       {{000 000} {001 001} {010 011} {011 010} {100 100} {101 101} {110 110} }

 add_fsm_encoding \
       {bd_3_eth_mac_0_slave_attachment.access_cs} \
       { }  \
       {{000 000} {001 001} {010 011} {011 010} {100 100} {101 101} {110 110} }

 add_fsm_encoding \
       {axi_data_fifo_v2_1_axic_reg_srl_fifo.state} \
       { }  \
       {{00 01000} {01 10000} {10 00010} {11 00100} }

 add_fsm_encoding \
       {axi_data_fifo_v2_1_axic_reg_srl_fifo__parameterized0.state} \
       { }  \
       {{00 01000} {01 10000} {10 00010} {11 00100} }

 add_fsm_encoding \
       {axi_data_fifo_v2_1_axic_reg_srl_fifo__parameterized1.state} \
       { }  \
       {{00 01000} {01 10000} {10 00010} {11 00100} }
