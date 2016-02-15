module mx_rb_tb;

	reg[31:0] 	in_PC, in_DM, in_ALU;
	reg 		S_MXRB;
	wire[31:0] 	out;

	mx_rb mx(.in_PC(in_PC), .in_DM(in_DM), .in_ALU(in_ALU), .S_MXRB(S_MXRB), .out(out));
	
	initial begin
		in_PC = 32'b11111111111111110000000000000000;
		in_DM = 32'b00000000000000001111111111111111;
		in_ALU = 32'b11111111111111111111111111111111;

		
		S_MXRB = 2'b00;
		#1;
		if(out != in_PC) $display("ERRO>> Out esperado (PC): %32b\n Out atual: %32b\n", in_PC, out);		

		S_MXRB = 2'b01;
		#1;
		if(out != in_DM) $display("ERRO>> Out esperado (DM): %32b\n Out atual: %32b\n", in_DM, out);

		S_MXRB = 2'b10;
		#1;
		if(out != in_ALU) $display("ERRO>> Out esperado (ALU): %32b\n Out atual: %32b\n", in_ALU, out);

	end
endmodule