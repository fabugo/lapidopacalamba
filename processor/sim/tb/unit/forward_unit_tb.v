module forward_unit_tb;
	
	reg [1:0]	OP_FU;
	reg [3:0]	RA, RB, WC;
	reg			W_RB;
	wire	 	out_A, out_B;
	forward_unit fu(.OP_FU(OP_FU), .RA(RA), .RB(RB), .WC(WC), .W_RB(W_RB), .out_A(out_A), .out_B(out_B));

	integer erro;
	reg condA, condB;
	reg[15:0] i;

	initial begin
		$display("\n---------------------------");
		$display("Teste do FU");
		$display("Total de testes: 1");

		erro = 0;

		for(i = 16'b0; i < 16'b1000000000000000; i = i + 1) begin
			OP_FU 	= i[14:13];
			W_RB 	= i[12];
			RA 		= i[11:8];
			RB 		= i[7:4];
			WC		= i[3:0];

			condA = OP_FU[1] == 1'b1 && RA == WC && W_RB;
			condB = OP_FU[0] == 1'b1 && RB == WC && W_RB;
			if((out_A != 1'b1 && condA) || (out_A != 1'b0 && !condA)
			|| (out_B != 1'b1 && condB) || (out_B != 1'b0 && !condB)) begin
				erro = erro + 1;
				$display("-> Erro para as entradas: OP_FU: %2b, W_RB: %b, RA: %4b, RB: %4b, WC: %4b. O encaminhamento nao era esperado.", OP_FU, W_RB, RA, RB, WC);
			end
		end
		$display("Fim do teste. Total de erros %2d", erro);
	end
endmodule
