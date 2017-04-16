	nios_system u0 (
		.clk_clk               (<connected-to-clk_clk>),               //          clk.clk
		.key_wire_export       (<connected-to-key_wire_export>),       //     key_wire.export
		.qsys_vga_CLK          (<connected-to-qsys_vga_CLK>),          //     qsys_vga.CLK
		.qsys_vga_HS           (<connected-to-qsys_vga_HS>),           //             .HS
		.qsys_vga_VS           (<connected-to-qsys_vga_VS>),           //             .VS
		.qsys_vga_BLANK        (<connected-to-qsys_vga_BLANK>),        //             .BLANK
		.qsys_vga_SYNC         (<connected-to-qsys_vga_SYNC>),         //             .SYNC
		.qsys_vga_R            (<connected-to-qsys_vga_R>),            //             .R
		.qsys_vga_G            (<connected-to-qsys_vga_G>),            //             .G
		.qsys_vga_B            (<connected-to-qsys_vga_B>),            //             .B
		.reset_reset_n         (<connected-to-reset_reset_n>),         //        reset.reset_n
		.sdram_wire_addr       (<connected-to-sdram_wire_addr>),       //   sdram_wire.addr
		.sdram_wire_ba         (<connected-to-sdram_wire_ba>),         //             .ba
		.sdram_wire_cas_n      (<connected-to-sdram_wire_cas_n>),      //             .cas_n
		.sdram_wire_cke        (<connected-to-sdram_wire_cke>),        //             .cke
		.sdram_wire_cs_n       (<connected-to-sdram_wire_cs_n>),       //             .cs_n
		.sdram_wire_dq         (<connected-to-sdram_wire_dq>),         //             .dq
		.sdram_wire_dqm        (<connected-to-sdram_wire_dqm>),        //             .dqm
		.sdram_wire_ras_n      (<connected-to-sdram_wire_ras_n>),      //             .ras_n
		.sdram_wire_we_n       (<connected-to-sdram_wire_we_n>),       //             .we_n
		.switch_wire_export    (<connected-to-switch_wire_export>),    //  switch_wire.export
		.video_PIXEL_CLK       (<connected-to-video_PIXEL_CLK>),       //        video.PIXEL_CLK
		.video_LINE_VALID      (<connected-to-video_LINE_VALID>),      //             .LINE_VALID
		.video_FRAME_VALID     (<connected-to-video_FRAME_VALID>),     //             .FRAME_VALID
		.video_pixel_clk_reset (<connected-to-video_pixel_clk_reset>), //             .pixel_clk_reset
		.video_PIXEL_DATA      (<connected-to-video_PIXEL_DATA>),      //             .PIXEL_DATA
		.video_config_SDAT     (<connected-to-video_config_SDAT>),     // video_config.SDAT
		.video_config_SCLK     (<connected-to-video_config_SCLK>),     //             .SCLK
		.sdram_clk_clk         (<connected-to-sdram_clk_clk>),         //    sdram_clk.clk
		.clock_25_clk          (<connected-to-clock_25_clk>)           //     clock_25.clk
	);

