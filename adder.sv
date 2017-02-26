module adder(input logic [15:0] inA, inB,
				 output logic [15:0] out
);


always_comb
begin
out = inA + inB;
end

endmodule