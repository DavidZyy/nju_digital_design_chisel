// module alu(
module top(
  // input        clock,
  // input        reset,
  input  [3:0] io_A,
  input  [3:0] io_B,
  output [3:0] io_Result,
  output [4:0] io_Result_4
);
/* verilator lint_off UNUSEDSIGNAL */
  assign io_Result = io_A - io_B;
  assign io_Result_4 = io_A - io_B;

endmodule
