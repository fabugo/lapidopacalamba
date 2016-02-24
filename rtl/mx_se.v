module mx_se(
			input 	wire[31:0]	in_RB,
			input 	wire[31:0]	in_SE,
			input 	wire		S_MXSE,
			output reg[31:0]	out);

	always @(*) begin
		case(S_MXSE) 
			1'b0: out = in_RB;
			1'b1: out = in_SE;
		endcase
	end

endmodule