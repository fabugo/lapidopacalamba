//Módulo do banco de registradores  (combinacional e sequencial)
module register_bank(RA, RB, WC, WPC, W_RB, CLK, PRA, PRB);
	
	input 	wire[3:0]	RA, RB, WC;
	input 	wire[31:0]	WPC;
	input 	wire		W_RB, CLK;
	output	wire [31:0]	PRA, PRB;
	
	reg[31:0] 	registers[0:15];	//16 registradores de 32 bits


	assign 						PRA = registers[RA];
	assign 						PRB = registers[RB];

	/*	
		Quando W_RB for 1 e o CLK tiver uma borda de subida,
		o valor da entrada WPC é registrado no registrador
		indicado por WC.
	*/
	always @(posedge CLK)
		if(W_RB == 1'b1)		registers[WC] = WPC;

endmodule
