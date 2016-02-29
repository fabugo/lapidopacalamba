module register_flags_tb;

	reg 			in_O, in_S, in_C, in_Z, CLK;
	reg [2:0] 		W_RF;
	wire			out_O, out_S, out_C, out_Z;
	register_flags rf(.in_O(in_O), .in_S(in_S), .in_C(in_C), .in_Z(in_Z), .W_RF(W_RF), .CLK(CLK), .out_O(out_O), .out_S(out_S), .out_C(out_C), .out_Z(out_Z));
	
	initial begin
		$display("\n---------------------------");
		$display("Teste do Registrador de Flags");
		$display("Total de testes: 6");

		CLK = 0;
		in_O = 1'b0;
		in_S = 1'b0;
		in_C = 1'b0;
		in_Z = 1'b0;
		W_RF = 3'b100;
		#1;
		CLK = 1;
		#1
		$display("Executando teste 1 (O=%1b, S=%1b, C=%1b, Z=%1b, W_RF=%3b): %s",
				in_O, in_S, in_C, in_Z, W_RF, ((out_O != in_O) || (out_S != in_S) || (out_C != in_C) || (out_Z != in_Z)) ? "Erro   " : "Sucesso");
		if((out_O != in_O) || (out_S != in_S) || (out_C != in_C) || (out_Z != in_Z))
			$display("Saidas esperadas: O=%1b, S=%1b, C=%1b, Z=%1b. Saidas obtidas: O=%1b, S=%1b, C=%1b, Z=%1b", in_O, in_S, in_C, in_Z, out_O, out_S, out_C, out_Z);

		CLK = 0;
		in_O = 1'b1;
		in_S = 1'b1;
		in_C = 1'b1;
		in_Z = 1'b1;
		W_RF = 3'b000;
		#1;
		CLK = 1;
		#1
		$display("Executando teste 2 (O=%1b, S=%1b, C=%1b, Z=%1b, W_RF=%3b): %s",
				in_O, in_S, in_C, in_Z, W_RF, ((out_O != 0) || (out_S != 0) || (out_C != 0) || (out_Z != 0)) ? "Erro   " : "Sucesso");
		if((out_O != 0) || (out_S != 0) || (out_C != 0) || (out_Z != 0))
			$display("Saidas esperadas: O=%1b, S=%1b, C=%1b, Z=%1b. Saidas obtidas: O=%1b, S=%1b, C=%1b, Z=%1b", in_O, in_S, in_C, in_Z, out_O, out_S, out_C, out_Z);

		CLK = 0;
		in_O = 1'b1;
		in_S = 1'b1;
		in_C = 1'b1;
		in_Z = 1'b1;
		W_RF = 3'b001;
		#1;
		CLK = 1;
		#1
		$display("Executando teste 3 (O=%1b, S=%1b, C=%1b, Z=%1b, W_RF=%3b): %s",
				in_O, in_S, in_C, in_Z, W_RF, ((out_O != 0) || (out_S != 0) || (out_C != 0) || (out_Z != in_Z)) ? "Erro   " : "Sucesso");
		if((out_O != 0) || (out_S != 0) || (out_C != 0) || (out_Z != in_Z))
			$display("Saidas esperadas: O=%1b, S=%1b, C=%1b, Z=%1b. Saidas obtidas: O=%1b, S=%1b, C=%1b, Z=%1b", in_O, in_S, in_C, in_Z, out_O, out_S, out_C, out_Z);

		CLK = 0;
		in_O = 1'b0;
		in_S = 1'b1;
		in_C = 1'b1;
		in_Z = 1'b1;
		W_RF = 3'b010;
		#1;
		CLK = 1;
		#1
		$display("Executando teste 4 (O=%1b, S=%1b, C=%1b, Z=%1b, W_RF=%3b): %s",
				in_O, in_S, in_C, in_Z, W_RF, ((out_O != 0) || (out_S != in_S) || (out_C != 0) || (out_Z != in_Z)) ? "Erro   " : "Sucesso");
		if((out_O != 0) || (out_S != in_S) || (out_C != 0) || (out_Z != in_Z))
			$display("Saidas esperadas: O=%1b, S=%1b, C=%1b, Z=%1b. Saidas obtidas: O=%1b, S=%1b, C=%1b, Z=%1b", in_O, in_S, in_C, in_Z, out_O, out_S, out_C, out_Z);

		CLK = 0;
		in_O = 1'b1;
		in_S = 1'b0;
		in_C = 1'b1;
		in_Z = 1'b1;
		W_RF = 3'b011;
		#1;
		CLK = 1;
		#1
		$display("Executando teste 5 (O=%1b, S=%1b, C=%1b, Z=%1b, W_RF=%3b): %s",
				in_O, in_S, in_C, in_Z, W_RF, ((out_O != 0) || (out_S != in_S) || (out_C != in_C) || (out_Z != in_Z)) ? "Erro   " : "Sucesso");
		if((out_O != 0) || (out_S != in_S) || (out_C != in_C) || (out_Z != in_Z))
			$display("Saidas esperadas: O=%1b, S=%1b, C=%1b, Z=%1b. Saidas obtidas: O=%1b, S=%1b, C=%1b, Z=%1b", in_O, in_S, in_C, in_Z, out_O, out_S, out_C, out_Z);

		CLK = 0;
		in_O = 1'b0;
		in_S = 1'b1;
		in_C = 1'b0;
		in_Z = 1'b1;
		W_RF = 3'b100;
		#1;
		CLK = 1;
		#1
		$display("Executando teste 6 (O=%1b, S=%1b, C=%1b, Z=%1b, W_RF=%3b): %s",
				in_O, in_S, in_C, in_Z, W_RF, ((out_O != in_O) || (out_S != in_S) || (out_C != in_C) || (out_Z != in_Z)) ? "Erro   " : "Sucesso");
		if((out_O != in_O) || (out_S != in_S) || (out_C != in_C) || (out_Z != in_Z))
			$display("Saidas esperadas: O=%1b, S=%1b, C=%1b, Z=%1b. Saidas obtidas: O=%1b, S=%1b, C=%1b, Z=%1b", in_O, in_S, in_C, in_Z, out_O, out_S, out_C, out_Z);
	end
endmodule
