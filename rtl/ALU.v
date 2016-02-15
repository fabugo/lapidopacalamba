module alu(
    input [4:0] OP,
    input [31:0] A,
    input [31:0] B,
    output reg [31:0] RES,
    output reg O,
    output reg S,
    output reg C,
    output reg Z);
    wire [31:0] aux_res;
    wire aux_O, aux_C;
    adder add32(.A(A),.B(B),.Result(aux_res),.Cout(aux_C),.Over(aux_O));
    always @(A or B or OP)begin
    		case (OP)
                5'b00000: RES = A + B;
                5'b00001: RES = A + B + 32'b1;
                5'b00011: RES = A + 32'b1;
                5'b00100: RES = A - B - 32'b1;
                5'b00101: RES = A - B;
                5'b00110: RES = A - 1;
    			5'b01000: RES = A << 1;
                5'b01001: RES = A >> 1;
    			5'b10000: RES = 32'b0;
    			5'b10001: RES = A & B;
    			5'b10010: RES = (~A) & B;
    			5'b10011: RES = B;
    			5'b10100: RES = A & (~B);
    			5'b10101: RES = A;
    			5'b10110: RES = A ^ B;
    			5'b10111: RES = A | B;
    			5'b11000: RES = ~(A & B);
    			5'b11001: RES = ~(A ^ B);
    			5'b11010: RES = (~A);
    			5'b11011: RES = (~A) | (B);
    			5'b11100: RES = (~B);
    			5'b11101: RES = A | (~B);
    			5'b11110: RES = ~(A | B);
    			5'b11111: RES = 32'b1;
    			default : RES = OP;
    		endcase
            //flags
            if(!RES)    Z = 1;
                        S = RES[31];
                        C = aux_C;
                        O = aux_O;
        end
endmodule
