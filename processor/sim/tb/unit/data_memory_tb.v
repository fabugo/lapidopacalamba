module data_memory_tb;
	reg CLK;
	reg[9:0] ADDRESS;
	reg[31:0] DATA;
	wire[31:0] Q;
	reg read_file, write_file, WE;
	data_memory dm(.read_file(read_file), .write_file(write_file), .WE(WE), .CLK(CLK), .ADDRESS(ADDRESS), .DATA(DATA), .Q(Q));
	
	parameter dim = 1024;

	reg[31:0] DATA_TMP;
	integer index;
	initial begin 
		write_file <= 1'b0;
		read_file <= 1'b0;	
		CLK <= 1'b0;
		
		//le o arquivo rom.out para a memoria
		#1
		read_file <= 1'b1;
		#1
		CLK <= 1'b1;
		#100
		read_file <= 1'b0;
		CLK <= 1'b0;
		#1

		index = 0;
		while (index < dim) begin
			//le a posicao da memoria dada por 'index' e coloca em DATA_TMP
			WE <= 1'b0;
			ADDRESS <= index;
			CLK <= 1'b1;
			#1	
			CLK <= 1'b0;		
			#1
			DATA_TMP = Q;		
			//calcula o novo valor a escrever na memoria (incrementa o valor)
			DATA <= DATA_TMP + 1;
			//escreve a posicao de memoria	dada por 'index'
			WE <= 1'b1;
			#1		
			CLK <= 1'b1;
			#1		
			WE <= 1'b0;
			CLK <= 1'b0;	
			#1				
			index = index +1;
		end
		
		//escreve a memoria no arquivo data.out
		write_file <= 1'b1;
		CLK <= 1'b1;
		#100
		CLK <= 1'b0;	  
		write_file <= 1'b0;
		#1000;
	end
endmodule
