module full_subtractor(A, B, borrowIn, result, borrowOut);
	
	input 	wire		A, B, borrowIn;
	output 	reg 		result, borrowOut;

	always @(*)begin
		case(borrowIn)
			0: begin
				borrowOut = (A == B) ? 1'b0 : B;
				result = (A == B) ? 1'b0 : 1'b1;
			end
			1: begin
				borrowOut = (A == B) ? 1'b1 : B;
				result = (A == B) ? 1'b1 : 1'b0;
			end
		endcase
	end

endmodule
