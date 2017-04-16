
module nios_system (
	clk_clk,
	key_wire_export,
	qsys_vga_CLK,
	qsys_vga_HS,
	qsys_vga_VS,
	qsys_vga_BLANK,
	qsys_vga_SYNC,
	qsys_vga_R,
	qsys_vga_G,
	qsys_vga_B,
	reset_reset_n,
	sdram_wire_addr,
	sdram_wire_ba,
	sdram_wire_cas_n,
	sdram_wire_cke,
	sdram_wire_cs_n,
	sdram_wire_dq,
	sdram_wire_dqm,
	sdram_wire_ras_n,
	sdram_wire_we_n,
	switch_wire_export,
	video_PIXEL_CLK,
	video_LINE_VALID,
	video_FRAME_VALID,
	video_pixel_clk_reset,
	video_PIXEL_DATA,
	video_config_SDAT,
	video_config_SCLK,
	sdram_clk_clk,
	clock_25_clk);	

	input		clk_clk;
	input	[3:0]	key_wire_export;
	output		qsys_vga_CLK;
	output		qsys_vga_HS;
	output		qsys_vga_VS;
	output		qsys_vga_BLANK;
	output		qsys_vga_SYNC;
	output	[7:0]	qsys_vga_R;
	output	[7:0]	qsys_vga_G;
	output	[7:0]	qsys_vga_B;
	input		reset_reset_n;
	output	[12:0]	sdram_wire_addr;
	output	[1:0]	sdram_wire_ba;
	output		sdram_wire_cas_n;
	output		sdram_wire_cke;
	output		sdram_wire_cs_n;
	inout	[31:0]	sdram_wire_dq;
	output	[3:0]	sdram_wire_dqm;
	output		sdram_wire_ras_n;
	output		sdram_wire_we_n;
	input	[7:0]	switch_wire_export;
	input		video_PIXEL_CLK;
	input		video_LINE_VALID;
	input		video_FRAME_VALID;
	input		video_pixel_clk_reset;
	input	[9:0]	video_PIXEL_DATA;
	inout		video_config_SDAT;
	output		video_config_SCLK;
	output		sdram_clk_clk;
	output		clock_25_clk;
endmodule
