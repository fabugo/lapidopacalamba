module ALU_TB;

    reg [4:0] OP;
    reg [31:0] A;
    reg [31:0] B;
    wire [31:0] RES;
    wire O;
    wire S;
    wire C;
    wire Z;

ALU u1(.OP(OPtb),.A(Atb),.B(Btb),.RES(REStb),.O(Otb),.S(Stb),.C(Ctb),.Z(Ztb));

endmodule
