;Testes para operações lógicas
;Para o teste N, escreve 1 na posicao N da memória, se o teste passar, ou -1, caso contrário

.module logic
.pseg
		loadlit r14, 1
		loadlit r15, -1

		loadlit r0, -1
		zeros r1

TESTE1:	loadlit r13, 0
		and r5, r0, r0
		sub r5, r5, r0
		jt.zero END1
		store r13, r15
		j TESTE2
END1:	store r13, r14

TESTE2:	inca r13, r13
		and r5, r0, r1
		jt.zero END2
		store r13, r15
		j TESTE3
END2:	store r13, r14

TESTE3:	inca r13, r13
		zeros r5
		ones r4
		passb r5, r0
		passa r4, r0
		sub r5, r5, r4
		jt.zero END3
		store r13, r15
		j TESTE4
END3:	store r13, r14


TESTE4:	inca r13, r13
		and r5, r0, r0
		sub r5, r5, r0
		jt.zero END4
		store r13, r15
		j TESTE5
END4:	store r13, r14

TESTE5:	inca r13, r13
		loadlit r5, -1
		nor r5, r5, r5
		jt.zero END5
		store r13, r15
		j TESTE6
END5:	store r13, r14

TESTE6:	inca r13, r13
		loadlit r4, 1
		loadlit r5, 2
		loadlit r6, 3
		or r4, r4, r5
		sub r4, r4, r6
		jt.zero END6
		store r13, r15
		j END
END6:	store r13, r14

END: j END

.end
		andnota r0, r0, r0
		andnotb r0, r0, r0
		xor r0, r0, r0
		nand r0, r0, r0
		xnor r0, r0, r0
		passnota r0, r0
		ornata r0, r0, r0
		passnotb r0, r0, r0
		ornotb r0, r0, r0