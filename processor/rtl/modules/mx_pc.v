//Módulo multiplexador MX_PC (combinacional)
module mx_pc(in_ALU, in_ADD, S_MXPC, out);

	input 	wire[31:0]	in_ALU, in_ADD;
	input 	wire		S_MXPC;
	output 	reg	[31:0]	out;

	/*
		Com S_MXPC = 0, a entrada da ALU é selecionada
		Com S_MXPC = 1, a entrada do somador é selecionada
	*/
	always @(*) begin
		case(S_MXPC) 
			1'b0: 				out = in_ALU;
			1'b1: 				out = in_ADD;
		endcase
	end

endmodule