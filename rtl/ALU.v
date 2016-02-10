module ALU(
    input [4:0] OP,
    input [31:0] A,
    input [31:0] B,
    output reg [31:0] RES,
    output reg O,
    output reg S,
    output reg C,
    output reg Z);

    always @(A or B or OP)begin
    		case (OP)
    			5'b01000: RES =  A << 1;
    			5'b10011: RES = B;
    			5'b11111: RES = 1'b0;
    			5'b10000: RES = 0'b0;
    			5'b10001: RES = A & B;
    			5'b10010: RES = (~A) & B;
    			5'b10100: RES = A & (~B);
    			5'b10101: RES = A;
    			5'b10110: RES = A ^ B;
    			5'b10111: RES = A | B;
    			5'b11000: RES = (~A) & (~B);
    			5'b11001: RES = ~(A ^ B);
    			5'b11010: RES = (~A);
    			5'b11011: RES = (~A) | (B);
    			5'b11100: RES = (~B);
    			5'b11101: RES = A | (~B);
    			5'b11110: RES = (~A) | (~B);
    			default : RES = OP;
    		endcase
        end
endmodule
