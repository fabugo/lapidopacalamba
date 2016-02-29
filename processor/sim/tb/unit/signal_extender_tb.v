module signal_extender_tb;

	reg	[15:0] in;
	reg OP_SE;
	wire[31:0] out;

	signal_extender se(.in(in), .OP_SE(OP_SE), .out(out));

	parameter 	ZERO_12 	= 32'b000000000000,
				ZERO_12E	= 32'b00000000000000000000000000000000,
				ZERO_16		= 32'b0000000000000000,
				ZERO_16E	= 32'b00000000000000000000000000000000,
				ONE_12 		= 32'b100000000000,
				ONE_12E		= 32'b11111111111111111111100000000000,
				ONE_16		= 32'b1000000000000000,
				ONE_16E		= 32'b11111111111111111000000000000000,
				RAND_12		= 32'b110101000101,
				RAND_12E	= 32'b11111111111111111111110101000101,
				RAND_16		= 32'b0111001001100110,
				RAND_16E	= 32'b00000000000000000111001001100110;

	initial begin
		$display("\n---------------------------");
		$display("Teste do Extensor de Sinal");
		$display("Total de testes: 6");

		in = ZERO_12;
		OP_SE = 1'b0;
		#1
		$display("Executando teste 1: %s", (out != ZERO_12E) ? "Erro" : "Sucesso");

		in = ZERO_16;
		OP_SE = 1'b1;
		#1
		$display("Executando teste 2: %s", (out != ZERO_16E) ? "Erro" : "Sucesso");

		in = ONE_12;
		OP_SE = 1'b0;
		#1
		$display("Executando teste 3: %s", (out != ONE_12E) ? "Erro" : "Sucesso");

		in = ONE_16;
		OP_SE = 1'b1;
		#1
		$display("Executando teste 4: %s", (out != ONE_16E) ? "Erro" : "Sucesso");

		in = RAND_12;
		OP_SE = 1'b0;
		#1
		$display("Executando teste 5: %s", (out != RAND_12E) ? "Erro" : "Sucesso");

		in = RAND_16;
		OP_SE = 1'b1;
		#1
		$display("Executando teste 6: %s", (out != RAND_16E) ? "Erro" : "Sucesso");
	end

endmodule
