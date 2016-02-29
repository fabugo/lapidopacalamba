//Módulo para o registrador do contador de programa
module program_counter(in, W_PC, CLK, RESET, out);

	input 	wire[31:0]	in;
	input 	wire		W_PC, CLK, RESET;
	output	reg[31:0] 	out;

	/*
		Quando W_PC for 1 e o CLK tiver uma borda de subida,
		o valor da entrada é registrado.
	*/
	always @(posedge CLK or posedge RESET)
		if(RESET) out <= 32'b0;
		else if(W_PC == 1'b1) 		out <= in;

endmodule
