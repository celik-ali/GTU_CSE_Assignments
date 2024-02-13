module mod(output wire [31:0] result, output op_done, input reset, CLK, input [31:0] a, b); // Mod operation that has datapath and control unit

wire wx, ws, wwe;

mod_cu control(wwe, ws, op_done, CLK, reset, wx);
mod_dp datapath(result, wx, CLK, ws, wwe,  a, b);

endmodule
