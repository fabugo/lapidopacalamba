module data_memory(
			input 	wire[31:0]	in,
			input 	wire[3:0]	address,
			input 	wire		W_DM,
			output 	reg[31:0]	out);

	reg[31:0] 	data[0:1024];

	always @(in or address or W_DM) begin
		case(W_DM)
			1'b0: begin
				out = data[address];
			end
			1'b1: begin
				data[address] = in;
			end
		endcase
	end

endmodule