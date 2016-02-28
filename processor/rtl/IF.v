module IF(	input 	wire 		CLK,

			input	wire 		S_MXPC,
			input	wire 		W_PC,
			input	wire 		read_file,
			input	wire 		write_file,
			input	wire 		WE,
			input	wire[31:0]	dataALU,
			input	wire[31:0]	DATA,
			output	wire[31:0]	nextPCout,
			output	wire[31:0]	instruction);

	wire [31:0] nextPCin;
	wire [31:0] pcpp;//pc+1
	wire [31:0] currentPC;

	assign nextPCout = nextPCin;

	mx_pc mxpc(.in_ALU(dataALU),
				.in_ADD(pcpp),
				.S_MXPC(S_MXPC),
				.out(nextPCin));

	adder32 add(.A(currentPC),
				.B(32'b1),
				.Cin(1'b0),
				.Result(pcpp),
				.Cout(),
				.Over());

	program_counter pc( .in(nextPCin),
						.W_PC(W_PC),
						.CLK(CLK),
						.out(currentPC));

	instruction_memory im(	.read_file(read_file),
							.write_file(write_file),
							.WE(WE),
							.CLK(CLK),
							.ADDRESS(currentPC),
							.DATA(DATA),
							.Q(instruction));

endmodule
