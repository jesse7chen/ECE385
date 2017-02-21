module regfile(
	input logic	Clk,
	input logic [15:0] Data,
	input logic [2:0] DR_in,
							SR1_in,
							SR2_in,
	input logic LD_REG,
	
	output logic [15:0] SR1_out,
							  SR2_out
);
logic [15:0] register [8:0];

assign SR1_out = register[SR1_in];
assign SR2_out = register[SR2_in];

always_ff @ (posedge Clk)
	begin
		if(LD_REG)
			register[DR_in] <= Data;
	end

endmodule