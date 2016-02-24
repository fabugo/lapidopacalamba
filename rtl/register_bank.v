module register_bank(
			input 	wire[3:0]	RA,
			input 	wire[3:0]	RB,
			input 	wire[3:0]	WC,
			input 	wire[31:0]	WPC,
			input 	wire		W_RB,
			output	reg[31:0]	PRA,
			output	reg[31:0]	PRB);

	reg[31:0] 	registers[0:15];

	always @(*) begin
		case(W_RB) 
			1'b0: begin
					PRA = registers[RA];
					PRB = registers[RB];
			end
			1'b1: 	registers[WC] = WPC;
		endcase
	end

endmodule
