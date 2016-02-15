module register_bank(in_PC, in_DM, in_ALU, S_MXRB, out);
	input in_PC, in_DM, in_ALU;
	input S_MXRB;
	output out;

	wire[31:0] in_PC, in_DM, in_ALU;
	wire S_MXRB;
	wire[31:0] out;

	assign out = (S_MXRB == 2'b0)
						? in_PC
						: (S_MXRB == 2'b01) 
							? in_DM
							: in_ALU;

endmodule