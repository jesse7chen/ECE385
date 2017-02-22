module SEXT #(parameter WIDTH = 10)
(
	input logic [WIDTH:0] in,
	output logic [15:0] out
);

assign out = 15'(signed'(in));

endmodule