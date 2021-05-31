circuit BadCounter :
  module BadCounter :
    input clock : Clock
    input reset : UInt<1>
    output io_out : UInt<3>

    reg reg1 : UInt<3>, clock with :
      reset => (UInt<1>("h0"), reg1) @[BadCounter.scala 11:17]
    reg reg2 : UInt<3>, clock with :
      reset => (UInt<1>("h0"), reg2) @[BadCounter.scala 12:21]
    node _reg2_T = add(reg2, reg1) @[BadCounter.scala 14:16]
    node _reg2_T_1 = tail(_reg2_T, 1) @[BadCounter.scala 14:16]
    io_out <= reg2 @[BadCounter.scala 15:10]
    reg1 <= UInt<1>("h1") @[BadCounter.scala 13:8]
    reg2 <= mux(reset, UInt<3>("h0"), _reg2_T_1) @[BadCounter.scala 12:21 BadCounter.scala 12:21 BadCounter.scala 14:8]
