module reg_EXMEM_WB(	input 	wire 		CLK,
						input	wire		RESET,
						input	wire		ENABLE,

						input	wire[3:0]	in_WC,
						input	wire[31:0]	in_PC,
						input 	wire[3:0]	in_RA,
						input 	wire[3:0]	in_RB,
						input	wire[31:0]	in_PR,
						input 	wire[31:0]	in_alu_res,
						input 	wire[3:0]	in_flags,
						input 	wire[1:0]	in_S_MXRB,
						input 	wire		in_W_RB,
						input 	wire[2:0]	in_W_RF,

						output	reg	[3:0]	out_WC,
						output	reg	[31:0]	out_PC,
						input 	reg [3:0]	out_RA,
						input 	reg [3:0]	out_RB,
						output	reg	[31:0]	out_PR,
						output 	reg	[31:0]	out_alu_res,
						output 	reg [3:0]	out_flags,
						output 	reg [1:0]	out_S_MXRB,
						output 	reg 		out_W_RB,
						output 	reg [2:0]	out_W_RF);

always @(posedge RESET)
						out_WC 		<= 4'b0;
						out_PC 		<= 31'b0;
						out_PR 		<= 31'b0;
						out_alu_res <= 31'b0;
						out_flags 	<= 31'b0;
						out_S_MXRB	<= 2'b0;
						out_W_RB	<= 1'b0;
						out_W_RF	<= 3'b0;

	always @(posedge CLK)
		if(ENABLE == 1'b1) begin
						out_WC 		<= in_WC;
						out_PC 		<= in_PC;
						out_PR 	<= in_PR;
						out_alu_res 	<= in_alu_res;
						out_flags 	<= in_flags;
						out_S_MXRB	<= in_S_MXRB;
						out_W_RB	<= in_W_RB;
						out_W_RF	<= in_W_RF;
		end

endmodule
