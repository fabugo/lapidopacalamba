module register_bank_tb;

	reg [3:0] 	RA, RB, WC;
	reg [31:0] 	WPC;
	reg 		CLK, RESET, W_RB;
	wire[31:0]  PRA, PRB;
	register_bank rb(.CLK(CLK), .RESET(RESET), .RA(RA), .RB(RB), .WC(WC), .WPC(WPC), .W_RB(W_RB), .PRA(PRA), .PRB(PRB));

	integer i, t, erro;
	reg[31:0] vec[0:15];

	initial begin
		$display("\n---------------------------");
		$display("Teste do Banco de Registradores");
		$display("Total de testes: 5");

		for(t = 1; t <= 5; t = t + 1) begin
			erro = 0;
			$display("Executando teste %1d", t);
			for(i = 0; i < 16; i = i + 1)
				vec[i] = $random;

			W_RB = 1'b1;
			for(i = 0; i < 16; i = i + 1) begin
				CLK = 0;
				#1
				CLK = 1;
				#1
				WC = i;
				WPC = vec[i];
			end

			W_RB = 1'b0;
			#1
			for(i = 0; i < 14; i = i + 1) begin
				RA = i;
				RB = i+1;
				#1
				if(PRA != vec[i]) begin
					erro = erro + 1;
					$display("+ Erro:\n   valor esperado em PRA: %8h\n   valor obtido: %8h", vec[i], PRA);
				end
				if(PRB != vec[i+1]) begin
					erro = erro + 1;
					$display("+ Erro:\n   valor esperado em PRB: %8h\n   valor obtido: %8h", vec[i+1], PRB);
				end
				#1;
			end
			$display("Fim do teste %1d, total de erros %2d", t, erro);

		end
	end
endmodule
