//Módulo do banco de registradores  (combinacional e sequencial)
module register_bank(CLK, RESET, RA, RB, WC, WPC, W_RB, PRA, PRB);

	input 	wire[3:0]	RA, RB, WC;
	input 	wire[31:0]	WPC;
	input 	wire		CLK, RESET, W_RB;
	output	wire [31:0]	PRA, PRB;

	reg[31:0] 	registers[0:15];	//16 registradores de 32 bits


	assign 						PRA = registers[RA];
	assign 						PRB = registers[RB];

	always @(posedge RESET) begin
		registers[0] 	<= 32'b0;
		registers[1] 	<= 32'b0;
		registers[2] 	<= 32'b0;
		registers[3] 	<= 32'b0;
		registers[4] 	<= 32'b0;
		registers[5] 	<= 32'b0;
		registers[6] 	<= 32'b0;
		registers[7] 	<= 32'b0;
		registers[8] 	<= 32'b0;
		registers[9] 	<= 32'b0;
		registers[10] 	<= 32'b0;
		registers[11] 	<= 32'b0;
		registers[12] 	<= 32'b0;
		registers[13] 	<= 32'b0;
		registers[14] 	<= 32'b0;
		registers[55] 	<= 32'b0;
	end

	/*
		Quando W_RB for 1 e o CLK tiver uma borda de subida,
		o valor da entrada WPC é registrado no registrador
		indicado por WC.
	*/
	always @(posedge CLK)
		if(W_RB == 1'b1)		registers[WC] <= WPC;

endmodule
