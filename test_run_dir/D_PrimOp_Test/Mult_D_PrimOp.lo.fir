circuit Mult_D_PrimOp :
  module EB_two :
    input clock : Clock
    input reset : UInt<1>
    output io_in_ready : UInt<1>
    input io_in_valid : UInt<1>
    input io_in_bits : SInt<5>
    input io_out_ready : UInt<1>
    output io_out_valid : UInt<1>
    output io_out_bits : SInt<5>

    reg head : UInt<1>, clock with :
      reset => (UInt<1>("h0"), head) @[D_PrimOp.scala 68:21]
    reg tail : UInt<1>, clock with :
      reset => (UInt<1>("h0"), tail) @[D_PrimOp.scala 69:21]
    reg full_0 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), full_0) @[D_PrimOp.scala 71:17]
    reg full_1 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), full_1) @[D_PrimOp.scala 71:17]
    reg data_0 : SInt<5>, clock with :
      reset => (UInt<1>("h0"), data_0) @[D_PrimOp.scala 72:17]
    reg data_1 : SInt<5>, clock with :
      reset => (UInt<1>("h0"), data_1) @[D_PrimOp.scala 72:17]
    node _T = asUInt(reset) @[D_PrimOp.scala 74:20]
    node _GEN_0 = mux(_T, UInt<1>("h0"), full_0) @[D_PrimOp.scala 74:24 D_PrimOp.scala 75:15 D_PrimOp.scala 71:17]
    node _GEN_1 = mux(_T, UInt<1>("h0"), full_1) @[D_PrimOp.scala 74:24 D_PrimOp.scala 76:15 D_PrimOp.scala 71:17]
    node _GEN_2 = mux(_T, asSInt(UInt<1>("h0")), data_0) @[D_PrimOp.scala 74:24 D_PrimOp.scala 77:15 D_PrimOp.scala 72:17]
    node _GEN_3 = mux(_T, asSInt(UInt<1>("h0")), data_1) @[D_PrimOp.scala 74:24 D_PrimOp.scala 78:15 D_PrimOp.scala 72:17]
    node _io_out_valid_T = or(full_0, full_1) @[D_PrimOp.scala 81:27]
    node _io_in_ready_T = eq(full_0, UInt<1>("h0")) @[D_PrimOp.scala 82:18]
    node _io_in_ready_T_1 = eq(full_1, UInt<1>("h0")) @[D_PrimOp.scala 82:29]
    node _io_in_ready_T_2 = or(_io_in_ready_T, _io_in_ready_T_1) @[D_PrimOp.scala 82:26]
    node _GEN_4 = validif(eq(UInt<1>("h0"), head), data_0) @[D_PrimOp.scala 83:15 D_PrimOp.scala 83:15]
    node _GEN_5 = mux(eq(UInt<1>("h1"), head), data_1, _GEN_4) @[D_PrimOp.scala 83:15 D_PrimOp.scala 83:15]
    node _GEN_6 = validif(eq(UInt<1>("h0"), tail), full_0) @[D_PrimOp.scala 85:23 D_PrimOp.scala 85:23]
    node _GEN_7 = mux(eq(UInt<1>("h1"), tail), full_1, _GEN_6) @[D_PrimOp.scala 85:23 D_PrimOp.scala 85:23]
    node _full_tail = _GEN_7 @[D_PrimOp.scala 85:23]
    node _T_1 = eq(_full_tail, UInt<1>("h0")) @[D_PrimOp.scala 85:23]
    node _T_2 = and(io_in_valid, _T_1) @[D_PrimOp.scala 85:20]
    node _full_tail_0 = UInt<1>("h1") @[D_PrimOp.scala 86:16 D_PrimOp.scala 86:16]
    node _GEN_8 = mux(eq(UInt<1>("h0"), tail), _full_tail_0, _GEN_0) @[D_PrimOp.scala 86:16 D_PrimOp.scala 86:16]
    node _GEN_9 = mux(eq(UInt<1>("h1"), tail), _full_tail_0, _GEN_1) @[D_PrimOp.scala 86:16 D_PrimOp.scala 86:16]
    node _data_tail = io_in_bits @[D_PrimOp.scala 87:16 D_PrimOp.scala 87:16]
    node _GEN_10 = mux(eq(UInt<1>("h0"), tail), _data_tail, _GEN_2) @[D_PrimOp.scala 87:16 D_PrimOp.scala 87:16]
    node _GEN_11 = mux(eq(UInt<1>("h1"), tail), _data_tail, _GEN_3) @[D_PrimOp.scala 87:16 D_PrimOp.scala 87:16]
    node _tail_T = eq(tail, UInt<1>("h0")) @[D_PrimOp.scala 88:13]
    node _GEN_12 = mux(_T_2, _GEN_8, _GEN_0) @[D_PrimOp.scala 85:36]
    node _GEN_13 = mux(_T_2, _GEN_9, _GEN_1) @[D_PrimOp.scala 85:36]
    node _GEN_14 = mux(_T_2, _GEN_10, _GEN_2) @[D_PrimOp.scala 85:36]
    node _GEN_15 = mux(_T_2, _GEN_11, _GEN_3) @[D_PrimOp.scala 85:36]
    node _GEN_16 = mux(_T_2, _tail_T, tail) @[D_PrimOp.scala 85:36 D_PrimOp.scala 88:10 D_PrimOp.scala 69:21]
    node _GEN_17 = validif(eq(UInt<1>("h0"), head), full_0) @[D_PrimOp.scala 91:21 D_PrimOp.scala 91:21]
    node _GEN_18 = mux(eq(UInt<1>("h1"), head), full_1, _GEN_17) @[D_PrimOp.scala 91:21 D_PrimOp.scala 91:21]
    node _full_head = _GEN_18 @[D_PrimOp.scala 91:21]
    node _T_3 = and(io_out_ready, _full_head) @[D_PrimOp.scala 91:21]
    node _full_head_0 = UInt<1>("h0") @[D_PrimOp.scala 92:16 D_PrimOp.scala 92:16]
    node _GEN_19 = mux(eq(UInt<1>("h0"), head), _full_head_0, _GEN_12) @[D_PrimOp.scala 92:16 D_PrimOp.scala 92:16]
    node _GEN_20 = mux(eq(UInt<1>("h1"), head), _full_head_0, _GEN_13) @[D_PrimOp.scala 92:16 D_PrimOp.scala 92:16]
    node _head_T = eq(head, UInt<1>("h0")) @[D_PrimOp.scala 93:13]
    node _GEN_21 = mux(_T_3, _GEN_19, _GEN_12) @[D_PrimOp.scala 91:36]
    node _GEN_22 = mux(_T_3, _GEN_20, _GEN_13) @[D_PrimOp.scala 91:36]
    node _GEN_23 = mux(_T_3, _head_T, head) @[D_PrimOp.scala 91:36 D_PrimOp.scala 93:10 D_PrimOp.scala 68:21]
    node _data_head = _GEN_5 @[D_PrimOp.scala 83:15]
    io_in_ready <= _io_in_ready_T_2 @[D_PrimOp.scala 82:15]
    io_out_valid <= _io_out_valid_T @[D_PrimOp.scala 81:16]
    io_out_bits <= _data_head @[D_PrimOp.scala 83:15]
    head <= mux(reset, UInt<1>("h0"), _GEN_23) @[D_PrimOp.scala 68:21 D_PrimOp.scala 68:21]
    tail <= mux(reset, UInt<1>("h0"), _GEN_16) @[D_PrimOp.scala 69:21 D_PrimOp.scala 69:21]
    full_0 <= _GEN_21
    full_1 <= _GEN_22
    data_0 <= _GEN_14
    data_1 <= _GEN_15

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

    inst EB of EB_two @[D_PrimOp.scala 31:18]
    node _EB_io_in_bits_T = add(io_a_bits, io_b_bits) @[Mult_D_PrimOp.scala 15:49]
    node _EB_io_in_bits_T_1 = tail(_EB_io_in_bits_T, 1) @[Mult_D_PrimOp.scala 15:49]
    node _EB_io_in_bits_T_2 = asSInt(_EB_io_in_bits_T_1) @[Mult_D_PrimOp.scala 15:49]
    node _EB_io_in_valid_T = and(io_a_valid, io_b_valid) @[D_PrimOp.scala 34:32]
    io_a_ready <= EB.io_in_ready @[D_PrimOp.scala 35:14]
    io_b_ready <= EB.io_in_ready @[D_PrimOp.scala 36:14]
    io_out_valid <= EB.io_out_valid @[D_PrimOp.scala 39:16]
    io_out_bits <= EB.io_out_bits @[D_PrimOp.scala 38:15]
    EB.clock <= clock
    EB.reset <= reset
    EB.io_in_valid <= _EB_io_in_valid_T @[D_PrimOp.scala 34:18]
    EB.io_in_bits <= _EB_io_in_bits_T_2 @[D_PrimOp.scala 33:17]
    EB.io_out_ready <= io_out_ready @[D_PrimOp.scala 40:19]

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

    inst EB of EB_two @[D_PrimOp.scala 31:18]
    node _EB_io_in_bits_T = mul(io_a_bits, io_b_bits) @[Mult_D_PrimOp.scala 17:49]
    node _EB_io_in_valid_T = and(io_a_valid, io_b_valid) @[D_PrimOp.scala 34:32]
    io_a_ready <= EB.io_in_ready @[D_PrimOp.scala 35:14]
    io_b_ready <= EB.io_in_ready @[D_PrimOp.scala 36:14]
    io_out_valid <= EB.io_out_valid @[D_PrimOp.scala 39:16]
    io_out_bits <= EB.io_out_bits @[D_PrimOp.scala 38:15]
    EB.clock <= clock
    EB.reset <= reset
    EB.io_in_valid <= _EB_io_in_valid_T @[D_PrimOp.scala 34:18]
    EB.io_in_bits <= asSInt(bits(_EB_io_in_bits_T, 4, 0)) @[D_PrimOp.scala 33:17]
    EB.io_out_ready <= io_out_ready @[D_PrimOp.scala 40:19]

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

    inst EB of EB_two @[D_PrimOp.scala 31:18]
    node _EB_io_in_bits_T = sub(io_a_bits, io_b_bits) @[Mult_D_PrimOp.scala 16:49]
    node _EB_io_in_bits_T_1 = tail(_EB_io_in_bits_T, 1) @[Mult_D_PrimOp.scala 16:49]
    node _EB_io_in_bits_T_2 = asSInt(_EB_io_in_bits_T_1) @[Mult_D_PrimOp.scala 16:49]
    node _EB_io_in_valid_T = and(io_a_valid, io_b_valid) @[D_PrimOp.scala 34:32]
    io_a_ready <= EB.io_in_ready @[D_PrimOp.scala 35:14]
    io_b_ready <= EB.io_in_ready @[D_PrimOp.scala 36:14]
    io_out_valid <= EB.io_out_valid @[D_PrimOp.scala 39:16]
    io_out_bits <= EB.io_out_bits @[D_PrimOp.scala 38:15]
    EB.clock <= clock
    EB.reset <= reset
    EB.io_in_valid <= _EB_io_in_valid_T @[D_PrimOp.scala 34:18]
    EB.io_in_bits <= _EB_io_in_bits_T_2 @[D_PrimOp.scala 33:17]
    EB.io_out_ready <= io_out_ready @[D_PrimOp.scala 40:19]

  module D_PrimOp_1_4 :
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

    inst EB of EB_two @[D_PrimOp.scala 31:18]
    node _EB_io_in_bits_T = rem(io_a_bits, io_b_bits) @[Mult_D_PrimOp.scala 19:49]
    node _EB_io_in_valid_T = and(io_a_valid, io_b_valid) @[D_PrimOp.scala 34:32]
    io_a_ready <= EB.io_in_ready @[D_PrimOp.scala 35:14]
    io_b_ready <= EB.io_in_ready @[D_PrimOp.scala 36:14]
    io_out_valid <= EB.io_out_valid @[D_PrimOp.scala 39:16]
    io_out_bits <= EB.io_out_bits @[D_PrimOp.scala 38:15]
    EB.clock <= clock
    EB.reset <= reset
    EB.io_in_valid <= _EB_io_in_valid_T @[D_PrimOp.scala 34:18]
    EB.io_in_bits <= _EB_io_in_bits_T @[D_PrimOp.scala 33:17]
    EB.io_out_ready <= io_out_ready @[D_PrimOp.scala 40:19]

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
    output io_out_bits : SInt<5>

    inst l0_0 of D_PrimOp_1 @[Mult_D_PrimOp.scala 39:20]
    inst l0_1 of D_PrimOp_1_1 @[Mult_D_PrimOp.scala 40:20]
    inst l0_2 of D_PrimOp_1_2 @[Mult_D_PrimOp.scala 41:20]
    inst l1_0 of D_PrimOp_1 @[Mult_D_PrimOp.scala 49:20]
    inst l1_1 of D_PrimOp_1_4 @[Mult_D_PrimOp.scala 50:20]
    node _T = and(io_a_valid, io_b_valid) @[Mult_D_PrimOp.scala 57:20]
    node _GEN_0 = mux(_T, l1_0.io_out_bits, l1_1.io_out_bits) @[Mult_D_PrimOp.scala 57:35 Mult_D_PrimOp.scala 58:12 Mult_D_PrimOp.scala 61:12]
    node _GEN_1 = mux(_T, l1_0.io_out_valid, l1_1.io_out_valid) @[Mult_D_PrimOp.scala 57:35 Mult_D_PrimOp.scala 58:12 Mult_D_PrimOp.scala 61:12]
    node _GEN_2 = mux(_T, io_out_ready, io_out_ready) @[Mult_D_PrimOp.scala 57:35 Mult_D_PrimOp.scala 58:12 Mult_D_PrimOp.scala 62:23]
    io_a_ready <= l0_2.io_a_ready @[Mult_D_PrimOp.scala 32:18]
    io_b_ready <= l0_2.io_b_ready @[Mult_D_PrimOp.scala 33:18]
    io_out_valid <= _GEN_1
    io_out_bits <= _GEN_0
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
    l0_1.io_out_ready <= l1_1.io_b_ready @[Mult_D_PrimOp.scala 33:18]
    l0_2.clock <= clock
    l0_2.reset <= reset
    l0_2.io_a_valid <= io_a_valid @[Mult_D_PrimOp.scala 32:18]
    l0_2.io_a_bits <= io_a_bits @[Mult_D_PrimOp.scala 32:18]
    l0_2.io_b_valid <= io_b_valid @[Mult_D_PrimOp.scala 33:18]
    l0_2.io_b_bits <= io_b_bits @[Mult_D_PrimOp.scala 33:18]
    l0_2.io_out_ready <= l1_1.io_a_ready @[Mult_D_PrimOp.scala 32:18]
    l1_0.clock <= clock
    l1_0.reset <= reset
    l1_0.io_a_valid <= l0_0.io_out_valid @[Mult_D_PrimOp.scala 32:18]
    l1_0.io_a_bits <= l0_0.io_out_bits @[Mult_D_PrimOp.scala 32:18]
    l1_0.io_b_valid <= l0_1.io_out_valid @[Mult_D_PrimOp.scala 33:18]
    l1_0.io_b_bits <= l0_1.io_out_bits @[Mult_D_PrimOp.scala 33:18]
    l1_0.io_out_ready <= _GEN_2
    l1_1.clock <= clock
    l1_1.reset <= reset
    l1_1.io_a_valid <= l0_2.io_out_valid @[Mult_D_PrimOp.scala 32:18]
    l1_1.io_a_bits <= l0_2.io_out_bits @[Mult_D_PrimOp.scala 32:18]
    l1_1.io_b_valid <= l0_1.io_out_valid @[Mult_D_PrimOp.scala 33:18]
    l1_1.io_b_bits <= l0_1.io_out_bits @[Mult_D_PrimOp.scala 33:18]
    l1_1.io_out_ready <= _GEN_2
