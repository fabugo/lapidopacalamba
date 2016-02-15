module signal_extender(
			input 	wire[15:0]	in,
			input 	wire		OP_SE,
			output	reg[31:0]	out);

	always @(OP_SE) begin
		case (OP_SE)
			1'b0: begin
				if(in[11] == 1'b1) 	out = {20'b1, in[11:0]};
				else 				out = {20'b0, in[11:0]};
			end
			1'b1: begin
				if(in[15] == 1'b1) 	out = {16'b1, in[15:0]};
				else 				out = {16'b0, in[15:0]};
			end
		endcase
	end

endmodule