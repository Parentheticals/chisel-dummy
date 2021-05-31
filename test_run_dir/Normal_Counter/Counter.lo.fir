circuit Counter :
  module Counter :
    input clock : Clock
    input reset : UInt<1>
    output io_out : UInt<3>

    reg register : UInt<3>, clock with :
      reset => (UInt<1>("h0"), register) @[Counter.scala 11:25]
    node _register_T = add(register, UInt<1>("h1")) @[Counter.scala 12:24]
    node _register_T_1 = tail(_register_T, 1) @[Counter.scala 12:24]
    io_out <= register @[Counter.scala 13:10]
    register <= mux(reset, UInt<3>("h0"), _register_T_1) @[Counter.scala 11:25 Counter.scala 11:25 Counter.scala 12:12]
