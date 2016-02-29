module program_counter_tb;
	reg CLK;

	reg	[31:0] 	in;
	reg 		W_PC;
	wire[31:0] 	out;
	program_counter pc(.in(in), .W_PC(W_PC), .CLK(CLK), .out(out));

	initial begin
		CLK = 0;
		$display("\n---------------------------");
		$display("Teste do PC");
		$display("Total de testes: 3");

		in = 32'b0;
		W_PC = 1'b1;
		#1;
		CLK = 1;
		#1
		$display("Executando teste 1: %s", (in != out) ? "Erro" : "Sucesso");
		if(out != in) $display("Saida esperada: %8h. Saida obtida: %8h", in, out);

		CLK = 0;
		W_PC = 1'b0;
		in = 32'b1;
		#1;
		CLK = 1;
		#1
		$display("Executando teste 2: %s", (in == out) ? "Erro" : "Sucesso");
		if(out == in) $display("Saida esperada: %8h. Saida obtida: %8h", in, out);

		CLK = 0;
		W_PC = 1'b1;
		#1;
		CLK = 1;
		#1
		$display("Executando teste 3: %s", (in != out) ? "Erro" : "Sucesso");
		if(out != in) $display("Saida esperada: %8h. Saida obtida: %8h", in, out);
	end
endmodule
