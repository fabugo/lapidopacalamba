module subtractor32(
    input   [31:0] A,
    input   [31:0] B,
    input          Bin,
    output  [31:0] Result,
    output         Bout,
    output         Over);

    wire [32:0]     Bor; //array de todos os carrys

    assign Bor[0] = Bin;
    assign    Bout = Bor[32];
    assign    Over = Bor[32] ^ Bor[31];

    genvar 	      i;
    generate
        for(i = 0; i < 32; i = i + 1) begin: gen_Adder32
            fullsubtractor fullsub (.A(A[i]), .B(B[i]), .Bin(Bor[i]),
                                    .Sub(Result[i]), .Bout(Bor[i+1]));
        end
    endgenerate
endmodule
