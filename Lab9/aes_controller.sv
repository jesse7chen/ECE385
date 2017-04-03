/*---------------------------------------------------------------------------
  --      aes_controller.sv                                                --
  --      Christine Chen                                                   --
  --      10/29/2013                                                       --
  --                                                                       --
  --      Modified by Po-Han Huang 03/09/2017                              --
  --                                                                       --
  --      For use with ECE 385 Experiment 9                                --
  --      Spring 2017 Distribution                                         --
  --      UIUC ECE Department                                              --
  ---------------------------------------------------------------------------*/

// AES controller module
// The actual AES computation is done in AES, not here.
module aes_controller(
                      input                  clk,
                      input                  reset_n,  // Active-low reset
                      input        [127:0]   msg_en,   // Encrypted message
                      input        [127:0]   key,      // Key
                      output logic [127:0]   msg_de,   // Decrypted message
                      input                  io_ready, // Ready for decryption
                      output logic           aes_ready, // Decryption complete
							 //output logic 				decrypt_begin, //Begin decrypting
							 //input logic				decrypt_done // Decryption done
							 output logic [3:0] round_out,
							 output logic [3:0] state_out,
							 output logic [127:0] key_out
       );

enum logic [1:0] {WAIT, COMPUTE, READY} state, next_state;
logic [15:0] counter, counter_in;

logic clk_aes;
logic reset_n_aes;
logic [127:0] msg_en_aes;
logic [127:0] key_aes;
logic [127:0] msg_de_aes;
logic decrypt_begin;
logic decrypt_done;

logic [3:0] round;
assign round_out = round;
logic [3:0] curr_state;
assign state_out = curr_state;
logic [127:0] keyschedule;
assign key_out = keyschedule;

assign clk_aes = clk;
assign reset_n_aes =  reset_n;
assign msg_en_aes = msg_en;
assign key_aes = key;

assign msg_de = msg_de_aes;

// This instantiation is for week 1. For week 2, instantiate AES according to new interfaces.
//AES aes0(clk, key[127:96], key[95:64], key[63:32], key[31:0], msg_de[127:96], msg_de[95:64], msg_de[63:32], msg_de[31:0]);

AES aes_0(.clk(clk_aes), .reset_n(reset_n_aes), .run(decrypt_begin), .msg_en(msg_en_aes), 
			 .key(key_aes), .msg_de(msg_de_aes), .ready(decrypt_done), .round_out(round), 
			 .state_out(curr_state), .key_out(keyschedule));

always_ff @ (posedge clk) begin
    if (reset_n == 1'b0) begin
        state <= WAIT;
        counter <= 16'd0;
    end 
    else begin
        state <= next_state;
        counter <= counter_in;
    end
end

always_comb begin
    // Next state logic
    next_state = state;
    case (state)
        // Wait until IO is ready.
        WAIT: begin
            if (io_ready)
                next_state = COMPUTE;
        end
        // Wait for AES decryption until it is ready.
        // (The counter prevents getting stuck in this state.)
        COMPUTE: begin
            if (decrypt_done == 1)
                next_state = READY;
        end
        // AES decryption is finished.
        READY: begin
        end
    endcase
    // Control signals
    aes_ready = 1'b0;
    counter_in = 16'd0;
	 decrypt_begin = 1'b0;
    case (state)
        WAIT: begin
        end
            
        COMPUTE: begin
            //counter_in = counter + 16'd1;
				decrypt_begin = 1'b1;
        end
  
        READY: begin
            aes_ready = 1'b1;
        end
    endcase
end
     
endmodule