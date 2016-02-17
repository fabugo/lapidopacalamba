module register_bank_tb;

	reg[3:0] RA, RB, WC;
	reg[31:0] WPC;
	reg W_RB;

	wire[31:0]  PRA, PRB;

	register_bank rb(.RA(RA), .RB(RB), .WC(WC), .WPC(WPC), .W_RB(W_RB), .PRA(PRA), .PRB(PRB));

	integer i, t;
	reg[31:0] vec[0:15];

	initial begin
		$display("\n---------------------------");
		$display("Teste do Banco de Registradores");
		$display("Total de testes: 5");

		for(t = 1; t <= 5; t = t + 1) begin
			$display("Teste %d: Load/Store em todos os registradores com valores aleatorios", t);
			$display("-> Preenchendo vetor com valores aleatorios");
			for(i = 0; i < 16; i = i + 1)
				vec[i] = $random;
			
			W_RB = 1'b1;
			$display("-> Armazenando valores (Store)");
			for(i = 0; i < 16; i = i + 1) begin
				#1
				WC = i;
				WPC = vec[i];
			end

			#1
			W_RB = 1'b0;
			#1
			$display("-> Carregando valores e comparando-os (Load)");
			for(i = 0; i < 15; i = i + 1) begin
				RA = i;
				RB = i+1;
				#1
				if(PRA != vec[i])
					$display("+ Erro:\n   valor esperado em PRA: %32b\n   valor obtido: %32b", vec[i], PRA);
				if(PRB != vec[i+1])
					$display("+ Erro:\n   valor esperado em PRA: %32b\n   valor obtido: %32b", vec[i+1], PRB);
			end
			$display("Fim do teste %d", t);
		end
	end
endmodule
