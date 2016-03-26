//Módulo multiplexador MX_B (combinacional)
module mx_B(in_RB, in_SE, in_mxRB, forward, S_MXSE, out);

	input 	wire[31:0]	in_RB, in_SE, in_mxRB;
	input 	wire		S_MXSE;
	input 	wire		forward;

	output 	reg	[31:0]	out;

	/*
		Com S_MXSE = 0, a entrada do banco de registradores
		Com S_MXSE = 1, a entrada do extensor de sinal é selecionada
	*/
	always @(*) begin
		if(forward)					out = in_mxRB;
		else begin
			case(S_MXSE)
				1'b0: 				out = in_RB;
				1'b1: 				out = in_SE;
				default:			out = in_RB;
			endcase
		end
	end

endmodule
