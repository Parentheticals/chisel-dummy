circuit Dummy_FSM :
  module Dummy_FSM :
    input clock : Clock
    input reset : UInt<1>
    output io_in_ready : UInt<1>
    input io_in_valid : UInt<1>
    input io_in_bits : UInt<4>
    input io_out_ready : UInt<1>
    output io_out_valid : UInt<1>
    output io_out_bits : UInt<4>

    reg state : UInt<2>, clock with :
      reset => (UInt<1>("h0"), state) @[dummy_FSM.scala 16:22]
    reg newval : UInt<4>, clock with :
      reset => (UInt<1>("h0"), newval) @[dummy_FSM.scala 17:23]
    reg en_counter : UInt<1>, clock with :
      reset => (UInt<1>("h0"), en_counter) @[dummy_FSM.scala 20:23]
    reg value : UInt<3>, clock with :
      reset => (UInt<1>("h0"), value) @[Counter.scala 60:40]
    node wrap = eq(value, UInt<3>("h7")) @[Counter.scala 72:24]
    node _value_T = add(value, UInt<1>("h1")) @[Counter.scala 76:24]
    node _value_T_1 = tail(_value_T, 1) @[Counter.scala 76:24]
    node _GEN_0 = mux(en_counter, _value_T_1, UInt<1>("h0")) @[dummy_FSM.scala 30:21 Counter.scala 76:15 Counter.scala 97:11]
    node _T = eq(UInt<2>("h0"), state) @[Conditional.scala 37:30]
    node _GEN_1 = mux(io_in_valid, UInt<2>("h1"), UInt<2>("h0")) @[dummy_FSM.scala 39:26 dummy_FSM.scala 40:15 dummy_FSM.scala 23:9]
    node _GEN_2 = mux(io_in_valid, UInt<1>("h1"), UInt<1>("h0")) @[dummy_FSM.scala 39:26 dummy_FSM.scala 41:20 dummy_FSM.scala 27:14]
    node _T_1 = eq(UInt<2>("h1"), state) @[Conditional.scala 37:30]
    node _T_2 = eq(value, UInt<3>("h6")) @[dummy_FSM.scala 47:27]
    node _newval_T = add(io_in_bits, UInt<1>("h1")) @[dummy_FSM.scala 49:30]
    node _newval_T_1 = tail(_newval_T, 1) @[dummy_FSM.scala 49:30]
    node _GEN_3 = mux(_T_2, UInt<2>("h2"), UInt<2>("h1")) @[dummy_FSM.scala 47:37 dummy_FSM.scala 48:15 dummy_FSM.scala 51:15]
    node _GEN_4 = mux(_T_2, _newval_T_1, newval) @[dummy_FSM.scala 47:37 dummy_FSM.scala 49:16 dummy_FSM.scala 17:23]
    node _GEN_5 = mux(_T_2, UInt<1>("h0"), UInt<1>("h1")) @[dummy_FSM.scala 47:37 dummy_FSM.scala 27:14 dummy_FSM.scala 52:20]
    node _T_3 = eq(UInt<2>("h2"), state) @[Conditional.scala 37:30]
    node _GEN_6 = mux(io_out_ready, UInt<2>("h0"), UInt<2>("h2")) @[dummy_FSM.scala 57:26 dummy_FSM.scala 58:15 dummy_FSM.scala 61:15]
    node _GEN_7 = mux(io_out_ready, UInt<1>("h0"), _GEN_0) @[dummy_FSM.scala 57:26 Counter.scala 97:11]
    node _GEN_8 = mux(_T_3, _GEN_6, UInt<2>("h0")) @[Conditional.scala 39:67 dummy_FSM.scala 23:9]
    node _GEN_9 = mux(_T_3, _GEN_7, _GEN_0) @[Conditional.scala 39:67]
    node _GEN_10 = mux(_T_3, UInt<1>("h1"), UInt<1>("h0")) @[Conditional.scala 39:67 dummy_FSM.scala 63:20 dummy_FSM.scala 26:16]
    node _GEN_11 = mux(_T_1, _GEN_3, _GEN_8) @[Conditional.scala 39:67]
    node _GEN_12 = mux(_T_1, _GEN_4, newval) @[Conditional.scala 39:67 dummy_FSM.scala 17:23]
    node _GEN_13 = mux(_T_1, _GEN_5, UInt<1>("h0")) @[Conditional.scala 39:67 dummy_FSM.scala 27:14]
    node _GEN_14 = mux(_T_1, _GEN_0, _GEN_9) @[Conditional.scala 39:67]
    node _GEN_15 = mux(_T_1, UInt<1>("h0"), _GEN_10) @[Conditional.scala 39:67 dummy_FSM.scala 26:16]
    node _GEN_16 = mux(_T, _GEN_1, _GEN_11) @[Conditional.scala 40:58]
    node _GEN_17 = mux(_T, _GEN_2, _GEN_13) @[Conditional.scala 40:58]
    node _GEN_18 = mux(_T, UInt<1>("h1"), UInt<1>("h0")) @[Conditional.scala 40:58 dummy_FSM.scala 43:19 dummy_FSM.scala 24:15]
    node _GEN_19 = mux(_T, newval, _GEN_12) @[Conditional.scala 40:58 dummy_FSM.scala 17:23]
    node _GEN_20 = mux(_T, _GEN_0, _GEN_14) @[Conditional.scala 40:58]
    node _GEN_21 = mux(_T, UInt<1>("h0"), _GEN_15) @[Conditional.scala 40:58 dummy_FSM.scala 26:16]
    io_in_ready <= _GEN_18
    io_out_valid <= _GEN_21
    io_out_bits <= newval @[dummy_FSM.scala 25:15]
    state <= mux(reset, UInt<2>("h0"), _GEN_16) @[dummy_FSM.scala 16:22 dummy_FSM.scala 16:22]
    newval <= mux(reset, UInt<1>("h0"), _GEN_19) @[dummy_FSM.scala 17:23 dummy_FSM.scala 17:23]
    en_counter <= _GEN_17
    value <= mux(reset, UInt<3>("h0"), _GEN_20) @[Counter.scala 60:40 Counter.scala 60:40]
