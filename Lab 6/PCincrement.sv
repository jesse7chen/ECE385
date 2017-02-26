module PCincrement(
	input logic [15:0] PCinput,
	output logic [15:0] PCoutput
);

assign PCoutput = PCinput + 1'b1;


endmodule