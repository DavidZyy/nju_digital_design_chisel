module alu(
  input        clock,
  input        reset,
  input  [3:0] io_A,
  input  [3:0] io_B,
  input  [2:0] io_op,
  output [3:0] io_Result,
  output       io_zero,
  output       io_carry,
  output       io_overflow
);
  wire [4:0] _io_Result_T = io_A + io_B; // @[lab3.scala 30:27]
  wire [3:0] _io_Result_T_1 = io_A + io_B; // @[lab3.scala 30:27]
  wire [3:0] _io_Result_T_3 = io_A - io_B; // @[lab3.scala 31:27]
  wire [3:0] _io_Result_T_4 = ~io_A; // @[lab3.scala 32:21]
  wire [3:0] _io_Result_T_5 = io_A & io_B; // @[lab3.scala 33:27]
  wire [3:0] _io_Result_T_6 = io_A | io_B; // @[lab3.scala 34:27]
  wire [3:0] _io_Result_T_7 = io_A ^ io_B; // @[lab3.scala 35:27]
  wire  _io_Result_T_8 = io_A < io_B; // @[lab3.scala 36:27]
  wire  _io_Result_T_9 = io_A == io_B; // @[lab3.scala 37:27]
  wire [3:0] _io_Result_T_11 = 3'h1 == io_op ? _io_Result_T_3 : _io_Result_T_1; // @[Mux.scala 81:58]
  wire [3:0] _io_Result_T_13 = 3'h2 == io_op ? _io_Result_T_4 : _io_Result_T_11; // @[Mux.scala 81:58]
  wire [3:0] _io_Result_T_15 = 3'h3 == io_op ? _io_Result_T_5 : _io_Result_T_13; // @[Mux.scala 81:58]
  wire [3:0] _io_Result_T_17 = 3'h4 == io_op ? _io_Result_T_6 : _io_Result_T_15; // @[Mux.scala 81:58]
  wire [3:0] _io_Result_T_19 = 3'h5 == io_op ? _io_Result_T_7 : _io_Result_T_17; // @[Mux.scala 81:58]
  wire [3:0] _io_Result_T_21 = 3'h6 == io_op ? {{3'd0}, _io_Result_T_8} : _io_Result_T_19; // @[Mux.scala 81:58]
  wire  _io_overflow_T_5 = io_Result[3] != io_A[3]; // @[lab3.scala 56:63]
  wire  _GEN_1 = io_op == 3'h1 & _io_Result_T_8; // @[lab3.scala 26:17 57:36 58:21]
  wire  _GEN_2 = io_op == 3'h1 & (io_A[3] != io_B[3] & _io_overflow_T_5); // @[lab3.scala 27:17 57:36 59:21]
  assign io_Result = 3'h7 == io_op ? {{3'd0}, _io_Result_T_9} : _io_Result_T_21; // @[Mux.scala 81:58]
  assign io_zero = io_Result == 4'h0; // @[lab3.scala 40:20]
  assign io_carry = io_op == 3'h0 ? _io_Result_T[4] : _GEN_1; // @[lab3.scala 54:30 55:21]
  assign io_overflow = io_op == 3'h0 ? io_A[3] == io_B[3] & io_Result[3] != io_A[3] : _GEN_2; // @[lab3.scala 54:30 56:21]
endmodule
