module mx_se_tb;

	reg	[31:0] 	in_RB, in_SE;
	reg 		S_MXSE;
	wire[31:0] 	out;
	mx_se mx(.in_RB(in_RB), .in_SE(in_SE), .S_MXSE(S_MXSE), .out(out));

	initial begin
		$display("\n---------------------------");
		$display("Teste do MX SE");
		$display("Total de testes: 2");

		in_RB = 32'b11111111111111110000000000000000;
		in_SE = 32'b00000000000000001111111111111111;

		S_MXSE = 1'b0;
		#1;
		$display("Executando teste 1: %s", (out != in_RB) ? "Erro" : "Sucesso");
		if(out != in_RB) $display("Saida esperada: %8h. Saida obtida: %8h", in_RB, out);

		S_MXSE = 1'b1;
		#1;
		$display("Executando teste 2: %s", (out != in_SE) ? "Erro" : "Sucesso");
		if(out != in_SE) $display("Saida esperada: %8h. Saida obtida: %8h", in_SE, out);
	end
endmodule
