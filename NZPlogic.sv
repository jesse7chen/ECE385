module NZPlogic (
	input logic [15:0] Data,
	output logic [2:0] NZP_wire
);


always_comb
begin
	NZP_wire = 3'b000;
	if(Data == 16'b0000000000000000)
		NZP_wire[1] = 1;
	else if (Data[15] == 1)
		NZP_wire[2] = 1;
	else if (Data [15] == 0)
		NZP_wire[0] = 1;
end

endmodule
