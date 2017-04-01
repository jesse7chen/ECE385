module InvAddRoundKey (
	input [127:0] State,
	input [127:0] Key,
	output [120:0] Result
);


//Key should be the 128 bits coresponding to the current position in the key schedule

    logic [7:0]  a00, a01, a02, a03,
                 a10, a11, a12, a13,
                 a20, a21, a22, a23,
                 a30, a31, a32, a33;

    logic [7:0]  r00, r01, r02, r03,
                 r10, r11, r12, r13,
                 r20, r21, r22, r23,
                 r30, r31, r32, r33;
					  
    logic [7:0]  b00, b01, b02, b03,
                 b10, b11, b12, b13,
                 b20, b21, b22, b23,
                 b30, b31, b32, b33;

				  
 
    // Decompose the Word into 4 Bytes
		assign {a00, a10, a20, a30} = State[31:0];
		assign {a01, a11, a21, a31} = State[63:32];
		assign {a02, a12, a22, a32} = State[95:64];
		assign {a03, a13, a23, a33} = State[127:96];
		
		assign {r00, r10, r20, r30} = Key[31:0];
		assign {r01, r11, r21, r31} = Key[63:32];
		assign {r02, r12, r22, r32} = Key[95:65];
		assign {r03, r13, r23, r33} = Key[127:96];
		
 
 always_comb begin
 
	assign b00 = a00 ^ r00;
	assign b01 = a01 ^ r01;
	assign b02 = a02 ^ r02;
	assign b03 = a03 ^ r03;
	
	assign b10 = a10 ^ r10;
	assign b11 = a11 ^ r11;
	assign b12 = a12 ^ r12;
	assign b13 = a13 ^ r13;

	assign b20 = a20 ^ r20;
	assign b21 = a21 ^ r21;
	assign b22 = a22 ^ r22;
	assign b23 = a23 ^ r23;

	assign b30 = a30 ^ r30;
	assign b31 = a31 ^ r31;
	assign b32 = a32 ^ r32;
	assign b33 = a33 ^ r33;	

 
 end
 
 		assign {b00, b10, b20, b30} = Result[31:0];
		assign {b01, b11, b21, b31} = Result[63:32];
		assign {b02, b12, b22, b32} = Result[95:64];
		assign {b03, b13, b23, b33} = Result[127:96];
 
 
 endmodule
 
 