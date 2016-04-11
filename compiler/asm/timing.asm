;Testes usado para verificar o timming do processador
;Este código executa 43 instruções antes de chegar ao halt, assim
;o tempo de processamento será de 43*clock

.module timming
.pseg
		loadlit r0, 1
		lcl r1, 6329
		lch r1, 1231
		store r0, r1
		load r2, r0
		addinc r3, r1, r2
		loadlit r4, 5
		sub r3, r3, r1
		j L
		
L:		and r3, r3, r0
		or r3, r2, r3
		passb r3, r3
		jt.zero L
		deca r4, r4
		jt.zero HALT
		j L

HALT:	j HALT
.end