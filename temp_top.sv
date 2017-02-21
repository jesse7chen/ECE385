module temp_top (
	input logic [15:0] S,
	input logic	Clk, Reset, Run, Continue,
	output logic [11:0] LED,
	output logic [6:0] HEX0, HEX1, HEX2, HEX3,
	output logic CE, UB, LB, OE, WE,
	output logic [19:0] ADDR,
	inout wire [15:0] Data //tristate buffers need to be of type wire
);

// Declaration of push button active high signals	

test_memory test_memory0(
	.Clk(Clk), .Reset(~Reset),
	.I_O(Data), .A(ADDR),
	.*
);
						 
slc3 CPU(.S(S), .Clk(Clk), .Reset(Reset), .Run(Run), .Continue(Continue), .LED(LED), 
			.HEX0(HEX0), .HEX1(HEX1), .HEX2(HEX2), .HEX3(HEX3), .CE(CE), .UB(UB), .LB(LB),
			.OE(OE), .WE(WE), .ADDR(ADDR), .Data(Data));
			
endmodule