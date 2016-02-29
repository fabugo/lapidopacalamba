module subtractor32(A, B, borrowIn, result, borrowOut, overflow);

	input	wire[31:0] 	A, B;
	input	wire		borrowIn;
	output	wire[31:0] 	result;
	output	wire		borrowOut, overflow;

	wire [32:0]			borrows; //array de todos os borrows

	assign 	borrows[0] 	= borrowIn;
	assign 	borrowOut 	= borrows[32];
	assign 	overflow 	= borrows[32] ^ borrows[31];

	genvar i;
	generate
		for(i = 0; i < 32; i = i + 1)
			full_subtractor fullsub (
									.A(A[i]),
									.B(B[i]),
									.borrowIn(borrows[i]),
									.result(result[i]),
									.borrowOut(borrows[i+1])
			);
	endgenerate
endmodule
