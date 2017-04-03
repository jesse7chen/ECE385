module decoder4#(parameter WIDTH = 32)
( 
	input logic clk,
	input logic reset_n,
	input logic [1:0] select,
	input logic[WIDTH:0] in,
	
	output logic[WIDTH:0] outA, outB, outC, outD
);

always_ff @ (posedge clk) 
begin
if(reset_n == 1'b0)
	begin
		outA <= 0;
		outB <= 0;
		outC <= 0;
		outD <= 0;
	end
else
	begin
	if(select == 2'b00)
		outA <= in;
	else if(select == 2'b01)
		outB <= in;
	else if(select == 2'b10)
		outC <= in;
	else if(select == 2'b11)
		outD <= in;
end
end
endmodule
