module full_adder(A, B, carryIn, result, carryOut);
	
	input 	wire		A, B, carryIn;
	output 	reg			result, carryOut;

	always @(*)begin
		result = (A ^ B) ^ carryIn;
		carryOut = (A & B) | ((A ^ B) & carryIn);
	end

endmodule
