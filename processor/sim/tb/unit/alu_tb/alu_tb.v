`include "rtl\\Defines.vh"

module alu_tb;
    reg     [4:0]   OP;
    reg     [31:0]  A,
                    B,
                    ESPERADO;
    wire    [31:0]  RES;
    wire            O,
                    S,
                    C,
                    Z;
    alu u1( .OP(OP),
            .A(A),
            .B(B),
            .result(RES),
            .O(O),
            .S(S),
            .C(C),
            .Z(Z));

    initial begin
/*------------------------------------------------------------------------------
-------- mnemonico: add c, a, b -- codigo: A + B; -- flags: O S C Z
------------------------------------------------------------------------------*/
        OP =        `ADD;
        A =         32'b00000000000000000000000000000001;
        B =         32'b00000000000000000000000000000000;
        ESPERADO =  32'b00000000000000000000000000000001;
        #5
        if(RES!=ESPERADO)
            $display("Erro add:\n Esperado:  %32b\n Resultado: %32b\n",ESPERADO,RES);
/*------------------------------------------------------------------------------
-------- mnemonico: addinc c, a, b -- codigo: A + B + 1; -- flags: O S C Z
------------------------------------------------------------------------------*/
        OP =        `ADDINC;
        A =         32'b00000000000000000000000000000001;
        B =         32'b00000000000000000000000000000010;
        ESPERADO =  32'b00000000000000000000000000000100;
        #5
        if(RES!=ESPERADO)
            $display("Erro addinc:\n Esperado:  %32b\n Resultado: %32b\n",ESPERADO,RES);
/*------------------------------------------------------------------------------
-------- mnemonico: inc c, a -- codigo: A + 1; -- flags: O S C Z
------------------------------------------------------------------------------*/
        OP =        `INCA;
        A =         32'b00000000000000000000000000000001;
        B =         32'b00000000000000000000000000000010;
        ESPERADO =  32'b00000000000000000000000000000010;
        #5
        if(RES!=ESPERADO)
            $display("Erro inca:\n Esperado:  %32b\n Resultado: %32b\n",ESPERADO,RES);
/*------------------------------------------------------------------------------
-------- mnemonico: subdec c, a, b -- codigo: A - B - 1; -- flags: O S C Z
------------------------------------------------------------------------------*/
        OP =        `SUBDEC;
        A =         32'b00000000000000000000000000000010;
        B =         32'b00000000000000000000000000000010;
        ESPERADO =  32'b11111111111111111111111111111111;
        #5
        if(RES!=ESPERADO)
            $display("Erro subdec:\n Esperado:  %32b\n Resultado: %32b\n",ESPERADO,RES);
/*------------------------------------------------------------------------------
-------- mnemonico: sub c, a, b -- codigo: A - B; -- flags: O S C Z
------------------------------------------------------------------------------*/
        OP =        `SUB;
        A =         32'b00000000000000000000000000000010;
        B =         32'b00000000000000000000000000000010;
        ESPERADO =  32'b00000000000000000000000000000000;
        #5
        if(RES!=ESPERADO)
            $display("Erro sub:\n Esperado:  %32b\n Resultado: %32b\n",ESPERADO,RES);
/*------------------------------------------------------------------------------
-------- mnemonico: deca c, a -- codigo: A - 1; -- flags: O S C Z
------------------------------------------------------------------------------*/
        OP =        `DECA;
        A =         32'b00000000000000000000000000000001;
        B =         32'b00000000000000000000000000000010;
        ESPERADO =  32'b00000000000000000000000000000000;
        #5
        if(RES!=ESPERADO)
            $display("Erro deca:\n Esperado:  %32b\n Resultado: %32b\n",ESPERADO,RES);
/*------------------------------------------------------------------------------
-------- mnemonico: lsl c, a -- codigo: A << 1; -- flags: x S C Z
------------------------------------------------------------------------------*/
        OP =        `LSL;
        A =         32'b00000000000000000000000000000001;
        B =         32'b00000000000000000000000000000010;
        ESPERADO =  32'b00000000000000000000000000000010;
        #5
        if(RES!=ESPERADO)
            $display("Erro lsl:\n Esperado:  %32b\n Resultado: %32b\n",ESPERADO,RES);
/*------------------------------------------------------------------------------
-------- mnemonico: asr c, a -- codigo: A -- flags: 1; -- flags: x S C Z
------------------------------------------------------------------------------*/
        OP =        `ASR;
        A =         32'b00000000000000000000000000000001;
        B =         32'b00000000000000000000000000000010;
        ESPERADO =  32'b00000000000000000000000000000000;
        #5
        if(RES!=ESPERADO)
            $display("Erro asr:\n Esperado:  %32b\n Resultado: %32b\n",ESPERADO,RES);
/*------------------------------------------------------------------------------
-------- mnemonico: zeros c -- codigo: 0; -- flags: x x x Z
------------------------------------------------------------------------------*/
        OP =        `ZEROS;
        A =         32'b00000000000000000000000000000001;
        B =         32'b00000000000000000000000000000010;
        ESPERADO =  32'b00000000000000000000000000000000;
        #5
        if(RES!=ESPERADO)
            $display("Erro zeros:\n Esperado:  %32b\n Resultado: %32b\n",ESPERADO,RES);
/*------------------------------------------------------------------------------
-------- mnemonico: and c, a, b -- codigo: A & B; -- flags: x x S Z
------------------------------------------------------------------------------*/
        OP =        `AND;
        A =         32'b00000000000000000000000000000001;
        B =         32'b00000000000000000000000000000010;
        ESPERADO =  32'b00000000000000000000000000000000;
        #5
        if(RES!=ESPERADO)
            $display("Erro and:\n Esperado:  %32b\n Resultado: %32b\n",ESPERADO,RES);
/*------------------------------------------------------------------------------
-------- mnemonico: andnota c, a, b -- codigo: (~A) & B; -- flags: x x S Z
------------------------------------------------------------------------------*/
        OP =        `ANDNOTA;
        A =         32'b00000000000000000000000000000001;
        B =         32'b00000000000000000000000000000010;
        ESPERADO =  32'b00000000000000000000000000000010;
        #5
        if(RES!=ESPERADO)
            $display("Erro andnota:\n Esperado:  %32b\n Resultado: %32b\n",ESPERADO,RES);
/*------------------------------------------------------------------------------
-------- mnemonico: passb c, b -- codigo: B; -- flags: x x x x
------------------------------------------------------------------------------*/
        OP =        `PASSB;
        A =         32'b00000000000000000000000000000001;
        B =         32'b00000000000000000000000000000010;
        ESPERADO =  32'b00000000000000000000000000000010;
        #5
        if(RES!=ESPERADO)
            $display("Erro passb:\n Esperado:  %32b\n Resultado: %32b\n",ESPERADO,RES);
/*------------------------------------------------------------------------------
-------- mnemonico: andnotb c, a, b -- codigo: A & (~B); -- flags: x x S Z
------------------------------------------------------------------------------*/
        OP =        `ANDNOTB;
        A =         32'b00000000000000000000000000000001;
        B =         32'b00000000000000000000000000000010;
        ESPERADO =  32'b00000000000000000000000000000001;
        #5
        if(RES!=ESPERADO)
            $display("Erro andnotb:\n Esperado:  %32b\n Resultado: %32b\n",ESPERADO,RES);
/*------------------------------------------------------------------------------
-------- mnemonico: passa, c, a -- codigo: A; -- flags: x x S Z
------------------------------------------------------------------------------*/
        OP =        `PASSA;
        A =         32'b00000000000000000000000000000001;
        B =         32'b00000000000000000000000000000010;
        ESPERADO =  32'b00000000000000000000000000000001;
        #5
        if(RES!=ESPERADO)
            $display("Erro passa:\n Esperado:  %32b\n Resultado: %32b\n",ESPERADO,RES);
/*------------------------------------------------------------------------------
-------- mnemonico: xor c, a, b -- codigo: A ^ B; -- flags: x x S Z
------------------------------------------------------------------------------*/
        OP =        `XOR;
        A =         32'b00000000000000000000000000000001;
        B =         32'b00000000000000000000000000000010;
        ESPERADO =  32'b00000000000000000000000000000011;
        #5
        if(RES!=ESPERADO)
            $display("Erro xor:\n Esperado:  %32b\n Resultado: %32b\n",ESPERADO,RES);
/*------------------------------------------------------------------------------
-------- mnemonico: or c, a, b -- codigo: A | B; -- flags: x x S Z
------------------------------------------------------------------------------*/
        OP =        `OR;
        A =         32'b00000000000000000000000000000001;
        B =         32'b00000000000000000000000000000010;
        ESPERADO =  32'b00000000000000000000000000000011;
        #5
        if(RES!=ESPERADO)
            $display("Erro or:\n Esperado:  %32b\n Resultado: %32b\n",ESPERADO,RES);
/*------------------------------------------------------------------------------
-------- mnemonico: nand c, a, b -- codigo: (~A) & (~B); -- flags: x x S Z
------------------------------------------------------------------------------*/
        OP =        `NAND;
        A =         32'b00000000000000000000000000000001;
        B =         32'b00000000000000000000000000000010;
        ESPERADO =  32'b11111111111111111111111111111111;
        #5
        if(RES!=ESPERADO)
            $display("Erro nand:\n Esperado:  %32b\n Resultado: %32b\n",ESPERADO,RES);
/*------------------------------------------------------------------------------
-------- mnemonico: xnor c, a, b -- codigo: ~(A ^ B); -- flags: x x S Z
------------------------------------------------------------------------------*/
        OP =        `XNOR;
        A =         32'b00000000000000000000000000000001;
        B =         32'b00000000000000000000000000000010;
        ESPERADO =  32'b11111111111111111111111111111100;
        #5
        if(RES!=ESPERADO)
            $display("Erro xnor:\n Esperado:  %32b\n Resultado: %32b\n",ESPERADO,RES);
/*------------------------------------------------------------------------------
-------- mnemonico: passnota c, a -- codigo: (~A); -- flags: x x S Z
------------------------------------------------------------------------------*/
        OP =        `PASSNOTA;
        A =         32'b00000000000000000000000000000001;
        B =         32'b00000000000000000000000000000010;
        ESPERADO =  32'b11111111111111111111111111111110;
        #5
        if(RES!=ESPERADO)
            $display("Erro passnota:\n Esperado:  %32b\n Resultado: %32b\n",ESPERADO,RES);
/*------------------------------------------------------------------------------
-------- mnemonico: ornota c, a, b -- codigo: (~A) | (B); -- flags: x x S Z
------------------------------------------------------------------------------*/
        OP =        `ORNOTA;
        A =         32'b00000000000000000000000000000001;
        B =         32'b00000000000000000000000000000010;
        ESPERADO =  32'b11111111111111111111111111111110;
        #5
        if(RES!=ESPERADO)
            $display("Erro ornota:\n Esperado:  %32b\n Resultado: %32b\n",ESPERADO,RES);
/*------------------------------------------------------------------------------
-------- mnemonico: passnotb c, b -- codigo: (~B); -- flags: x x S Z
------------------------------------------------------------------------------*/
        OP =        `PASSNOTB;
        A =         32'b00000000000000000000000000000001;
        B =         32'b00000000000000000000000000000010;
        ESPERADO =  32'b11111111111111111111111111111101;
        #5
        if(RES!=ESPERADO)
            $display("Erro passnotb:\n Esperado:  %32b\n Resultado: %32b\n",ESPERADO,RES);
/*------------------------------------------------------------------------------
-------- mnemonico: ornotb c, a, b -- codigo: A | (~B); -- flags: x x S Z
------------------------------------------------------------------------------*/
        OP =        `ORNOTB;
        A =         32'b00000000000000000000000000000001;
        B =         32'b00000000000000000000000000000010;
        ESPERADO =  32'b11111111111111111111111111111101;
        #5
        if(RES!=ESPERADO)
            $display("Erro ornotb:\n Esperado:  %32b\n Resultado: %32b\n",ESPERADO,RES);
/*------------------------------------------------------------------------------
-------- mnemonico: nor c, a, b -- codigo: (~A) | (~B); -- flags: x x S Z
------------------------------------------------------------------------------*/
        OP =        `NOR;
        A =         32'b00000000000000000000000000000001;
        B =         32'b00000000000000000000000000000010;
        ESPERADO =  32'b11111111111111111111111111111100;
        #5
        if(RES!=ESPERADO)
            $display("Erro nor:\n Esperado:  %32b\n Resultado: %32b\n",ESPERADO,RES);
/*------------------------------------------------------------------------------
-------- mnemonico: ones c -- codigo: 1; -- flags: x x x x
------------------------------------------------------------------------------*/
        OP =        `ONES;
        A =         32'b00000000000000000000000000000001;
        B =         32'b00000000000000000000000000000010;
        ESPERADO =  32'b00000000000000000000000000000001;
        #5
        if(RES!=ESPERADO)
            $display("Erro ones:\n Esperado:  %32b\n Resultado: %32b\n",ESPERADO,RES);
        $display("Fim");
    end
endmodule
