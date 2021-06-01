circuit Dummy_nonFSM :
  module Dummy_nonFSM :
    input clock : Clock
    input reset : UInt<1>
    output io_in_ready : UInt<1>
    input io_in_valid : UInt<1>
    input io_in_bits : UInt<4>
    input io_out_ready : UInt<1>
    output io_out_valid : UInt<1>
    output io_out_bits : UInt<4>

    node _io_in_ready_T = and(io_in_valid, io_out_ready) @[dummy_nonFSM copy.scala 13:32]
    node _io_in_ready_T_1 = eq(_io_in_ready_T, UInt<1>("h0")) @[dummy_nonFSM copy.scala 13:18]
    reg enable : UInt<1>, clock with :
      reset => (UInt<1>("h0"), enable) @[dummy_nonFSM copy.scala 14:23]
    reg value : UInt<3>, clock with :
      reset => (UInt<1>("h0"), value) @[Counter.scala 60:40]
    node _T = eq(enable, UInt<1>("h0")) @[dummy_nonFSM copy.scala 17:8]
    node wrap = eq(value, UInt<3>("h7")) @[Counter.scala 72:24]
    node _value_T = add(value, UInt<1>("h1")) @[Counter.scala 76:24]
    node _value_T_1 = tail(_value_T, 1) @[Counter.scala 76:24]
    node _GEN_0 = mux(_T, _value_T_1, value) @[dummy_nonFSM copy.scala 17:17 Counter.scala 76:15 Counter.scala 60:40]
    node _T_1 = add(UInt<3>("h6"), UInt<1>("h1")) @[dummy_nonFSM copy.scala 21:31]
    node _T_2 = tail(_T_1, 1) @[dummy_nonFSM copy.scala 21:31]
    node _T_3 = eq(value, _T_2) @[dummy_nonFSM copy.scala 21:22]
    node _io_out_bits_T = add(io_in_bits, UInt<1>("h1")) @[dummy_nonFSM copy.scala 23:31]
    node _io_out_bits_T_1 = tail(_io_out_bits_T, 1) @[dummy_nonFSM copy.scala 23:31]
    node _GEN_1 = mux(_T_3, UInt<1>("h0"), _GEN_0) @[dummy_nonFSM copy.scala 21:38 Counter.scala 97:11]
    node _GEN_2 = mux(_T_3, _io_out_bits_T_1, UInt<1>("h0")) @[dummy_nonFSM copy.scala 21:38 dummy_nonFSM copy.scala 23:17 dummy_nonFSM copy.scala 26:17]
    node _GEN_3 = mux(_T_3, UInt<1>("h1"), UInt<1>("h0")) @[dummy_nonFSM copy.scala 21:38 dummy_nonFSM copy.scala 24:18 dummy_nonFSM copy.scala 27:18]
    io_in_ready <= _io_in_ready_T_1 @[dummy_nonFSM copy.scala 13:15]
    io_out_valid <= _GEN_3
    io_out_bits <= _GEN_2
    enable <= io_in_ready @[dummy_nonFSM copy.scala 14:23]
    value <= mux(reset, UInt<3>("h0"), _GEN_1) @[Counter.scala 60:40 Counter.scala 60:40]
