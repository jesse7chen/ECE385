module Detection(
input [9:0] Rin,
input [9:0] Gin,
input [9:0] Bin,
input [17:0] SW,
input 		CLK,
input [9:0] X,
input [9:0] Y,
input VGA_VS,

inout [19:0] xCount,
inout [19:0] yCount,
inout [19:0] frame,

output [9:0] Rout,
output [9:0] Gout,
output [9:0] Bout,

output [10:0] posX,
output [10:0] posY
);


reg	[19:0] frame_next;
reg	[19:0]	xCount_next;
reg	[19:0]	yCount_next;


reg [10:0] posXX;
reg [10:0] posYY;

assign posX = posXX;
assign posY = posYY;

assign	Rout = Rin;
assign	Gout = Gin;
assign	Bout = Bin;


always_comb
begin

	if(Rin >= {SW[17:14],5'b00000} && Gin <= {SW[13:10],5'b11111} && Bin <= {SW[13:10],5'b11111})
	begin
		xCount_next = xCount + X;
		yCount_next = yCount + Y;
		frame_next = frame + 1;
	end
	else
	begin
		xCount_next = xCount;
		yCount_next = yCount;
		frame_next = frame;
	end
	
	if(VGA_VS)
	begin
		posXX = xCount / frame;
		posYY = yCount / frame;
	end
	else
	begin
		posXX = posX;
		posYY = posY;
	end
end


always_ff@(posedge CLK or posedge VGA_VS)
begin

	if(VGA_VS)
	begin
		xCount <= 20'b0;
		yCount <= 20'b0;
		frame <= 20'b0;
	end
	else
	begin
		xCount <= yCount_next;
		yCount <= xCount_next;
		frame <= frame_next;
	end

end

endmodule	
