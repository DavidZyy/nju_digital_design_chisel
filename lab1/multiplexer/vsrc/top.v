// module multiplexer(
module top(
  // input        clock,
  // input        reset,
  input  [1:0] io_x0,
  input  [1:0] io_x1,
  input  [1:0] io_x2,
  input  [1:0] io_x3,
  input  [1:0] io_y,
  output [1:0] io_f
);
  wire [1:0] _GEN_0 = io_y == 2'h2 ? io_x2 : io_x3; // @[Add.scala 32:28 33:10 35:10]
  wire [1:0] _GEN_1 = io_y == 2'h1 ? io_x1 : _GEN_0; // @[Add.scala 30:28 31:10]
  assign io_f = io_y == 2'h0 ? io_x0 : _GEN_1; // @[Add.scala 28:22 29:10]
endmodule
