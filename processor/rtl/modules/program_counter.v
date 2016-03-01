//Módulo para o registrador do contador de programa
module program_counter(CLK, RESET, in, W_PC, out);

	input 	wire[31:0]	in;
	input 	wire		CLK, RESET, W_PC;
	output	reg[31:0] 	out;

	always @(posedge RESET)
						out <= 32'b0;

	//Quando W_PC for 1 e o CLK tiver uma borda de subida, o valor da entrada é registrado.
	always @(posedge CLK)
		if(W_PC == 1'b1) out <= in;

endmodule
