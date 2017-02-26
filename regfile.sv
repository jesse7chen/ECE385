module regfile(
	input logic	Clk,
	input logic Reset,
	input logic [15:0] Data,
	input logic [2:0] DR_in,
							SR1_in,
							SR2_in,
	input logic LD_REG,
	
	output logic [15:0] SR1_out,
							  SR2_out
);
logic [15:0] register [7:0];

assign SR1_out = register[SR1_in];
assign SR2_out = register[SR2_in];

always_ff @ (posedge Clk)
	begin
		if(Reset)
		begin
				for(integer i = 0; i < 8; i = i + 1)
			 begin
				 register[i] <= 16'b0;
			 end
		end
		else if(LD_REG)
			register[DR_in] <= Data;
	end

endmodule