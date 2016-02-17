module tester_flags_tb;

	reg O, S, C, Z;
	reg[2:0] cond, OP_TF;
	wire  out;
	tester_flags tf(.O(O), .S(S), .C(C), .Z(Z), .cond(cond), .OP_TF(OP_TF), .out(out));

	integer exit1, exit2;
	reg[4:0] i;

	initial begin
		$display("\n---------------------------");
		$display("Teste do Testador de Flags");
		$display("Total de testes: 6");

		exit1 = 0;
		OP_TF = 3'b111;
		while(exit1 != 1) begin
			//Informa qual teste está sendo realizado
			$display("\n---------------------------");
			case(OP_TF)
				3'b111: $display("Teste 1: (Nunca pula)");
				3'b000: $display("Teste 2: jf.COND (Pula se a condicao for falsa)");
				3'b001: $display("Teste 3: jt.COND (Pula se a condicao for verdadeira)");
				3'b010: $display("Teste 4: j L (Sempre pula)");
				3'b011: $display("Teste 5: jal b (Sempre pula)");
				3'b100: $display("Teste 6: jr b (Sempre pula)");
			endcase
			
			exit2 = 0;
			cond = 3'b000;
			while(exit2 != 1) begin
			$display("\nCondicao: %s", (cond == 0)
										? "true    "
										: (cond == 1)
											? "neg     "
											: (cond == 2)
												? "zero    "
												: (cond == 4)
													? "carry   "
													: (cond == 5)
														? "negzero "
														: "overflow");
			$display("O  S  C  Z");
				//Testa todas as combinações possíveis de flags com cond e OP_TF atuais
				for(i = 5'b0; i <= 5'b1111; i = i + 1) begin
					O = i[0];
					S = i[1];
					C = i[2];
					Z = i[3];
					#1
					$display("%b  %b  %b  %b - %s", O, S, C, Z, ((out == 1) ? "Nao Pulou" : "Pulou    "));
				end

				//Atualida a condição de teste, ou finaliza o teste atual
				case(cond)
					3'b000: cond = 3'b001;
					3'b001: cond = 3'b010;
					3'b010: cond = 3'b100;
					3'b100: cond = 3'b101;
					3'b101: cond = 3'b111;
					3'b111: exit2 = 1;
				endcase
			end

			//Atualiza o OP_TF ou finaliza a execução dos testes
			case(OP_TF)
				3'b111: OP_TF = 3'b000;
				3'b000: OP_TF = 3'b001;
				3'b001: OP_TF = 3'b010;
				3'b010: OP_TF = 3'b011;
				3'b011: OP_TF = 3'b100;
				3'b100: exit1 = 1;
			endcase
		end
	end
endmodule
