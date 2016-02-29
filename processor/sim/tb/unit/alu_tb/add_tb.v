module add_tb;
    reg     [31:0]  A,
                    B,
                    ESPERADO;
    wire    [31:0]  RES;
    wire            O,
                    C;
    reg             Cin;
    integer i,pass,erro;
    parameter loops = 99999;
    adder32 add32(.A(A),.B(B),.carryIn(Cin),.result(RES),.carryOut(C),.overflow(O));
    initial begin
    $display("Executando %d testes",loops);
        pass = 0; erro = 0;
        for(i=0; i<loops; i=i+1)begin
            A = $random;
            B = $random;
            Cin = $random;
            ESPERADO = A+B+Cin;
            #10
            if(RES != ESPERADO)begin erro = erro + 1;
            $display("%d: ERRO!\nA: %b\nB: %B\nEsperado: %b\nResultado %b\n",i,A,B,ESPERADO,RES);
            end
            else                    pass = pass + 1;
        end
        if(!erro)   $display("Ta tranquilo, ta favoravel");
        else        $display("\n\nVish.exe");
    end
endmodule
