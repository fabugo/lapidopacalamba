module mx_rb_tb;

	reg	[31:0] 	in_PC, in_DM, in_ALU;
	reg	[1:0]	S_MXRB;
	wire[31:0] 	out;
	mx_rb mx(.in_PC(in_PC), .in_DM(in_DM), .in_ALU(in_ALU), .S_MXRB(S_MXRB), .out(out));

	initial begin
		$display("\n---------------------------");
		$display("Teste do MX RB");
		$display("Total de testes: 3");

		in_PC = 32'b11111111111111110000000000000000;
		in_DM = 32'b00000000000000001111111111111111;
		in_ALU = 32'b11111111111111111111111111111111;

		S_MXRB = 2'b00;
		#1;
		$display("Executando teste 1: %s", (out != in_PC) ? "Erro" : "Sucesso");
		if(out != in_PC) $display("Saida esperada: %8h. Saida obtida: %8h", in_PC, out);

		S_MXRB = 2'b01;
		#1;
		$display("Executando teste 2: %s", (out != in_DM) ? "Erro" : "Sucesso");
		if(out != in_DM) $display("Saida esperada: %8h. Saida obtida: %8h", in_DM, out);

		S_MXRB = 2'b10;
		#1;
		$display("Executando teste 3: %s", (out != in_ALU) ? "Erro" : "Sucesso");
		if(out != in_ALU) $display("Saida esperada: %8h. Saida obtida: %8h", in_ALU, out);
	end
endmodule
