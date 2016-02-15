module ar_tb;
    reg     [4:0]   OP;
    reg     [31:0]  A,
                    B;
    wire    [31:0]  RES;
    wire            O,
                    C;
    reg             Cin;

    adder32 add32(.A(A),.B(B),.Cin(Cin),.Result(RES),.Cout(C),.Over(O));

    initial begin
        //carry teste
        A = 32'b00000000000000000000000000000000;
        B = 32'b11111111111111111111111111111111;
        Cin = 1;
        #1
        //overflow test
        A = 32'b00000000000000000000000000000000;
        B = 32'b01111111111111111111111111111111;
        Cin = 1;
    end
endmodule
