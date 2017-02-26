module FlipFlop (input logic Clk, Load, Reset, D, 
					  output logic Q);

always_ff @ (posedge Clk)
	begin

	Q <= Q;

	if(Reset)
		Q <= 1'b0;
		
	else if(Load)
		Q <= D;
		
end
endmodule