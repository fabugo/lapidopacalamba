module mx_pc(in_ALU, in_ADD, S_MXPC, out);
	input 		in_ALU, in_ADD;
	input 		S_MXPC;
	output 		out;

	wire[31:0] 	in_ALU, in_ADD;
	wire 		S_MXPC;
	wire[31:0] 	out;

	assign 		out = (S_MXPC)
					? in_ADD
					: in_ALU;

endmodule