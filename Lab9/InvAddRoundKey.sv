module InvAddRoundKey (
	input [127:0] State,
	input [127:0] Key,
	output [127:0] Result
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
	 always_comb
	 begin
		{a00, a10, a20, a30} = State[31:0];
	   {a01, a11, a21, a31} = State[63:32];
		{a02, a12, a22, a32} = State[95:64];
		{a03, a13, a23, a33} = State[127:96];
		
		{r00, r10, r20, r30} = Key[31:0];
		{r01, r11, r21, r31} = Key[63:32];
		{r02, r12, r22, r32} = Key[95:64];
		{r03, r13, r23, r33} = Key[127:96];
		
 
 
	b00 = a00 ^ r00;
	b01 = a01 ^ r01;
	b02 = a02 ^ r02;
	b03 = a03 ^ r03;
	
	b10 = a10 ^ r10;
	b11 = a11 ^ r11;
	b12 = a12 ^ r12;
	b13 = a13 ^ r13;

	b20 = a20 ^ r20;
	b21 = a21 ^ r21;
	b22 = a22 ^ r22;
	b23 = a23 ^ r23;

	b30 = a30 ^ r30;
	b31 = a31 ^ r31;
	b32 = a32 ^ r32;
	b33 = a33 ^ r33;	

 
 
 
 		Result[31:0] = {b00, b10, b20, b30};
		Result[63:32] = {b01, b11, b21, b31};
		Result[95:64] = {b02, b12, b22, b32};
		Result[127:96] = {b03, b13, b23, b33};
 
 end
 
 endmodule
 
 