circuit multiplexer :
  module multiplexer :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip x0 : UInt<2>, flip x1 : UInt<2>, flip x2 : UInt<2>, flip x3 : UInt<2>, flip y : UInt<2>, f : UInt<2>}

    node _T = eq(io.y, UInt<1>("h0")) @[Add.scala 28:13]
    when _T : @[Add.scala 28:22]
      io.f <= io.x0 @[Add.scala 29:10]
    else :
      node _T_1 = eq(io.y, UInt<1>("h1")) @[Add.scala 30:19]
      when _T_1 : @[Add.scala 30:28]
        io.f <= io.x1 @[Add.scala 31:10]
      else :
        node _T_2 = eq(io.y, UInt<2>("h2")) @[Add.scala 32:19]
        when _T_2 : @[Add.scala 32:28]
          io.f <= io.x2 @[Add.scala 33:10]
        else :
          io.f <= io.x3 @[Add.scala 35:10]


