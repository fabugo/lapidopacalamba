module data_memory(
			input 				read_file,
			input 				write_file,
			input 				WE,
			input 				CLK,
			input 		[9:0]	ADDRESS,
			input 		[31:0]	DATA,
			output 	reg	[31:0]	Q);

	parameter dim = 1024;

	reg[31:0] ram_mem[0:dim-1];

	always @(posedge CLK) begin
		if(read_file == 1'b1)
			$readmemb("rom.out", ram_mem);
		else if(write_file == 1'b1)
			$writememb("data.out", ram_mem);
		else if (WE == 1'b1)
			ram_mem[ADDRESS] <= DATA;
		else if (WE == 1'b0)
			Q <= ram_mem[ADDRESS];
	end
endmodule
