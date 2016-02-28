module adder32(A, B, carryIn, result, carryOut, overflow);
	
	input   wire[31:0]	A, B;
	input   wire		carryIn;
	output  wire [31:0]	result;
	output	wire		carryOut, overflow;

	wire [32:0]			carries; //array de todos os carries

	assign 	carries[0] 	= carryIn;
	assign 	carryOut 	= carries[32];
	assign 	overflow 	= carries[32] ^ carries[31];

	genvar i;
	generate
		for(i = 0; i < 32; i = i + 1)
			full_adder fulladd(
								.A(A[i]),
								.B(B[i]),
								.carryIn(carries[i]),
								.result(result[i]),
								.carryOut(carries[i+1])
			);
	endgenerate
	
endmodule
