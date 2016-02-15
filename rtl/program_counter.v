module program_counter(in, W_PC, CLK, out);
	input 		in, W_PC, CLK;
	output 		out;

	wire[31:0] 	in;
	wire 		W_PC;

	reg[31:0] 	pc_reg, out;

	always @(posedge CLK) begin
		case (W_PC)
			1'b0:		pc_reg = in;
			1'b1:		out = pc_reg;
		endcase
	end

endmodule