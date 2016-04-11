.module flags
.pseg
        ; Testa flags
        ;       
	; r0 points to ARR1
    lcl		r0, LOWBYTE ARR1
    lch		r0, HIGHBYTE ARR1
	zeros	r1
	deca	r2,r1	;r2 = 0-1
	store	r0,r2	;ARR1[0] = -1
	inca    r0,r0	
	store	r0,r2	;ARR1[1] = -1
	inca    r0,r0
	store	r0,r2	;ARR1[2] = -1
	inca    r0,r0
	store	r0,r2	;ARR1[3] = -1
	inca    r0,r0
	store	r0,r2	;ARR1[4] = -1
	inca    r0,r0
	store	r0,r2	;ARR1[5] = -1
	inca    r0,r0
	store	r0,r2	;ARR1[6] = -1
	inca    r0,r0
	store	r0,r2	;ARR1[7] = -1
	deca	r0,r0
	deca	r0,r0
	deca	r0,r0
	deca	r0,r0
	deca	r0,r0
	deca	r0,r0
	deca	r0,r0	;r0 = &ARR1
	passa	r3,r1 	;r3 = 0
	jt.zero L1
	nop
	store	r0,r1	;ARR1[0] = 0
L1:	inca	r0,r0	;r0 = &ARR1[1]
	passb	r3,r1	;r3 = 0
	jf.zero L2
	nop
	store	r0,r1	;ARR1[1] = 0
L2:	inca	r0,r0	;r0 = &ARR1[2]
	zeros	r3		;r3 = 0
	deca	r3,r3	;r3 = -1
	inca	r3,r3	;r3 = 0
	jt.carry L31
	nop
	store	r0,r1	;ARR1[2] = 0
L31:	jf.overflow L3
	nop
	inca	r0,r0	;r0 = &ARR1[3]
	store	r0,r1	;ARR1[3] = 0
	deca	r0,r0	;r0 = &ARR1[2]
L3:	inca	r0,r0	;r0 = &ARR1[3]
	inca	r0,r0	;r0 = &ARR1[4]
	lcl	r3,65535
	lch	r3,32767
	inca	r3,r3
	jt.overflow L4
	nop
	store	r0,r1	;ARR1[4] = 0
L4:	inca	r0,r0	;r0 = &ARR1[5]
	asr	r2,r2
        inca    r2,r2
	jt.zero L5
	nop
	store	r0,r1	;ARR1[5] = 0
L5:	inca	r0,r0	;r0 = &ARR1[6]
        deca    r2,r2
	lcl	r3,0
	lch	r3,32768
        subdec  r3,r3,r1
	jt.overflow L6
	nop
	store	r0,r1	;ARR1[6] = 0
L6:	inca	r0,r0	;r0 = &ARR1[7]
        passnota r2,r2
	jt.zero HALT
	nop
	store	r0,r1	;ARR1[7] = 0
HALT:   j HALT
        nop
	;; 
.dseg
ARR1:
        .word  0               ; errou flag ZERO 	passa 		(FFFF->0)
        .word  0               ; errou flag ZERO 	passb 		(FFFF->0)
        .word  0               ; errou flag CARRY 	inca 		(FFFF->0)
        .word  0               ; errou flag OVERFLOW 	inca 		(FFFF->0)
        .word  0               ; errou flag OVERFLOW 	inca 		(FFFF->0)
        .word  0               ; errou flag ZERO 	asr+ inca  	(FFFF->0)
        .word  0               ; errou flag OVERFLOW 	subdeca  	(FFFF->0)
        .word  0               ; errou flag ZERO 	passnota  	(FFFF->0)
.end