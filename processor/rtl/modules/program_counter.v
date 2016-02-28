//Módulo para o registrador do contador de programa
module program_counter(in, W_PC, CLK, out);

	input 	wire[31:0]	in;
	input 	wire		W_PC, CLK;
	output	reg[31:0] 	out;

	/*	
		Quando W_PC for 1 e o CLK tiver uma borda de subida,
		o valor da entrada é registrado.
	*/
	always @(posedge CLK)
		if(W_PC == 1'b1) 		out <= in;

endmodule