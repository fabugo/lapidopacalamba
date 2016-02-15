module register_bank(W_RB, RA, RB, WC, WPC, PRB, PRA);
	input W_RB;
	input[3:0] RA, RB, WC;
	input[31:0] WPC;
	output[31:0] PRA, PRB;

	wire W_RB, RA, RB, WC, WPC;
	reg PRA, PRB;

	reg [31:0] registers[0:15];

	always @(W_RB) begin
		if (W_RB) begin
			assign registers[WC] = WPC;
		end else  begin
			assign PRA = registers[RA];
			assign PRB = registers[RB];
		end
	end

endmodule