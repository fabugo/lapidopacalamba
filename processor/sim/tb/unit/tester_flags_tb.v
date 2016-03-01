module tester_flags_tb;

	reg 		RESET, O, S, C, Z;
	reg	[2:0] 	cond, OP_TF;
	wire  		out;
	tester_flags tf(.RESET(RESET), .O(O), .S(S), .C(C), .Z(Z), .cond(cond), .OP_TF(OP_TF), .out(out));

	integer exit, erro;
	reg[4:0] i;

	initial begin
		$display("\n---------------------------");
		$display("Executando teste do Testador de Flags");
		$display("Total de testes: 6");

		OP_TF = 3'b111;
		$display("Executando teste 1: (Nunca pula)");
		exit = 0;
		erro = 0;
		cond = 3'b000;
		while(exit != 1) begin
			for(i = 5'b0; i <= 5'b1111; i = i + 1) begin
				O = i[0];
				S = i[1];
				C = i[2];
				Z = i[3];
				#1
				if(out == 1'b0) begin
					erro = erro + 1;
					$display("-> Erro para as entradas: O: %b, S: %b, C: %b, Z: %b, cond: %3b. O pulo nao era esperado.", O, S, C, Z, cond);
				end
			end
			case(cond)
				3'b000: cond = 3'b001;
				3'b001: cond = 3'b010;
				3'b010: cond = 3'b100;
				3'b100: cond = 3'b101;
				3'b101: cond = 3'b111;
				3'b111: exit = 1;
			endcase
		end
		$display("Finalizado teste 1. %3d erros\n", erro);

		OP_TF = 3'b000;
		$display("Executando teste 2: jf.COND (Pula se a condicao for falsa)");
		exit = 0;
		erro = 0;
		cond = 3'b000;
		while(exit != 1) begin
			for(i = 5'b0; i <= 5'b1111; i = i + 1) begin
				O = i[0];
				S = i[1];
				C = i[2];
				Z = i[3];
				#1
				if(out == 1'b0 && ((cond == 0)
						|| (cond == 1 && S == 1)
						|| (cond == 2 && Z == 1)
						|| (cond == 4 && C == 1)
						|| (cond == 5 && (S & Z) == 1)
						|| (cond == 7 && O == 1))) begin
					erro = erro + 1;
					$display("-> Erro para as entradas: O: S: C: Z: cond: . O pulo nao era esperado.", O, S, C, Z, cond);
				end else if(out == 1'b1 && cond != 0 && ((cond == 1 && S == 0)
						|| (cond == 2 && Z == 0)
						|| (cond == 4 && C == 0)
						|| (cond == 5 && (S & Z) == 0)
						|| (cond == 7 && O == 0))) begin
					erro = erro + 1;
					$display("-> Erro para as entradas: O: %b, S: %b, C: %b, Z: %b, cond: %3b. O pulo esperado nao foi executado.", O, S, C, Z, cond);
				end

			end
			case(cond)
				3'b000: cond = 3'b001;
				3'b001: cond = 3'b010;
				3'b010: cond = 3'b100;
				3'b100: cond = 3'b101;
				3'b101: cond = 3'b111;
				3'b111: exit = 1;
			endcase
		end
		$display("Finalizado teste 2. %3d erros\n", erro);

		OP_TF = 3'b001;

		$display("Executando teste 3: jt.COND (Pula se a condicao for verdadeira)");
		exit = 0;
		erro = 0;
		cond = 3'b000;
		while(exit != 1) begin
			for(i = 5'b0; i <= 5'b1111; i = i + 1) begin
				O = i[0];
				S = i[1];
				C = i[2];
				Z = i[3];
				#1
				if(out == 1'b0 && (cond != 0) && ((cond == 1 && S == 0)
						|| (cond == 2 && Z == 0)
						|| (cond == 4 && C == 0)
						|| (cond == 5 && ~(S & Z) == 0)
						|| (cond == 7 && O == 0))) begin
					erro = erro + 1;
					$display("-> Erro para as entradas: O: %b, S: %b, C: %b, Z: %b, cond: %3b. O pulo nao era esperado.", O, S, C, Z, cond);
				end else if(out == 1'b1 && ((cond == 0)
						|| (cond == 1 && S == 1)
						|| (cond == 2 && Z == 1)
						|| (cond == 4 && C == 1)
						|| (cond == 5 && ~(S & Z) == 1)
						|| (cond == 7 && O == 1))) begin
					erro = erro + 1;
					$display("-> Erro para as entradas: O: %b, S: %b, C: %b, Z: %b, cond: %3b. O pulo esperado nao foi executado.", O, S, C, Z, cond);
				end
			end
			case(cond)
				3'b000: cond = 3'b001;
				3'b001: cond = 3'b010;
				3'b010: cond = 3'b100;
				3'b100: cond = 3'b101;
				3'b101: cond = 3'b111;
				3'b111: exit = 1;
			endcase
		end
		$display("Finalizado teste 3. %3d erros\n", erro);

		OP_TF = 3'b010;
		$display("Executando teste 4: j L (Sempre pula)");
		exit = 0;
		erro = 0;
		cond = 3'b000;
		while(exit != 1) begin
			for(i = 5'b0; i <= 5'b1111; i = i + 1) begin
				O = i[0];
				S = i[1];
				C = i[2];
				Z = i[3];
				#1
				if(out == 1'b1) begin
					erro = erro + 1;
					$display("-> Erro para as entradas: O: %b, S: %b, C: %b, Z: %b, cond: %3b. O pulo esperado nao foi executado.", O, S, C, Z, cond);
				end
			end
			case(cond)
				3'b000: cond = 3'b001;
				3'b001: cond = 3'b010;
				3'b010: cond = 3'b100;
				3'b100: cond = 3'b101;
				3'b101: cond = 3'b111;
				3'b111: exit = 1;
			endcase
		end
		$display("Finalizado teste 4. %3d erros\n", erro);

		OP_TF = 3'b011;
		$display("Executando teste 5: jal b (Sempre pula)");
		exit = 0;
		erro = 0;
		cond = 3'b000;
		while(exit != 1) begin
			for(i = 5'b0; i <= 5'b1111; i = i + 1) begin
				O = i[0];
				S = i[1];
				C = i[2];
				Z = i[3];
				#1
				if(out == 1'b1) begin
					erro = erro + 1;
					$display("-> Erro para as entradas: O: %b, S: %b, C: %b, Z: %b, cond: %3b. O pulo esperado nao foi executado.", O, S, C, Z, cond);
				end
			end
			case(cond)
				3'b000: cond = 3'b001;
				3'b001: cond = 3'b010;
				3'b010: cond = 3'b100;
				3'b100: cond = 3'b101;
				3'b101: cond = 3'b111;
				3'b111: exit = 1;
			endcase
		end
		$display("Finalizado teste 5. %3d erros\n", erro);

		OP_TF = 3'b100;
		$display("Executando teste 6: jr b (Sempre pula)");
		exit = 0;
		erro = 0;
		cond = 3'b000;
		while(exit != 1) begin
			for(i = 5'b0; i <= 5'b1111; i = i + 1) begin
				O = i[0];
				S = i[1];
				C = i[2];
				Z = i[3];
				#1
				if(out == 1'b1) begin
					erro = erro + 1;
					$display("-> Erro para as entradas: O: %b, S: %b, C: %b, Z: %b, cond: %3b. O pulo esperado nao foi executado.", O, S, C, Z, cond);
				end
			end
			case(cond)
				3'b000: cond = 3'b001;
				3'b001: cond = 3'b010;
				3'b010: cond = 3'b100;
				3'b100: cond = 3'b101;
				3'b101: cond = 3'b111;
				3'b111: exit = 1;
			endcase
		end
		$display("Finalizado teste 6. %3d erros\n", erro);
	end
endmodule
