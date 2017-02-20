module tristate_buffer(
input logic GateMARMUX,
				GatePC,
				GateMDR,
				GateALU,
				
input logic[15:0] MARMUX_Out,
				ALU_Out,
				PC_Out,
				MDR_Out,
				
output logic[15:0] tristate_out
);

always_comb
begin
if(GateMARMUX)
	tristate_out = MARMUX_Out;
else if(GatePC)
	tristate_out = PC_Out;
else if(GateMDR)
	tristate_out = MDR_Out;
else if(GateALU)
	tristate_out = ALU_Out;
else
	tristate_out = 16'bXXXXXXXXXXXXXXXX;

end

endmodule