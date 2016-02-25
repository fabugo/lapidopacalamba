module data_memory(
                    input               CLK,
                    input               W_DM,
                    input   [31:0]      AD,
                    input   [31:0]      WP,
                    output  [31:0]      PR,
                  );
  reg [31:0] DATA [0:(2**4)-1];
  always @(posedge CLK) begin
    if(W_DM)    DATA[AD] = WP;
    else        PR = DATA[endereco];
  end
endmodule
