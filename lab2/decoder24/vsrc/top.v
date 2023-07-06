// module Decoder24(
module top(
  // input        clock,
  // input        reset,
  input  [1:0] io_x,
  input        io_en,
  output [3:0] io_y
);
  wire [1:0] _io_y_T_1 = 2'h1 == io_x ? 2'h2 : 2'h1; // @[Mux.scala 81:58]
  wire [2:0] _io_y_T_3 = 2'h2 == io_x ? 3'h4 : {{1'd0}, _io_y_T_1}; // @[Mux.scala 81:58]
  wire [3:0] _io_y_T_5 = 2'h3 == io_x ? 4'h8 : {{1'd0}, _io_y_T_3}; // @[Mux.scala 81:58]
  assign io_y = io_en ? _io_y_T_5 : 4'h0; // @[lab.scala 60:15 61:10 68:10]
endmodule
