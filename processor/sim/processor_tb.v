module processor_tb();
	parameter PERIOD = 30;

	reg CLK;
	initial CLK = 0;
	always #(PERIOD/2) CLK = ~CLK;

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
		pc_RESET = 0;
		rb_RESET = 0;
		tf_RESET = 0;
		im_read_file = 0;
		im_write_file = 0;
		im_WE = 0;
		im_DATA = 0;
		dm_read_file = 0;
		dm_write_file = 0;

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
		#1

		pc_RESET = 0;
		rb_RESET = 0;
		tf_RESET = 0;
		#(PERIOD-1)
		//-----------------------------------------------
		
		#100000;

		im_write_file = 1;
		dm_write_file = 1;
		#PERIOD
		im_write_file = 0;
		dm_write_file = 0;
	end

endmodule
