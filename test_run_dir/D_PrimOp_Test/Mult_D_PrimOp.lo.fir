circuit Mult_D_PrimOp :
  module EB_one :
    input clock : Clock
    input reset : UInt<1>
    output io_in_ready : UInt<1>
    input io_in_valid : UInt<1>
    input io_in_bits : SInt<5>
    input io_out_ready : UInt<1>
    output io_out_valid : UInt<1>
    output io_out_bits : SInt<5>

    reg vld : UInt<1>, clock with :
      reset => (UInt<1>("h0"), vld) @[D_PrimOp.scala 84:20]
    reg rdy : UInt<1>, clock with :
      reset => (UInt<1>("h0"), rdy) @[D_PrimOp.scala 85:20]
    reg data : SInt<5>, clock with :
      reset => (UInt<1>("h0"), data) @[D_PrimOp.scala 86:21]
    io_in_ready <= rdy @[D_PrimOp.scala 93:15]
    io_out_valid <= vld @[D_PrimOp.scala 92:16]
    io_out_bits <= data @[D_PrimOp.scala 94:15]
    vld <= mux(reset, UInt<1>("h0"), io_in_valid) @[D_PrimOp.scala 84:20 D_PrimOp.scala 84:20 D_PrimOp.scala 88:7]
    rdy <= mux(reset, UInt<1>("h0"), io_out_ready) @[D_PrimOp.scala 85:20 D_PrimOp.scala 85:20 D_PrimOp.scala 89:7]
    data <= mux(reset, asSInt(UInt<5>("h0")), io_in_bits) @[D_PrimOp.scala 86:21 D_PrimOp.scala 86:21 D_PrimOp.scala 90:8]

  module D_PrimOp_1 :
    input clock : Clock
    input reset : UInt<1>
    output io_a_ready : UInt<1>
    input io_a_valid : UInt<1>
    input io_a_bits : SInt<5>
    output io_b_ready : UInt<1>
    input io_b_valid : UInt<1>
    input io_b_bits : SInt<5>
    input io_out_ready : UInt<1>
    output io_out_valid : UInt<1>
    output io_out_bits : SInt<5>

    inst EB of EB_one @[D_PrimOp.scala 48:18]
    node _EB_io_in_bits_T = add(io_a_bits, io_b_bits) @[Mult_D_PrimOp.scala 8:47]
    node _EB_io_in_bits_T_1 = tail(_EB_io_in_bits_T, 1) @[Mult_D_PrimOp.scala 8:47]
    node _EB_io_in_bits_T_2 = asSInt(_EB_io_in_bits_T_1) @[Mult_D_PrimOp.scala 8:47]
    node _EB_io_in_valid_T = and(io_a_valid, io_b_valid) @[D_PrimOp.scala 51:32]
    io_a_ready <= EB.io_in_ready @[D_PrimOp.scala 52:14]
    io_b_ready <= EB.io_in_ready @[D_PrimOp.scala 53:14]
    io_out_valid <= EB.io_out_valid @[D_PrimOp.scala 56:16]
    io_out_bits <= EB.io_out_bits @[D_PrimOp.scala 55:15]
    EB.clock <= clock
    EB.reset <= reset
    EB.io_in_valid <= _EB_io_in_valid_T @[D_PrimOp.scala 51:18]
    EB.io_in_bits <= _EB_io_in_bits_T_2 @[D_PrimOp.scala 50:17]
    EB.io_out_ready <= io_out_ready @[D_PrimOp.scala 57:19]

  module D_PrimOp_1_1 :
    input clock : Clock
    input reset : UInt<1>
    output io_a_ready : UInt<1>
    input io_a_valid : UInt<1>
    input io_a_bits : SInt<5>
    output io_b_ready : UInt<1>
    input io_b_valid : UInt<1>
    input io_b_bits : SInt<5>
    input io_out_ready : UInt<1>
    output io_out_valid : UInt<1>
    output io_out_bits : SInt<5>

    inst EB of EB_one @[D_PrimOp.scala 48:18]
    node _EB_io_in_bits_T = mul(io_a_bits, io_b_bits) @[Mult_D_PrimOp.scala 10:47]
    node _EB_io_in_valid_T = and(io_a_valid, io_b_valid) @[D_PrimOp.scala 51:32]
    io_a_ready <= EB.io_in_ready @[D_PrimOp.scala 52:14]
    io_b_ready <= EB.io_in_ready @[D_PrimOp.scala 53:14]
    io_out_valid <= EB.io_out_valid @[D_PrimOp.scala 56:16]
    io_out_bits <= EB.io_out_bits @[D_PrimOp.scala 55:15]
    EB.clock <= clock
    EB.reset <= reset
    EB.io_in_valid <= _EB_io_in_valid_T @[D_PrimOp.scala 51:18]
    EB.io_in_bits <= asSInt(bits(_EB_io_in_bits_T, 4, 0)) @[D_PrimOp.scala 50:17]
    EB.io_out_ready <= io_out_ready @[D_PrimOp.scala 57:19]

  module D_PrimOp_1_2 :
    input clock : Clock
    input reset : UInt<1>
    output io_a_ready : UInt<1>
    input io_a_valid : UInt<1>
    input io_a_bits : SInt<5>
    output io_b_ready : UInt<1>
    input io_b_valid : UInt<1>
    input io_b_bits : SInt<5>
    input io_out_ready : UInt<1>
    output io_out_valid : UInt<1>
    output io_out_bits : SInt<5>

    inst EB of EB_one @[D_PrimOp.scala 48:18]
    node _EB_io_in_bits_T = sub(io_a_bits, io_b_bits) @[Mult_D_PrimOp.scala 9:47]
    node _EB_io_in_bits_T_1 = tail(_EB_io_in_bits_T, 1) @[Mult_D_PrimOp.scala 9:47]
    node _EB_io_in_bits_T_2 = asSInt(_EB_io_in_bits_T_1) @[Mult_D_PrimOp.scala 9:47]
    node _EB_io_in_valid_T = and(io_a_valid, io_b_valid) @[D_PrimOp.scala 51:32]
    io_a_ready <= EB.io_in_ready @[D_PrimOp.scala 52:14]
    io_b_ready <= EB.io_in_ready @[D_PrimOp.scala 53:14]
    io_out_valid <= EB.io_out_valid @[D_PrimOp.scala 56:16]
    io_out_bits <= EB.io_out_bits @[D_PrimOp.scala 55:15]
    EB.clock <= clock
    EB.reset <= reset
    EB.io_in_valid <= _EB_io_in_valid_T @[D_PrimOp.scala 51:18]
    EB.io_in_bits <= _EB_io_in_bits_T_2 @[D_PrimOp.scala 50:17]
    EB.io_out_ready <= io_out_ready @[D_PrimOp.scala 57:19]

  module D_PrimOp_0 :
    input clock : Clock
    input reset : UInt<1>
    output io_a_ready : UInt<1>
    input io_a_valid : UInt<1>
    input io_a_bits : SInt<5>
    input io_out_ready : UInt<1>
    output io_out_valid : UInt<1>
    output io_out_bits : SInt<5>

    inst EB of EB_one @[D_PrimOp.scala 13:18]
    node _EB_io_in_bits_T = sub(asSInt(UInt<1>("h0")), io_a_bits) @[Mult_D_PrimOp.scala 14:32]
    node _EB_io_in_bits_T_1 = tail(_EB_io_in_bits_T, 1) @[Mult_D_PrimOp.scala 14:32]
    node _EB_io_in_bits_T_2 = asSInt(_EB_io_in_bits_T_1) @[Mult_D_PrimOp.scala 14:32]
    io_a_ready <= EB.io_in_ready @[D_PrimOp.scala 17:14]
    io_out_valid <= EB.io_out_valid @[D_PrimOp.scala 20:16]
    io_out_bits <= EB.io_out_bits @[D_PrimOp.scala 19:15]
    EB.clock <= clock
    EB.reset <= reset
    EB.io_in_valid <= io_a_valid @[D_PrimOp.scala 16:18]
    EB.io_in_bits <= _EB_io_in_bits_T_2 @[D_PrimOp.scala 15:17]
    EB.io_out_ready <= io_out_ready @[D_PrimOp.scala 21:19]

  module D_PrimOp_1_3 :
    input clock : Clock
    input reset : UInt<1>
    output io_a_ready : UInt<1>
    input io_a_valid : UInt<1>
    input io_a_bits : SInt<5>
    output io_b_ready : UInt<1>
    input io_b_valid : UInt<1>
    input io_b_bits : SInt<5>
    input io_out_ready : UInt<1>
    output io_out_valid : UInt<1>
    output io_out_bits : SInt<5>

    inst EB of EB_one @[D_PrimOp.scala 48:18]
    node _EB_io_in_bits_T = and(io_a_bits, io_b_bits) @[Mult_D_PrimOp.scala 15:47]
    node _EB_io_in_bits_T_1 = asSInt(_EB_io_in_bits_T) @[Mult_D_PrimOp.scala 15:47]
    node _EB_io_in_valid_T = and(io_a_valid, io_b_valid) @[D_PrimOp.scala 51:32]
    io_a_ready <= EB.io_in_ready @[D_PrimOp.scala 52:14]
    io_b_ready <= EB.io_in_ready @[D_PrimOp.scala 53:14]
    io_out_valid <= EB.io_out_valid @[D_PrimOp.scala 56:16]
    io_out_bits <= EB.io_out_bits @[D_PrimOp.scala 55:15]
    EB.clock <= clock
    EB.reset <= reset
    EB.io_in_valid <= _EB_io_in_valid_T @[D_PrimOp.scala 51:18]
    EB.io_in_bits <= _EB_io_in_bits_T_1 @[D_PrimOp.scala 50:17]
    EB.io_out_ready <= io_out_ready @[D_PrimOp.scala 57:19]

  module D_PrimOp_1_5 :
    input clock : Clock
    input reset : UInt<1>
    output io_a_ready : UInt<1>
    input io_a_valid : UInt<1>
    input io_a_bits : SInt<5>
    output io_b_ready : UInt<1>
    input io_b_valid : UInt<1>
    input io_b_bits : SInt<5>
    input io_out_ready : UInt<1>
    output io_out_valid : UInt<1>
    output io_out_bits : SInt<5>

    inst EB of EB_one @[D_PrimOp.scala 48:18]
    node _EB_io_in_bits_T = rem(io_a_bits, io_b_bits) @[Mult_D_PrimOp.scala 12:47]
    node _EB_io_in_valid_T = and(io_a_valid, io_b_valid) @[D_PrimOp.scala 51:32]
    io_a_ready <= EB.io_in_ready @[D_PrimOp.scala 52:14]
    io_b_ready <= EB.io_in_ready @[D_PrimOp.scala 53:14]
    io_out_valid <= EB.io_out_valid @[D_PrimOp.scala 56:16]
    io_out_bits <= EB.io_out_bits @[D_PrimOp.scala 55:15]
    EB.clock <= clock
    EB.reset <= reset
    EB.io_in_valid <= _EB_io_in_valid_T @[D_PrimOp.scala 51:18]
    EB.io_in_bits <= _EB_io_in_bits_T @[D_PrimOp.scala 50:17]
    EB.io_out_ready <= io_out_ready @[D_PrimOp.scala 57:19]

  module D_PrimOp_1_7 :
    input clock : Clock
    input reset : UInt<1>
    output io_a_ready : UInt<1>
    input io_a_valid : UInt<1>
    input io_a_bits : SInt<5>
    output io_b_ready : UInt<1>
    input io_b_valid : UInt<1>
    input io_b_bits : SInt<5>
    input io_out_ready : UInt<1>
    output io_out_valid : UInt<1>
    output io_out_bits : SInt<5>

    inst EB of EB_one @[D_PrimOp.scala 48:18]
    node _EB_io_in_bits_T = xor(io_a_bits, io_b_bits) @[Mult_D_PrimOp.scala 17:47]
    node _EB_io_in_bits_T_1 = asSInt(_EB_io_in_bits_T) @[Mult_D_PrimOp.scala 17:47]
    node _EB_io_in_valid_T = and(io_a_valid, io_b_valid) @[D_PrimOp.scala 51:32]
    io_a_ready <= EB.io_in_ready @[D_PrimOp.scala 52:14]
    io_b_ready <= EB.io_in_ready @[D_PrimOp.scala 53:14]
    io_out_valid <= EB.io_out_valid @[D_PrimOp.scala 56:16]
    io_out_bits <= EB.io_out_bits @[D_PrimOp.scala 55:15]
    EB.clock <= clock
    EB.reset <= reset
    EB.io_in_valid <= _EB_io_in_valid_T @[D_PrimOp.scala 51:18]
    EB.io_in_bits <= _EB_io_in_bits_T_1 @[D_PrimOp.scala 50:17]
    EB.io_out_ready <= io_out_ready @[D_PrimOp.scala 57:19]

  module Mult_D_PrimOp :
    input clock : Clock
    input reset : UInt<1>
    output io_a_ready : UInt<1>
    input io_a_valid : UInt<1>
    input io_a_bits : SInt<5>
    output io_b_ready : UInt<1>
    input io_b_valid : UInt<1>
    input io_b_bits : SInt<5>
    input io_out_ready : UInt<1>
    output io_out_valid : UInt<1>
    output io_out_bits : SInt<10>

    inst l0_0 of D_PrimOp_1 @[Mult_D_PrimOp.scala 48:20]
    inst l0_1 of D_PrimOp_1_1 @[Mult_D_PrimOp.scala 49:20]
    inst l0_2 of D_PrimOp_1_2 @[Mult_D_PrimOp.scala 50:20]
    inst l0_3 of D_PrimOp_0 @[Mult_D_PrimOp.scala 51:20]
    inst l0_4 of D_PrimOp_1_3 @[Mult_D_PrimOp.scala 52:20]
    inst l1_0 of D_PrimOp_1 @[Mult_D_PrimOp.scala 62:20]
    inst l1_1 of D_PrimOp_1_5 @[Mult_D_PrimOp.scala 63:20]
    inst l1_2 of D_PrimOp_1_2 @[Mult_D_PrimOp.scala 64:20]
    inst l1_3 of D_PrimOp_1_7 @[Mult_D_PrimOp.scala 65:20]
    inst l1_4 of D_PrimOp_1_1 @[Mult_D_PrimOp.scala 66:20]
    node _T = and(io_a_valid, io_b_valid) @[Mult_D_PrimOp.scala 86:20]
    node _GEN_0 = mux(_T, l1_0.io_out_bits, l1_1.io_out_bits) @[Mult_D_PrimOp.scala 86:35 Mult_D_PrimOp.scala 87:12 Mult_D_PrimOp.scala 93:12]
    node check1_ready = io_out_ready @[Mult_D_PrimOp.scala 75:20 Mult_D_PrimOp.scala 104:16]
    node _GEN_1 = mux(_T, check1_ready, io_out_ready) @[Mult_D_PrimOp.scala 86:35 Mult_D_PrimOp.scala 87:12 Mult_D_PrimOp.scala 95:23]
    node _GEN_2 = mux(_T, l1_0.io_out_valid, l1_1.io_out_valid) @[Mult_D_PrimOp.scala 86:35 Mult_D_PrimOp.scala 87:12 Mult_D_PrimOp.scala 93:12]
    node _GEN_3 = mux(_T, l1_2.io_out_bits, l1_3.io_out_bits) @[Mult_D_PrimOp.scala 86:35 Mult_D_PrimOp.scala 88:12 Mult_D_PrimOp.scala 94:12]
    node check2_ready = io_out_ready @[Mult_D_PrimOp.scala 80:20 Mult_D_PrimOp.scala 105:16]
    node _GEN_4 = mux(_T, check2_ready, io_out_ready) @[Mult_D_PrimOp.scala 86:35 Mult_D_PrimOp.scala 88:12 Mult_D_PrimOp.scala 96:23]
    node _GEN_5 = mux(_T, l1_2.io_out_valid, l1_3.io_out_valid) @[Mult_D_PrimOp.scala 86:35 Mult_D_PrimOp.scala 88:12 Mult_D_PrimOp.scala 94:12]
    node _GEN_6 = mux(_T, io_out_ready, check1_ready) @[Mult_D_PrimOp.scala 86:35 Mult_D_PrimOp.scala 89:23 Mult_D_PrimOp.scala 93:12]
    node _GEN_7 = mux(_T, io_out_ready, check2_ready) @[Mult_D_PrimOp.scala 86:35 Mult_D_PrimOp.scala 90:23 Mult_D_PrimOp.scala 94:12]
    node _GEN_8 = mux(_T, io_out_ready, io_out_ready) @[Mult_D_PrimOp.scala 86:35 Mult_D_PrimOp.scala 91:23 Mult_D_PrimOp.scala 97:23]
    node check2_bits = _GEN_3 @[Mult_D_PrimOp.scala 80:20]
    node rawOut_lo = asUInt(check2_bits) @[Cat.scala 30:58]
    node check1_bits = _GEN_0 @[Mult_D_PrimOp.scala 75:20]
    node rawOut_hi = asUInt(check1_bits) @[Cat.scala 30:58]
    node _rawOut_T = cat(rawOut_hi, rawOut_lo) @[Cat.scala 30:58]
    node rawOut = asSInt(_rawOut_T) @[Mult_D_PrimOp.scala 100:52]
    node check1_valid = _GEN_2 @[Mult_D_PrimOp.scala 75:20]
    node check2_valid = _GEN_5 @[Mult_D_PrimOp.scala 80:20]
    node _io_out_valid_T = and(check1_valid, check2_valid) @[Mult_D_PrimOp.scala 103:32]
    io_a_ready <= l0_4.io_a_ready @[Mult_D_PrimOp.scala 32:18]
    io_b_ready <= l0_4.io_b_ready @[Mult_D_PrimOp.scala 33:18]
    io_out_valid <= _io_out_valid_T @[Mult_D_PrimOp.scala 103:16]
    io_out_bits <= rawOut @[Mult_D_PrimOp.scala 102:15]
    l0_0.clock <= clock
    l0_0.reset <= reset
    l0_0.io_a_valid <= io_a_valid @[Mult_D_PrimOp.scala 32:18]
    l0_0.io_a_bits <= io_a_bits @[Mult_D_PrimOp.scala 32:18]
    l0_0.io_b_valid <= io_b_valid @[Mult_D_PrimOp.scala 33:18]
    l0_0.io_b_bits <= io_b_bits @[Mult_D_PrimOp.scala 33:18]
    l0_0.io_out_ready <= l1_0.io_a_ready @[Mult_D_PrimOp.scala 32:18]
    l0_1.clock <= clock
    l0_1.reset <= reset
    l0_1.io_a_valid <= io_a_valid @[Mult_D_PrimOp.scala 32:18]
    l0_1.io_a_bits <= io_a_bits @[Mult_D_PrimOp.scala 32:18]
    l0_1.io_b_valid <= io_b_valid @[Mult_D_PrimOp.scala 33:18]
    l0_1.io_b_bits <= io_b_bits @[Mult_D_PrimOp.scala 33:18]
    l0_1.io_out_ready <= l1_4.io_a_ready @[Mult_D_PrimOp.scala 32:18]
    l0_2.clock <= clock
    l0_2.reset <= reset
    l0_2.io_a_valid <= io_a_valid @[Mult_D_PrimOp.scala 32:18]
    l0_2.io_a_bits <= io_a_bits @[Mult_D_PrimOp.scala 32:18]
    l0_2.io_b_valid <= io_b_valid @[Mult_D_PrimOp.scala 33:18]
    l0_2.io_b_bits <= io_b_bits @[Mult_D_PrimOp.scala 33:18]
    l0_2.io_out_ready <= l1_2.io_a_ready @[Mult_D_PrimOp.scala 32:18]
    l0_3.clock <= clock
    l0_3.reset <= reset
    l0_3.io_a_valid <= io_a_valid @[Mult_D_PrimOp.scala 30:18]
    l0_3.io_a_bits <= io_a_bits @[Mult_D_PrimOp.scala 30:18]
    l0_3.io_out_ready <= l1_3.io_a_ready @[Mult_D_PrimOp.scala 32:18]
    l0_4.clock <= clock
    l0_4.reset <= reset
    l0_4.io_a_valid <= io_a_valid @[Mult_D_PrimOp.scala 32:18]
    l0_4.io_a_bits <= io_a_bits @[Mult_D_PrimOp.scala 32:18]
    l0_4.io_b_valid <= io_b_valid @[Mult_D_PrimOp.scala 33:18]
    l0_4.io_b_bits <= io_b_bits @[Mult_D_PrimOp.scala 33:18]
    l0_4.io_out_ready <= l1_4.io_b_ready @[Mult_D_PrimOp.scala 33:18]
    l1_0.clock <= clock
    l1_0.reset <= reset
    l1_0.io_a_valid <= l0_0.io_out_valid @[Mult_D_PrimOp.scala 32:18]
    l1_0.io_a_bits <= l0_0.io_out_bits @[Mult_D_PrimOp.scala 32:18]
    l1_0.io_b_valid <= l0_1.io_out_valid @[Mult_D_PrimOp.scala 33:18]
    l1_0.io_b_bits <= l0_1.io_out_bits @[Mult_D_PrimOp.scala 33:18]
    l1_0.io_out_ready <= _GEN_1
    l1_1.clock <= clock
    l1_1.reset <= reset
    l1_1.io_a_valid <= l0_2.io_out_valid @[Mult_D_PrimOp.scala 32:18]
    l1_1.io_a_bits <= l0_2.io_out_bits @[Mult_D_PrimOp.scala 32:18]
    l1_1.io_b_valid <= l0_1.io_out_valid @[Mult_D_PrimOp.scala 33:18]
    l1_1.io_b_bits <= l0_1.io_out_bits @[Mult_D_PrimOp.scala 33:18]
    l1_1.io_out_ready <= _GEN_6
    l1_2.clock <= clock
    l1_2.reset <= reset
    l1_2.io_a_valid <= l0_2.io_out_valid @[Mult_D_PrimOp.scala 32:18]
    l1_2.io_a_bits <= l0_2.io_out_bits @[Mult_D_PrimOp.scala 32:18]
    l1_2.io_b_valid <= l0_3.io_out_valid @[Mult_D_PrimOp.scala 33:18]
    l1_2.io_b_bits <= l0_3.io_out_bits @[Mult_D_PrimOp.scala 33:18]
    l1_2.io_out_ready <= _GEN_4
    l1_3.clock <= clock
    l1_3.reset <= reset
    l1_3.io_a_valid <= l0_3.io_out_valid @[Mult_D_PrimOp.scala 32:18]
    l1_3.io_a_bits <= l0_3.io_out_bits @[Mult_D_PrimOp.scala 32:18]
    l1_3.io_b_valid <= l0_4.io_out_valid @[Mult_D_PrimOp.scala 33:18]
    l1_3.io_b_bits <= l0_4.io_out_bits @[Mult_D_PrimOp.scala 33:18]
    l1_3.io_out_ready <= _GEN_7
    l1_4.clock <= clock
    l1_4.reset <= reset
    l1_4.io_a_valid <= l0_1.io_out_valid @[Mult_D_PrimOp.scala 32:18]
    l1_4.io_a_bits <= l0_1.io_out_bits @[Mult_D_PrimOp.scala 32:18]
    l1_4.io_b_valid <= l0_4.io_out_valid @[Mult_D_PrimOp.scala 33:18]
    l1_4.io_b_bits <= l0_4.io_out_bits @[Mult_D_PrimOp.scala 33:18]
    l1_4.io_out_ready <= _GEN_8
