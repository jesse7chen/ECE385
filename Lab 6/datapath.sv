module datapath(
				input logic			Clk, Reset_ah,
				//inout wire [15:0] Data,
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
				output logic [15:0] MAR, MDR, IR,//, PC_out
				output logic BEN_out,
				output logic [11:0] LED
);

// Declare all registers
logic [15:0] IRreg, PC, MARreg, MDRreg;
logic [15:0] Data;

// Branch logic components
logic [2:0] NZP;
wire [2:0] NZP_wire;

logic BEN;
wire BEN_wire;

logic [15:0] increment; // Wire from PCIncrement to PCMUX
logic [15:0] ALU_Out; // Wire from ALU output to Data MUX
logic [15:0] SR1_out;
logic [15:0] SR2_out;
logic [15:0] Adder_output;

logic [15:0] ADDR1MUXtoAdder;
logic [2:0] SR1MUXtoReg;
logic [15:0] SR2MUXtoALU;
logic [2:0] DRMUXtoReg;
logic [15:0] MDRMUXtoMDR;

logic [15:0] PCMUX_output; // Wire from PCMUX to PC register
logic [15:0] ADDR2MUXtoAdder;

logic [15:0] IRtoSR2MUX;
SEXT#(4) SEXT_SR2MUX(.in(IR[4:0]), .out(IRtoSR2MUX));
	
// Declares 2-1 MUX
mux2 _ADDR1MUX (.select(ADDR1MUX), .inA(SR1_out), .inB(PC), .out(ADDR1MUXtoAdder));
mux2#(2) _SR1MUX (.select(SR1MUX), .inA(IR[11:9]), .inB(IR[8:6]), .out(SR1MUXtoReg));
mux2 _SR2MUX (.select(SR2MUX), .inA(SR2_out), .inB(IRtoSR2MUX), .out(SR2MUXtoALU));
mux2#(2) _DRMUX (.select(DRMUX), .inA(3'b111), .inB(IR[11:9]), .out(DRMUXtoReg));
mux2 _MDRMUX (.select(MIO_EN), .inA(Data), .inB(MDR_In), .out(MDRMUXtoMDR));

// Declares PCMUX
// 00 -> PC+1 01-> Data 10 -> Adder output
mux3 _PCMUX(.select(PCMUX), .inA(increment), .inB(Adder_output), .inC(Data), .out(PCMUX_output));

// Declare 4-1 MUX
logic [15:0] ADDR2MUX_A;
logic [15:0] ADDR2MUX_B;
logic [15:0] ADDR2MUX_C;
mux4 _ADDR2MUX(.select(ADDR2MUX), .inA(ADDR2MUX_A), .inB(ADDR2MUX_B), .inC(ADDR2MUX_C), 
					.inD(16'b0000000000000000), .out(ADDR2MUXtoAdder));
SEXT#(10) SEXT0(.in(IR[10:0]), .out(ADDR2MUX_A));
SEXT#(8) SEXT1(.in(IR[8:0]), .out(ADDR2MUX_B));
SEXT#(5) SEXT2(.in(IR[5:0]), .out(ADDR2MUX_C));

// 5-1 MUX controlling flow to data bus
tristate_buffer DATA_MUX(.GateALU(GateALU), .GateMARMUX(GateMARMUX), .GateMDR(GateMDR), .GatePC(GatePC),
								 .MARMUX_Out(Adder_output), .ALU_Out(ALU_Out), .PC_Out(PC), .MDR_Out(MDRreg),
								 .Data(Data));
// PC increment module
PCincrement _PCincrement(.PCinput(PC), .PCoutput(increment));

// ALU Module
ALU _ALU(.ALUK(ALUK), .inA(SR1_out), .inB(SR2MUXtoALU), .ALU_Out(ALU_Out));

// regfile
regfile register(.Clk(Clk), .Data(Data), .DR_in(DRMUXtoReg), .SR1_in(SR1MUXtoReg), .SR2_in(IR[2:0]), .LD_REG(LD_REG),
					  .SR1_out(SR1_out), .SR2_out(SR2_out), .Reset(Reset_ah));

// 16 bit adder
adder _adder(.inA(ADDR2MUXtoAdder), .inB(ADDR1MUXtoAdder), .out(Adder_output));

// NZP logic
NZPlogic NZP_logic(.Data(Data), .NZP_wire(NZP_wire));

// BEN logic
BENlogic BEN_logic(.NZP(NZP), .IR(IR[11:9]), .BEN(BEN_wire));

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
		if (LD_MDR)
			MDRreg <= MDRMUXtoMDR;
		if (LD_CC)
			NZP <= NZP_wire;
		if (LD_BEN)
			BEN <= BEN_wire;
		if (LD_LED)
			LED <= IR[11:0];
		// LD_REG is in register file
	end
		
	assign IR = IRreg;
	assign MAR = MARreg;
	assign MDR = MDRreg;
	assign BEN_out = BEN;
	//assign PC_out = PC;
	
endmodule