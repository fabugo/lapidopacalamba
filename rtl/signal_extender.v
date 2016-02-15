module signal_extender(in, OP_SE, out);
	input 			in, OP_SE;
	output 			out;

	wire[15:0] 		in;
	wire 			OP_SE;
	reg[31:0] 		out;

	always @(OP_SE) begin
		if (OP_SE == 1'b1) begin
			if(in[15] == 1'b1) 			out = {16'b1, in[15:0]};
			else 						out = {16'b0, in[15:0]};
		end else if(OP_SE == 1'b0) begin
			if(in[11] == 1'b1) 			out = {20'b1, in[11:0]};
			else 						out = {20'b0, in[11:0]};
		end
	end

endmodule