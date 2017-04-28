module Detection(
input [9:0] Rin,
input [9:0] Gin,
input [9:0] Bin,
input [17:0] SW,
input 		CLK,
input [9:0] X,
input [9:0] Y,
input VGA_VS,
input Reset,
input logic [3:0] data1,
input run,

output [9:0] Rout,
output [9:0] Gout,
output [9:0] Bout,
output logic [3:0] enable
);


logic [9:0] red;
logic [9:0] blue;
logic [9:0] green;

logic [9:0] red_low;
logic [9:0] green_low;
logic [9:0] blue_low;

logic [9:0] red_h;
logic [9:0] green_h;
logic [9:0] blue_h;

logic [9:0] threshold;

assign threshold = 10'd50;

always_ff@(posedge CLK)
begin

	if(run == 1'b0)
	begin
		if(X == 10'd464 && Y == 10'd274)
		begin
			red <= Rin;
			blue <= Bin;
			green <= Gin;
		end
	end
	
	else if (run == 1'b1)
	begin
				//&& X > 0 && Y > 0 && X < 640 && Y < 480)
		if((Rin <= red_h && Rin >= red_low) && (Gin <= green_h && Gin >= green_low) && (Bin <= blue_h && Bin >= blue_low))
		begin
			enable <= 4'b0001;
			if(SW[2])
			begin
				Rout <= 10'b1111111111;
				Gout <= 10'b1111111111;
				Bout <= 10'b1111111111;
			end
			else
			begin
				Rout <= Rin;
				Gout <= Gin;
				Bout <= Bin;
			end
		end
		else
		begin
			if(data1[0] == 1'b1)
			begin
				enable <= data1;
				Rout <= Rin;
				Gout <= Gin;
				Bout <= Bin;
			end
			else
			begin 
				enable <= 4'b0000;
				Rout <= Rin;
				Gout <= Gin;
				Bout <= Bin;
			end
		end
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


endmodule	
