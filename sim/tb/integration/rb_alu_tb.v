`include "rtl\\Defines.vh"

module rb_alu_tb();
	reg[3:0] RA, RB, WC;
	reg[31:0] WPC;
	reg W_RB;
	wire[31:0]  PRA, PRB;
	register_bank u1(.RA(RA), .RB(RB), .WC(WC), .WPC(WPC), .W_RB(W_RB), .PRA(PRA), .PRB(PRB));
	
	reg     [4:0]   OP;
    wire    [31:0]  RESULT;
    wire            O, S, C, Z;
	alu u2(.OP(OP), .A(PRA), .B(PRB), .RES(RESULT), .O(O), .S(S), .C(C), .Z(Z));

	integer i;

	initial begin
		$display("\n---------------------------");
		$display("Teste de integracao (RB - ALU)");
		$display("Total de testes: 16");

		//Carrega valores em rb
		W_RB = 1'b1;
		for(i = 0; i < 16; i = i + 1) begin
			#10
			WC = i;
			WPC = i;
		end
		#10

		OP = `ADD; //Configura a ULA para executar soma
		W_RB = 0'b0;
		for(i = 0; i < 15; i = i + 1) begin
			$display("Executando teste %d", i+1);
			RA = i;
			RB = i+1;
			#10

			if(RESULT != (i + (i+1))) $display("-> Erro para as entradas: A: %b, B: %b. Resultado esperado: %d, Resultado Obtido: %d.", PRA, PRB, i + (i+1), RESULT);
		end
	end
endmodule