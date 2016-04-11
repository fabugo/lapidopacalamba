;Testes para operações aritiméticas
;Para o teste N, escreve 1 na posicao N da memória, se o teste passar, ou -1, caso contrário

.module arithmetic
.pseg
		loadlit r14, 1
		loadlit r15, -1

		loadlit r0, 1
		loadlit r1, 3
		loadlit r2, 5
		loadlit r7, 2
		loadlit r8, -1

TESTE1: loadlit r13, 0
		addinc r4, r0, r1
		sub r4, r4, r2
		jt.zero END1
		store r13, r15
		j TESTE2
END1:	store r13, r14

TESTE2:	loadlit r13, 1
		add r4, r0, r1
		subdec r4, r4, r1
		jt.zero END2
		store r13, r15
		j TESTE3
END2:	store r13, r14

TESTE3:	loadlit r13, 2
		zeros r4
		inca r4, r4
		inca r4, r4
		inca r4, r4
		inca r4, r4
		subdec r4, r2, r4
		jt.zero END3
		store r13, r15
		j TESTE4
END3:	store r13, r14

TESTE4:	loadlit r13, 3
		ones r4
		lsl r4, r4
		sub r4, r4, r7
		jt.zero END4
		store r13, r15
		j TESTE5
END4:	store r13, r14

TESTE5:	loadlit r13, 4
		loadlit r4, -2
		asr r4, r4
		sub r4, r4, r8
		jt.zero END5
		store r13, r15
		j END
END5:	store r13, r14
		asr r0, r0

END:	j END
.end
