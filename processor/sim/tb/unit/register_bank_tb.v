module register_bank_tb;

	reg [3:0] 	RA, RB, WC;
	reg [31:0] 	WPC;
	reg 		W_RB, CLK;
	wire[31:0]  PRA, PRB;
	register_bank rb(.RA(RA), .RB(RB), .WC(WC), .WPC(WPC), .W_RB(W_RB), .CLK(CLK), .PRA(PRA), .PRB(PRB));

	integer i, t;
	reg[31:0] vec[0:15];

	initial begin
		$display("\n---------------------------");
		$display("Teste do Banco de Registradores");
		$display("Total de testes: 5");

		for(t = 1; t <= 5; t = t + 1) begin
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
				if(PRA != vec[i])
					$display("+ Erro:\n   valor esperado em PRA: %8h\n   valor obtido: %8h", vec[i], PRA);
				if(PRB != vec[i+1])
					$display("+ Erro:\n   valor esperado em PRB: %8h\n   valor obtido: %8h", vec[i+1], PRB);
				#1;
			end
			$display("Fim do teste %1d", t);
		end
	end
endmodule
