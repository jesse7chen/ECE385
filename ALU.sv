module ALU(	
input logic[1:0] ALUK,
input logic[15:0] inA, inB,

output logic[15:0] ALU_Out
);

always_comb
begin
	unique case(ALUK)
		2'b00 	:	ALU_Out = inA + inB;
		2'b01 	:	ALU_Out = inA & inB;
		2'b10 	:	ALU_Out = ~inA ;
		2'b11 	:	ALU_Out = inA;
		default	:	ALU_Out = inA;
	endcase
end
	
endmodule