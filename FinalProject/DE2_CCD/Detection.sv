module Detection(
input [9:0] Rin,
input [9:0] Gin,
input [9:0] Bin,
input [17:0] SW,
input 		CLK,
input [10:0] X,
input [10:0] Y,
input VGA_VS,
input Reset,
input logic [3:0] data1,
input run,

output [9:0] red_threshold,
output [9:0] blue_threshold,
output [9:0] green_threshold,
output [9:0] Rout,
output [9:0] Gout,
output [9:0] Bout,
output logic [3:0] enable
);

assign red_threshold = red;
assign blue_threshold = blue;
assign green_threshold = green;

logic [9:0] red;
logic [9:0] blue;
logic [9:0] green;

logic [9:0] red_low;
logic [9:0] green_low;
logic [9:0] blue_low;

logic [9:0] red_h;
logic [9:0] green_h;
logic [9:0] blue_h;

logic match;

logic [9:0] threshold;

logic [20:0] x_count;
logic [20:0] y_count;
logic [20:0] pixel_count;


assign threshold = 10'd75;

logic RED_match, GREEN_match, BLUE_match, y_RED_match, y_GREEN_match, y_BLUE_match;
logic g_RED_match, g_GREEN_match, g_BLUE_match, RED_GT_GREEN_match, RED_GT_BLUE_match;
logic GREEN_GT_RED_match, GREEN_GT_BLUE_match, R_detect, Y_detect, G_detect;

assign match = ((Rin <= red_h && Rin >= red_low) && (Gin >= green_low) && (Bin <= blue_h && Bin >= blue_low))? 1'b1:1'b0; 


always_ff@(posedge CLK)
begin
	if(run == 1'b0)
	begin
		if(X == 11'd640 && Y == 11'd512)
		begin
			red <= Rin;
			blue <= Bin;
			green <= Gin;
		end
	end
end
	
always_comb
begin
				//&& X > 0 && Y > 0 && X < 640 && Y < 480)
		if(match)
		begin
			if(SW[2])
			begin
				Rout = 10'b1111111111;
				Gout = 10'b1111111111;
				Bout = 10'b1111111111;
			end
			else
			begin
				Rout = Rin;
				Gout = Gin;
				Bout = Bin;
			end
		end
		else
		begin
				Rout = Rin;
				Gout = Gin;
				Bout = Bin;
		end
end

always_comb
begin
	if(red <= threshold)
		red_low = 0;
	else
		red_low = red - threshold;
		
	if(red >= (10'd1023 - threshold))
		red_h  = 10'd1023;
	else
		red_h = red + threshold;
end
	
always_comb
begin
	if(green <= threshold)
		green_low = 0;
	else
		green_low = green - threshold;
		
	if(green >= 10'd1023 - threshold)
		green_h  = 10'd1023;
	else
		green_h = green + threshold;
end

always_comb
begin
	if(blue <= threshold)
		blue_low = 0;
	else
		blue_low = blue - threshold;
		
	if(green >= 10'd1023 - threshold)
		blue_h  = 10'd1023;
	else
		blue_h = blue + threshold;
end


//Red Color intensity checks
assign	RED_match=(Rin > 10'h100)? 1'b1:1'b0;  //Red > 128
assign	GREEN_match=(Gin > 10'h080)? 1'b1:1'b0;	//Green > 128
assign	BLUE_match=(Bin > 10'h080)? 1'b1:1'b0;		//Blue > 128

//Yellow Color intensity check
assign	y_RED_match=(Rin > 10'h100)? 1'b1:1'b0;  //Red > 128 100
assign	y_GREEN_match=(Gin > 10'h100)? 1'b1:1'b0;	//Green > 128  140
assign	y_BLUE_match=(Bin < 10'h080)? 1'b1:1'b0;		//Blue > 128  100

//Green color intensity check
assign	g_RED_match=(Rin < 10'd100)? 1'b1:1'b0;  //Red > 128 100
assign	g_GREEN_match=(Gin > 10'd140)? 1'b1:1'b0;	//Green > 128  140
assign	g_BLUE_match=(Bin < 10'h100)? 1'b1:1'b0;		//Blue > 128  100

//For RED Greater Then Green detection
assign	RED_GT_GREEN_match=(Rin > (Gin + Gin[9:1]))?1'b1:1'b0; //Red > 1.5(Green)
//For RED Greater Then Blue detection
assign	RED_GT_BLUE_match=(Rin > {Bin[8:0],1'b0})?1'b1:1'b0;  //Red > 2(Blue)

//For Green Greater Then Red detection
assign	GREEN_GT_RED_match=(Gin > {Rin[8:0],1'b0})?1'b1:1'b0; 
//For Green Greater Then Blue detection
assign	GREEN_GT_BLUE_match=(Gin> {Bin[8:0],1'b0})?1'b1:1'b0;  


// set match if R>128 and R> 2(G) and R > 2(B) and G < 128 and B < 128
assign	R_detect = RED_match & RED_GT_GREEN_match & RED_GT_BLUE_match & ~GREEN_match &  ~BLUE_match;
assign	Y_detect = y_RED_match & y_GREEN_match & y_BLUE_match;
assign	G_detect = g_RED_match & g_GREEN_match & g_BLUE_match;


endmodule	
