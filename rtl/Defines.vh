`ifndef OPCODE
	//Operacões Artimetica
	`define ADD         5'b00000
	`define ADDINC      5'b00001
	`define INCA        5'b00011
	`define SUBDEC      5'b00100
	`define SUB         5'b00101
	`define DECA        5'b00110
	//Operacões de Deslocamento
	`define LSL         5'b01000
	`define ASR         5'b01001
	//Operacões Lógicas
	`define ZEROS       5'b10000
	`define AND         5'b10001
	`define ANDNOTA     5'b10010
	`define PASSB       5'b10011
	`define ANDNOTB     5'b10100
	`define PASSA       5'b10101
	`define XOR         5'b10110
	`define OR          5'b10111
	`define NAND        5'b11000
	`define XNOR        5'b11001
	`define PASSNOTA    5'b11010
	`define ORNOTA      5'b11011
	`define PASSNOTB    5'b11100
	`define ORNOTB      5'b11101
	`define NOR         5'b11110
	`define ONES        5'b11111
	//Operacões de Desvio
	`define JUMPER      5'b01000
	`define JT         	5'b01001
	`define JF          5'b01001
	`define JAL         5'b01001
	`define JR          5'b01001

`endif //OPCODE
`define OPCODE
