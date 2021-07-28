circuit Mult_D_PrimOp2 :
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
      reset => (UInt<1>("h0"), head) @[D_PrimOp.scala 104:21]
    reg tail : UInt<1>, clock with :
      reset => (UInt<1>("h0"), tail) @[D_PrimOp.scala 105:21]
    reg full_0 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), full_0) @[D_PrimOp.scala 107:17]
    reg full_1 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), full_1) @[D_PrimOp.scala 107:17]
    reg data_0 : SInt<5>, clock with :
      reset => (UInt<1>("h0"), data_0) @[D_PrimOp.scala 108:17]
    reg data_1 : SInt<5>, clock with :
      reset => (UInt<1>("h0"), data_1) @[D_PrimOp.scala 108:17]
    node _T = asUInt(reset) @[D_PrimOp.scala 110:20]
    node _GEN_0 = mux(_T, UInt<1>("h0"), full_0) @[D_PrimOp.scala 110:24 D_PrimOp.scala 111:15 D_PrimOp.scala 107:17]
    node _GEN_1 = mux(_T, UInt<1>("h0"), full_1) @[D_PrimOp.scala 110:24 D_PrimOp.scala 112:15 D_PrimOp.scala 107:17]
    node _GEN_2 = mux(_T, asSInt(UInt<1>("h0")), data_0) @[D_PrimOp.scala 110:24 D_PrimOp.scala 113:15 D_PrimOp.scala 108:17]
    node _GEN_3 = mux(_T, asSInt(UInt<1>("h0")), data_1) @[D_PrimOp.scala 110:24 D_PrimOp.scala 114:15 D_PrimOp.scala 108:17]
    node _io_out_valid_T = or(full_0, full_1) @[D_PrimOp.scala 117:27]
    node _io_in_ready_T = eq(full_0, UInt<1>("h0")) @[D_PrimOp.scala 118:18]
    node _io_in_ready_T_1 = eq(full_1, UInt<1>("h0")) @[D_PrimOp.scala 118:29]
    node _io_in_ready_T_2 = or(_io_in_ready_T, _io_in_ready_T_1) @[D_PrimOp.scala 118:26]
    node _GEN_4 = validif(eq(UInt<1>("h0"), head), data_0) @[D_PrimOp.scala 119:15 D_PrimOp.scala 119:15]
    node _GEN_5 = mux(eq(UInt<1>("h1"), head), data_1, _GEN_4) @[D_PrimOp.scala 119:15 D_PrimOp.scala 119:15]
    node _GEN_6 = validif(eq(UInt<1>("h0"), tail), full_0) @[D_PrimOp.scala 121:23 D_PrimOp.scala 121:23]
    node _GEN_7 = mux(eq(UInt<1>("h1"), tail), full_1, _GEN_6) @[D_PrimOp.scala 121:23 D_PrimOp.scala 121:23]
    node _full_tail = _GEN_7 @[D_PrimOp.scala 121:23]
    node _T_1 = eq(_full_tail, UInt<1>("h0")) @[D_PrimOp.scala 121:23]
    node _T_2 = and(io_in_valid, _T_1) @[D_PrimOp.scala 121:20]
    node _full_tail_0 = UInt<1>("h1") @[D_PrimOp.scala 122:16 D_PrimOp.scala 122:16]
    node _GEN_8 = mux(eq(UInt<1>("h0"), tail), _full_tail_0, _GEN_0) @[D_PrimOp.scala 122:16 D_PrimOp.scala 122:16]
    node _GEN_9 = mux(eq(UInt<1>("h1"), tail), _full_tail_0, _GEN_1) @[D_PrimOp.scala 122:16 D_PrimOp.scala 122:16]
    node _data_tail = io_in_bits @[D_PrimOp.scala 123:16 D_PrimOp.scala 123:16]
    node _GEN_10 = mux(eq(UInt<1>("h0"), tail), _data_tail, _GEN_2) @[D_PrimOp.scala 123:16 D_PrimOp.scala 123:16]
    node _GEN_11 = mux(eq(UInt<1>("h1"), tail), _data_tail, _GEN_3) @[D_PrimOp.scala 123:16 D_PrimOp.scala 123:16]
    node _tail_T = eq(tail, UInt<1>("h0")) @[D_PrimOp.scala 124:13]
    node _GEN_12 = mux(_T_2, _GEN_8, _GEN_0) @[D_PrimOp.scala 121:36]
    node _GEN_13 = mux(_T_2, _GEN_9, _GEN_1) @[D_PrimOp.scala 121:36]
    node _GEN_14 = mux(_T_2, _GEN_10, _GEN_2) @[D_PrimOp.scala 121:36]
    node _GEN_15 = mux(_T_2, _GEN_11, _GEN_3) @[D_PrimOp.scala 121:36]
    node _GEN_16 = mux(_T_2, _tail_T, tail) @[D_PrimOp.scala 121:36 D_PrimOp.scala 124:10 D_PrimOp.scala 105:21]
    node _GEN_17 = validif(eq(UInt<1>("h0"), head), full_0) @[D_PrimOp.scala 127:21 D_PrimOp.scala 127:21]
    node _GEN_18 = mux(eq(UInt<1>("h1"), head), full_1, _GEN_17) @[D_PrimOp.scala 127:21 D_PrimOp.scala 127:21]
    node _full_head = _GEN_18 @[D_PrimOp.scala 127:21]
    node _T_3 = and(io_out_ready, _full_head) @[D_PrimOp.scala 127:21]
    node _full_head_0 = UInt<1>("h0") @[D_PrimOp.scala 128:16 D_PrimOp.scala 128:16]
    node _GEN_19 = mux(eq(UInt<1>("h0"), head), _full_head_0, _GEN_12) @[D_PrimOp.scala 128:16 D_PrimOp.scala 128:16]
    node _GEN_20 = mux(eq(UInt<1>("h1"), head), _full_head_0, _GEN_13) @[D_PrimOp.scala 128:16 D_PrimOp.scala 128:16]
    node _head_T = eq(head, UInt<1>("h0")) @[D_PrimOp.scala 129:13]
    node _GEN_21 = mux(_T_3, _GEN_19, _GEN_12) @[D_PrimOp.scala 127:36]
    node _GEN_22 = mux(_T_3, _GEN_20, _GEN_13) @[D_PrimOp.scala 127:36]
    node _GEN_23 = mux(_T_3, _head_T, head) @[D_PrimOp.scala 127:36 D_PrimOp.scala 129:10 D_PrimOp.scala 104:21]
    node _data_head = _GEN_5 @[D_PrimOp.scala 119:15]
    io_in_ready <= _io_in_ready_T_2 @[D_PrimOp.scala 118:15]
    io_out_valid <= _io_out_valid_T @[D_PrimOp.scala 117:16]
    io_out_bits <= _data_head @[D_PrimOp.scala 119:15]
    head <= mux(reset, UInt<1>("h0"), _GEN_23) @[D_PrimOp.scala 104:21 D_PrimOp.scala 104:21]
    tail <= mux(reset, UInt<1>("h0"), _GEN_16) @[D_PrimOp.scala 105:21 D_PrimOp.scala 105:21]
    full_0 <= _GEN_21
    full_1 <= _GEN_22
    data_0 <= _GEN_14
    data_1 <= _GEN_15

  module D_PrimOp2_1 :
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

    inst EB of EB_two @[D_PrimOp.scala 67:18]
    node _EB_io_in_bits_T = add(io_a_bits, io_b_bits) @[Mult_D_PrimOp.scala 8:47]
    node _EB_io_in_bits_T_1 = tail(_EB_io_in_bits_T, 1) @[Mult_D_PrimOp.scala 8:47]
    node _EB_io_in_bits_T_2 = asSInt(_EB_io_in_bits_T_1) @[Mult_D_PrimOp.scala 8:47]
    node _EB_io_in_valid_T = and(io_a_valid, io_b_valid) @[D_PrimOp.scala 70:32]
    io_a_ready <= EB.io_in_ready @[D_PrimOp.scala 71:14]
    io_b_ready <= EB.io_in_ready @[D_PrimOp.scala 72:14]
    io_out_valid <= EB.io_out_valid @[D_PrimOp.scala 75:16]
    io_out_bits <= EB.io_out_bits @[D_PrimOp.scala 74:15]
    EB.clock <= clock
    EB.reset <= reset
    EB.io_in_valid <= _EB_io_in_valid_T @[D_PrimOp.scala 70:18]
    EB.io_in_bits <= _EB_io_in_bits_T_2 @[D_PrimOp.scala 69:17]
    EB.io_out_ready <= io_out_ready @[D_PrimOp.scala 76:19]

  module D_PrimOp2_1_1 :
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

    inst EB of EB_two @[D_PrimOp.scala 67:18]
    node _EB_io_in_bits_T = mul(io_a_bits, io_b_bits) @[Mult_D_PrimOp.scala 10:47]
    node _EB_io_in_valid_T = and(io_a_valid, io_b_valid) @[D_PrimOp.scala 70:32]
    io_a_ready <= EB.io_in_ready @[D_PrimOp.scala 71:14]
    io_b_ready <= EB.io_in_ready @[D_PrimOp.scala 72:14]
    io_out_valid <= EB.io_out_valid @[D_PrimOp.scala 75:16]
    io_out_bits <= EB.io_out_bits @[D_PrimOp.scala 74:15]
    EB.clock <= clock
    EB.reset <= reset
    EB.io_in_valid <= _EB_io_in_valid_T @[D_PrimOp.scala 70:18]
    EB.io_in_bits <= asSInt(bits(_EB_io_in_bits_T, 4, 0)) @[D_PrimOp.scala 69:17]
    EB.io_out_ready <= io_out_ready @[D_PrimOp.scala 76:19]

  module D_PrimOp2_1_2 :
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

    inst EB of EB_two @[D_PrimOp.scala 67:18]
    node _EB_io_in_bits_T = sub(io_a_bits, io_b_bits) @[Mult_D_PrimOp.scala 9:47]
    node _EB_io_in_bits_T_1 = tail(_EB_io_in_bits_T, 1) @[Mult_D_PrimOp.scala 9:47]
    node _EB_io_in_bits_T_2 = asSInt(_EB_io_in_bits_T_1) @[Mult_D_PrimOp.scala 9:47]
    node _EB_io_in_valid_T = and(io_a_valid, io_b_valid) @[D_PrimOp.scala 70:32]
    io_a_ready <= EB.io_in_ready @[D_PrimOp.scala 71:14]
    io_b_ready <= EB.io_in_ready @[D_PrimOp.scala 72:14]
    io_out_valid <= EB.io_out_valid @[D_PrimOp.scala 75:16]
    io_out_bits <= EB.io_out_bits @[D_PrimOp.scala 74:15]
    EB.clock <= clock
    EB.reset <= reset
    EB.io_in_valid <= _EB_io_in_valid_T @[D_PrimOp.scala 70:18]
    EB.io_in_bits <= _EB_io_in_bits_T_2 @[D_PrimOp.scala 69:17]
    EB.io_out_ready <= io_out_ready @[D_PrimOp.scala 76:19]

  module D_PrimOp2_0 :
    input clock : Clock
    input reset : UInt<1>
    output io_a_ready : UInt<1>
    input io_a_valid : UInt<1>
    input io_a_bits : SInt<5>
    input io_out_ready : UInt<1>
    output io_out_valid : UInt<1>
    output io_out_bits : SInt<5>

    inst EB of EB_two @[D_PrimOp.scala 30:18]
    node _EB_io_in_bits_T = sub(asSInt(UInt<1>("h0")), io_a_bits) @[Mult_D_PrimOp.scala 14:32]
    node _EB_io_in_bits_T_1 = tail(_EB_io_in_bits_T, 1) @[Mult_D_PrimOp.scala 14:32]
    node _EB_io_in_bits_T_2 = asSInt(_EB_io_in_bits_T_1) @[Mult_D_PrimOp.scala 14:32]
    io_a_ready <= EB.io_in_ready @[D_PrimOp.scala 34:14]
    io_out_valid <= EB.io_out_valid @[D_PrimOp.scala 37:16]
    io_out_bits <= EB.io_out_bits @[D_PrimOp.scala 36:15]
    EB.clock <= clock
    EB.reset <= reset
    EB.io_in_valid <= io_a_valid @[D_PrimOp.scala 33:18]
    EB.io_in_bits <= _EB_io_in_bits_T_2 @[D_PrimOp.scala 32:17]
    EB.io_out_ready <= io_out_ready @[D_PrimOp.scala 38:19]

  module D_PrimOp2_1_3 :
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

    inst EB of EB_two @[D_PrimOp.scala 67:18]
    node _EB_io_in_bits_T = and(io_a_bits, io_b_bits) @[Mult_D_PrimOp.scala 15:47]
    node _EB_io_in_bits_T_1 = asSInt(_EB_io_in_bits_T) @[Mult_D_PrimOp.scala 15:47]
    node _EB_io_in_valid_T = and(io_a_valid, io_b_valid) @[D_PrimOp.scala 70:32]
    io_a_ready <= EB.io_in_ready @[D_PrimOp.scala 71:14]
    io_b_ready <= EB.io_in_ready @[D_PrimOp.scala 72:14]
    io_out_valid <= EB.io_out_valid @[D_PrimOp.scala 75:16]
    io_out_bits <= EB.io_out_bits @[D_PrimOp.scala 74:15]
    EB.clock <= clock
    EB.reset <= reset
    EB.io_in_valid <= _EB_io_in_valid_T @[D_PrimOp.scala 70:18]
    EB.io_in_bits <= _EB_io_in_bits_T_1 @[D_PrimOp.scala 69:17]
    EB.io_out_ready <= io_out_ready @[D_PrimOp.scala 76:19]

  module D_PrimOp2_1_5 :
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

    inst EB of EB_two @[D_PrimOp.scala 67:18]
    node _EB_io_in_bits_T = rem(io_a_bits, io_b_bits) @[Mult_D_PrimOp.scala 12:47]
    node _EB_io_in_valid_T = and(io_a_valid, io_b_valid) @[D_PrimOp.scala 70:32]
    io_a_ready <= EB.io_in_ready @[D_PrimOp.scala 71:14]
    io_b_ready <= EB.io_in_ready @[D_PrimOp.scala 72:14]
    io_out_valid <= EB.io_out_valid @[D_PrimOp.scala 75:16]
    io_out_bits <= EB.io_out_bits @[D_PrimOp.scala 74:15]
    EB.clock <= clock
    EB.reset <= reset
    EB.io_in_valid <= _EB_io_in_valid_T @[D_PrimOp.scala 70:18]
    EB.io_in_bits <= _EB_io_in_bits_T @[D_PrimOp.scala 69:17]
    EB.io_out_ready <= io_out_ready @[D_PrimOp.scala 76:19]

  module D_PrimOp2_1_7 :
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

    inst EB of EB_two @[D_PrimOp.scala 67:18]
    node _EB_io_in_bits_T = xor(io_a_bits, io_b_bits) @[Mult_D_PrimOp.scala 17:47]
    node _EB_io_in_bits_T_1 = asSInt(_EB_io_in_bits_T) @[Mult_D_PrimOp.scala 17:47]
    node _EB_io_in_valid_T = and(io_a_valid, io_b_valid) @[D_PrimOp.scala 70:32]
    io_a_ready <= EB.io_in_ready @[D_PrimOp.scala 71:14]
    io_b_ready <= EB.io_in_ready @[D_PrimOp.scala 72:14]
    io_out_valid <= EB.io_out_valid @[D_PrimOp.scala 75:16]
    io_out_bits <= EB.io_out_bits @[D_PrimOp.scala 74:15]
    EB.clock <= clock
    EB.reset <= reset
    EB.io_in_valid <= _EB_io_in_valid_T @[D_PrimOp.scala 70:18]
    EB.io_in_bits <= _EB_io_in_bits_T_1 @[D_PrimOp.scala 69:17]
    EB.io_out_ready <= io_out_ready @[D_PrimOp.scala 76:19]

  module Mult_D_PrimOp2 :
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

    inst l0_0 of D_PrimOp2_1 @[Mult_D_PrimOp.scala 124:20]
    inst l0_1 of D_PrimOp2_1_1 @[Mult_D_PrimOp.scala 125:20]
    inst l0_2 of D_PrimOp2_1_2 @[Mult_D_PrimOp.scala 126:20]
    inst l0_3 of D_PrimOp2_0 @[Mult_D_PrimOp.scala 127:20]
    inst l0_4 of D_PrimOp2_1_3 @[Mult_D_PrimOp.scala 128:20]
    inst l1_0 of D_PrimOp2_1 @[Mult_D_PrimOp.scala 138:20]
    inst l1_1 of D_PrimOp2_1_5 @[Mult_D_PrimOp.scala 139:20]
    inst l1_2 of D_PrimOp2_1_2 @[Mult_D_PrimOp.scala 140:20]
    inst l1_3 of D_PrimOp2_1_7 @[Mult_D_PrimOp.scala 141:20]
    inst l1_4 of D_PrimOp2_1_1 @[Mult_D_PrimOp.scala 142:20]
    node _T = and(io_a_valid, io_b_valid) @[Mult_D_PrimOp.scala 162:20]
    node _GEN_0 = mux(_T, l1_0.io_out_bits, l1_1.io_out_bits) @[Mult_D_PrimOp.scala 162:35 Mult_D_PrimOp.scala 163:12 Mult_D_PrimOp.scala 169:12]
    node check1_ready = io_out_ready @[Mult_D_PrimOp.scala 151:20 Mult_D_PrimOp.scala 180:16]
    node _GEN_1 = mux(_T, check1_ready, io_out_ready) @[Mult_D_PrimOp.scala 162:35 Mult_D_PrimOp.scala 163:12 Mult_D_PrimOp.scala 171:23]
    node _GEN_2 = mux(_T, l1_0.io_out_valid, l1_1.io_out_valid) @[Mult_D_PrimOp.scala 162:35 Mult_D_PrimOp.scala 163:12 Mult_D_PrimOp.scala 169:12]
    node _GEN_3 = mux(_T, l1_2.io_out_bits, l1_3.io_out_bits) @[Mult_D_PrimOp.scala 162:35 Mult_D_PrimOp.scala 164:12 Mult_D_PrimOp.scala 170:12]
    node check2_ready = io_out_ready @[Mult_D_PrimOp.scala 156:20 Mult_D_PrimOp.scala 181:16]
    node _GEN_4 = mux(_T, check2_ready, io_out_ready) @[Mult_D_PrimOp.scala 162:35 Mult_D_PrimOp.scala 164:12 Mult_D_PrimOp.scala 172:23]
    node _GEN_5 = mux(_T, l1_2.io_out_valid, l1_3.io_out_valid) @[Mult_D_PrimOp.scala 162:35 Mult_D_PrimOp.scala 164:12 Mult_D_PrimOp.scala 170:12]
    node _GEN_6 = mux(_T, io_out_ready, check1_ready) @[Mult_D_PrimOp.scala 162:35 Mult_D_PrimOp.scala 165:23 Mult_D_PrimOp.scala 169:12]
    node _GEN_7 = mux(_T, io_out_ready, check2_ready) @[Mult_D_PrimOp.scala 162:35 Mult_D_PrimOp.scala 166:23 Mult_D_PrimOp.scala 170:12]
    node _GEN_8 = mux(_T, io_out_ready, io_out_ready) @[Mult_D_PrimOp.scala 162:35 Mult_D_PrimOp.scala 167:23 Mult_D_PrimOp.scala 173:23]
    node check2_bits = _GEN_3 @[Mult_D_PrimOp.scala 156:20]
    node rawOut_lo = asUInt(check2_bits) @[Cat.scala 30:58]
    node check1_bits = _GEN_0 @[Mult_D_PrimOp.scala 151:20]
    node rawOut_hi = asUInt(check1_bits) @[Cat.scala 30:58]
    node _rawOut_T = cat(rawOut_hi, rawOut_lo) @[Cat.scala 30:58]
    node rawOut = asSInt(_rawOut_T) @[Mult_D_PrimOp.scala 176:52]
    node check1_valid = _GEN_2 @[Mult_D_PrimOp.scala 151:20]
    node check2_valid = _GEN_5 @[Mult_D_PrimOp.scala 156:20]
    node _io_out_valid_T = and(check1_valid, check2_valid) @[Mult_D_PrimOp.scala 179:32]
    io_a_ready <= l0_4.io_a_ready @[Mult_D_PrimOp.scala 117:18]
    io_b_ready <= l0_4.io_b_ready @[Mult_D_PrimOp.scala 118:18]
    io_out_valid <= _io_out_valid_T @[Mult_D_PrimOp.scala 179:16]
    io_out_bits <= rawOut @[Mult_D_PrimOp.scala 178:15]
    l0_0.clock <= clock
    l0_0.reset <= reset
    l0_0.io_a_valid <= io_a_valid @[Mult_D_PrimOp.scala 117:18]
    l0_0.io_a_bits <= io_a_bits @[Mult_D_PrimOp.scala 117:18]
    l0_0.io_b_valid <= io_b_valid @[Mult_D_PrimOp.scala 118:18]
    l0_0.io_b_bits <= io_b_bits @[Mult_D_PrimOp.scala 118:18]
    l0_0.io_out_ready <= l1_0.io_a_ready @[Mult_D_PrimOp.scala 117:18]
    l0_1.clock <= clock
    l0_1.reset <= reset
    l0_1.io_a_valid <= io_a_valid @[Mult_D_PrimOp.scala 117:18]
    l0_1.io_a_bits <= io_a_bits @[Mult_D_PrimOp.scala 117:18]
    l0_1.io_b_valid <= io_b_valid @[Mult_D_PrimOp.scala 118:18]
    l0_1.io_b_bits <= io_b_bits @[Mult_D_PrimOp.scala 118:18]
    l0_1.io_out_ready <= l1_4.io_a_ready @[Mult_D_PrimOp.scala 117:18]
    l0_2.clock <= clock
    l0_2.reset <= reset
    l0_2.io_a_valid <= io_a_valid @[Mult_D_PrimOp.scala 117:18]
    l0_2.io_a_bits <= io_a_bits @[Mult_D_PrimOp.scala 117:18]
    l0_2.io_b_valid <= io_b_valid @[Mult_D_PrimOp.scala 118:18]
    l0_2.io_b_bits <= io_b_bits @[Mult_D_PrimOp.scala 118:18]
    l0_2.io_out_ready <= l1_2.io_a_ready @[Mult_D_PrimOp.scala 117:18]
    l0_3.clock <= clock
    l0_3.reset <= reset
    l0_3.io_a_valid <= io_a_valid @[Mult_D_PrimOp.scala 115:18]
    l0_3.io_a_bits <= io_a_bits @[Mult_D_PrimOp.scala 115:18]
    l0_3.io_out_ready <= l1_3.io_a_ready @[Mult_D_PrimOp.scala 117:18]
    l0_4.clock <= clock
    l0_4.reset <= reset
    l0_4.io_a_valid <= io_a_valid @[Mult_D_PrimOp.scala 117:18]
    l0_4.io_a_bits <= io_a_bits @[Mult_D_PrimOp.scala 117:18]
    l0_4.io_b_valid <= io_b_valid @[Mult_D_PrimOp.scala 118:18]
    l0_4.io_b_bits <= io_b_bits @[Mult_D_PrimOp.scala 118:18]
    l0_4.io_out_ready <= l1_4.io_b_ready @[Mult_D_PrimOp.scala 118:18]
    l1_0.clock <= clock
    l1_0.reset <= reset
    l1_0.io_a_valid <= l0_0.io_out_valid @[Mult_D_PrimOp.scala 117:18]
    l1_0.io_a_bits <= l0_0.io_out_bits @[Mult_D_PrimOp.scala 117:18]
    l1_0.io_b_valid <= l0_1.io_out_valid @[Mult_D_PrimOp.scala 118:18]
    l1_0.io_b_bits <= l0_1.io_out_bits @[Mult_D_PrimOp.scala 118:18]
    l1_0.io_out_ready <= _GEN_1
    l1_1.clock <= clock
    l1_1.reset <= reset
    l1_1.io_a_valid <= l0_2.io_out_valid @[Mult_D_PrimOp.scala 117:18]
    l1_1.io_a_bits <= l0_2.io_out_bits @[Mult_D_PrimOp.scala 117:18]
    l1_1.io_b_valid <= l0_1.io_out_valid @[Mult_D_PrimOp.scala 118:18]
    l1_1.io_b_bits <= l0_1.io_out_bits @[Mult_D_PrimOp.scala 118:18]
    l1_1.io_out_ready <= _GEN_6
    l1_2.clock <= clock
    l1_2.reset <= reset
    l1_2.io_a_valid <= l0_2.io_out_valid @[Mult_D_PrimOp.scala 117:18]
    l1_2.io_a_bits <= l0_2.io_out_bits @[Mult_D_PrimOp.scala 117:18]
    l1_2.io_b_valid <= l0_3.io_out_valid @[Mult_D_PrimOp.scala 118:18]
    l1_2.io_b_bits <= l0_3.io_out_bits @[Mult_D_PrimOp.scala 118:18]
    l1_2.io_out_ready <= _GEN_4
    l1_3.clock <= clock
    l1_3.reset <= reset
    l1_3.io_a_valid <= l0_3.io_out_valid @[Mult_D_PrimOp.scala 117:18]
    l1_3.io_a_bits <= l0_3.io_out_bits @[Mult_D_PrimOp.scala 117:18]
    l1_3.io_b_valid <= l0_4.io_out_valid @[Mult_D_PrimOp.scala 118:18]
    l1_3.io_b_bits <= l0_4.io_out_bits @[Mult_D_PrimOp.scala 118:18]
    l1_3.io_out_ready <= _GEN_7
    l1_4.clock <= clock
    l1_4.reset <= reset
    l1_4.io_a_valid <= l0_1.io_out_valid @[Mult_D_PrimOp.scala 117:18]
    l1_4.io_a_bits <= l0_1.io_out_bits @[Mult_D_PrimOp.scala 117:18]
    l1_4.io_b_valid <= l0_4.io_out_valid @[Mult_D_PrimOp.scala 118:18]
    l1_4.io_b_bits <= l0_4.io_out_bits @[Mult_D_PrimOp.scala 118:18]
    l1_4.io_out_ready <= _GEN_8
