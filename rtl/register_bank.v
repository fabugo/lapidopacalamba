module register_bank(RA, RB, WC, WPC, W_RB, PRA, PRB);
	input 		RA, RB, WC, WPC, W_RB;
	output 		PRA, PRB;

	wire[3:0] 	RA, RB, WC;
	wire[31:0] 	WPC;
	wire 		W_RB;
	reg[31:0] 	PRA, PRB;

	reg[31:0] 	registers[0:15];

	always @(RA or RB or WC or WPC or W_RB) begin
		if (W_RB == 1'b1) begin
						registers[WC] = WPC;
		end else if(W_RB == 1'b0)  begin
						PRA = registers[RA];
						PRB = registers[RB];
		end
	end

endmodule
