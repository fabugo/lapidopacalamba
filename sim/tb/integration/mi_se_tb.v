module mi_se_tb();
	//Cria a memória
	//memory_instruction u1();

	reg[15:0] seIn;
	reg OP_SE;
	wire[31:0] seOut;

	signal_extender u2(.in(seIn), .OP_SE(OP_SE), .out(seOut));

	initial begin
		$display("\n---------------------------");
		$display("Teste de integracao (MI - SE)");
		$display("Total de testes: ");
	end
endmodule