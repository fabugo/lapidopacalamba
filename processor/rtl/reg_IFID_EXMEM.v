module reg_IFID_EXMEM(	input 	wire 		CLK,
						input	wire		RESET,
						input	wire		ENABLE,

						input	wire[3:0]	in_WC,
						input	wire[31:0]	in_PC,
						input	wire[31:0]	in_PRA,
						input	wire[31:0]	in_PRB,
						input 	wire		in_S_MXSE,
						input 	wire[4:0]	in_OP_ALU,
						input 	wire		in_W_DM,
						input 	wire[1:0]	in_S_MXRB,
						input 	wire		in_W_RB,
						input 	wire[2:0]	in_W_RF,

						output	reg	[3:0]	out_WC,
						output	reg	[31:0]	out_PC,
						output	reg	[31:0]	out_PRA,
						output	reg	[31:0]	out_PRB,
						output 	reg	[31:0]	out_se_out,
						output 	reg 		out_S_MXSE,
						output 	reg [4:0]	out_OP_ALU,
						output 	reg 		out_W_DM,
						output 	reg [1:0]	out_S_MXRB,
						output 	reg 		out_W_RB,
						output 	reg [2:0]	out_W_RF);

always @(posedge RESET)
						out_WC 		<= 4'b0;
						out_PC 		<= 31'b0;
						out_PRA 	<= 31'b0;
						out_PRB 	<= 31'b0;
						out_se_out 	<= 31'b0;
						out_S_MXSE	<= 1'b1;
						out_OP_ALU	<= 5'b10011; //passb
						out_W_DM	<= 1'b0;
						out_S_MXRB	<= 2'b0;
						out_W_RB	<= 1'b0;
						out_W_RF	<= 3'b0;

	always @(posedge CLK)
		if(ENABLE == 1'b1) begin
						out_WC 		<= in_WC;
						out_PC 		<= in_PC;
						out_PRA 	<= in_PRA;
						out_PRB 	<= in_PRB;
						out_se_out 	<= in_se_out;
						out_S_MXSE	<= in_S_MXSE;
						out_OP_ALU	<= in_OP_ALU;
						out_W_DM	<= in_W_DM;
						out_S_MXRB	<= in_S_MXRB;
						out_W_RB	<= in_W_RB;
						out_W_RF	<= in_W_RF;
		end
		
endmodule
