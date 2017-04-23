module Detection(
input [9:0] Rin,
input [9:0] Gin,
input [9:0] Bin,
input [17:0] SW,
input 		CLK,
input [9:0] X,
input [9:0] Y,
input VGA_VS,

output [9:0] Rout,
output [9:0] Gout,
output [9:0] Bout,

output reg [9:0] posX,
output reg [9:0] posY
);

logic [15:0] xCount;
logic [15:0] yCount;
logic [15:0] frame;



//3	:	LUT_DATA	<=	{8'h09,iExposure[15:8]};//	Exposure


always_ff@(posedge CLK)
begin
	if(VGA_VS)
	begin
		posX <= xCount / frame;
		posY <= yCount / frame;
		xCount <= 0;
		yCount <= 0;
		frame <= 0;
	end

if(SW[0])
if(Rin >= {SW[17:14],5'b00000} && Gin <= {SW[13:10],5'b11111} && Bin <= {SW[13:10],5'b11111})
		begin
		
		xCount <= X + xCount;
		yCount <= Y + yCount;
		frame <= frame+1;


	//Rout = 10'b1111111111;
	//Gout = 10'b1111111111;
	//Bout = 10'b1111111111;
		end
		else
		begin 
	Rout = Rin;
	Gout = Gin;
	Bout = Bin;
	end 
	
	
	
else if(SW[1])	
	if(Rin <= {SW[13:10],5'b11111} && Gin >= {SW[17:14],5'b11111} && Bin <= {SW[13:10],5'b11111})

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
	
else if(SW[2])	
	if(Rin <= {SW[13:10],5'b11111} && Gin <= {SW[13:10],5'b11111} && Bin >= {SW[17:14],5'b10111} )

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
	
else 
begin
	Rout = Rin;
	Gout = Gin;
	Bout = Bin;
end
end
endmodule	