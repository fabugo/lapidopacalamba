module mx_a_tb;

	reg	[31:0] 	in_PRA, in_mxrb;
	reg			forward;
	wire[31:0] 	out;
	mx_a mx(.in_PRA(in_PRA), .in_mxrb(in_mxrb), .forward(forward), .out(out));

	initial begin
		$display("\n---------------------------");
		$display("Teste do MX A");
		$display("Total de testes: 2");

		in_PRA = 32'b11111111111111110000000000000000;
		in_mxrb = 32'b00000000000000001111111111111111;
		
		forward = 1'b0;
		#1;
		$display("Executando teste 1: %s", (out != in_PRA) ? "Erro" : "Sucesso");
		if(out != in_PRA) $display("Saida esperada: %8h. Saida obtida: %8h", in_PRA, out);

		forward = 1'b1;
		#1;
		$display("Executando teste 2: %s", (out != in_mxrb) ? "Erro" : "Sucesso");
		if(out != in_mxrb) $display("Saida esperada: %8h. Saida obtida: %8h", in_mxrb, out);
	end
endmodule