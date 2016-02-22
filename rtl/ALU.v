module alu(
			input   [4:0]       OP,
			input   [31:0]      A,
			input   [31:0]      B,
			output  reg[31:0]   RES,
			output  reg         O,
			output  reg         S,
			output  reg         C,
			output  reg         Z);

	reg [31:0]  add_A,
				add_B,
				sub_A,
				sub_B;
	wire [31:0] add_RES,
				sub_RES;
	reg  [31:0] aux_RES;
	wire        add_O,
				add_C,
				sub_O,
				sub_C;
	reg         Cin,
				Bin;

	adder32 add32(.A(add_A), .B(add_B), .Cin(Cin), .Result(add_RES), .Cout(add_C), .Over(add_O));
	subtractor32 sub32(.A(sub_A), .B(sub_B), .Bin(Bin), .Result(sub_RES), .Bout(sub_C), .Over(sub_O));

	always @(*)begin
		case (OP)
			5'b00000: begin
				add_A 	= A;
				add_B 	= B;
				Cin 	= 1'b0;
				aux_RES = add_RES;
			end
			5'b00001: begin
				add_A 	= A;
				add_B 	= B;
				Cin 	= 1'b1;
				aux_RES = add_RES;
			end
			5'b00011: begin
				add_A 	= A;
				add_B 	= 32'b1;
				Cin 	= 1'b0;
				aux_RES = add_RES;
			end
			5'b00100:begin
				sub_A 	= A;
				sub_B 	= B;
				Bin = 1'b1;
				aux_RES = sub_RES;
			end
			5'b00101:begin
				sub_A 	= A;
				sub_B 	= B;
				Bin = 1'b0;
				aux_RES = sub_RES;
			end
			5'b00110:begin
				sub_A 	= A;
				sub_B 	= 32'b1;
				Bin 	= 1'b0;
				aux_RES = sub_RES;
			end
			5'b01000: aux_RES = A << 1;
			5'b01001: aux_RES = A >> 1;
			5'b10000: aux_RES = 32'b0;
			5'b10001: aux_RES = A & B;
			5'b10010: aux_RES = (~A) & B;
			5'b10011: aux_RES = B;
			5'b10100: aux_RES = A & (~B);
			5'b10101: aux_RES = A;
			5'b10110: aux_RES = A ^ B;
			5'b10111: aux_RES = A | B;
			5'b11000: aux_RES = ~(A & B);
			5'b11001: aux_RES = ~(A ^ B);
			5'b11010: aux_RES = (~A);
			5'b11011: aux_RES = (~A) | (B);
			5'b11100: aux_RES = (~B);
			5'b11101: aux_RES = A | (~B);
			5'b11110: aux_RES = ~(A | B);
			5'b11111: aux_RES = 32'b1;
			default : aux_RES = OP;
		endcase
	end

	always@(*) begin
						RES = aux_RES;
		//logica de flags
		if(!RES)		Z = 1;
		else			Z = 0;
						S = RES[31];
		if(OP[4:3] == 2'b01)begin//operacao de deslocamento
			if(OP[0])	C = A[0];
			else		C = A[31];
		end
		else begin//operacoes aritimeticas
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
