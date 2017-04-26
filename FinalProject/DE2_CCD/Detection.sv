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

output [9:0] Rout,
output [9:0] Gout,
output [9:0] Bout,
output logic [3:0] enable
);

always_ff@(posedge CLK)
begin
	if(Rin >= {SW[17:14],5'b00000} && Gin <= {SW[13:10],5'b11111} && Bin <= {SW[13:10],5'b11111} ) //&& X > 0 && Y > 0 && X < 640 && Y < 480)
	begin
		enable = 4'b0001;
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
		if(data1[0] == 1'b1)
		begin
			enable = data1;
			Rout = Rin;
			Gout = Gin;
			Bout = Bin;
		end
		else
		begin 
			enable = 4'b0000;
			Rout = Rin;
			Gout = Gin;
			Bout = Bin;
		end
	end
end



endmodule	
