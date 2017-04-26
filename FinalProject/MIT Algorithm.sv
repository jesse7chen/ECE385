
module otherfind(reset, clk, enable, video, address, bot_r, top_l, x_cen, y_cen, found, floor, roof);

 input reset, clk, enable;
 input [23:0] video;
 input [16:0] address;
 input [18:0] bot_r;
 input [18:0] top_l;
 input [23:0] floor;
 input [23:0] roof;
 output found; //ended up not being used
 output [9:0] x_cen; //x is {x_ad, 0}
 output [8:0] y_cen;
 
 parameter BOX = 16;
 parameter PIX = 4; //grab four pixels and average note the bit shift
 //average depends on this value so it should be a
 //power of two
 
 reg found;
 reg [2:0] count; //depends on pix
 reg [10:0] xad_sum;
 reg [9:0] yad_sum;
 reg [9:0] x_cen;
 reg [8:0] y_cen;
 reg [8:0] xad_old;
 reg [7:0] yad_old;
 reg [8:0] xcen_old;
 reg [7:0] ycen_old;
 
 always @ (posedge clk or posedge reset)
 if(reset) 
 begin 
	 x_cen <= 0; 
	 y_cen <= 0; 
	 xad_sum <= 0; 
	 yad_sum <= 0; 
	 found <= 0;
	 count <= 0; 
	 xcen_old <= 0; 
	 ycen_old <= 0; 
	 xad_old<= 0; 
	 yad_old <= 0; 
 end
 
 else 
	begin
	if(enable) 
		begin
 ///if we have reached the desired number of pixels average the sums and pass it out as
 ///the center coordinate
			if(count == PIX) 
			 begin
				 x_cen <= {xad_sum[10:2],2’b0}; 
				 y_cen <= {yad_sum[9:1],2’b0}; 
				 xad_sum <= 0;
				 yad_sum <= 0;
				 found <= 1; 
				 count <= 0; 
				 xcen_old <= x_cen; 
				 ycen_old <= y_cen; 
				 xad_old <= 0; 
				 yad_old <= 0;
			 end
 
 ///if the cuurent pixel is in the appropriate color range and it is on the screen
 ///that we are projecting onto then update the running sums
 
			 else if((video[23:16] >= floor[23:16]) && (video[23:16] <= roof[23:16]) &&
			 (video[15:8] >= floor[15:8]) && (video[15:8] <= roof[15:8]) &&
			 (video[7:0] >= floor[7:0]) && (video[7:0] <= roof[7:0]) &&
			 ({address[16:8],1’b1} >= top_l[18:9]) && ({address[7:0],1’b1} >= top_l[8:0]) &&
			 ({address[16:8],1’b1} <= bot_r[18:9]) && ({address[7:0],1’b1} <= bot_r[8:0]))
			 begin 
				 x_cen <= x_cen; 
				 y_cen <= y_cen; 
				 xad_sum <= xad_sum+address[16:8]; 
				 yad_sum <= yad_sum+address[7:0];
				 found <= 0; 
				 count <= count+1; 
				 xcen_old <= xcen_old; 
				 ycen_old <= ycen_old;
				 xad_old <= address[16:8]; 
				 yad_old <= address[7:0]; 
			 end
			 else
			 begin 
				 x_cen <= x_cen; 
				 y_cen <= y_cen; 
				 xcen_old <= xcen_old; 
				 ycen_old <= ycen_old;
				 xad_sum <= xad_sum; 
				 yad_sum <= yad_sum; 
				 found <= 0; count<= count;
				 xad_old <= xad_old; 
				 yad_old <= yad_old; 
			 end
		end
	 else 
	 begin 
		 x_cen <= 0; 
		 y_cen <= 0; 
		 xcen_old <= 0; 
		 ycen_old <= 0;
		 xad_sum <= 0; 
		 yad_sum <= 0; 
		 found <= 0; 
		 count <= 0;
		 xad_old <= 0; 
		 yad_old <= 0; 
	 end
 end
endmodule