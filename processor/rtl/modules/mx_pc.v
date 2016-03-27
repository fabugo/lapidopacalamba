//Módulo multiplexador MX_PC (combinacional)
module mx_pc(in_SE, in_RB, in_ADD, S_MXPC, out);

	input 	wire[31:0]	in_SE, in_RB, in_ADD;
	input 	wire[1:0]	S_MXPC;
	
	output 	reg	[31:0]	out;

	/*
		Com S_MXPC = 00, a entrada do extensor de sinal é selecionada
		Com S_MXPC = 01, a entrada do banco de registradores é selecionada
		Com S_MXPC = 10, a entrada do somador é selecionada
	*/
	always @(*) begin
		case(S_MXPC)
			2'b00: 				out = in_SE;
			2'b01: 				out = in_RB;
			2'b10: 				out = in_ADD;
			default:			out = in_SE;
		endcase
	end

endmodule
