// module encoder24(
module top(
  // input        clock,
  // input        reset,
  input  [3:0] io_x,
  input        io_en,
  output [1:0] io_y
);
  wire [1:0] _io_y_T_5 = 4'h4 == io_x ? 2'h2 : {{1'd0}, 4'h2 == io_x}; // @[Mux.scala 81:58]
  wire [1:0] _io_y_T_7 = 4'h8 == io_x ? 2'h3 : _io_y_T_5; // @[Mux.scala 81:58]
  assign io_y = io_en ? _io_y_T_7 : 2'h0; // @[lab.scala 87:15 88:10 95:10]
endmodule
