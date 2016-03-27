//Módulo multiplexador MX_A (combinacional)
module mx_a(in_PRA, in_mxrb, forward, out);

	input 	wire[31:0]	in_PRA, in_mxrb;
	input 	wire		forward;

	output 	reg	[31:0]	out;

	/*
		Com forward = 0, a entrada do banco de registradores é selecionada
		Com forward = 1, a entrada do multiplexador rb é selecionada
	*/
	always @(*) begin
		case(forward)
			1'b0: 				out = in_PRA;
			1'b1: 				out = in_mxrb;
			default:			out = in_PRA;
		endcase
	end

endmodule
