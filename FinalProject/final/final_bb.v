
module final (
	clk_clk,
	key_wire_export,
	led_wire_export,
	reset_reset_n,
	sdram_clk_clk,
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
	rgb_export,
	inx_export,
	iny_export,
	vs_export,
	clk_wire_export,
	posx_export,
	posy_export);	

	input		clk_clk;
	input	[3:0]	key_wire_export;
	output	[7:0]	led_wire_export;
	input		reset_reset_n;
	output		sdram_clk_clk;
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
	input	[29:0]	rgb_export;
	input	[9:0]	inx_export;
	input	[9:0]	iny_export;
	input		vs_export;
	output		clk_wire_export;
	output	[9:0]	posx_export;
	output	[9:0]	posy_export;
endmodule
