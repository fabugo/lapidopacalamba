module program_counter_tb;
	
	reg CLK, RESET;

	reg	[31:0] 	in;
	wire[31:0] 	out;
	program_counter pc(.CLK(CLK), .RESET(RESET), .in(in), .out(out));

	initial begin
		CLK = 0;
		$display("\n---------------------------");
		$display("Teste do PC");
		$display("Total de testes: 3");

		in = 32'b0;
		#1;
		CLK = 1;
		#1
		$display("Executando teste 1: %s", (in != out) ? "Erro" : "Sucesso");
		if(out != in) $display("Saida esperada: %8h. Saida obtida: %8h", in, out);

		CLK = 0;
		in = 32'b1;
		#1;
		CLK = 1;
		#1
		$display("Executando teste 2: %s", (in != out) ? "Erro" : "Sucesso");
		if(out != in) $display("Saida esperada: %8h. Saida obtida: %8h", in, out);

		CLK = 0;
		in = 32'b1111;
		#1;
		CLK = 1;
		#1
		$display("Executando teste 3: %s", (in != out) ? "Erro" : "Sucesso");
		if(out != in) $display("Saida esperada: %8h. Saida obtida: %8h", in, out);
	end
endmodule
