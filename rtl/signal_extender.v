module signal_extender(
			input 	wire[15:0]	in,
			input 	wire		OP_SE,
			output	reg[31:0]	out);

	always @(OP_SE) begin
		case (OP_SE)
			1'b0: out = {{20{in[11]}}, in[11:0]};
			1'b1: out = {{16{in[15]}}, in[15:0]};
		endcase
	end

endmodule