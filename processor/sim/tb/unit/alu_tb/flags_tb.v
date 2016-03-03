`include "rtl\\Defines.vh"
module flags_tb;
	reg	 [4:0]   OP;
	reg	 [31:0]  A,
					B;
	reg			R_ALU;
	wire	[31:0]  RES;
	wire			O,
					S,
					C,
					Z;
	reg			 FLAG_ESPERADA;
	alu u1( .OP(OP),
			.A(A),
			.B(B),
			.R_ALU(R_ALU),
			.RES(RES),
			.O(O),
			.S(S),
			.C(C),
			.Z(Z));
	integer i,pass,erro;
	parameter loops = 99999;
	initial begin
		erro = 0; pass = 0;
		$display("Executando %d testes para Flags de Sinal",loops);
		for(i=0;i<loops;i=i+1)begin
			A = $random;
			B = $random;
			OP = $random;
			while(OP == `PASSB || OP == `ONES)
				OP = $random;
			#10
			FLAG_ESPERADA = RES[31];
			if(S != FLAG_ESPERADA)begin
				$display("%d: ERRO!\nOP: %d\nA: %d\nB: %d\nFlag Esperada: %d\nSignal: %d",i,OP,A,B,FLAG_ESPERADA,S);
				erro = erro +1;
			end
			else pass = pass +1;
		end
		if(!erro)   $display("Ta tranquilo, ta favoravel");
		else		$display("\n\nVish.exe");
	end
	/*Testes por vetores
	[70:0]
		OP	  -> 70:66
		A	   -> 65:34
		B	   -> 33:2
		FLAG_ESPERADA   -> 1
		FRout   -> 0

	*/
	reg [70:0] vec [0:20];
	initial begin
		$readmemb ("vectorZero.in",vec);
		erro = 0; pass = 0;
		$display("Executando %d testes para Flags Zero",loops);
		for(i=0;i<loops;i=i+1)begin
			OP	= vec [i] [69:65];
			A	 = vec [i] [64:33];
			B	 = vec [i] [32:1];
			FLAG_ESPERADA = vec [i] [0];
			#10
			if(S != FLAG_ESPERADA)begin
				$display("%d: ERRO!\nOP: %d\nA: %d\nB: %d\nFlag Esperada: %d\nSignal: %d",i,OP,A,B,FLAG_ESPERADA,S);
				erro = erro +1;
			end
			else pass = pass +1;
		end
		if(!erro)   $display("Ta tranquilo, ta favoravel");
		else		$display("\n\nVish.exe");
	end
endmodule
