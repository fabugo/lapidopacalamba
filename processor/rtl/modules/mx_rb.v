//Módulo multiplexador MX_RB (combinacional)
module mx_rb(in_PC, in_DM, in_ALU, S_MXRB, out);

	input 	wire[31:0]	in_PC, in_DM, in_ALU;
	input 	wire[1:0]	S_MXRB;
	output 	reg	[31:0]	out;

	/*
		Com S_MXRB = 00, a entrada do PC é selecionada
		Com S_MXRB = 01, a entrada da memória de dados é selecionada
		Com S_MXRB = 10, a entrada da ALU é selecionada
	*/
	always @(*) begin
		case(S_MXRB)
			2'b00: 				out = in_PC;
			2'b01: 				out = in_DM;
			2'b10: 				out = in_ALU;
		endcase
	end

endmodule