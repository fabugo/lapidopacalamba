module mx_pc(
			input 	wire[31:0]	in_ALU,
			input 	wire[31:0]	in_ADD,
			input 	wire		S_MXPC,
			output 	reg[31:0] 	out);

	always @(in_ALU or in_ADD or S_MXPC) begin
		case(S_MXPC) 
			1'b0: out = in_ALU;
			1'b1: out = in_ADD;
		endcase
	end

endmodule