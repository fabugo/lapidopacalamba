module fulladder(
    input A, B, Cin,
    output reg Sum, Cout);
    reg AorxB;
    always @(*)begin
        AorxB = A ^ B;
        Sum = AorxB ^ Cin;
        Cout = (A & B) | (AorxB & Cin);
    end
endmodule
