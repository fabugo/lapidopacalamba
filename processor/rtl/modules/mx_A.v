//Módulo multiplexador MX_A (combinacional)
module mx_A(in_RA, in_mxRB, forward, out);

	input 	wire[31:0]	in_RA, in_mxRB;
	input 	wire		forward;

	output 	reg	[31:0]	out;

	/*
		Com S_MXSE = 0, a entrada do banco de registradores
		Com S_MXSE = 1, a entrada do multiplexador do estágio WB
	*/
	always @(*) begin
		if(forward)		out = in_mxRB;
		else			out = in_RA;
	end

endmodule
