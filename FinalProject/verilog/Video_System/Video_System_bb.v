
module Video_System (
	VGA_CLK_from_the_VGA_Controller,
	VGA_HS_from_the_VGA_Controller,
	VGA_VS_from_the_VGA_Controller,
	VGA_BLANK_from_the_VGA_Controller,
	VGA_SYNC_from_the_VGA_Controller,
	VGA_R_from_the_VGA_Controller,
	VGA_G_from_the_VGA_Controller,
	VGA_B_from_the_VGA_Controller,
	reset_n,
	I2C_SDAT_to_and_from_the_AV_Config,
	I2C_SCLK_from_the_AV_Config,
	clk,
	SRAM_DQ_to_and_from_the_Pixel_Buffer,
	SRAM_ADDR_from_the_Pixel_Buffer,
	SRAM_LB_N_from_the_Pixel_Buffer,
	SRAM_UB_N_from_the_Pixel_Buffer,
	SRAM_CE_N_from_the_Pixel_Buffer,
	SRAM_OE_N_from_the_Pixel_Buffer,
	SRAM_WE_N_from_the_Pixel_Buffer,
	Video_In_Decoder_external_interface_PIXEL_CLK,
	Video_In_Decoder_external_interface_LINE_VALID,
	Video_In_Decoder_external_interface_FRAME_VALID,
	Video_In_Decoder_external_interface_pixel_clk_reset,
	Video_In_Decoder_external_interface_PIXEL_DATA);	

	output		VGA_CLK_from_the_VGA_Controller;
	output		VGA_HS_from_the_VGA_Controller;
	output		VGA_VS_from_the_VGA_Controller;
	output		VGA_BLANK_from_the_VGA_Controller;
	output		VGA_SYNC_from_the_VGA_Controller;
	output	[7:0]	VGA_R_from_the_VGA_Controller;
	output	[7:0]	VGA_G_from_the_VGA_Controller;
	output	[7:0]	VGA_B_from_the_VGA_Controller;
	input		reset_n;
	inout		I2C_SDAT_to_and_from_the_AV_Config;
	output		I2C_SCLK_from_the_AV_Config;
	input		clk;
	inout	[15:0]	SRAM_DQ_to_and_from_the_Pixel_Buffer;
	output	[19:0]	SRAM_ADDR_from_the_Pixel_Buffer;
	output		SRAM_LB_N_from_the_Pixel_Buffer;
	output		SRAM_UB_N_from_the_Pixel_Buffer;
	output		SRAM_CE_N_from_the_Pixel_Buffer;
	output		SRAM_OE_N_from_the_Pixel_Buffer;
	output		SRAM_WE_N_from_the_Pixel_Buffer;
	input		Video_In_Decoder_external_interface_PIXEL_CLK;
	input		Video_In_Decoder_external_interface_LINE_VALID;
	input		Video_In_Decoder_external_interface_FRAME_VALID;
	input		Video_In_Decoder_external_interface_pixel_clk_reset;
	input	[9:0]	Video_In_Decoder_external_interface_PIXEL_DATA;
endmodule
