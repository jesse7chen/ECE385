module mux4( 

	input logic [1:0] select,
	input logic[15:0] inA, inB, inC, inD,
	
	output logic[15:0] out
);

always_comb
begin
if(select == 2'b00)
	out = inA;
else if(select == 2'b01)
	out = inB;
else if(select == 2'b10)
	out = inC;
else //(select == 2'b11)
	out = inD;
end
endmodule
