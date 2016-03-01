module processor();
	parameter PERIOD = 30;

	reg CLK;
	initial CLK = 0;
	always #(PERIOD/2) CLK = ~CLK;

	reg 		pc_RESET;
	reg 		uc_RESET;
	reg 		im_RESET;
	reg 		rb_RESET;
	reg 		tf_RESET;
	reg 		dm_RESET;
	reg 		rf_RESET;

	wire[31:0]	mxpc_out;
	reg 		im_read_file;
	reg 		im_write_file;
	reg 		dm_read_file;
	reg 		dm_write_file;
	wire[31:0]	im_instruction;

	wire[31:0]	rb_PRA;
	wire[31:0]	rb_PRB;
	wire[31:0]	se_out;
	wire[4:0]	uc_OP_ALU;
	wire[2:0]	uc_OP_TF;
	wire		uc_W_PC;
	wire		uc_W_DM;
	wire		uc_W_IM;
	wire[2:0]	uc_W_RF;
	wire[1:0]	uc_S_MXRB;
	wire		uc_S_MXSE;

	wire 		tf_out;
	wire[31:0]	dm_Q;
	wire[31:0]	alu_result;
	wire 		alu_O;
	wire 		alu_S;
	wire 		alu_C;
	wire 		alu_Z;

	wire[31:0]	mxrb_out;
	wire 		rf_O;
	wire 		rf_S;
	wire 		rf_C;
	wire 		rf_Z;

	IF if_1(.CLK(CLK),
			.alu_result(alu_result),
			.tf_out(tf_out),
			.mxpc_out(mxpc_out),
			.im_RESET(im_RESET),
			.im_read_file(im_read_file),
			.im_write_file(im_write_file),
			.im_DATA(32'b0),
			.uc_W_IM(uc_W_IM),
			.im_instruction(im_instruction),
			.pc_RESET(pc_RESET),
			.uc_W_PC(uc_W_PC));

	ID id(	.CLK(CLK),
			.im_instruction(im_instruction),
			.rb_RESET(rb_RESET),
			.rb_WPC(mxrb_out),
			.rb_PRA(rb_PRA),
			.rb_PRB(rb_PRB),
			.se_out(se_out),
			.uc_RESET(uc_RESET),
			.uc_OP_ALU(uc_OP_ALU),
			.uc_OP_TF(uc_OP_TF),
			.uc_W_PC(uc_W_PC),
			.uc_W_DM(uc_W_DM),
			.uc_W_IM(uc_W_IM),
			.uc_W_RF(uc_W_RF),
			.uc_S_MXRB(uc_S_MXRB),
			.uc_S_MXSE(uc_S_MXSE));

	EX ex(	.CLK(CLK),
			.rb_PRA(rb_PRA),
			.rb_PRB(rb_PRB),
			.se_out(se_out),
			.uc_S_MXSE(uc_S_MXSE),
			.rf_O(rf_O),
			.rf_S(rf_S),
			.rf_C(rf_C),
			.rf_Z(rf_Z),
			.tf_RESET(tf_RESET),
			.tf_cond(im_instruction[14:12]),
			.uc_OP_TF(uc_OP_TF),
			.tf_out(tf_out),
			.dm_RESET(dm_RESET),
			.dm_read_file(dm_read_file),
			.dm_write_file(dm_write_file),
			.uc_W_DM(uc_W_DM),
			.dm_Q(dm_Q),
			.uc_OP_ALU(uc_OP_ALU),
			.alu_result(alu_result),
			.alu_O(alu_O),
			.alu_S(alu_S),
			.alu_C(alu_C),
			.alu_Z(alu_Z));

	WB wb(	.CLK(CLK),
			.mxpc_out(mxpc_out),
			.dm_Q(dm_Q),
			.alu_result(alu_result),
			.uc_S_MXRB(uc_S_MXRB),
			.mxrb_out(mxrb_out),
			.rf_RESET(rf_RESET),
			.alu_O(alu_O),
			.alu_S(alu_S),
			.alu_C(alu_C),
			.alu_Z(alu_Z),
			.uc_W_RF(uc_W_RF),
			.rf_O(rf_O),
			.rf_S(rf_S),
			.rf_C(rf_C),
			.rf_Z(rf_Z));

	initial begin
		//-------------------- START --------------------
		im_RESET = 1;
		dm_RESET = 1;
		#1
		im_RESET = 0;
		dm_RESET = 0;
		dm_read_file = 1;
		im_read_file = 1;
		#(PERIOD-1)
		dm_read_file = 0;
		im_read_file = 0;
		dm_write_file = 0;
		im_write_file = 0;
		
		pc_RESET = 1;
		rb_RESET = 1;
		tf_RESET = 1;
		rf_RESET = 1;
		#1

		uc_RESET = 1;
		pc_RESET = 0;
		rb_RESET = 0;
		tf_RESET = 0;
		rf_RESET = 0;
		#(PERIOD-1)

		//Start machine in 20ps
		uc_RESET = 0;
		//-----------------------------------------------
		
		#120;

		im_write_file = 1;
		dm_write_file = 1;
		#PERIOD
		im_write_file = 0;
		dm_write_file = 0;
	end

endmodule
