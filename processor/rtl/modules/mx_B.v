//Módulo multiplexador MX_B (combinacional)
module mx_b(in_PRB, in_SE, in_mxrb, forward, S_MXSE, out);

	input 	wire[31:0]	in_PRB, in_SE, in_mxrb;
	input 	wire		forward;
	input 	wire		S_MXSE;

	output 	reg	[31:0]	out;

	/*
		Com forward = 1, a entrada do multiplexador rb é selecionada
		Com S_MXSE = 0, a entrada do banco de registradores é selecionada
		Com S_MXSE = 1, a entrada do extensor de sinal é selecionada
	*/
	always @(*) begin
		if(forward)					out = in_mxrb;
		else begin
			case(S_MXSE)
				1'b0: 				out = in_PRB;
				1'b1: 				out = in_SE;
				default:			out = in_PRB;
			endcase
		end
	end

endmodule
