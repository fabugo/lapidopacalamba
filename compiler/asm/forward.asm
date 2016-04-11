;Testes de adiantamento de dados
;Para o teste N, escreve -1 na posicao N da memória se o teste não passar
.module forward
.pseg
	loadlit r2, 34
	loadlit r1, 8
	loadlit r0, 1
	loadlit r15, -1

	;Sucessivas operações aritméticas
	TESTE1:	add r0, r0, r1	;r0 = 9
			add r0, r1, r0	;r0 = 17
			add r0, r0, r0	;r0 = 34
			sub r2, r2, r0
			jt.zero TESTE2	;if(r0 != 34)
			loadlit r14, 0
			store r14, r15

	;Escrita da memória de um valor que ainda não foi armazenado no banco de reg
	TESTE2:	loadlit r1, 15
			add r0, r0, r0	;r0 = 68
			store r1, r0	;MEM[15] = 68
			load r2, r1		;r2 = MEM[15]
			sub r2, r2, r0
			jt.zero TESTE3	;if(r2 != r0)
			loadlit r14, 1
			store r14, r15

	;Leitura da memória utilizando um reg de endereço que ainda não está pronto
	TESTE3:	loadlit r3, 35
			loadlit r1, 20
			sub r1, r3, r1	;r1 = 15
			load r2, r1		;r2 = MEM[15]
			sub r2, r2, r0
			jt.zero TESTE4	;if(r2 != r0)
			loadlit r14, 2
			store r14, r15

	;jal utilizando um reg de endereço que ainda não está pronto
	TESTE4:	jt.zero TESTE5
			loadlit r14, 3
			store r14, r15

	;jr utilizando um reg de endereço que ainda não está pronto
	TESTE5: jt.zero FIM
			loadlit r14, 4
			store r14, r15

	FIM: j FIM
.end