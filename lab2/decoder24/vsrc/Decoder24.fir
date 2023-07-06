circuit Decoder24 :
  module Decoder24 :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip x : UInt<2>, flip en : UInt<1>, y : UInt<4>}

    when io.en : @[lab.scala 60:15]
      node _io_y_T = eq(UInt<1>("h1"), io.x) @[Mux.scala 81:61]
      node _io_y_T_1 = mux(_io_y_T, UInt<2>("h2"), UInt<1>("h1")) @[Mux.scala 81:58]
      node _io_y_T_2 = eq(UInt<2>("h2"), io.x) @[Mux.scala 81:61]
      node _io_y_T_3 = mux(_io_y_T_2, UInt<3>("h4"), _io_y_T_1) @[Mux.scala 81:58]
      node _io_y_T_4 = eq(UInt<2>("h3"), io.x) @[Mux.scala 81:61]
      node _io_y_T_5 = mux(_io_y_T_4, UInt<4>("h8"), _io_y_T_3) @[Mux.scala 81:58]
      io.y <= _io_y_T_5 @[lab.scala 61:10]
    else :
      io.y <= UInt<1>("h0") @[lab.scala 68:10]


