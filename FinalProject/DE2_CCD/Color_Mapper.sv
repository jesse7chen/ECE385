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
                                          VGA_X, VGA_Y, posX, posY,      // Coordinates of current drawing pixel
                       output logic [7:0] VGA_R, VGA_G, VGA_B // VGA RGB output
                     );
     
    
    logic point_on;
    logic [7:0] Red, Green, Blue;
	 
     
 /* The ball's (pixelated) circle is generated using the standard circle formula.  Note that while 
    the single line is quite powerful descriptively, it causes the synthesis tool to use up three
    of the 12 available multipliers on the chip! Since the multiplicants are required to be signed,
    we have to first cast them from logic to int (signed by default) before they are multiplied. */
      
    int DistX, DistY, DistXX, DistYY;
    assign DistX = posX - 10'd10;
	 assign DistXX = posX + 10'd10;
    assign DistY = posY - 10'd10;
	 assign DistYY = posY + 10'd10;
   
    assign VGA_R = Red;
    assign VGA_G = Green;
    assign VGA_B = Blue;
    
    // Compute whether the pixel corresponds to ball or background
    always_comb
    begin : On_point
        if (VGA_X >= DistX && VGA_X <= DistXX)
				if(VGA_Y >= DistY && VGA_Y <= DistYY)
					point_on = 1'b1;
				else
				point_on = 1'b0;
        else 
            point_on = 1'b0;
    end
    
    // Assign color based on ball_on signal
    always_comb
    begin : RGB_Display
        if ((point_on == 1'b1)) 
        begin
            // White box
            Red = 8'hff;
            Green = 8'hff;
            Blue = 8'hff;
        end
        else 
        begin
            // Background
            Red = VGA_R_In[9:2]; 
            Green = VGA_G_In[9:2];
            Blue = VGA_B_In[9:2];
        end
    end 
    
endmodule

