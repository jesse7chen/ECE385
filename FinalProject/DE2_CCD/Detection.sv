module Detection(
input [9:0] Rin,
input [9:0] Gin,
input [9:0] Bin,
input [17:0] SW,
input 		CLK,

output [9:0] Rout,
output [9:0] Gout,
output [9:0] Bout
);

//3	:	LUT_DATA	<=	{8'h09,iExposure[15:8]};//	Exposure


always_ff@(posedge CLK)
begin
if(SW[0])
if(Rin >= {SW[17:14],5'b11111} && Gin <= {SW[13:10],5'b11111} && Bin <= {SW[13:10],5'b11111})

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
	if(Rin <= {SW[13:10],5'b11111} && Gin <= {SW[13:10],5'b11111} && Bin >= {SW[17:14],5'b11111})

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