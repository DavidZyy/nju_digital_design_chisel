module encoder_prio83(
  input        clock,
  input        reset,
  input  [7:0] io_x,
  input        io_en,
  output [2:0] io_y
);
  wire [2:0] _GEN_1 = io_x[1] ? 3'h1 : 3'h0; // @[lab.scala 116:29 117:14]
  wire [2:0] _GEN_2 = io_x[2] ? 3'h2 : _GEN_1; // @[lab.scala 116:29 117:14]
  wire [2:0] _GEN_3 = io_x[3] ? 3'h3 : _GEN_2; // @[lab.scala 116:29 117:14]
  wire [2:0] _GEN_4 = io_x[4] ? 3'h4 : _GEN_3; // @[lab.scala 116:29 117:14]
  wire [2:0] _GEN_5 = io_x[5] ? 3'h5 : _GEN_4; // @[lab.scala 116:29 117:14]
  wire [2:0] _GEN_6 = io_x[6] ? 3'h6 : _GEN_5; // @[lab.scala 116:29 117:14]
  wire [2:0] _GEN_7 = io_x[7] ? 3'h7 : _GEN_6; // @[lab.scala 116:29 117:14]
  assign io_y = io_en ? _GEN_7 : 3'h0; // @[lab.scala 114:15 121:10]
endmodule
