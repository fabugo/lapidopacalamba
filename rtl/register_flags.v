module register_flags(
			input 	wire		in_O,
			input 	wire		in_S,
			input 	wire		in_C,
			input 	wire		in_Z,
			input	wire[2:0]	W_RF,
			output 	reg			out_O,
			output 	reg			out_S,
			output 	reg			out_C,
			output 	reg			out_Z);

	always @(*) begin
		case(W_RF)
			3'b001: 			out_Z = in_Z;
			3'b010: begin
								out_S = in_S;
								out_Z = in_Z;
			end
			3'b011: begin
								out_S = in_S;
								out_C = in_C;
								out_Z = in_Z;
			end
			3'b100: begin
								out_O = in_O;
								out_S = in_S;
								out_C = in_C;
								out_Z = in_Z;
			end
		endcase
	end

endmodule
