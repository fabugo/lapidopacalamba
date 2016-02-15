module register_bank(RA, RB, WC, WPC, W_RB, PRB, PRA);
	input RA, RB, WC, WPC, W_RB;
	output PRA, PRB;

	wire[3:0] RA, RB, WC;
	wire[31:0] WPC;
	reg[31:0] PRA, PRB;
	wire W_RB;

	reg[31:0] registers[0:15];

	always @(W_RB) begin
		if (W_RB) begin
			registers[WC] = WPC;
		end else  begin
			PRA = registers[RA];
			PRB = registers[RB];
		end
	end

endmodule