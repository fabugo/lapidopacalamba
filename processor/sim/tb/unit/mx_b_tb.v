module mx_b_tb;

	reg	[31:0] 	in_PRB, in_SE, in_mxrb;
	reg			S_MXSE;
	reg			forward;
	wire[31:0] 	out;
	mx_b mx(.in_PRB(in_PRB), .in_SE(in_SE), .in_mxrb(in_mxrb), .forward(forward), .S_MXSE(S_MXSE), .out(out));

	initial begin
		$display("\n---------------------------");
		$display("Teste do MX B");
		$display("Total de testes: 3");

		in_PRB = 32'b11111111111111110000000000000000;
		in_SE = 32'b00000000000000001111111111111111;
		in_mxrb = 32'b11111111111111111111111111111111;

		S_MXSE = 1'b0;
		#1;
		$display("Executando teste 1: %s", (out != in_PRB) ? "Erro" : "Sucesso");
		if(out != in_PRB) $display("Saida esperada: %8h. Saida obtida: %8h", in_PRB, out);

		S_MXSE = 1'b1;
		#1;
		$display("Executando teste 2: %s", (out != in_SE) ? "Erro" : "Sucesso");
		if(out != in_SE) $display("Saida esperada: %8h. Saida obtida: %8h", in_SE, out);

		forward = 1'b1;
		#1;
		$display("Executando teste 3: %s", (out != in_mxrb) ? "Erro" : "Sucesso");
		if(out != in_mxrb) $display("Saida esperada: %8h. Saida obtida: %8h", in_mxrb, out);
	end
endmodule