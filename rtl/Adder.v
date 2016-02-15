module adder(
  input   [31:0] A,
  input   [31:0] B,
  output  [31:0] Result,
  output         Cout,
  output         Over);
    wire [32:0]     Carry;
    assign Carry[0] = 1'b0;
    assign Cout = Carry[32];
    assign Over = Carry[32] ^ Carry[31];
    genvar 	      i;
    generate
        for(i = 0; i < 32; i = i + 1) begin: gen_Adder32
            fa fulladd(.A(A[i]), .B(B[i]), .Cin(Carry[i]), .Sum(Result[i]), .Cout(Carry[i+1]));
        end
    endgenerate
endmodule
