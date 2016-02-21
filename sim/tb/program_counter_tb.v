module program_counter_tb;

	reg[31:0] 	in;
	reg 		W_PC;
	wire[31:0] 	out;

	reg CLK;

	initial CLK = 0;

	always #5 CLK = ~CLK; 

	program_counter pc(.in(in), .W_PC(W_PC), .CLK(CLK), .out(out));

	
	initial begin
		$display("\n---------------------------");
		$display("Teste do PC");
		$display("Total de testes: 3");

		in = 32'b0;
		W_PC = 1'b1;
		#10;
		$display("Executando teste 1: %s", (in != out) ? "Erro" : "Sucesso");

		W_PC = 1'b0;
		in = 32'b1;
		#10;
		$display("Executando teste 2: %s", (in == out) ? "Erro" : "Sucesso");

		W_PC = 1'b1;
		#10;
		$display("Executando teste 3: %s", (in != out) ? "Erro" : "Sucesso");
	end
endmodule