circuit encoder24 :
  module encoder24 :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip x : UInt<4>, flip en : UInt<1>, y : UInt<2>}

    when io.en : @[lab.scala 87:15]
      node _io_y_T = eq(UInt<1>("h1"), io.x) @[Mux.scala 81:61]
      node _io_y_T_1 = mux(_io_y_T, UInt<1>("h0"), UInt<1>("h0")) @[Mux.scala 81:58]
      node _io_y_T_2 = eq(UInt<2>("h2"), io.x) @[Mux.scala 81:61]
      node _io_y_T_3 = mux(_io_y_T_2, UInt<1>("h1"), _io_y_T_1) @[Mux.scala 81:58]
      node _io_y_T_4 = eq(UInt<3>("h4"), io.x) @[Mux.scala 81:61]
      node _io_y_T_5 = mux(_io_y_T_4, UInt<2>("h2"), _io_y_T_3) @[Mux.scala 81:58]
      node _io_y_T_6 = eq(UInt<4>("h8"), io.x) @[Mux.scala 81:61]
      node _io_y_T_7 = mux(_io_y_T_6, UInt<2>("h3"), _io_y_T_5) @[Mux.scala 81:58]
      io.y <= _io_y_T_7 @[lab.scala 88:10]
    else :
      io.y <= UInt<1>("h0") @[lab.scala 95:10]


