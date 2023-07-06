circuit encoder_prio83 :
  module encoder_prio83 :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip x : UInt<8>, flip en : UInt<1>, y : UInt<3>}

    io.y <= UInt<1>("h0") @[lab.scala 113:8]
    when io.en : @[lab.scala 114:15]
      node _T = bits(io.x, 0, 0) @[lab.scala 116:16]
      node _T_1 = eq(_T, UInt<1>("h1")) @[lab.scala 116:20]
      when _T_1 : @[lab.scala 116:29]
        io.y <= UInt<3>("h0") @[lab.scala 117:14]
      node _T_2 = bits(io.x, 1, 1) @[lab.scala 116:16]
      node _T_3 = eq(_T_2, UInt<1>("h1")) @[lab.scala 116:20]
      when _T_3 : @[lab.scala 116:29]
        io.y <= UInt<3>("h1") @[lab.scala 117:14]
      node _T_4 = bits(io.x, 2, 2) @[lab.scala 116:16]
      node _T_5 = eq(_T_4, UInt<1>("h1")) @[lab.scala 116:20]
      when _T_5 : @[lab.scala 116:29]
        io.y <= UInt<3>("h2") @[lab.scala 117:14]
      node _T_6 = bits(io.x, 3, 3) @[lab.scala 116:16]
      node _T_7 = eq(_T_6, UInt<1>("h1")) @[lab.scala 116:20]
      when _T_7 : @[lab.scala 116:29]
        io.y <= UInt<3>("h3") @[lab.scala 117:14]
      node _T_8 = bits(io.x, 4, 4) @[lab.scala 116:16]
      node _T_9 = eq(_T_8, UInt<1>("h1")) @[lab.scala 116:20]
      when _T_9 : @[lab.scala 116:29]
        io.y <= UInt<3>("h4") @[lab.scala 117:14]
      node _T_10 = bits(io.x, 5, 5) @[lab.scala 116:16]
      node _T_11 = eq(_T_10, UInt<1>("h1")) @[lab.scala 116:20]
      when _T_11 : @[lab.scala 116:29]
        io.y <= UInt<3>("h5") @[lab.scala 117:14]
      node _T_12 = bits(io.x, 6, 6) @[lab.scala 116:16]
      node _T_13 = eq(_T_12, UInt<1>("h1")) @[lab.scala 116:20]
      when _T_13 : @[lab.scala 116:29]
        io.y <= UInt<3>("h6") @[lab.scala 117:14]
      node _T_14 = bits(io.x, 7, 7) @[lab.scala 116:16]
      node _T_15 = eq(_T_14, UInt<1>("h1")) @[lab.scala 116:20]
      when _T_15 : @[lab.scala 116:29]
        io.y <= UInt<3>("h7") @[lab.scala 117:14]
    else :
      io.y <= UInt<1>("h0") @[lab.scala 121:10]


