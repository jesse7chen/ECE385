module mux6#(parameter WIDTH = 32)
( 
	input logic [2:0] select,
	input logic[WIDTH:0] inA, inB, inC, inD, inE, inF,
	
	output logic[WIDTH:0] out
);

always_comb
begin
if(select == 3'b000)
	out = inA;
else if(select == 3'b001)
	out = inB;
else if(select == 3'b010)
	out = inC;
else if(select == 3'b011)
	out = inD;
else if(select == 3'b100)
	out = inE;
else
	out = inF;
end
endmodule
