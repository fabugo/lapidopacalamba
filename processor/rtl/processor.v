module processor(	input 	wire 		CLK,

					input	wire 		reg_ifid_exmem_RESET,
					input	wire 		reg_ifid_exmem_ENABLE,
					input	wire 		reg_exmem_wb_RESET,
					input	wire 		reg_exmem_wb_ENABLE,
	
					input	wire 		pc_RESET,
					input	wire 		im_RESET,
					input	wire 		rb_RESET,
					input	wire 		tf_RESET,
					input	wire 		dm_RESET,

					input	wire 		im_read_file,
					input	wire 		im_write_file,
					input	wire 		im_WE,
					input	wire[31:0]	im_DATA,
					input	wire 		dm_read_file,
					input	wire 		dm_write_file);

	//IF-ID
	wire[3:0]	ifid_RA;
	wire[3:0]	ifid_RB;
	wire[3:0]	ifid_WC;
	wire[31:0]	ifid_PC;
	wire[31:0]	ifid_PRA;
	wire[31:0]	ifid_PRB;
	wire[31:0]	ifid_se_out;
	wire		ifid_S_MXSE;
	wire[4:0]	ifid_OP_ALU;
	wire		ifid_W_DM;
	wire[1:0]	ifid_S_MXRB;
	wire		ifid_W_RB;

	//reg IF-ID_EX-MEM
	wire[3:0]	reg_ifid_exmem_RA;
	wire[3:0]	reg_ifid_exmem_RB;
	wire[3:0]	reg_ifid_exmem_WC;
	wire[31:0]	reg_ifid_exmem_PC;
	wire[31:0]	reg_ifid_exmem_PRA;
	wire[31:0]	reg_ifid_exmem_PRB;
	wire[31:0]	reg_ifid_exmem_se_out;
	wire		reg_ifid_exmem_S_MXSE;
	wire[4:0]	reg_ifid_exmem_OP_ALU;
	wire		reg_ifid_exmem_W_DM;
	wire[1:0]	reg_ifid_exmem_S_MXRB;
	wire		reg_ifid_exmem_W_RB;

	//EX-MEM
	wire[3:0]	exmem_RA;
	wire[3:0]	exmem_RB;
	wire[3:0]	exmem_WC;
	wire[31:0]	exmem_PC;
	wire[31:0]	exmem_PR;
	wire[31:0]	exmem_alu_res;
	wire[3:0]	exmem_flags;
	wire[1:0]	exmem_S_MXRB;
	wire		exmem_W_RB;

	//reg EX-MEM_WB
	wire[3:0]	reg_exmem_wb_RA;
	wire[3:0]	reg_exmem_wb_RB;
	wire[3:0]	reg_exmem_wb_WC;
	wire[31:0]	reg_exmem_wb_PC;
	wire[31:0]	reg_exmem_wb_PR;
	wire[31:0]	reg_exmem_wb_alu_res;
	wire[1:0]	reg_exmem_wb_S_MXRB;
	wire		reg_exmem_wb_W_RB;

	//WB
	wire[31:0]	wb_WPC;
	wire		wb_W_RB;

	IF_ID if_id(					.CLK(CLK),
									.pc_RESET(pc_RESET),
									.im_RESET(im_RESET),
									.im_read_file(im_read_file),
									.im_write_file(im_write_file),
									.im_WE(im_WE),
									.im_DATA(im_DATA),
									.rb_RESET(rb_RESET),
									.tf_RESET(tf_RESET),
									.in_flags(exmem_flags),
									.in_WPC(wb_WPC),
									.in_W_RB(wb_W_RB),
									.out_WC(ifid_WC),
									.out_RA(ifid_RA),
									.out_RB(ifid_RB),
									.out_PC(ifid_PC),
									.out_PRA(ifid_PRA),
									.out_PRB(ifid_PRB),
									.out_se_out(ifid_se_out),
									.out_S_MXSE(ifid_S_MXSE),
									.out_OP_ALU(ifid_OP_ALU),
									.out_W_DM(ifid_W_DM),
									.out_S_MXRB(ifid_S_MXRB),
									.out_W_RB(ifid_W_RB));

	reg_IFID_EXMEM reg_ifid(	.CLK(CLK),
									.RESET(reg_ifid_exmem_RESET),
									.ENABLE(reg_ifid_exmem_ENABLE),
									.in_RA(ifid_RA),
									.in_RB(ifid_RB),
									.in_WC(ifid_WC),
									.in_PC(ifid_PC),
									.in_PRA(ifid_PRA),
									.in_PRB(ifid_PRB),
									.in_se_out(ifid_se_out),
									.in_S_MXSE(ifid_S_MXSE),
									.in_OP_ALU(ifid_OP_ALU),
									.in_W_DM(ifid_W_DM),
									.in_S_MXRB(ifid_S_MXRB),
									.in_W_RB(ifid_W_RB),
									.out_RA(reg_ifid_exmem_RA),
									.out_RB(reg_ifid_exmem_RB),
									.out_WC(reg_ifid_exmem_WC),
									.out_PC(reg_ifid_exmem_PC),
									.out_PRA(reg_ifid_exmem_PRA),
									.out_PRB(reg_ifid_exmem_PRB),
									.out_se_out(reg_ifid_exmem_se_out),
									.out_S_MXSE(reg_ifid_exmem_S_MXSE),
									.out_OP_ALU(reg_ifid_exmem_OP_ALU),
									.out_W_DM(reg_ifid_exmem_W_DM),
									.out_S_MXRB(reg_ifid_exmem_S_MXRB),
									.out_W_RB(reg_ifid_exmem_W_RB));

	EX_MEM ex_mem(					.CLK(CLK),
									.dm_RESET(dm_RESET),
									.dm_read_file(dm_read_file),
									.dm_write_file(dm_write_file),
									.in_mxrb(wb_WPC),
									.in_wb_RA(reg_exmem_wb_RA),
									.in_wb_RB(reg_exmem_wb_RB),
									.in_ex_RA(reg_ifid_exmem_RA),
									.in_ex_RB(reg_ifid_exmem_RB),
									.in_WC(reg_ifid_exmem_WC),
									.in_PC(reg_ifid_exmem_PC),
									.in_PRA(reg_ifid_exmem_PRA),
									.in_PRB(reg_ifid_exmem_PRB),
									.in_se_out(reg_ifid_exmem_se_out),
									.in_S_MXSE(reg_ifid_exmem_S_MXSE),
									.in_OP_ALU(reg_ifid_exmem_OP_ALU),
									.in_W_DM(reg_ifid_exmem_W_DM),
									.in_S_MXRB(reg_ifid_exmem_S_MXRB),
									.in_W_RB(reg_ifid_exmem_W_RB),
									.out_RA(exmem_RA),
									.out_RB(exmem_RB),
									.out_WC(exmem_WC),
									.out_PC(exmem_PC),
									.out_PR(exmem_PR),
									.out_alu_res(exmem_alu_res),
									.out_flags(exmem_flags),
									.out_S_MXRB(exmem_S_MXRB),
									.out_W_RB(exmem_W_RB));

	reg_EXMEM_WB reg_exmem(		.CLK(CLK),
									.RESET(reg_exmem_wb_RESET),
									.ENABLE(reg_exmem_wb_ENABLE),
									.in_RA(exmem_RA),
									.in_RB(exmem_RB),
									.in_WC(exmem_WC),
									.in_PC(exmem_PC),
									.in_PR(exmem_PR),
									.in_alu_res(exmem_alu_res),
									.in_S_MXRB(exmem_S_MXRB),
									.in_W_RB(exmem_W_RB),
									.out_RA(reg_exmem_wb_RA),
									.out_RB(reg_exmem_wb_RB),
									.out_WC(reg_exmem_wb_WC),
									.out_PC(reg_exmem_wb_PC),
									.out_PR(reg_exmem_wb_PR),
									.out_alu_res(reg_exmem_wb_alu_res),
									.out_S_MXRB(reg_exmem_wb_S_MXRB),
									.out_W_RB(reg_exmem_wb_W_RB));

	WB wb(							.in_WC(reg_exmem_wb_WC),
									.in_PC(reg_exmem_wb_PC),
									.in_PR(reg_exmem_wb_PR),
									.in_alu_res(reg_exmem_wb_alu_res),
									.in_S_MXRB(reg_exmem_wb_S_MXRB),
									.in_W_RB(reg_exmem_wb_W_RB),
									.out_WPC(wb_WPC),
									.out_W_RB(wb_W_RB));

endmodule