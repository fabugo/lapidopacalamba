module sub_tb;
    reg     [31:0]  A,
                    B;
    wire    [31:0]  RES;
    wire            O,
                    C;
    reg             Bin;
    subtractor32 sub32(.A(A),.B(B),.Bin(Bin),.Result(RES),.Bout(C),.Over(O));

    initial begin
        //carry teste
        A = 32'b00000000000000000000000000000000;
        B = 32'b00000000000000000000000000000001;
        Bin = 0;
        #2
        //overflow test
        A = 32'b10000000000000000000000000000000;
        B = 32'b00000000000000000000000000000001;
        Bin = 0;
        #2;
    end
endmodule
