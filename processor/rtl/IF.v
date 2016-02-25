module IF(input CLK,
        input           S_MXPC,
        input           W_PC,
        //adicionar sinais da memoria
        input [31:0]    dataALU,
        output [31:0]   nextPCout,
        output [31:0]   instruction
    );
    wire [31:0] nextPCin;
    wire [31:0] pcpp;
    wire [31:0] currentPC;
    mux_pc mxpc(.in_ALU(dataALU),
                .in_ADD(pcpp),
                .S_MXPC(S_MXPC),
                .out(nextPCin)
            );
    adder32 add(.A(currentPC),
                .B(32'b1),
                .Cin(32'b0),
                .Result(pcpp),
                .Cout(),
                .Over()
            );
    program_counter pc( .in(nextPC),
                        .W_PC(W_PC),
                        .CLK(CLK),
                        .out(currentPC)
                    );
    //adicionar memoria de instrucoes aqui
endmodule
