module program_counter(in, W_PC, out);
	input in, W_PC;
	output out;

	wire[31:0] in;
	wire W_PC;
	reg[31:0] out;

	always @(W_PC) begin
		if (W_PC) begin
			out = in;
		end
	end

endmodule