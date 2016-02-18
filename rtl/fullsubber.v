module fullsubtractor(
    input A, B, Bin,
    output reg Sub, Bout);
    always @(*)begin
        case(Bin)
            0:begin
                if(A == B) begin    Bout = 0;
                                    Sub = 0;
                end else begin      Bout = B;
                                    Sub = 1;
                end
            end
            1:begin
                if(A == B) begin    Bout = 1;
                                    Sub = 1;
                end else begin      Bout = B;
                                    Sub = 0;
                end
            end
        endcase
    end
endmodule
