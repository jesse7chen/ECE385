//------------------------------------------------------------------------------
// Company: 		 UIUC ECE Dept.
// Engineer:		 Stephen Kempf
//
// Create Date:    17:44:03 10/08/06
// Design Name:    ECE 385 Lab 6 Given Code - Incomplete ISDU
// Module Name:    ISDU - Behavioral
//
// Comments:
//    Revised 03-22-2007
//    Spring 2007 Distribution
//    Revised 07-26-2013
//    Spring 2015 Distribution
//    Revised 02-13-2017
//    Spring 2017 Distribution
//------------------------------------------------------------------------------


module ISDU ( 	input logic			Clk, 
                        			Reset,
									Run,
									Continue,
									
				input logic[3:0] 	Opcode, 
				input logic     	IR_5,
				input logic     	IR_11,
				input logic 		BEN,
				  
				output logic 		LD_MAR,
									LD_MDR,
									LD_IR,
									LD_BEN,
									LD_CC,
									LD_REG,
									LD_PC,
									LD_LED, // for PAUSE instruction
									
				output logic 		GatePC,
									GateMDR,
									GateALU,
									GateMARMUX,
									
				output logic [1:0] 	PCMUX,
				output logic        DRMUX,
									SR1MUX,
									SR2MUX,
									ADDR1MUX,
				output logic [1:0] 	ADDR2MUX,
									ALUK,
				  
				output logic 		Mem_CE,
									Mem_UB,
									Mem_LB,
									Mem_OE,
									Mem_WE,
									MIO_EN
				);

    enum logic [4:0] {	Halted, 
    					PauseIR1, 
    					PauseIR2, 
    					S_18, 
    					S_33_1, 
    					S_33_2, 
    					S_35, 
    					S_32, 
    					S_01,
						S_05,
						S_09,
						S_06,
						S_25,
						S_25_2,
						S_27,
						S_07,
						S_23,
						S_16,
						S_16_2,
						S_00,
						S_22,
						S_12,
						S_04,
						S_21}   State, Next_state;   // Internal state logic
	    
    always_ff @ (posedge Clk)
    begin : Assign_Next_State
        if (Reset) 
            State <= Halted;
        else 
            State <= Next_state;
    end
   
	always_comb
    begin 
    	// Default next state is staying at current state
	    Next_state = State;
	 
        unique case (State)
            Halted : 
	            if (Run) 
					Next_state <= S_18;					  
            S_18 : 
                Next_state <= S_33_1;
            // Any states involving SRAM require more than one clock cycles.
            // The exact number will be discussed in lecture.
            S_33_1 : 
                Next_state <= S_33_2;
            S_33_2 : 
                Next_state <= S_35;
            S_35 : 
					 Next_state <= S_32;
				
				
                //Next_state <= PauseIR1;
            // PauseIR1 and PauseIR2 are only for Week 1 such that TAs can see 
            // the values in IR. They should be removed in Week 2
				
            PauseIR1 : 
                if (~Continue) 
                    Next_state <= PauseIR1;
                else 
                    Next_state <= PauseIR2;
            PauseIR2 : 
                if (Continue) 
                    Next_state <= PauseIR2;
                else 
                    Next_state <= S_18;
						  
						  
            S_32 : 
				/*unique */case (Opcode)	//shouldn't be unique since we don't use all opcodes
				
					4'b0001 : 
					    Next_state <= S_01; //ADD
						 
					4'b0101 : 
					    Next_state <= S_05;	//AND

					4'b1001 : 
					    Next_state <= S_09;	//NOT

					4'b0110 : 
					    Next_state <= S_06;	//LDR
						 
					4'b0111 : 
					    Next_state <= S_07;	//STR

					4'b0100 : 
					    Next_state <= S_04;	//JSR

					4'b1100 : 
					    Next_state <= S_12;	//JMP

					4'b0000 : 
					    Next_state <= S_00;	//BEN

					4'b1101 : 
					    Next_state <= PauseIR1;	//PSE

					default : 
					    Next_state <= S_18;
						 
				endcase
				
            
				S_01 : Next_state <= S_18;	
				
				S_05 : Next_state <= S_18;
				
				S_09 : Next_state <= S_18;
				
				S_06 : Next_state <= S_25;
				S_25 : Next_state <= S_25_2;
				S_25_2 : Next_state <= S_27;
				S_27 : Next_state <= S_18;
				
				S_07 : Next_state <= S_23;
				S_23 : Next_state <= S_16;
				S_16 : Next_state <= S_16_2;
				S_16_2 : Next_state <= S_18;
				
				S_04 : Next_state <= S_21;
				S_21 : Next_state <= S_18;
				
				S_12 : Next_state <= S_18;
				
				S_00 : if(BEN) Next_state <= S_22;
							else Next_state <= S_18;
							
				S_22 : Next_state <= S_18;				
				


			default : ;

	     endcase
    end
   
    always_comb
    begin 
        // default controls signal values; within a process, these can be
        // overridden further down (in the case statement, in this case)
	    LD_MAR = 1'b0;
	    LD_MDR = 1'b0;
	    LD_IR = 1'b0;
	    LD_BEN = 1'b0;
	    LD_CC = 1'b0;
	    LD_REG = 1'b0;
	    LD_PC = 1'b0;
	    LD_LED = 1'b0;
		 
	    GatePC = 1'b0;
	    GateMDR = 1'b0;
	    GateALU = 1'b0;
	    GateMARMUX = 1'b0;
		 
		ALUK = 2'b00;
		 
	    PCMUX = 2'b00;
	    DRMUX = 1'b0;
	    SR1MUX = 1'b0;
	    SR2MUX = 1'b0;
	    ADDR1MUX = 1'b0;
	    ADDR2MUX = 2'b00;
		 
	    Mem_OE = 1'b1;
	    Mem_WE = 1'b1;
		 
		 MIO_EN = 1'b0;
		 
		
		// Assign control signals based on current state
	    case (State)
			Halted: ;
			S_18 : 
				begin 
					GatePC = 1'b1;
					LD_MAR = 1'b1;
					PCMUX = 2'b00;
					LD_PC = 1'b1;
				end
			S_33_1 : 
				Mem_OE = 1'b0;
			S_33_2 : 
				begin 
					Mem_OE = 1'b0;
					LD_MDR = 1'b1;
				end
			S_35 : 
				begin 
					GateMDR = 1'b1;
					LD_IR = 1'b1;
				end
			PauseIR1: ;
			PauseIR2: ;
			S_32 : 
                LD_BEN = 1'b1;
					 
					 
					 
			S_01 : //ADD
				begin 
					SR2MUX			= IR_5;	//*******make sure when 1, it passes IR and when 0 passes SR2 - Fixed
					ALUK 				= 2'b00; // Make sure this is add function - Checked
					GateALU			= 1'b1;
					LD_REG 			= 1'b1;
					SR1MUX  			= 1'b1; // Make sure this is passing IR[8:6]	- Checked
					LD_CC 			= 1'b1;
					DRMUX				= 1'b1;	//*****make sure when 1 it passes IR [11:9] - Checked
				end
			
			
			S_05 : //AND
				begin 
					SR2MUX = IR_5;
					ALUK = 2'b01;
					GateALU = 1'b1;
					LD_REG = 1'b1;
					SR1MUX = 1'b1;
					LD_CC = 1'b1; 
					DRMUX	= 1'b1;
				end	
				
				
			S_09 : // NOT
				begin 
					ALUK = 2'b10;
					GateALU = 1'b1;
					LD_REG = 1'b1;
					SR1MUX = 1'b1;
					LD_CC = 1'b1; 
					DRMUX	= 1'b1;
				end
				
				
			S_06 : // LDR - Load address into MAR
				begin 
					LD_MAR = 1'b1;
					SR1MUX = 1'b1;
					ADDR2MUX = 2'b10;
					GateMARMUX = 1'b1;
					ADDR1MUX = 1'b0;
				end	


			S_25 : // LDR - Call output
				begin 
					Mem_OE = 1'b0;	//Active Low
				end
				
				
			S_25_2 : // LDR - Load output into MDR
				begin 
					Mem_OE = 1'b0;	// changed this to enable output for both states
					LD_MDR = 1'b1;
					MIO_EN = 1'b0;
					// Do we need MIO.EN? - Don't think so since it's active low anyway but just in case
				end	


			S_27 : // LDR - Load MDR into register
				begin 
					LD_REG = 1'b1;
					DRMUX	= 1'b1;
					GateMDR = 1'b1;
					LD_CC = 1'b1;
				end
				
				
			S_07 : // Store - Load address into MAR - This code copied from S_06
				begin 
					LD_MAR = 1'b1;
					SR1MUX = 1'b1; // Use BaseR as address
					ADDR2MUX = 2'b10;
					GateMARMUX = 1'b1;
					ADDR1MUX = 1'b0;	
				end	


			S_23 : // Store - Get data to be stored, put in MDR
				begin 
					GateALU = 1'b1;
					LD_MDR = 1'b1;
					MIO_EN = 1'b0; // Set MIO_EN here
					SR1MUX = 1'b0; // Use SR as address
					ALUK = 2'b11; // Just pass SR1 register value
				end
				
			S_16 :  // Store - 
				begin 
				Mem_WE = 1'b0;
				GateMDR = 1'b1;
				end			
		
		
			S_16_2 : // Store - 
				begin 
					Mem_WE = 1'b0;
					GateMDR = 1'b1;
				end
				
				
			S_00 : // Branch
				begin 
					LD_BEN = 1'b1; // Make sure that BEN is actually being output wire of datapath
				end	
		
			S_22 : // Branch to proper instruction
				begin 
					PCMUX = 2'b01;
					LD_PC = 1'b1;	
					ADDR1MUX = 1'b1;
					ADDR2MUX = 2'b01;	
				end
				
			S_12 : //Jump
				begin 
					SR1MUX = 1'b1;
					ADDR1MUX = 1'b0;
					ADDR2MUX = 2'b11;
					PCMUX = 2'b01;
					LD_PC	= 1'b1;
				end			
				
			S_04 : //JSR
				begin 
					GatePC = 1'b1;
					LD_REG = 1'b1;
					DRMUX = 1'b0;
				end
				
			S_21 : //JSR
				begin 
					ADDR1MUX = 1'b1;
					ADDR2MUX = 2'b00;
					PCMUX = 2'b01;
					LD_PC = 1'b1;
				end	

				
            default : ;
        endcase
    end 

 	// These should always be active
	assign Mem_CE = 1'b0;
	assign Mem_UB = 1'b0;
	assign Mem_LB = 1'b0;
	
endmodule