module register_bank_tb;

	reg[3:0] 	RA, RB, WC;
	reg[31:0] 	WPC;
	reg 		W_RB;
	wire[31:0] 	PRA, PRB;

	register_bank rb(.RA, .RB, .WC, .WPC, .W_RB, .PRB, .PRA);

	integer i;

	reg[31:0] vec[0:15];

	initial begin
		$display("Preenchendo vetor");
		for(i = 0; i < 16; i = i + 1)
			vec[i] = $random;
		$display("vetor cheio\n enchendo banco de registros");
		W_RB = 1'b1;
		for(i = 0; i < 16; i = i + 1)begin
			#1
			WC = i;
			WPC = vec[i];
		end
		$display("banco cheio\n lendo do banco e comparando");
		#1
		W_RB = 1'b0;
		#1
		for(i = 0; i < 15; i = i + 1)begin
			RA = i;
			RB = i+1;
			#1
			if(PRA != vec[i] || PRB != vec[i+1])
				$display("\n>ERRO<\nPRA: %32b\nVEC: %32b\nPRB: %32b\nVEC: %32b",
													   PRA,vec[i],PRB,vec[i+1]);
		end
		$display("fim");
	end
endmodule
