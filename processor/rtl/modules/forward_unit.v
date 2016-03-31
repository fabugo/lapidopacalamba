module forward_unit(	input 	wire [3:0]	RA,
						input 	wire [3:0]	RB,
						input 	wire [3:0]	WC,
						input 	wire		W_RB,

						output 	reg		 	out_A,
						output 	reg			out_B);

	always @ (*) begin
		out_A = (RA == WC && W_RB) ? 1'b1 : 1'b0; //Se RA == WC e a operação anterior vai escrever em WC
		out_B = (RB == WC && W_RB) ? 1'b1 : 1'b0; //Se RB == WC e a operação anterior vai escrever em WC
	end

endmodule
