module data_memory(
			input 				read_file,
			input 				write_file,
			input 				WE,
			input 				CLK,
			input 		[9:0]	ADDRESS,
			input 		[31:0]	DATA,
			output 	reg	[31:0]	Q);

integer dim;
initial dim = 1024;

reg[31:0] ram_mem[0:dim-1];
reg[31:0] ram_mem2[0:dim-1];

always @(posedge CLK) begin
	if (read_file == 1'b1)
		ram_mem <= ram_mem2;
	else if (WE == 1'b1 && read_file == 1'b0)
		ram_mem[ADDRESS] <= DATA;
end

always @(posedge CLK) begin
	if (read_file == 1'b1)
		ram_mem <= ram_mem2;
	else if (WE == 1'b1 && read_file == 1'b0)
		ram_mem[ADDRESS] <= DATA;
end
							
Q <= ram_mem[ADDRESS];

le: process(read_file)
file INFILE : TEXT  is in ".../rom.out";
variable DATA_TEMP : STD_LOGIC_VECTOR(31 downto 0);	
variable IN_LINE: LINE;  		
variable index :integer;
begin			 
	if((read_file'event) and (read_file='1')) then
	  index := 0;
	  while NOT(endfile(INFILE)) loop
		readline(INFILE,IN_LINE);	
		hread(IN_LINE, DATA_TEMP);	
		ram_mem2(index) <= DATA_TEMP;
		index := index + 1;
	  end loop;
	end if;		
end process le;	


esc: process( write_file)	
file OUTFILE : TEXT  is out ".../data.out";
variable OUT_LINE : LINE;
variable index :integer;
begin
	if((write_file'event) and (write_file='1')) then
	  	index := 0;
		while (index < dim) loop	
		hwrite(OUT_LINE,ram_mem(index));
		writeline(OUTFILE,OUT_LINE);	
		index := index + 1;
	  end loop;
	end if;	
end process esc;
endmodule
