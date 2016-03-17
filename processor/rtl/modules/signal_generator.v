module signal_generator(
	input 	wire[2:0]	type,
	input 	wire[4:0]	op,
	output 	reg	[4:0]	OP_ALU,
	output 	reg	[2:0]	OP_TF,
	output 	reg			OP_SE,
	output 	reg			W_PC,
	output 	reg			W_DM,
	output 	reg			W_IM,
	output 	reg			W_RB,
	output 	reg [2:0]	W_RF,
	output 	reg	[1:0]	S_MXRB,
	output 	reg			S_MXSE);
	
endmodule
