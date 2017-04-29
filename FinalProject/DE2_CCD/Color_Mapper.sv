//-------------------------------------------------------------------------
//    Color_Mapper.sv                                                    --
//    Stephen Kempf                                                      --
//    3-1-06                                                             --
//                                                                       --
//    Modified by David Kesler  07-16-2008                               --
//    Translated by Joe Meng    07-07-2013                               --
//    Modified by Po-Han Huang  03-03-2017                               --
//                                                                       --
//    Spring 2017 Distribution                                           --
//                                                                       --
//    For use with ECE 385 Lab 7                                         --
//    University of Illinois ECE Department                              --
//-------------------------------------------------------------------------


module  Color_Mapper ( input        [9:0] VGA_R_In, VGA_G_In, VGA_B_In, // VGA input from camera   
                                          VGA_X, VGA_Y,       // Coordinates of current drawing pixel
							  input					CLK,
							  input 	logic		[3:0] data,
							  input 			memory_on,
							  input run,
                       output logic [7:0] VGA_R, VGA_G, VGA_B // VGA RGB output
                     );
    
    
    logic point_on;
    logic [7:0] Red, Green, Blue;
	 reg [7:0] white;
	 assign white = 8'hff;
	 
	 logic	[1:0] value_in;
	 logic	[1:0] value_out;
	 
	 
	 logic	[1:0] value_inT;
	 logic	[1:0] value_outT;
	 
	 always_ff@(posedge CLK)
	 begin
	 value_in <= value_inT;
	 end
	 
	 
	 RAM		ram1 (

				.clock(CLK),
				.data(value_in),
				.rdaddress({VGA_X, VGA_Y}),
				.wraddress({(VGA_X-4), VGA_Y}),
				.wren(1'b1),
				.q(value_out)
					);
     
 /* The ball's (pixelated) circle is generated using the standard circle formula.  Note that while 
    the single line is quite powerful descriptively, it causes the synthesis tool to use up three
    of the 12 available multipliers on the chip! Since the multiplicants are required to be signed,
    we have to first cast them from logic to int (signed by default) before they are multiplied. */
    int centerX, centerY;  
    int DistX, DistY, DistXX, DistYY;
    //assign DistX = posX - 10'd10;
	 //assign DistXX = posX + 10'd10;
    //assign DistY = posY - 10'd10;
	 //assign DistYY = posY + 10'd10;
	 
	 assign centerX = 10'd464;
	 assign centerY = 10'd274;
	 assign DistX = 10'd454;
	 assign DistXX = 10'd474;
    assign DistY = 10'd264;
	 assign DistYY = 10'd284;
   
    assign VGA_R = Red;
    assign VGA_G = Green;
    assign VGA_B = Blue;
	 

    
    // Compute whether the pixel corresponds to ball or background
	always_comb
	begin : On_point
		point_on = 1'b0;
		if(run == 1'b0)
		begin
				if ((VGA_X >= DistX && VGA_X <= DistXX && VGA_Y == centerY) || (VGA_Y >= DistY && VGA_Y <= DistYY && VGA_X == centerX))
				begin
					point_on = 1'b1;
					//value_inT <= 2'b00;
				end
				/*if (VGA_R_In == 10'b1111111111 && VGA_G_In == 10'b1111111111 && VGA_B_In == 10'b1111111111)
				begin
					value_inT <= 2'b11;
				end
				if(value_out == 2'b11)
				begin
					point_on <= 1'b1;
					value_inT <=	value_out;
				end*/
		end
    end
    
	 

    // Assign color based on ball_on signal
    always_comb
    begin : RGB_Display
		if(point_on)
		begin
				Red = 8'hff;
            Green = 8'hff;
            Blue = 8'hff;
				value_inT = value_out;
		end
		
	   else 
		begin
				Red = VGA_R_In/4; 
            Green = VGA_G_In/4;
            Blue = VGA_B_In/4;
				value_inT = value_out;
				
				if (VGA_R_In == 10'b1111111111 && VGA_G_In == 10'b1111111111 && VGA_B_In == 10'b1111111111)
				begin
					value_inT = 2'b11;
				end
				if(value_out == 2'b11)
				begin
					Red = 8'hff;
					Green = 8'hff;
					Blue = 8'hff;
					value_inT =	value_out;
				end
			/*if (memory_on) 
			begin
            // White box
            Red = white;
            Green = white;
            Blue = white;
         end
         else 
         begin
            // Background
            Red = VGA_R_In[9:2]; 
            Green = VGA_G_In[9:2];
            Blue = VGA_B_In[9:2];
         end*/
		end
    end 
    
endmodule

