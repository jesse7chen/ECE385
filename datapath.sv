module datapath(
				input logic			Clk, Reset_ah,
				inout logic [15:0] Data,
				input logic 		LD_MAR,
									LD_MDR,
									LD_IR,
									LD_BEN,
									LD_CC,
									LD_REG,
									LD_PC,
									LD_LED, // for PAUSE instruction
									
				input logic 		GatePC,
									GateMDR,
									GateALU,
									GateMARMUX,
									
				input logic [1:0] 	PCMUX,
				input logic        DRMUX,
									SR1MUX,
									SR2MUX,
									ADDR1MUX,
									MIO_EN,
				input logic [1:0] 	ADDR2MUX,
									ALUK,
				input logic [15:0] MDR_In,					
				output logic [15:0] MAR, MDR, IR

);

// Declare all registers
logic [15:0] IRreg, PC, MARreg, MDRreg;

// Branch logic components
logic [2:0] NZP;
logic BEN;

// Declares 2-1 MUX and associated wires
mux2 _ADDR1MUX (.select(ADDR1MUX), .inA(), .inB(), .out(ADDR1MUXtoAdder));
	logic[15:0] ADDR1MUXtoAdder;
mux2#(2) _SR1MUX (.select(SR1MUX), .inA(SR1_out), .inB(PC), .out(SR1MUXtoReg));
	logic [2:0] SR1MUXtoReg;
mux2 _SR2MUX (.select(SR2MUX), .inA(), .inB(), .out(SR2MUXtoALU));
	logic [15:0] SR2MUXtoALU;
mux2#(2) _DRMUX (.select(DRMUX), .inA(), .inB(), .out(DRMUXtoReg));
	logic [2:0] DRMUXtoReg;
mux2 _MDRMUX (.select(MIO_EN), .inA(Data), .inB(MDR_In), .out(MDRMUXtoMDR));
	logic [15:0] MDRMUXtoMDR;

// Declares PCMUX
// 00 -> PC+1 01-> Data 10 -> Adder output
mux3 _PCMUX(.select(PCMUX), .inA(increment), .inB(Adder_output), .inC(Data), .out(PCMUX_output));
logic [15:0] PCMUX_output; // Wire from PCMUX to PC register

// Declare 4-1 MUX
mux4 _ADDR2MUX(.select(ADDR2MUX), .inA(), .inB(), .inC(), .inD(16'b0000000000000000), .out(ADDR2MUXtoAdder));
logic [15:0] ADDR2MUXtoAdder;

// 5-1 MUX controlling flow to data bus
tristate_buffer DATA_MUX(.GateALU(GateALU), .GateMARMUX(GateMARMUX), .GateMDR(GateMDR), .GatePC(GatePC),
								 .MARMUX_Out(), .ALU_Out(ALU_OUT), .PC_Out(PC), .MDR_Out(MDR),
								 .tristate_out(Data));
// PC increment module
logic [15:0] increment; // Wire from PCIncrement to PCMUX
PCincrement _PCincrement(.PCinput(PC), .PCoutput(increment));

// ALU Module
ALU _ALU(.ALUK(ALUK), .inA(SR1_out), .inB(SR2MUXtoALU), .ALU_Out(ALU_Out));
logic [15:0] ALU_Out; // Wire from ALU output to Data MUX

// regfile
regfile register(.Clk(Clk), .Data(Data), .DR_in(DRMUXtoReg), .SR1_in(SR1MUXtoReg), .SR2_in(IR[2:0]), .LD_REG(LD_REG),
					  .SR1_out(SR1_out), .SR2_out(SR2_out));
logic [15:0] SR1_out;
logic [15:0] SR2_out;

// 16 bit adder
logic [15:0] Adder_output;
assign Adder_output = ADDR2MUXtoAdder + ADDR1MUXtoAdder;

	always_ff @ (posedge Clk)
	begin
		if (Reset_ah)
			begin
			IRreg <= 16'b0000000000000000;
			MARreg <= 16'b0000000000000000;
			PC <= 16'b0000000000000000;
			MDRreg <= 16'b0000000000000000;
			end
		if (LD_IR)
			IRreg <= Data;
		if (LD_MAR)
			MARreg <= Data;
		if (LD_PC)
			PC <= PCMUX_output;
		if (LD_CC)
			begin
			
			
			end
	end

	assign IR = IRreg;
	assign MAR = MARreg;
	
	
	
endmodule