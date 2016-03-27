module forward_unit(	input wire [3:0]	RAex,
						input wire [3:0]	RAwb,
						input wire [3:0]	RBex,
						input wire [3:0]	RBwb,

						output reg [3:0] 	fwA,
						output reg [3:0]	fwB
	);

	always @ (*) begin
		if(RAex == RAwb) 	fwA = 1;
		else				fwA = 0;
		if(RBex == RBwb)	fwB = 1;
		else				fwB = 0;
	end
endmodule
