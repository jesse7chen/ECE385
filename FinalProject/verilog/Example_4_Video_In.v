
module Example_4_Video_In (
	// Inputs
	CLOCK_50,
	TD_CLK27,
	KEY,

	//  Video In
	TD_DATA,
	TD_HS,
	TD_VS,

/*****************************************************************************/
	// Bidirectionals
	//  Memory (SRAM)
	SRAM_DQ,
	
	//  AV Config
	I2C_SDAT,
	
/*****************************************************************************/
	// Outputs
	TD_RESET_N,
	
	// 	Memory (SRAM)
	SRAM_ADDR,

	SRAM_CE_N,
	SRAM_WE_N,
	SRAM_OE_N,
	SRAM_UB_N,
	SRAM_LB_N,
	
	// VGA
	VGA_CLK,
	VGA_HS,
	VGA_VS,
	VGA_BLANK_N,
	VGA_SYNC_N,
	VGA_R,
	VGA_G,
	VGA_B,

	// AV Config
	I2C_SCLK,
	
	GPIO,
	LEDR
);

/*****************************************************************************
 *                           Parameter Declarations                          *
 *****************************************************************************/


/*****************************************************************************
 *                             Port Declarations                             *
 *****************************************************************************/
// Inputs
input				CLOCK_50;
input				TD_CLK27;
input		[ 3: 0]	KEY;

//  Video In
input		[ 7: 0]	TD_DATA;
input				TD_HS;
input				TD_VS;

// Bidirectionals
// 	Memory (SRAM)
inout		[15: 0]	SRAM_DQ;



// Outputs
output				TD_RESET_N;

// 	Memory (SRAM)
output		[19: 0]	SRAM_ADDR;

output				SRAM_CE_N;
output				SRAM_WE_N;
output				SRAM_OE_N;
output				SRAM_UB_N;
output				SRAM_LB_N;

//  VGA
output				VGA_CLK;
output				VGA_HS;
output				VGA_VS;
output				VGA_BLANK_N;
output				VGA_SYNC_N;
output		[ 7: 0]	VGA_R;
output		[ 7: 0]	VGA_G;
output		[ 7: 0]	VGA_B;

//  AV Config
output				I2C_SCLK;

//  AV Config
inout				I2C_SDAT;

inout 		[39 : 0]	GPIO;

output [17:0] LEDR;

/*****************************************************************************
 *                 Internal Wires and Registers Declarations                 *
 *****************************************************************************/
// Internal Wires

// Internal Registers

// State Machine Registers

/*****************************************************************************
 *                         Finite State Machine(s)                           *
 *****************************************************************************/


/*****************************************************************************
 *                             Sequential Logic                              *
 *****************************************************************************/


/*****************************************************************************
 *                            Combinational Logic                            *
 *****************************************************************************/

// Output Assignments
assign TD_RESET_N	= 1'b1;

assign		video_pixel_clk_reset = ~KEY[1]; //            .pixel_clk_reset

assign		video_PIXEL_CLK = GPIO[12];       //       video.PIXEL_CLK
assign 		video_LINE_VALID = GPIO[14];      //            .LINE_VALID
assign		video_FRAME_VALID = GPIO[15];     //            .FRAME_VALID

assign 		video_PIXEL_DATA[0] = GPIO[0];       //            .PIXEL_DATA	
assign 		video_PIXEL_DATA[1] = GPIO[1];       //            .PIXEL_DATA	
assign 		video_PIXEL_DATA[2] = GPIO[5];       //            .PIXEL_DATA	
assign 		video_PIXEL_DATA[3] = GPIO[3];       //            .PIXEL_DATA	
assign 		video_PIXEL_DATA[4] = GPIO[2];      //            .PIXEL_DATA	
assign 		video_PIXEL_DATA[5] = GPIO[4];       //            .PIXEL_DATA	
assign 		video_PIXEL_DATA[6] = GPIO[6];       //            .PIXEL_DATA	
assign 		video_PIXEL_DATA[7] = GPIO[7];       //            .PIXEL_DATA	
assign 		video_PIXEL_DATA[8] = GPIO[8];       //            .PIXEL_DATA	
assign 		video_PIXEL_DATA[9] = GPIO[9];       //            .PIXEL_DATA	

wire video_PIXEL_CLK;       //       video.PIXEL_CLK
wire video_LINE_VALID;      //            .LINE_VALID
wire video_FRAME_VALID;     //            .FRAME_VALID
wire video_pixel_clk_reset; //            .pixel_clk_reset
wire [9:0]  video_PIXEL_DATA;       //            .PIXEL_DATA
wire SCLK1;
wire SDAT1;

assign 		LEDR[0] = video_PIXEL_DATA[0];     
assign 		LEDR[1] = video_PIXEL_DATA[1];
assign 		LEDR[2] = video_PIXEL_DATA[2];    
assign 		LEDR[3] = video_PIXEL_DATA[3];      
assign 		LEDR[4] = video_PIXEL_DATA[4];     
assign 		LEDR[5] = video_PIXEL_DATA[5];    
assign 		LEDR[6] = video_PIXEL_DATA[6];     
assign 		LEDR[7] = video_PIXEL_DATA[7];    
assign 		LEDR[8] = video_PIXEL_DATA[8];     
assign 		LEDR[9] = video_PIXEL_DATA[9];

assign GPIO[13] = VGA_CLK;

/*****************************************************************************
 *                              Internal Modules                             *
 *****************************************************************************/

Video_System Video_System (
	// 1) global signals:
	.clk									(CLOCK_50),
	.reset_n								(KEY[0]),

	// the_AV_Config
	.I2C_SDAT_to_and_from_the_AV_Config		(GPIO[16]),
	.I2C_SCLK_from_the_AV_Config			(GPIO[17]),
	
	// the_Pixel_Buffer
	.SRAM_DQ_to_and_from_the_Pixel_Buffer	(SRAM_DQ),
	.SRAM_ADDR_from_the_Pixel_Buffer		(SRAM_ADDR),
	.SRAM_LB_N_from_the_Pixel_Buffer		(SRAM_LB_N),
	.SRAM_UB_N_from_the_Pixel_Buffer		(SRAM_UB_N),
	.SRAM_CE_N_from_the_Pixel_Buffer		(SRAM_CE_N),
	.SRAM_OE_N_from_the_Pixel_Buffer		(SRAM_OE_N),
	.SRAM_WE_N_from_the_Pixel_Buffer		(SRAM_WE_N),

	/*
	// the_Video_In_Decoder
	.TD_CLK27_to_the_Video_In_Decoder		(TD_CLK27),
	.TD_DATA_to_the_Video_In_Decoder		(TD_DATA),
	.TD_HS_to_the_Video_In_Decoder			(TD_HS),
	.TD_RESET_from_the_Video_In_Decoder		(),
	.TD_VS_to_the_Video_In_Decoder			(TD_VS),
	*/
	// the_VGA_Controller
	.VGA_CLK_from_the_VGA_Controller		(VGA_CLK),
	.VGA_HS_from_the_VGA_Controller			(VGA_HS),
	.VGA_VS_from_the_VGA_Controller			(VGA_VS),
	.VGA_BLANK_from_the_VGA_Controller		(VGA_BLANK_N),
	.VGA_SYNC_from_the_VGA_Controller		(VGA_SYNC_N),
	.VGA_R_from_the_VGA_Controller			(VGA_R),
	.VGA_G_from_the_VGA_Controller			(VGA_G),
	.VGA_B_from_the_VGA_Controller			(VGA_B),
	
	.Video_In_Decoder_external_interface_PIXEL_CLK(video_PIXEL_CLK),       // Video_In_Decoder_external_interface.PIXEL_CLK
	.Video_In_Decoder_external_interface_LINE_VALID(video_LINE_VALID),      //                                    .LINE_VALID
	.Video_In_Decoder_external_interface_FRAME_VALID(video_FRAME_VALID),     //                                    .FRAME_VALID
	.Video_In_Decoder_external_interface_pixel_clk_reset(video_pixel_clk_reset), //                                    .pixel_clk_reset
	.Video_In_Decoder_external_interface_PIXEL_DATA(video_PIXEL_DATA)       //                                    .PIXEL_DATA
);

endmodule

