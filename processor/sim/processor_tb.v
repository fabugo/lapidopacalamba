module processor_tb();
	parameter PERIOD = 10;

	reg CLK;
	initial CLK = 1;
	always #(PERIOD/2) CLK = ~CLK;

	reg 		reg_ifid_exmem_RESET;
	reg 		reg_ifid_exmem_ENABLE;
	reg 		reg_exmem_wb_RESET;
	reg 		reg_exmem_wb_ENABLE;

	reg 		pc_RESET;
	reg 		im_RESET;
	reg 		rb_RESET;
	reg 		tf_RESET;
	reg 		dm_RESET;

	reg 		im_read_file;
	reg 		im_write_file;
	reg			im_WE;
	reg [31:0]	im_DATA;
	reg 		dm_read_file;
	reg 		dm_write_file;

	processor processor(.CLK(CLK),
						.reg_ifid_exmem_RESET(reg_ifid_exmem_RESET),
						.reg_ifid_exmem_ENABLE(reg_ifid_exmem_ENABLE),
						.reg_exmem_wb_RESET(reg_exmem_wb_RESET),
						.reg_exmem_wb_ENABLE(reg_exmem_wb_ENABLE),
						.pc_RESET(pc_RESET),
						.im_RESET(im_RESET),
						.rb_RESET(rb_RESET),
						.tf_RESET(tf_RESET),
						.dm_RESET(dm_RESET),
						.im_read_file(im_read_file),
						.im_write_file(im_write_file),
						.im_WE(im_WE),
						.im_DATA(im_DATA),
						.dm_read_file(dm_read_file),
						.dm_write_file(dm_write_file));

	initial begin
		//-------------------- START --------------------
		#(PERIOD/2)
		reg_ifid_exmem_RESET = 0;
		reg_exmem_wb_RESET = 0;
		pc_RESET = 0;
		im_RESET = 0;
		rb_RESET = 0;
		tf_RESET = 0;
		dm_RESET = 0;
		im_read_file = 0;
		im_write_file = 0;
		im_WE = 0;
		im_DATA = 0;
		dm_read_file = 0;
		dm_write_file = 0;
		#1

		//Reset and read memories
		im_RESET = 1;
		dm_RESET = 1;
		#1
		im_RESET = 0;
		dm_RESET = 0;
		dm_read_file = 1;
		im_read_file = 1;
		#(PERIOD-2)
		dm_read_file = 0;
		im_read_file = 0;
		dm_write_file = 0;
		im_write_file = 0;


		#(PERIOD/2)
		//Reset modules and regs
		reg_ifid_exmem_RESET = 1;
		reg_exmem_wb_RESET = 1;
		rb_RESET = 1;
		tf_RESET = 1;
		#1
		reg_ifid_exmem_RESET = 0;
		reg_exmem_wb_RESET = 0;
		pc_RESET = 1;
		rb_RESET = 0;
		tf_RESET = 0;
		#1

		//Enable regs
		pc_RESET = 0;
		reg_ifid_exmem_ENABLE = 1;
		reg_exmem_wb_ENABLE = 1;

		//-----------------------------------------------
		
		#9000;

		im_write_file = 1;
		dm_write_file = 1;
		#PERIOD
		im_write_file = 0;
		dm_write_file = 0;
	end

endmodule
