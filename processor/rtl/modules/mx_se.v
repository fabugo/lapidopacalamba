//Módulo multiplexador MX_SE (combinacional)
module mx_se(in_RB, in_SE, S_MXSE, out);

	input 	wire[31:0]	in_RB, in_SE;
	input 	wire		S_MXSE;
	output 	reg	[31:0]	out;

	/*
		Com S_MXSE = 0, a entrada do banco de registradores
		Com S_MXSE = 1, a entrada do extensor de sinal é selecionada
	*/
	always @(*) begin
		case(S_MXSE)
			1'b0: 				out = in_RB;
			1'b1: 				out = in_SE;
			default:			out = in_RB;
		endcase
	end

endmodule
