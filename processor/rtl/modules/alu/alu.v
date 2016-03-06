module alu(OP, A, B, result, O, S, C, Z);

	input   wire[4:0]	OP;
	input   wire[31:0]	A, B;
	output  reg [31:0]	result;
	output  reg			O, S, C, Z;

			reg [31:0]	add_A,
						add_B,
						sub_A,
						sub_B;
			wire[31:0]	add_result,
						sub_result;
			reg [31:0]	aux_result;
			wire		add_O,
						add_C,
						sub_O,
						sub_C;
			reg			carryIn,
						borrowIn;

	adder32 add32(.A(add_A), .B(add_B), .carryIn(carryIn), .result(add_result), .carryOut(add_C), .overflow(add_O));

	subtractor32 sub32(.A(sub_A), .B(sub_B), .borrowIn(borrowIn), .result(sub_result), .borrowOut(sub_C), .overflow(sub_O));

	always @(*) begin
		case (OP)
			5'b00000: begin //add c, a, b <=> c = a + b
				add_A 		= A;
				add_B 		= B;
				carryIn 	= 1'b0;
				aux_result 	= add_result;
			end
			5'b00001: begin //addi c, a, b <=> c = a + b + 1
				add_A 		= A;
				add_B 		= B;
				carryIn 	= 1'b1;
				aux_result 	= add_result;
			end
			5'b00011: begin //inca c, a <=> c = a + 1
				add_A 		= A;
				add_B 		= 32'b1;
				carryIn 	= 1'b0;
				aux_result 	= add_result;
			end
			5'b00100: begin //subdec c, a, b <=> c = a - b - 1
				sub_A 		= A;
				sub_B 		= B;
				borrowIn 	= 1'b1;
				aux_result 	= sub_result;
			end
			5'b00101: begin //sub c, a, b <=> c = a - b
				sub_A 		= A;
				sub_B 		= B;
				borrowIn 	= 1'b0;
				aux_result	= sub_result;
			end
			5'b00110: begin //deca c, a <=> c = a - 1
				sub_A 		= A;
				sub_B 		= 32'b1;
				borrowIn 	= 1'b0;
				aux_result 	= sub_result;
			end
			5'b01000: aux_result = A << 1; 		//lsl c, a <=> c = << a
			5'b01001: begin
					aux_result = A >>> 1; 		//asr c, a <=> c = >>> a
					aux_result[31] = aux_result[30]; //O deslocamento não está conservando o bit, mesmo usando >>>.
			end
			5'b10000: aux_result = 32'b0; 		//zeros c <=> c = 0
			5'b10001: aux_result = A & B; 		//and c, a, b <=> c = a & b
			5'b10010: aux_result = (~A) & B;	//andnota c, a, b <=> c = !a & b
			5'b10011: aux_result = B;			//passb c, b <=> c = b
			5'b10100: aux_result = A & (~B);	//andnotb c, a, b <=> c = a & !b
			5'b10101: aux_result = A;			//passa c, a <=> c = a
			5'b10110: aux_result = A ^ B;		//xor c, a, b <=> c = a xor b
			5'b10111: aux_result = A | B;		//or c, a, b <=> c = a | b
			5'b11000: aux_result = ~(A & B);	//nand c, a, b <=> c = !(a & b)
			5'b11001: aux_result = ~(A ^ B);	//xnor c, a, b <=> c = !(a xor b)
			5'b11010: aux_result = (~A);		//passnota c, a <=> c = !a
			5'b11011: aux_result = (~A) | (B);	//ornota c, a, b <=> c = !a | b
			5'b11100: aux_result = (~B);		//passnotb c, b <=> c = !b
			5'b11101: aux_result = A | (~B);	//ornotb c, a, b <=> c = a | !b
			5'b11110: aux_result = ~(A | B);	//nor c, a, b <=> c = !(a | b)
			5'b11111: aux_result = 32'b1;		//ones c <=> c = 1
			5'b01100: aux_result = B;			//loadlit c, Const <=> c = Const
			5'b01101: aux_result = B | (A & 16'hffff0000);			//lcl c, Const <=> c = Const16 | (C&0xffff0000)
			5'b01110: aux_result = (B << 16) | (A & 16'h0000ffff);	//lch c, Const <=> c = (Const16 « 16) | (C&0x0000ffff)
			default : aux_result = OP;
		endcase
		result = aux_result;
	end

	//logica de flags
	always@(*) begin
						Z = (result == 32'b0) ? 1 : 0;
						S = result[31];
		if(OP[4:3] == 2'b01) begin //operacao de deslocamento
			if(OP[0])	C = A[0];
			else		C = A[31];
		end
		else begin //operacoes aritimeticas
			if(OP[2] == 1)begin
						C = sub_C;
						O = sub_O;
			end
			else if(!OP[2])begin
						C = add_C;
						O = add_O;
			end
			else begin
						C = 0;
						O = 0;
			end
		end
	end

endmodule
