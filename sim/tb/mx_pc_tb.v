module mx_pc_tb;

	reg[31:0] 	in_ALU, in_ADD;
	reg 		S_MXPC;
	wire[31:0] 	out;

	mx_pc mx(.in_ALU(in_ALU), .in_ADD(in_ADD), .S_MXPC(S_MXPC), .out(out));
	
	initial begin
		in_ALU = 32'b11111111111111110000000000000000;
		in_ADD = 32'b00000000000000001111111111111111;
		
		S_MXPC = 1'b0;
		#1;
		if(out != in_ALU) $display("ERRO>> Out esperado (ALU): %32b\n Out atual: %32b\n", in_ALU, out);
		
		S_MXPC = 1'b1;
		#1;
		if(out != in_ADD) $display("ERRO>> Out esperado (ADD): %32b\n Out atual: %32b\n", in_ADD, out);		

	end
endmodule