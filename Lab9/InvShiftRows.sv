module InvShiftRows(
	input [127:0] inState,
	output [127:0] outState
);

    logic [7:0]  a00, a01, a02, a03,
                 a10, a11, a12, a13,
                 a20, a21, a22, a23,
                 a30, a31, a32, a33;

				  
 
    // Decompose the Word into 4 Bytes
		assign {a00, a10, a20, a30} = inState[31:0];
		assign {a01, a11, a21, a31} = inState[63:32];
		assign {a02, a12, a22, a32} = inState[95:64];
		assign {a03, a13, a23, a33} = inState[127:96];
		
		assign outState[31:0] = {a00, a11, a22, a33};
		assign outState[63:32] = {a01, a12, a23, a30};
		assign outState[95:65] = {a02, a13, a20, a31};
		assign outState[127:96] = {a03, a10, a21, a32};
		
endmodule
