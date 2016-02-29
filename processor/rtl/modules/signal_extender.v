//Módulo extensor de sinal (combinacional)
module signal_extender(in, OP_SE, out);

	input 	wire[15:0]	in;
	input 	wire		OP_SE;
	output	reg	[31:0]	out;

	/*
		Com OP_SE = 0, os 12 bits menos significativos são extendidos para 32 bits
		Com OP_SE = 1, os 16 bits menos significativos são extendidos para 32 bits
	*/
	always @(*) begin
		if(OP_SE == 1'b0) 		out = {{20{in[11]}}, in[11:0]};
		else if(OP_SE == 1'b1) 	out = {{16{in[15]}}, in[15:0]};
	end

endmodule
