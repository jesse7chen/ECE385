/*---------------------------------------------------------------------------
  --      AES.sv                                                           --
  --      Joe Meng                                                         --
  --      Fall 2013                                                        --
  --                                                                       --
  --      Modified by Po-Han Huang 03/09/2017                              --
  --                                                                       --
  --      For use with ECE 385 Experiment 9                                --
  --      Spring 2017 Distribution                                         --
  --      UIUC ECE Department                                              --
  ---------------------------------------------------------------------------*/

// AES decryption core.

// AES module interface with all ports, commented for Week 1
 module  AES ( input                 clk, 
                                     reset_n,
                                     run,
               input        [127:0]  msg_en,
                                     key,
               output logic [127:0]  msg_de,
               output logic          ready,
					output logic [3:0] round_out,
					output logic [3:0] state_out,
					output logic [127:0] key_out);

// Partial interface for Week 1
// Splitting the signals into 32-bit ones for compatibility with ModelSim
//module  AES ( input                clk,
  //            input        [31:0]  key_0, key_1, key_2, key_3,
    //          output logic [31:0]  keyschedule_out_0, keyschedule_out_1, keyschedule_out_2, keyschedule_out_3 );      
      
logic [1407:0] keyschedule; 
logic [127:0] key_input;
assign key_input = key;

assign key_out = keyschedule[127:0];

logic [3:0] round;
logic [3:0] round_in; 
assign round_out = round;

logic [3:0] curr_state;
assign state_out = curr_state;


logic [127:0] msg_de_in;
logic [127:0] msg_de_in_wire;

logic [1:0] IMCmux_select;
logic [2:0] REGmux_select;

logic [127:0] curr_key;
//logic [127:0] curr_key_in;

logic [127:0] ADDKEYwire;
logic [31:0] IMC_wire_in;
logic [127:0] InvSubBytes_wire;
logic [127:0] InvShiftRows_wire;
logic [127:0] IMC_reg;
logic [127:0] IMC_reg_wire;
logic [31:0] IMC_wire_out;
logic stop;
assign ready = stop;

logic decrypt_begin;
assign decrypt_begin = run;

logic LD_IMC_REG;
logic LD_REG;
      
KeyExpansion keyexpansion_0(.clk(clk), 
                            //.Cipherkey({key_0, key_1, key_2, key_3}),
									 .Cipherkey(key_input),
                            .KeySchedule(keyschedule)
                            );
 
assign {keyschedule_out_0, keyschedule_out_1, keyschedule_out_2, keyschedule_out_3} = keyschedule[127:0];

mux4#(31) IMCmux(.inA(msg_de_in[31:0]), .inB(msg_de_in[63:32]), .inC(msg_de_in[95:64]), 
			.inD(msg_de_in[127:96]), .select(IMCmux_select), .out(IMC_wire_in));
mux6#(127) REGmux(.inA(ADDKEYwire), .inB(InvShiftRows_wire), .inC(InvSubBytes_wire), 
						.inD(IMC_reg_wire), .inE(msg_en), .inF(msg_de_in), .select(REGmux_select), 
						.out(msg_de_in_wire));
decoder4#(32) IMCdecoder(.clk(clk), .reset_n(reset_n), .in(IMC_wire_out), .outA(IMC_reg_wire[31:0]), 
								  .outB(IMC_reg_wire[63:32]), .outC(IMC_reg_wire[95:64]), 
								  .outD(IMC_reg_wire[127:96]), .select(IMCmux_select));

InvAddRoundKey invaddroundkey_0(.State(msg_de_in), .Key(curr_key), .Result(ADDKEYwire));
InvShiftRows invshiftrows_0(.inState(msg_de_in), .outState(InvShiftRows_wire));
InvMixColumns invmixcolumns_0(.in(IMC_wire_in), .out(IMC_wire_out));

/*InvSubBytes invsubbytes[15:0](clk,{msg_de_in[7:0], msg_de_in[15:8], msg_de_in[23:16],
					msg_de_in[31:24], msg_de_in[39:32], msg_de_in[47:40], msg_de_in[55:48], 
					msg_de_in[63:56], msg_de_in[71:64], msg_de_in[79:72], msg_de_in[87:80],
					msg_de_in[95:88], msg_de_in[103:96], msg_de_in[111:104], msg_de_in[119:112],
					msg_de_in[127:120]},
					{InvSubBytes_wire[7:0], InvSubBytes_wire[15:8], InvSubBytes_wire[23:16], 
					InvSubBytes_wire[31:24], InvSubBytes_wire[39:32], InvSubBytes_wire[47:40], 
					InvSubBytes_wire[55:48], InvSubBytes_wire[63:56], InvSubBytes_wire[71:64],
				   InvSubBytes_wire[79:72], InvSubBytes_wire[87:80], InvSubBytes_wire[95:88],
					InvSubBytes_wire[103:96], InvSubBytes_wire[111:104], InvSubBytes_wire[119:112],
					InvSubBytes_wire[127:120]});*/
					
InvSubBytes invsubbytes_0(.clk(clk), .in(msg_de_in[7:0]), .out(InvSubBytes_wire[7:0]));
InvSubBytes invsubbytes_1(.clk(clk), .in(msg_de_in[15:8]), .out(InvSubBytes_wire[15:8]));
InvSubBytes invsubbytes_2(.clk(clk), .in(msg_de_in[23:16]), .out(InvSubBytes_wire[23:16]));
InvSubBytes invsubbytes_3(.clk(clk), .in(msg_de_in[31:24]), .out(InvSubBytes_wire[31:24]));

InvSubBytes invsubbytes_4(.clk(clk), .in(msg_de_in[39:32]), .out(InvSubBytes_wire[39:32]));
InvSubBytes invsubbytes_5(.clk(clk), .in(msg_de_in[47:40]), .out(InvSubBytes_wire[47:40]));
InvSubBytes invsubbytes_6(.clk(clk), .in(msg_de_in[55:48]), .out(InvSubBytes_wire[55:48]));
InvSubBytes invsubbytes_7(.clk(clk), .in(msg_de_in[63:56]), .out(InvSubBytes_wire[63:56]));

InvSubBytes invsubbytes_8(.clk(clk), .in(msg_de_in[71:64]), .out(InvSubBytes_wire[71:64]));
InvSubBytes invsubbytes_9(.clk(clk), .in(msg_de_in[79:72]), .out(InvSubBytes_wire[79:72]));
InvSubBytes invsubbytes_10(.clk(clk), .in(msg_de_in[87:80]), .out(InvSubBytes_wire[87:80]));
InvSubBytes invsubbytes_11(.clk(clk), .in(msg_de_in[95:88]), .out(InvSubBytes_wire[95:88]));

InvSubBytes invsubbytes_12(.clk(clk), .in(msg_de_in[103:96]), .out(InvSubBytes_wire[103:96]));
InvSubBytes invsubbytes_13(.clk(clk), .in(msg_de_in[111:104]), .out(InvSubBytes_wire[111:104]));
InvSubBytes invsubbytes_14(.clk(clk), .in(msg_de_in[119:112]), .out(InvSubBytes_wire[119:112]));
InvSubBytes invsubbytes_15(.clk(clk), .in(msg_de_in[127:120]), .out(InvSubBytes_wire[127:120]));


// For week 2, write your own state machine here for AES decryption process.

enum logic [6:0] { RESET, WAIT, LOAD_MSG, LD_KEY1, LD_KEY2, LD_KEY3, LD_KEY4, LD_KEY5,
						 ADDKEYSTART, SHIFTROWLOOP, SUBBYTESLOOP, SUBBYTESLOOP2, ADDKEYLOOP, MIXLOOP1,
						 MIXLOOP2, MIXLOOP3, MIXLOOP4, MIXLOOP5, SHIFTROWFINAL, SUBBYTESFINAL, SUBBYTESFINAL2,
						 ADDKEYFINAL, END
} state, next_state;

assign msg_de = msg_de_in;

always_ff @ (posedge clk) begin
        if(reset_n == 1'b0) 
		  begin
            state <= RESET;
				msg_de_in <= msg_en;
				round <= 4'd0;
				//IMC_reg <= 32'd0;
        end
		  
		   else begin
            state <= next_state;
				round <= round_in;
				if(LD_REG)
					begin
						msg_de_in <= msg_de_in_wire;
					end
				//if(LD_IMC_REG)
					//begin
					//IMC_reg <= IMC_reg_wire;
					//end
			end
end


always_comb begin
        // Next state logic
        next_state = state;
        unique case (state)
            RESET: begin
                next_state = WAIT;
            end
            WAIT: begin
                if (decrypt_begin == 1'd1)  // CHANGE THIS
                    next_state = LOAD_MSG;
            end
				
				LOAD_MSG: begin
					next_state = ADDKEYSTART;
				end
				
				LD_KEY1: begin
					next_state = LD_KEY2;
				end
				
				LD_KEY2: begin
					next_state = LD_KEY3;
				end
				
				LD_KEY3: begin
					next_state = LD_KEY4;
				end
				
				LD_KEY4: begin
					next_state = LD_KEY5;
				end
				
				LD_KEY5: begin
					next_state = ADDKEYSTART;
				end
				
				ADDKEYSTART: begin
					next_state = SHIFTROWLOOP;
				end
				
				SHIFTROWLOOP: begin
					next_state = SUBBYTESLOOP;
				end
				
				SUBBYTESLOOP: begin
					next_state = SUBBYTESLOOP2;
				end
				
				SUBBYTESLOOP2: begin
					next_state = ADDKEYLOOP;
				end
				
				ADDKEYLOOP: begin
					next_state = MIXLOOP1;
				end
				
				MIXLOOP1: begin
					next_state = MIXLOOP2;
				end
				
				MIXLOOP2: begin
					next_state = MIXLOOP3;
				end
				
				MIXLOOP3: begin
					next_state = MIXLOOP4;
				end
				
				MIXLOOP4: begin
					next_state = MIXLOOP5;
				end
				
				MIXLOOP5: begin
					if(round == 4'd9) 
						begin
						next_state = SHIFTROWFINAL;
						end
					else
						begin
						next_state = SHIFTROWLOOP;
						end
				end
				
				SHIFTROWFINAL: begin
					next_state = SUBBYTESFINAL;
				end
				
				SUBBYTESFINAL: begin
					next_state = SUBBYTESFINAL2;
				end
				
				SUBBYTESFINAL2: begin
					next_state = ADDKEYFINAL;
				end
				
				ADDKEYFINAL: begin
					next_state = END;
				end
				
				END: begin

				end
		endcase
	end       

always_comb begin
        // State signals
		  stop = 0;
		  round_in = round;
		  curr_key = 32'd0;
		  REGmux_select = 3'b101;
		  IMCmux_select = 2'b00;
		  LD_IMC_REG = 1'b0;
		  LD_REG = 1'b1;
		  curr_state = 4'b1110;
        unique case (state)
            RESET: begin
					 curr_state = 4'b0000;
            end
				
            WAIT: begin
					 curr_state = 4'b0001;
            end
				
				LOAD_MSG: begin
					REGmux_select = 3'b100;
				end
				
				ADDKEYSTART: begin
					curr_key = keyschedule[127:0];
					round_in = round + 4'd1;
					REGmux_select = 3'b000;
					curr_state = 4'b0010;
				end
				
				SHIFTROWLOOP: begin
					REGmux_select = 3'b001;
					curr_state = 4'b0011;
				end
				
				SUBBYTESLOOP: begin
					curr_state = 4'b0100;
				end
				
				SUBBYTESLOOP2: begin
					REGmux_select = 3'b010;
				end
				
				ADDKEYLOOP: begin
					REGmux_select = 3'b000;
					curr_state = 4'b0101;
					if(round == 4'd1)
						curr_key = keyschedule[255:128];
					else if(round == 4'd2)
						curr_key = keyschedule[383:256];
					else if(round == 4'd3)
						curr_key = keyschedule[511:384];
					else if(round == 4'd4)
						curr_key = keyschedule[639:512];
					else if(round == 4'd5)
						curr_key = keyschedule[767:640];
					else if(round == 4'd6)
						curr_key = keyschedule[895:768];
					else if(round == 4'd7)
						curr_key = keyschedule[1023:896];
					else if(round == 4'd8)
						curr_key = keyschedule[1151:1024];
					else if(round == 4'd9)
						curr_key = keyschedule[1279:1152];
				end
				
				MIXLOOP1: begin
					IMCmux_select = 2'b00;
					curr_state = 4'b0110;
					//LD_IMC_REG = 1'b1;
				end
				
				MIXLOOP2: begin
					IMCmux_select = 2'b01;
					curr_state = 4'b0111;
					//LD_IMC_REG = 1'b1;
				end
				
				MIXLOOP3: begin
					IMCmux_select = 2'b10;
					curr_state = 4'b1000;
					//LD_IMC_REG = 1'b1;
				end
				
				MIXLOOP4: begin
					IMCmux_select = 2'b11;
					curr_state = 4'b1001;
					//LD_IMC_REG = 1'b1;
				end
				
				MIXLOOP5: begin
					round_in = round + 4'd1;
					REGmux_select = 3'b011;
				end
				
				SHIFTROWFINAL: begin
					REGmux_select = 3'b001;
					curr_state = 4'b1010;
				end
				
				SUBBYTESFINAL: begin
					REGmux_select = 3'b010;
					curr_state = 4'b1011;
				end
				
				SUBBYTESFINAL2: begin
					REGmux_select = 3'b010;
				end
				
				ADDKEYFINAL: begin
					curr_key = keyschedule[1407:1280];
					REGmux_select = 3'b000;
					curr_state = 4'b1100;
				end
				
				END: begin
					stop = 1;
					curr_state = 4'b1101;
					LD_REG = 1'b0;
				end
		endcase
	end    	
endmodule