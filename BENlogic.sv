module BENlogic(
	input [2:0] NZP, IR,
	output BEN
);

always_comb
begin
	BEN = 1'b0;
	if(NZP&IR)
		BEN = 1'b1;
end

endmodule
