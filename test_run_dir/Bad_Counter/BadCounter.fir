;buildInfoPackage: chisel3, version: 3.4.3, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit BadCounter : 
  module BadCounter : 
    input clock : Clock
    input reset : UInt<1>
    output io : {out : UInt<3>}
    
    reg reg1 : UInt<3>, clock @[BadCounter.scala 11:17]
    reg reg2 : UInt<3>, clock with : (reset => (reset, UInt<3>("h00"))) @[BadCounter.scala 12:21]
    reg1 <= UInt<1>("h01") @[BadCounter.scala 13:8]
    node _reg2_T = add(reg2, reg1) @[BadCounter.scala 14:16]
    node _reg2_T_1 = tail(_reg2_T, 1) @[BadCounter.scala 14:16]
    reg2 <= _reg2_T_1 @[BadCounter.scala 14:8]
    io.out <= reg2 @[BadCounter.scala 15:10]
    
