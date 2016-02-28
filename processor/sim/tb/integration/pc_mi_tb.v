`include "rtl\\modules\\ram.vhd"

module pc_mi_tb();
	reg CLK;
	initial CLK = 0;
	always #5 CLK = ~CLK;

	reg[31:0] 	in;
	reg 		W_PC;
	wire[31:0] 	out;
	program_counter u1(.in(in), .W_PC(W_PC), .CLK(CLK), .out(out));
	
	reg			rFile;
	reg			wFile;
	reg			WE;
	reg [9:0]	ADRESS;
	reg [31:0]	DATA;
	wire [31:0]	Q;
	ram u2(.read_file(rFile), .write_file(wFile), .WE(WE), .clk(CLK), .ADRESS(ADRESS), .DATA(DATA), .Q(Q));

	initial begin
		$display("\n---------------------------");
		$display("Teste de integracao (PC - MI)");
		$display("Total de testes: ");
	end
endmodule