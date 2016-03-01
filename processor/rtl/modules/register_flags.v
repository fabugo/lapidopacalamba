//Módulo do registrador de flags
module register_flags(CLK, RESET, in_O, in_S, in_C, in_Z, W_RF, out_O, out_S, out_C, out_Z);

	input 	wire		CLK, RESET, in_O, in_S, in_C, in_Z;
	input	wire[2:0]	W_RF;
	output 	reg			out_O, out_S, out_C, out_Z;

	always @(posedge RESET) begin
		out_O <= 1'b0;
		out_S <= 1'b0;
		out_C <= 1'b0;
		out_Z <= 1'b0;
	end

	/*
		Quando o CLK tiver uma borda de subida as flags são
		registradas de acordo com o valor de W_RF.
		*Com W_RF = 000, nenhuma flag é registrada
	*/
	always @(posedge CLK) begin
		case(W_RF)
			3'b001: 			out_Z <= in_Z;
			3'b010: begin
								out_S <= in_S;
								out_Z <= in_Z;
			end
			3'b011: begin
								out_S <= in_S;
								out_C <= in_C;
								out_Z <= in_Z;
			end
			3'b100: begin
								out_O <= in_O;
								out_S <= in_S;
								out_C <= in_C;
								out_Z <= in_Z;
			end
		endcase
	end

endmodule
