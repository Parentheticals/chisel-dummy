circuit Useless :
  module Useless :
    input clock : Clock
    input reset : UInt<1>
    output io_a_ready : UInt<1>
    input io_a_valid : UInt<1>
    input io_a_bits_num0_0 : UInt<1>
    input io_a_bits_num0_1 : UInt<1>
    input io_a_bits_num0_2 : UInt<1>
    input io_a_bits_num1_0 : UInt<1>
    input io_a_bits_num1_1 : UInt<1>
    input io_a_bits_num1_2 : UInt<1>
    input io_b_0 : UInt<1>
    input io_b_1 : UInt<1>
    input io_b_2 : UInt<1>
    output io_rdy_b : UInt<1>
    output io_op_0 : UInt<3>
    output io_op_1 : UInt<3>
    output io_delayed_0 : UInt<3>
    output io_delayed_1 : UInt<3>
    output io_vld_delay : UInt<1>

    node c_num0_hi = cat(io_a_bits_num0_0, io_a_bits_num0_1) @[Cat.scala 30:58]
    node c_num0 = cat(c_num0_hi, io_a_bits_num0_2) @[Cat.scala 30:58]
    node c_num1_hi = cat(io_a_bits_num1_0, io_a_bits_num1_1) @[Cat.scala 30:58]
    node c_num1 = cat(c_num1_hi, io_a_bits_num1_2) @[Cat.scala 30:58]
    node c_b_hi = cat(io_b_0, io_b_1) @[Cat.scala 30:58]
    node c_b = cat(c_b_hi, io_b_2) @[Cat.scala 30:58]
    node _io_op_0_T = add(c_num0, c_b) @[Useless.scala 33:24]
    node _io_op_0_T_1 = tail(_io_op_0_T, 1) @[Useless.scala 33:24]
    node _io_op_1_T = add(c_num1, c_b) @[Useless.scala 34:24]
    node _io_op_1_T_1 = tail(_io_op_1_T, 1) @[Useless.scala 34:24]
    node _GEN_0 = mux(io_a_valid, _io_op_0_T_1, c_b) @[Useless.scala 32:21 Useless.scala 33:14 Useless.scala 37:14]
    node _GEN_1 = mux(io_a_valid, _io_op_1_T_1, c_b) @[Useless.scala 32:21 Useless.scala 34:14 Useless.scala 38:14]
    node _GEN_2 = mux(io_a_valid, UInt<1>("h0"), UInt<1>("h1")) @[Useless.scala 32:21 Useless.scala 35:16 Useless.scala 39:16]
    reg store1 : UInt<3>, clock with :
      reset => (UInt<1>("h0"), store1) @[Useless.scala 44:23]
    reg store2 : UInt<3>, clock with :
      reset => (UInt<1>("h0"), store2) @[Useless.scala 45:23]
    reg value : UInt<1>, clock with :
      reset => (UInt<1>("h0"), value) @[Counter.scala 60:40]
    node _T = eq(value, UInt<1>("h0")) @[Useless.scala 49:19]
    node _GEN_3 = mux(_T, UInt<1>("h1"), UInt<1>("h0")) @[Useless.scala 49:28 Useless.scala 50:14 Useless.scala 53:14]
    node _GEN_4 = mux(_T, UInt<1>("h0"), UInt<1>("h1")) @[Useless.scala 49:28 Useless.scala 51:18 Useless.scala 54:18]
    node wrap = eq(value, UInt<1>("h1")) @[Counter.scala 72:24]
    node _value_T = add(value, UInt<1>("h1")) @[Counter.scala 76:24]
    node _value_T_1 = tail(_value_T, 1) @[Counter.scala 76:24]
    node _T_1 = eq(io_rdy_b, UInt<1>("h1")) @[Useless.scala 59:17]
    node _GEN_5 = mux(_T_1, c_num0, store1) @[Useless.scala 59:25 Useless.scala 60:12 Useless.scala 44:23]
    node _GEN_6 = mux(_T_1, c_b, store2) @[Useless.scala 59:25 Useless.scala 61:12 Useless.scala 45:23]
    io_a_ready <= _GEN_2
    io_rdy_b <= _GEN_3
    io_op_0 <= _GEN_0
    io_op_1 <= _GEN_1
    io_delayed_0 <= store1 @[Useless.scala 64:17]
    io_delayed_1 <= store2 @[Useless.scala 65:17]
    io_vld_delay <= _GEN_4
    store1 <= mux(reset, UInt<1>("h0"), _GEN_5) @[Useless.scala 44:23 Useless.scala 44:23]
    store2 <= mux(reset, UInt<1>("h0"), _GEN_6) @[Useless.scala 45:23 Useless.scala 45:23]
    value <= mux(reset, UInt<1>("h0"), _value_T_1) @[Counter.scala 60:40 Counter.scala 60:40 Counter.scala 76:15]
