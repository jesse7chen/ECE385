module BENlogic(
	input logic [2:0] NZP, IR,
	output logic BEN
);

always_comb
begin
	BEN = 1'b0;
	if(NZP&IR)
		BEN = 1'b1;
	else if(IR[0]&NZP[0] == 1'b1)
		BEN = 1'b1;
	else if(IR[1]&NZP[1] == 1'b1)
		BEN = 1'b1;
	else if(IR[2]&NZP[2] == 1'b1)
		BEN = 1'b1;
	else if(IR == 3'b111)
		BEN = 1'b1;
end

endmodule
