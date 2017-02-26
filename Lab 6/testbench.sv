module testbench();

timeunit 1ns;

timeprecision 0.1ns;

logic [15:0] S;
logic	Clk = 0;
logic Reset, Run; 
logic Continue = 0;
logic [11:0] LED;
logic [6:0] HEX0, HEX1, HEX2, HEX3;
logic CE, UB, LB, OE, WE;
logic [19:0] ADDR;
wire [15:0] Data; //tristate buffers need to be of type wire

//logic [15:0] MAR_out, MDR_out, IR_out, PC_output;


temp_top temp(.*);


always begin: CLOCK_GENERATION
#1 Clk = ~Clk;
end

always begin: Continue_Generation
#4 Continue = ~Continue;
end

initial begin: CLOCK_INITIALIZATION
Clk = 0;
end


initial begin: TEST_VECTORS
S = 16'b0000000000000011;
Reset = 0;
Run = 1;

#4
Reset = 1;

#4
Run = 0;

#4
Run = 1;


#4
S = 16'b0000000000001111;


end

endmodule