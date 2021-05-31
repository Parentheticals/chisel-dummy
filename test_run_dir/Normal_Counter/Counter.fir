;buildInfoPackage: chisel3, version: 3.4.3, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit Counter : 
  module Counter : 
    input clock : Clock
    input reset : UInt<1>
    output io : {out : UInt<3>}
    
    reg register : UInt<3>, clock with : (reset => (reset, UInt<3>("h00"))) @[Counter.scala 11:25]
    node _register_T = add(register, UInt<1>("h01")) @[Counter.scala 12:24]
    node _register_T_1 = tail(_register_T, 1) @[Counter.scala 12:24]
    register <= _register_T_1 @[Counter.scala 12:12]
    io.out <= register @[Counter.scala 13:10]
    
