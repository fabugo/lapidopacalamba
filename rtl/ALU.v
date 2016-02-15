module alu(
    input [4:0] OP,
    input [31:0] A,
    input [31:0] B,
    output reg [31:0] RES,
    output reg O,
    output reg S,
    output reg C,
    output reg Z);

    reg [31:0]  ar_A,
                ar_B;
    wire [31:0] ar_RES;
    wire        ar_O,
                ar_C;
    reg         ar_Cin;

    adder32 add32(.A(ar_A),.B(ar_B),.Cin(ar_Cin),.Result(ar_RES),.Cout(ar_C),.Over(ar_O));

    always @(A or B or OP)begin
    		case (OP)
                5'b00000:begin
                    ar_A = A;
                    ar_B = B;
                    ar_Cin = 1'b0;
                    RES = ar_RES;
                end
                5'b00001: begin
                    ar_A = A;
                    ar_B = B;
                    ar_Cin = 1'b1;
                    RES = ar_RES;
                end
                5'b00011: begin
                    ar_A = A;
                    ar_B = 32'b1;
                    ar_Cin = 1'b0;
                    RES = ar_RES;
                end
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
            if(!RES)    Z = 1;
                        S = RES[31];
                        C = ar_C;
                        O = ar_O;
        end
endmodule
