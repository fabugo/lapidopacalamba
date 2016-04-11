;Testes das operações de memória
;Para o teste N, escreve 1 na posicao N da memória, se o teste passar, ou -1, caso contrário

.module memory
.pseg
		loadlit r14, 1
		loadlit r15, -1

		loadlit r1, 213
		loadlit r2, 784
		loadlit r3, 481
		loadlit r4, 222

TESTE1:	loadlit r12, 10
		loadlit r13, 0
		loadlit r0, 33
		store r12, r0
		load r5, r12
		sub r5, r5, r0
		jt.zero END1
		store r13, r15
		j TESTE2
END1:	store r13, r14

TESTE2:	inca r12, r12
		inca r13, r13
		loadlit r1, 213
		store r12, r1
		load r5, r12
		sub r5, r5, r1
		jt.zero END2
		store r13, r15
		j TESTE3
END2:	store r13, r14
		
TESTE3:	inca r12, r12
		inca r13, r13
		loadlit r2, 784
		store r12, r2
		load r5, r12
		sub r5, r5, r2
		jt.zero END3
		store r13, r15
		j TESTE4
END3:	store r13, r14
		
TESTE4:	inca r12, r12
		inca r13, r13
		loadlit r3, 481
		store r12, r3
		load r5, r12
		sub r5, r5, r3
		jt.zero END4
		store r13, r15
		j TESTE5
END4:	store r13, r14
		
TESTE5:	inca r12, r12
		inca r13, r13
		loadlit r4, 222
		store r12, r4
		load r5, r12
		sub r5, r5, r4
		jt.zero END5
		store r13, r15
		j END
END5:	store r13, r14

END:	j END
.end