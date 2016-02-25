module program_counter(
			input 	wire[31:0]	in,
			input 	wire		W_PC,
			input 				CLK,
			output	reg[31:0] 	out);

	always @(posedge CLK) begin
		if(W_PC == 1'b1) out <= in;
	end

endmodule