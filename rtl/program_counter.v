module program_counter(W_PC, inPC, outPC);
	input W_PC;
	input[31:0] inPC;
	output[31:0] outPC;

	wire W_PC, inPC;
	reg outPC;

	always @(W_PC) begin
		if (W_PC) begin
			assign outPC = inPC;
		end
	end

endmodule