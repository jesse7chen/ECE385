module mux3( 

	input logic [1:0] select,
	input logic[15:0] inA, inB, inC,
	
	output logic[15:0] out
);

always_comb
begin
	if(select == 2'b00)
		out = inA;
	else if(select == 2'b01)
		out = inB;
	else //if(select == 2'b10)
		out = inC;
end
endmodule
