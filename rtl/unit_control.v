module unit_control(
			input 				CLK,
			input 		[2:0]	type,
			input 		[4:0]	op,
			output	reg	[31:0]	out,
			output 	reg	[4:0]	OP_ALU,
			output 	reg	[2:0]	OP_TF,
			output 	reg			OP_SE,
			output 	reg			W_DM,
			output 	reg			W_MI,
			output 	reg			W_RB,
			output 	reg			W_RF,
			output 	reg			S_MXPC,
			output 	reg	[1:0]	S_MXRB,
			output 	reg			S_MXSE);

reg[1:0] STATE, NEXT;
parameter 	IF = 2'b00,
			ID = 2'b01,
			EX = 2'b11,
			WB = 2'b10;

reg	[4:0]	reg_OP_ALU;
reg	[2:0]	reg_OP_TF;
reg			reg_W_DM;
reg			reg_W_RB;
reg			reg_W_RF;
reg			reg_S_MXPC;
reg	[1:0]	reg_S_MXRB;
reg			reg_S_MXSE;

always @ (STATE or type or op) begin
	NEXT = IF;
	case(STATE)
		IF : NEXT = ID;
		ID : NEXT = EX;
		EX : NEXT = WB;
		WB : NEXT = IF;
		default : NEXT = IF;
	endcase
end

always @ (posedge CLK) STATE <= NEXT;

always @ (posedge CLK) begin
	case(STATE)
		IF: 			W_MI 	<= 1'b1;

		ID: begin
			case(type)
				3'b001: begin
						reg_W_RB 	<= 1'b1;
						reg_OP_ALU 	<= op;
						reg_OP_TF 	<= 3'b111;
						reg_W_RB 	<= 1'b1;
						reg_W_DM 	<= 1'b0;
						reg_S_MXSE 	<= 1'b0;
						reg_S_MXRB 	<= 2'b10;

					if(op == 5'b10011 || op == 5'b11111)
						reg_W_RF 	<= 3'b000);
					else if(op == 5'b10000)
						reg_W_RF 	<= 3'B001);
					else if(startWith(uc.OP_ALU, "01"))
						reg_W_RF 	<= 3'b011);
					else if(startWith(uc.OP_ALU, "00"))
						reg_W_RF 	<= 3'b100);
					else
						reg_W_RF 	<= 3'b010);
				end
				3'b010: begin

				end
				3'b100: begin

				end
				3'b000: begin

				end
				3'b110: begin

				end
			endcase
		end

		EX: begin
			S_MXSE 	<= reg_S_MXSE;
			OP_ALU 	<= reg_OP_ALU;
			W_DM 	<= reg_W_DM;
			OP_TF 	<= reg_OP_TF;
		end

		WB: begin
			S_MXPC 	<= reg_S_MXPC;
			S_MXRB 	<= reg_S_MXRB;
			S_MXPC 	<= reg_S_MXPC;
			W_RF 	<= reg_W_RF;
			W_RB 	<= reg_W_RB;
			W_PC 	<= 1'b1;
		end
	endcase
end
endmodule