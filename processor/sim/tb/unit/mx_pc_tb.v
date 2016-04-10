module mx_pc_tb;

	reg	[31:0] 	in_SE, in_RB, in_ADD;
	reg	[1:0]	S_MXPC;
	wire[31:0] 	out;
	mx_pc mx(.in_SE(in_SE), .in_RB(in_RB), .in_ADD(in_ADD), .S_MXPC(S_MXPC), .out(out));

	initial begin
		$display("\n---------------------------");
		$display("Teste do MX PC");
		$display("Total de testes: 3");

		in_SE = 32'b11111111111111110000000000000000;
		in_RB = 32'b00000000000000001111111111111111;
		in_ADD = 32'b11111111111111111111111111111111;

		S_MXPC = 2'b00;
		#1;
		$display("Executando teste 1: %s", (out != in_SE) ? "Erro" : "Sucesso");
		if(out != in_SE) $display("Saida esperada: %8h. Saida obtida: %8h", in_SE, out);

		S_MXPC = 2'b01;
		#1;
		$display("Executando teste 2: %s", (out != in_RB) ? "Erro" : "Sucesso");
		if(out != in_RB) $display("Saida esperada: %8h. Saida obtida: %8h", in_RB, out);

		S_MXPC = 2'b10;
		#1;
		$display("Executando teste 3: %s", (out != in_ADD) ? "Erro" : "Sucesso");
		if(out != in_ADD) $display("Saida esperada: %8h. Saida obtida: %8h", in_ADD, out);
	end
endmodule
