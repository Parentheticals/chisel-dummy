circuit MultipleModules :
  module Ope1 :
    input clock : Clock
    input reset : UInt<1>
    input io_a : UInt<7>
    output io_out : UInt<7>

    reg reg_a : UInt<7>, clock with :
      reset => (UInt<1>("h0"), reg_a) @[MultipleModules.scala 83:22]
    io_out <= reg_a @[MultipleModules.scala 87:10]
    reg_a <= mux(reset, UInt<7>("h0"), io_a) @[MultipleModules.scala 83:22 MultipleModules.scala 83:22 MultipleModules.scala 85:9]

  module Ope2 :
    input clock : Clock
    input reset : UInt<1>
    input io_a : UInt<7>
    output io_out : UInt<7>

    reg reg_a : UInt<7>, clock with :
      reset => (UInt<1>("h0"), reg_a) @[MultipleModules.scala 96:22]
    reg reg_b : UInt<7>, clock with :
      reset => (UInt<1>("h0"), reg_b) @[MultipleModules.scala 97:22]
    node _T = rem(reg_b, UInt<2>("h2")) @[MultipleModules.scala 102:14]
    node _T_1 = eq(_T, UInt<1>("h0")) @[MultipleModules.scala 102:20]
    node _GEN_0 = mux(_T_1, reg_b, reg_a) @[MultipleModules.scala 102:29 MultipleModules.scala 103:12 MultipleModules.scala 105:12]
    io_out <= _GEN_0
    reg_a <= mux(reset, UInt<7>("h0"), io_a) @[MultipleModules.scala 96:22 MultipleModules.scala 96:22 MultipleModules.scala 99:9]
    reg_b <= mux(reset, UInt<7>("h0"), reg_a) @[MultipleModules.scala 97:22 MultipleModules.scala 97:22 MultipleModules.scala 100:9]

  module Ope :
    input clock : Clock
    input reset : UInt<1>
    input io_a : UInt<7>
    input io_b : UInt<7>
    output io_out_a : UInt<7>
    output io_out_b : UInt<7>

    inst op1 of Ope1 @[MultipleModules.scala 67:19]
    inst op2 of Ope2 @[MultipleModules.scala 68:19]
    io_out_a <= op1.io_out @[MultipleModules.scala 73:12]
    io_out_b <= op2.io_out @[MultipleModules.scala 74:12]
    op1.clock <= clock
    op1.reset <= reset
    op1.io_a <= io_a @[MultipleModules.scala 70:12]
    op2.clock <= clock
    op2.reset <= reset
    op2.io_a <= io_b @[MultipleModules.scala 71:12]

  module MultipleModules :
    input clock : Clock
    input reset : UInt<1>
    output io_in1_ready : UInt<1>
    input io_in1_valid : UInt<1>
    input io_in1_bits : UInt<7>
    output io_in2_ready : UInt<1>
    input io_in2_valid : UInt<1>
    input io_in2_bits : UInt<7>
    input io_out1_ready : UInt<1>
    output io_out1_valid : UInt<1>
    output io_out1_bits : UInt<7>
    input io_out2_ready : UInt<1>
    output io_out2_valid : UInt<1>
    output io_out2_bits : UInt<7>

    inst pipeline_0 of Ope @[MultipleModules.scala 15:11]
    inst pipeline_1 of Ope @[MultipleModules.scala 15:11]
    inst pipeline_2 of Ope @[MultipleModules.scala 15:11]
    inst pipeline_3 of Ope @[MultipleModules.scala 15:11]
    inst pipeline_4 of Ope @[MultipleModules.scala 15:11]
    inst pipeline_5 of Ope @[MultipleModules.scala 15:11]
    inst pipeline_6 of Ope @[MultipleModules.scala 15:11]
    inst pipeline_7 of Ope @[MultipleModules.scala 15:11]
    inst pipeline_8 of Ope @[MultipleModules.scala 15:11]
    inst pipeline_9 of Ope @[MultipleModules.scala 15:11]
    node _GEN_0 = mux(io_in1_valid, io_in1_bits, UInt<1>("h0")) @[MultipleModules.scala 18:22 MultipleModules.scala 19:24 MultipleModules.scala 21:24]
    node _GEN_1 = mux(io_in2_valid, io_in2_bits, UInt<1>("h0")) @[MultipleModules.scala 24:22 MultipleModules.scala 25:24 MultipleModules.scala 27:24]
    node _GEN_2 = mux(io_in1_valid, pipeline_0.io_out_a, UInt<1>("h0")) @[MultipleModules.scala 31:26 MultipleModules.scala 32:16 MultipleModules.scala 34:16]
    node _GEN_3 = mux(io_in2_valid, pipeline_0.io_out_b, UInt<1>("h0")) @[MultipleModules.scala 36:26 MultipleModules.scala 37:16 MultipleModules.scala 39:16]
    node _GEN_4 = mux(io_in1_valid, pipeline_1.io_out_a, UInt<1>("h0")) @[MultipleModules.scala 31:26 MultipleModules.scala 32:16 MultipleModules.scala 34:16]
    node _GEN_5 = mux(io_in2_valid, pipeline_1.io_out_b, UInt<1>("h0")) @[MultipleModules.scala 36:26 MultipleModules.scala 37:16 MultipleModules.scala 39:16]
    node _GEN_6 = mux(io_in1_valid, pipeline_2.io_out_a, UInt<1>("h0")) @[MultipleModules.scala 31:26 MultipleModules.scala 32:16 MultipleModules.scala 34:16]
    node _GEN_7 = mux(io_in2_valid, pipeline_2.io_out_b, UInt<1>("h0")) @[MultipleModules.scala 36:26 MultipleModules.scala 37:16 MultipleModules.scala 39:16]
    node _GEN_8 = mux(io_in1_valid, pipeline_3.io_out_a, UInt<1>("h0")) @[MultipleModules.scala 31:26 MultipleModules.scala 32:16 MultipleModules.scala 34:16]
    node _GEN_9 = mux(io_in2_valid, pipeline_3.io_out_b, UInt<1>("h0")) @[MultipleModules.scala 36:26 MultipleModules.scala 37:16 MultipleModules.scala 39:16]
    node _GEN_10 = mux(io_in1_valid, pipeline_4.io_out_a, UInt<1>("h0")) @[MultipleModules.scala 31:26 MultipleModules.scala 32:16 MultipleModules.scala 34:16]
    node _GEN_11 = mux(io_in2_valid, pipeline_4.io_out_b, UInt<1>("h0")) @[MultipleModules.scala 36:26 MultipleModules.scala 37:16 MultipleModules.scala 39:16]
    node _GEN_12 = mux(io_in1_valid, pipeline_5.io_out_a, UInt<1>("h0")) @[MultipleModules.scala 31:26 MultipleModules.scala 32:16 MultipleModules.scala 34:16]
    node _GEN_13 = mux(io_in2_valid, pipeline_5.io_out_b, UInt<1>("h0")) @[MultipleModules.scala 36:26 MultipleModules.scala 37:16 MultipleModules.scala 39:16]
    node _GEN_14 = mux(io_in1_valid, pipeline_6.io_out_a, UInt<1>("h0")) @[MultipleModules.scala 31:26 MultipleModules.scala 32:16 MultipleModules.scala 34:16]
    node _GEN_15 = mux(io_in2_valid, pipeline_6.io_out_b, UInt<1>("h0")) @[MultipleModules.scala 36:26 MultipleModules.scala 37:16 MultipleModules.scala 39:16]
    node _GEN_16 = mux(io_in1_valid, pipeline_7.io_out_a, UInt<1>("h0")) @[MultipleModules.scala 31:26 MultipleModules.scala 32:16 MultipleModules.scala 34:16]
    node _GEN_17 = mux(io_in2_valid, pipeline_7.io_out_b, UInt<1>("h0")) @[MultipleModules.scala 36:26 MultipleModules.scala 37:16 MultipleModules.scala 39:16]
    node _GEN_18 = mux(io_in1_valid, pipeline_8.io_out_a, UInt<1>("h0")) @[MultipleModules.scala 31:26 MultipleModules.scala 32:16 MultipleModules.scala 34:16]
    node _GEN_19 = mux(io_in2_valid, pipeline_8.io_out_b, UInt<1>("h0")) @[MultipleModules.scala 36:26 MultipleModules.scala 37:16 MultipleModules.scala 39:16]
    node _io_out1_valid_T = neq(pipeline_9.io_out_a, UInt<1>("h0")) @[MultipleModules.scala 55:47]
    node _io_out2_valid_T = neq(pipeline_9.io_out_b, UInt<1>("h0")) @[MultipleModules.scala 56:47]
    io_in1_ready <= UInt<1>("h1") @[MultipleModules.scala 49:16]
    io_in2_ready <= UInt<1>("h1") @[MultipleModules.scala 50:16]
    io_out1_valid <= _io_out1_valid_T @[MultipleModules.scala 55:17]
    io_out1_bits <= pipeline_9.io_out_a @[MultipleModules.scala 52:16]
    io_out2_valid <= _io_out2_valid_T @[MultipleModules.scala 56:17]
    io_out2_bits <= pipeline_9.io_out_b @[MultipleModules.scala 53:16]
    pipeline_0.clock <= clock
    pipeline_0.reset <= reset
    pipeline_0.io_a <= _GEN_0
    pipeline_0.io_b <= _GEN_1
    pipeline_1.clock <= clock
    pipeline_1.reset <= reset
    pipeline_1.io_a <= _GEN_2
    pipeline_1.io_b <= _GEN_3
    pipeline_2.clock <= clock
    pipeline_2.reset <= reset
    pipeline_2.io_a <= _GEN_4
    pipeline_2.io_b <= _GEN_5
    pipeline_3.clock <= clock
    pipeline_3.reset <= reset
    pipeline_3.io_a <= _GEN_6
    pipeline_3.io_b <= _GEN_7
    pipeline_4.clock <= clock
    pipeline_4.reset <= reset
    pipeline_4.io_a <= _GEN_8
    pipeline_4.io_b <= _GEN_9
    pipeline_5.clock <= clock
    pipeline_5.reset <= reset
    pipeline_5.io_a <= _GEN_10
    pipeline_5.io_b <= _GEN_11
    pipeline_6.clock <= clock
    pipeline_6.reset <= reset
    pipeline_6.io_a <= _GEN_12
    pipeline_6.io_b <= _GEN_13
    pipeline_7.clock <= clock
    pipeline_7.reset <= reset
    pipeline_7.io_a <= _GEN_14
    pipeline_7.io_b <= _GEN_15
    pipeline_8.clock <= clock
    pipeline_8.reset <= reset
    pipeline_8.io_a <= _GEN_16
    pipeline_8.io_b <= _GEN_17
    pipeline_9.clock <= clock
    pipeline_9.reset <= reset
    pipeline_9.io_a <= _GEN_18
    pipeline_9.io_b <= _GEN_19
