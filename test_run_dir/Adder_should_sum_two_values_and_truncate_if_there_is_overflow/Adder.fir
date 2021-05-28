;buildInfoPackage: chisel3, version: 3.4.3, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit Adder : 
  module Adder : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in1 : UInt<16>, flip in2 : UInt<16>, out : UInt<16>}
    
    node _io_out_T = add(io.in1, io.in2) @[adder.scala 22:22]
    io.out <= _io_out_T @[adder.scala 22:12]
    
