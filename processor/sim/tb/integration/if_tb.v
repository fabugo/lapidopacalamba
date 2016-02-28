module if_tb();
		reg 			CLK,
                 		S_MXPC,
                  		W_PC,
         				read_file,
         				write_file,
         				WE;
        reg     [31:0]	dataALU,
         				DATA;
        wire    [31:0]	nextPCout,
           				instruction;
		IF u1(	.CLK(CLK),
		    	.S_MXPC(S_MXPC),
		    	.W_PC(W_PC),
		    	.read_file(read_file),
		    	.write_file(write_file),
		    	.WE(WE),
		    	.dataALU(dataALU),
		    	.DATA(DATA),
		    	.nextPCout(nextPCout),
		    	.instruction(instruction)
			);

	always #5 	CLK = ~CLK;
	initial begin
		$display("\n---------------------------");
		$display("Teste de integracao (IF)");
				CLK=		0;
				S_MXPC=		0;
				W_PC=		0;
				read_file=	0;
				write_file=	0;
				WE=			0;
				dataALU=	0;
				DATA=		0;
			#100
			read_file = 1;
			#100
			read_file = 0;
		$display("Total de testes: ");
	end
endmodule
