module forward_unit(	input wire [3:0]	ex_RA,
						input wire [3:0]	ex_RB,
						input wire [3:0]	wb_RA,
						input wire [3:0]	wb_RB,

						output reg		 	out_A,
						output reg			out_B);

	always @ (*) begin
		out_A = (ex_RA == wb_RA) ? 1'b1 : 1'b0;
		out_B = (ex_RB == wb_RB) ? 1'b1 : 1'b0;
	end

endmodule
