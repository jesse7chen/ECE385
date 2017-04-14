//-------------------------------------------------------------------------
//      lab7_usb.sv                                                      --
//      Christine Chen                                                   --
//      Fall 2014                                                        --
//                                                                       --
//      Fall 2014 Distribution                                           --
//                                                                       --
//      For use with ECE 385 Lab 7                                       --
//      UIUC ECE Department                                              --
//-------------------------------------------------------------------------


module FinalProject( input               CLOCK_50,
             input        [3:0]  KEY,          //bit 0 is set up as Reset
             output logic [6:0]  HEX0, HEX1,
             // VGA Interface 
             output logic [7:0]  VGA_R,        //VGA Red
                                 VGA_G,        //VGA Green
                                 VGA_B,        //VGA Blue
             output logic        VGA_CLK,      //VGA Clock
                                 VGA_SYNC_N,   //VGA Sync signal
                                 VGA_BLANK_N,  //VGA Blank signal
                                 VGA_VS,       //VGA virtical sync signal
                                 VGA_HS,       //VGA horizontal sync signal
				input		[39:0] GPIO,
											

				
             // SDRAM Interface for Nios II Software
             output logic [12:0] DRAM_ADDR,    //SDRAM Address 13 Bits
             inout  wire  [31:0] DRAM_DQ,      //SDRAM Data 32 Bits
             output logic [1:0]  DRAM_BA,      //SDRAM Bank Address 2 Bits
             output logic [3:0]  DRAM_DQM,     //SDRAM Data Mast 4 Bits
             output logic        DRAM_RAS_N,   //SDRAM Row Address Strobe
                                 DRAM_CAS_N,   //SDRAM Column Address Strobe
                                 DRAM_CKE,     //SDRAM Clock Enable
                                 DRAM_WE_N,    //SDRAM Write Enable
                                 DRAM_CS_N    //SDRAM Chip Select
                                 //DRAM_CLK      //SDRAM Clock
                    );
						  
logic video_PIXEL_CLK;       //       video.PIXEL_CLK
logic video_LINE_VALID;      //            .LINE_VALID
logic video_FRAME_VALID;     //            .FRAME_VALID
logic video_pixel_clk_reset; //            .pixel_clk_reset
logic   [9:0]  video_PIXEL_DATA;       //            .PIXEL_DATA
						  
						  
logic [3:0] KEYS;			
logic [7:0] Switches;	


assign		video_pixel_clk_reset = !KEY[1]; //            .pixel_clk_reset

assign		video_PIXEL_CLK = GPIO[10];       //       video.PIXEL_CLK
assign 		video_LINE_VALID = GPIO[12];      //            .LINE_VALID
assign		video_FRAME_VALID = GPIO[13];     //            .FRAME_VALID


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

				

     //The connections for nios_system might be named different depending on how you set up Qsys
     nios_system nios_system(
                             .clk_clk(CLOCK_50),         
                             .reset_reset_n(KEY[0]),   
                             .sdram_wire_addr(DRAM_ADDR), 
                             .sdram_wire_ba(DRAM_BA),   
                             .sdram_wire_cas_n(DRAM_CAS_N),
                             .sdram_wire_cke(DRAM_CKE),  
                             .sdram_wire_cs_n(DRAM_CS_N), 
                             .sdram_wire_dq(DRAM_DQ),   
                             .sdram_wire_dqm(DRAM_DQM),  
                             .sdram_wire_ras_n(DRAM_RAS_N),
                             .sdram_wire_we_n(DRAM_WE_N), 
                            // .sdram_clk_clk(DRAM_CLK),

									  

		.key_wire_export(KEYS),       //    key_wire.export
		.qsys_vga_CLK(VGA_CLK),          //    qsys_vga.CLK
		.qsys_vga_HS(VGA_HS),           //            .HS
		.qsys_vga_VS(VGA_VS),           //            .VS
		.qsys_vga_BLANK(VGA_BLANK_N),        //            .BLANK
		.qsys_vga_SYNC(VGA_SYNC_N),         //            .SYNC
		
		.qsys_vga_R(VGA_R),            //            .R
		.qsys_vga_G(VGA_G),            //            .G
		.qsys_vga_B(VGA_B),            //            .B


		.switch_wire_export(Switches),    // switch_wire.export
		
		.video_PIXEL_CLK(video_PIXEL_CLK),       //       video.PIXEL_CLK
		.video_LINE_VALID(video_LINE_VALID),      //            .LINE_VALID
		.video_FRAME_VALID(video_FRAME_VALID),     //            .FRAME_VALID
		.video_pixel_clk_reset(video_pixel_clk_reset), //            .pixel_clk_reset
		.video_PIXEL_DATA(video_PIXEL_DATA)       //            .PIXEL_DATA
    );
    

endmodule
