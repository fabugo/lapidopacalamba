module mx_rb(
			input 	wire[31:0]	in_PC,
			input 	wire[31:0]	in_DM,
			input 	wire[31:0]	in_ALU,
			input 	wire[1:0]	S_MXRB,
			output 	reg[31:0]	out);

	always @(in_PC or in_DM or in_ALU or S_MXRB) begin
		case(S_MXRB)
			2'b00: out = in_PC;
			2'b01: out = in_DM;
			2'b10: out = in_ALU;
		endcase
	end

endmodule