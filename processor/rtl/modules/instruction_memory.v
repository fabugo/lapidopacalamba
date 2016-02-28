module instruction_memory(read_file, write_file, WE, CLK, ADDRESS, DATA, Q);
	input	wire 		read_file, write_file, WE, CLK;
	input 	wire[9:0]	ADDRESS;
	input 	wire[31:0]	DATA;
	output 	wire[31:0]	Q;

	parameter dim = 1024;
	reg[31:0] ram_mem[0:dim-1];

	integer i;
	initial
		for(i = 0; i < dim; i = i + 1)
			ram_mem[i] = {32{1'b0}};

	assign Q = ram_mem[ADDRESS];

	always @(posedge CLK)
		if (WE == 1'b1)
			ram_mem[ADDRESS] <= DATA;

	always @(read_file)
		if(read_file == 1'b1)
			$readmemb("data/im.in", ram_mem);

	always @(write_file)
		if(write_file == 1'b1)
			$writememb("data/im.out", ram_mem);
endmodule
