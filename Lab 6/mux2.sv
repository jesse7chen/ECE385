module mux2#(parameter WIDTH = 15)
( 
	input logic select,
	input logic[WIDTH:0] inA, inB,
	
	output logic[WIDTH:0] out
);

always_comb
begin
if(select)
	out = inB;
	
else
	out = inA;
end
endmodule
