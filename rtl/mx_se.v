module register_bank(in_RB, in_SE, S_MXSE, out);
	input in_RB, in_SE;
	input S_MXSE;
	output out;

	wire[31:0] in_RB, in_SE;
	wire S_MXSE;
	wire[31:0] out;

	assign out = (S_MXSE) ? in_SE : in_RB;

endmodule