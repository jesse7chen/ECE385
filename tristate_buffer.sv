module tristate_buffer(
input logic GateMARMUX,
				GatePC,
				GateMDR,
				GateALU,
				
input logic[15:0] MARMUX_Out,
				ALU_Out,
				PC_Out,
				MDR_Out,
				
inout wire[15:0] Data
);


always_comb
begin
if(GateMARMUX)
	Data = MARMUX_Out;
else if(GatePC)
	Data = PC_Out;
else if(GateMDR)
	Data = MDR_Out;
else if(GateALU)
	Data = ALU_Out;
else
	Data = 16'bZZZZZZZZZZZZZZZZ;
end

endmodule