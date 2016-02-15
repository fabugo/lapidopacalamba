module mx_se_tb;

	reg[31:0] 	in_RB, in_SE;
	reg 		S_MXSE;
	wire[31:0] 	out;

	mx_se mx(.in_RB(in_RB), .in_SE(in_SE), .S_MXSE(S_MXSE), .out(out));
	
	initial begin
		in_RB = 32'b11111111111111110000000000000000;
		in_SE = 32'b00000000000000001111111111111111;
		
		S_MXSE = 1'b0;
		#1;
		if(out != in_SE) $display("ERRO>> Out esperado (SE): %32b\n Out atual: %32b\n", in_SE, out);		

		S_MXSE = 1'b1;
		#1;
		if(out != in_RB) $display("ERRO>> Out esperado (RB): %32b\n Out atual: %32b\n", in_RB, out);

	end
endmodule