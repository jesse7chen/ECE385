module testbench();

timeunit 1ms;

timeprecision 0.1ms;

logic [15:0] S;
logic	Clk = 0;
logic Reset, Run, Continue;
logic [11:0] LED;
logic [6:0] HEX0, HEX1, HEX2, HEX3;
logic CE, UB, LB, OE, WE;
logic [19:0] ADDR;
wire [15:0] Data; //tristate buffers need to be of type wire

slc3 slc3_0(.*);

/*always@(posedge clk)
begin
   $display("%b", slc3_0.d0.MARreg);
	$display("%b", slc3_0.d0.MDRreg);
	$display("%b", slc3_0.d0.IRreg);
	$display("%b", slc3_0.d0.PC);
end
endmodule*/

//Clock generator
always
begin
#2 Clk = 1;
   $display("%b", slc3_0.d0.MARreg);
	$display("%b", slc3_0.d0.MDRreg);
	$display("%b", slc3_0.d0.IRreg);
	$display("%b", slc3_0.d0.PC);
#2 Clk = 0;
   $display("%b", slc3_0.d0.MARreg);
	$display("%b", slc3_0.d0.MDRreg);
	$display("%b", slc3_0.d0.IRreg);
	$display("%b", slc3_0.d0.PC);
end



initial begin: TEST_VECTORS
S = 16'b0000000000000000;
Reset = 0;
Run = 0;
Continue = 0;

#4
Run = 1;

#4
Run = 0;

#4
Continue = 1;

#4 
Continue = 0;

#4
Continue = 1;

#4 
Continue = 0;

#4
Continue = 1;

#4 
Continue = 0;

#4
Continue = 1;

#4 
Continue = 0;

#4
Continue = 1;

#4 
Continue = 0;

#4
Continue = 1;

#4 
Continue = 0;

#4
Continue = 1;

#4 
Continue = 0;

#4
Continue = 1;

#4 
Continue = 0;

end

endmodule