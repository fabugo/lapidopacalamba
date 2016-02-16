module register_bank_tb;

	reg[31:0] ZERO, UM, DOIS, TRES, QUATRO, CINCO, SEIS, SETE, OITO, NOVE, DEZ, ONZE, DOZE, TREZE, QUATORZE, QUINZE;

	parameter	ZERO_32			= 32'b0000,
				UM_32 			= 32'b0001,
				DOIS_32 		= 32'b0010,
				TRES_32 		= 32'b0011,
				QUATRO_32 		= 32'b0100,
				CINCO_32 		= 32'b0101,
				SEIS_32 		= 32'b0110,
				SETE_32 		= 32'b0111,
				OITO_32 		= 32'b1000,
				NOVE_32 		= 32'b1001,
				DEZ_32 			= 32'b1010,
				ONZE_32 		= 32'b1011,
				DOZE_32 		= 32'b1100,
				TREZE_32 		= 32'b1101,
				QUATORZE_32 	= 32'b1110,
				QUINZE_32 		= 32'b1111;

	parameter	ZERO_4			= 4'b0000,
				UM_4 			= 4'b0001,
				DOIS_4 			= 4'b0010,
				TRES_4 			= 4'b0011,
				QUATRO_4 		= 4'b0100,
				CINCO_4 		= 4'b0101,
				SEIS_4 			= 4'b0110,
				SETE_4 			= 4'b0111,
				OITO_4 			= 4'b1000,
				NOVE_4 			= 4'b1001,
				DEZ_4 			= 4'b1010,
				ONZE_4 			= 4'b1011,
				DOZE_4 			= 4'b1100,
				TREZE_4 		= 4'b1101,
				QUATORZE_4 		= 4'b1110,
				QUINZE_4 		= 4'b1111;

	reg[3:0] RA, RB, WC;
	reg[31:0] WPC;
	reg W_RB;

	wire[31:0]  PRA, PRB;

	register_bank rb(.RA(RA), .RB(RB), .WC(WC), .WPC(WPC), .W_RB(W_RB), .PRA(PRA), .PRB(PRB));

	initial begin
		WC 		= ZERO_4;
		WPC 	= ZERO_32;
		#2;
		W_RB 	= 1'b1;
		#2;

		WC 		= UM_4;
		WPC 	= UM_32;
		#2;

		WC 		= DOIS_4;
		WPC 	= DOIS_32;
		#2;

		WC 		= TRES_4;
		WPC 	= TRES_32;
		#2;

		WC 		= QUATRO_4;
		WPC 	= QUATRO_32;
		#2;

		WC 		= CINCO_4;
		WPC 	= CINCO_32;
		#2;

		WC 		= SEIS_4;
		WPC 	= SEIS_32;
		#2;

		WC 		= SETE_4;
		WPC 	= SETE_32;
		#2;

		WC 		= OITO_4;
		WPC 	= OITO_32;
		#2;

		WC 		= NOVE_4;
		WPC 	= NOVE_32;
		#2;

		WC 		= DEZ_4;
		WPC 	= DEZ_32;
		#2;

		WC 		= ONZE_4;
		WPC 	= ONZE_32;
		#2;

		WC 		= DOZE_4;
		WPC 	= DOZE_32;
		#2;

		WC 		= TREZE_4;
		WPC 	= TREZE_32;
		#2;

		WC 		= QUATORZE_4;
		WPC 	= QUATORZE_32;
		#2;

		WC 		= QUINZE_4;
		WPC 	= QUINZE_32;
		#2;


		RA 		= ZERO_4;
		RB 		= UM_4;
		#2;
		W_RB 	= 1'b0;
		#2;
if(PRA != ZERO_4) 	$display("ERRO>> Valor errado em PRA. Esperado: %32b \nPresente: %32b\n", 		ZERO_4, 	PRA);
if(PRB != UM_4) 	$display("ERRO>> Valor errado em PRB. Esperado: %32b \nPresente: %32b\n\n", 	UM_4, 		PRB);

		RA 		= DOIS_4;
		RB 		= TRES_4;
		#2;
if(PRA != DOIS_4) 	$display("ERRO>> Valor errado em PRA. Esperado: %32b \nPresente: %32b\n", 		DOIS_4, 	PRA);
if(PRB != TRES_4) 	$display("ERRO>> Valor errado em PRB. Esperado: %32b \nPresente: %32b\n\n", 	TRES_4, 	PRB);

		RA 		= QUATRO_4;
		RB 		= CINCO_4;
		#2;
if(PRA != QUATRO_4) 	$display("ERRO>> Valor errado em PRA. Esperado: %32b \nPresente: %32b\n", 	QUATRO_4, 	PRA);
if(PRB != CINCO_4) 	$display("ERRO>> Valor errado em PRB. Esperado: %32b \nPresente: %32b\n\n", 	CINCO_4, 	PRB);

		RA 		= SEIS_4;
		RB 		= SETE_4;
		#2;
if(PRA != SEIS_4) 	$display("ERRO>> Valor errado em PRA. Esperado: %32b \nPresente: %32b\n", 		SEIS_4,		PRA);
if(PRB != SETE_4) 	$display("ERRO>> Valor errado em PRB. Esperado: %32b \nPresente: %32b\n\n", 	SETE_4, 	PRB);

		RA 		= OITO_4;
		RB 		= NOVE_4;
		#2;
if(PRA != OITO_4) 	$display("ERRO>> Valor errado em PRA. Esperado: %32b \nPresente: %32b\n", 		OITO_4, 	PRA);
if(PRB != NOVE_4) 	$display("ERRO>> Valor errado em PRB. Esperado: %32b \nPresente: %32b\n\n", 	NOVE_4, 	PRB);

		RA 		= DEZ_4;
		RB 		= ONZE_4;
		#2;
if(PRA != DEZ_4) 	$display("ERRO>> Valor errado em PRA. Esperado: %32b \nPresente: %32b\n", 		DEZ_4, 		PRA);
if(PRB != ONZE_4) 	$display("ERRO>> Valor errado em PRB. Esperado: %32b \nPresente: %32b\n\n", 	ONZE_4, 	PRB);

		RA 		= DOZE_4;
		RB 		= TREZE_4;
		#2;
if(PRA != DOZE_4) 	$display("ERRO>> Valor errado em PRA. Esperado: %32b \nPresente: %32b\n", 		DOZE_4, 	PRA);
if(PRB != TREZE_4) 	$display("ERRO>> Valor errado em PRB. Esperado: %32b \nPresente: %32b\n\n", 	TREZE_4, 	PRB);

		RA 		= QUATORZE_4;
		RB 		= QUINZE_4;
		#2;
if(PRA != QUATORZE_4) 	$display("ERRO>> Valor errado em PRA. Esperado: %32b \nPresente: %32b\n", 	QUATORZE_4, PRA);
if(PRB != QUINZE_4) 	$display("ERRO>> Valor errado em PRB. Esperado: %32b \nPresente: %32b\n\n", QUINZE_4, 	PRB);
	end
//random test

	integer i;

	reg[31:0] vec[0:15];

	initial begin
		$display("Preenchendo vetor");
		for(i = 0; i < 16; i = i + 1)
			vec[i] = $random;
		$display("vetor cheio\n enchendo banco de registros");
		W_RB = 1'b1;
		for(i = 0; i < 16; i = i + 1)begin
			#1
			WC = i;
			WPC = vec[i];
		end
		$display("banco cheio\n lendo do banco e comparando");
		#1
		W_RB = 1'b0;
		#1
		for(i = 0; i < 15; i = i + 1)begin
			RA = i;
			RB = i+1;
			#1
			if(PRA != vec[i] || PRB != vec[i+1])
				$display("\n>ERRO<\nPRA: %32b\nVEC: %32b\nPRB: %32b\nVEC: %32b",
													   PRA,vec[i],PRB,vec[i+1]);
		end
		$display("fim");
	end
endmodule
