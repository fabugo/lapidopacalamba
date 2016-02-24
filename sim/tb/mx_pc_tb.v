module mx_pc_tb;

	reg[31:0] 	in_ALU, in_ADD;
	reg 		S_MXPC;
	wire[31:0] 	out;

	mx_pc mx(.in_ALU(in_ALU), .in_ADD(in_ADD), .S_MXPC(S_MXPC), .out(out));
	
	initial begin
		$display("\n---------------------------");
		$display("Teste do MX PC");
		$display("Total de testes: 2");

		in_ALU = 32'b11111111111111110000000000000000;
		in_ADD = 32'b00000000000000001111111111111111;


		S_MXPC = 1'b0;
		#1;
		$display("Executando teste 1: %s", (out != in_ALU) ? "Erro" : "Sucesso");
		if(out != in_ALU) $display("Saida esperada: %32b. Saida obtida: %32b", in_ALU, out);
		
		S_MXPC = 1'b1;
		#1;
		$display("Executando teste 2: %s", (out != in_ADD) ? "Erro" : "Sucesso");
		if(out != in_ALU) $display("Saida esperada: %32b. Saida obtida: %32b", in_ADD, out);
	end
endmodule