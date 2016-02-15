module alu(
			input   [4:0]       OP,
			input   [31:0]      A,
			input   [31:0]      B,
			output  reg[31:0]   RES,
			output  reg         O,
			output  reg         S,
			output  reg         C,
			output  reg         Z);

	reg [31:0]  ar_A,
				ar_B;
	wire [31:0] ar_RES;
	reg  [31:0] aux_RES;
	wire        ar_O,
				ar_C;
	reg         ar_Cin;

	adder32 add32(.A(ar_A), .B(ar_B), .Cin(ar_Cin), .Result(ar_RES), .Cout(ar_C), .Over(ar_O));

	always @(*)begin
		case (OP)
			5'b00000: begin
				ar_A 	= A;
				ar_B 	= B;
				ar_Cin 	= 1'b0;
				aux_RES = ar_RES;
			end
			5'b00001: begin
				ar_A 	= A;
				ar_B 	= B;
				ar_Cin 	= 1'b1;
				aux_RES = ar_RES;
			end
			5'b00011: begin
				ar_A 	= A;
				ar_B 	= 32'b1;
				ar_Cin 	= 1'b0;
				aux_RES = ar_RES;
			end
			5'b00100: aux_RES = A - B - 32'b1;
			5'b00101: aux_RES = A - B;
			5'b00110: aux_RES = A - 1;
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
		if(!RES)	Z = 1;
		else		Z = 0;
					S = RES[31];
					C = ar_C;
					O = ar_O;
	end
endmodule
