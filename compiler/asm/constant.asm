;Testes para operações com constante
;Para o teste N, escreve 1 na posicao N da memória, se o teste passar, ou -1, caso contrário

.module constant
.pseg
		ones r14
		zeros r15
		deca r15, r15
		zeros r13

TESTE1:	loadlit r0, 100
		loadlit r1, 200
		loadlit r2, 300

		add r3, r0, r1
		sub r4, r2, r3
		jt.zero END1
		store r13, r15
		j TESTE2
END1:	store r13, r14

TESTE2:	inca r13, r13
		store r13, r15
		lcl r0, LOWBYTE END2
		lch r0, HIGHBYTE END2
		jr r0
		j END
END2:	store r13, r14

END:	j END
.end