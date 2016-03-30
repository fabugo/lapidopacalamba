//Módulo para o registrador do contador de programa
module program_counter(CLK, RESET, in, out);

	input 	wire[31:0]	in;
	input 	wire		CLK, RESET;
	output	reg[31:0] 	out;

	always @(posedge RESET)
		out <= 32'b0;

	always @(posedge CLK)
		out <= in;

endmodule
