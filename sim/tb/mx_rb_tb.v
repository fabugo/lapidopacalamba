module mx_rb_tb;

	reg[31:0] in;
	reg W_PC;
	wire[31:0] out;

	reg CLK;

	initial CLK = 0;

	always #5 CLK = ~CLK; 

	program_counter pc(.in(in), .W_PC(W_PC), .CLK(CLK), .out(out));

	
	initial begin
		in = 32'b0;
		W_PC = 1'b0;
		#10;
		W_PC = 1'b1;
		#10;
if(in != out) $display("ERRO>> Out esperado: %32b\n Out atual: %32b\n", in, out);
		W_PC = 1'b0;
		#10;

		in = 32'b1;
		W_PC = 1'b0;
		#10;
		W_PC = 1'b1;
		#10;
if(in != out) $display("ERRO>> Out esperado: %32b\n Out atual: %32b\n", in, out);
		W_PC = 1'b0;
		#10;
		
		in = 32'b10;
		W_PC = 1'b0;
		#10;
		W_PC = 1'b1;
		#10;
if(in != out) $display("ERRO>> Out esperado: %32b\n Out atual: %32b\n", in, out);
		W_PC = 1'b0;
		#10;

		in = 32'b100;
		W_PC = 1'b0;
		#10;
		W_PC = 1'b1;
		#10;
if(in != out) $display("ERRO>> Out esperado: %32b\n Out atual: %32b\n", in, out);
		W_PC = 1'b0;
		#10;

		in = 32'b1000;
		W_PC = 1'b0;
		#10;
		W_PC = 1'b1;
		#10;
if(in != out) $display("ERRO>> Out esperado: %32b\n Out atual: %32b\n", in, out);
		W_PC = 1'b0;
		#10;
	end
endmodule