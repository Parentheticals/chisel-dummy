;buildInfoPackage: chisel3, version: 3.4.3, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit FIRFilter : 
  module FIRFilter : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in : UInt<10>, flip valid : UInt<1>, out : UInt<10>, flip consts : UInt<10>[7]}
    
    reg taps_1 : UInt<10>, clock with : (reset => (reset, UInt<10>("h00"))) @[FIRFilter.scala 15:66]
    reg taps_2 : UInt<10>, clock with : (reset => (reset, UInt<10>("h00"))) @[FIRFilter.scala 15:66]
    reg taps_3 : UInt<10>, clock with : (reset => (reset, UInt<10>("h00"))) @[FIRFilter.scala 15:66]
    reg taps_4 : UInt<10>, clock with : (reset => (reset, UInt<10>("h00"))) @[FIRFilter.scala 15:66]
    reg taps_5 : UInt<10>, clock with : (reset => (reset, UInt<10>("h00"))) @[FIRFilter.scala 15:66]
    reg taps_6 : UInt<10>, clock with : (reset => (reset, UInt<10>("h00"))) @[FIRFilter.scala 15:66]
    when io.valid : @[FIRFilter.scala 16:64]
      taps_1 <= io.in @[FIRFilter.scala 16:68]
      skip @[FIRFilter.scala 16:64]
    when io.valid : @[FIRFilter.scala 16:64]
      taps_2 <= taps_1 @[FIRFilter.scala 16:68]
      skip @[FIRFilter.scala 16:64]
    when io.valid : @[FIRFilter.scala 16:64]
      taps_3 <= taps_2 @[FIRFilter.scala 16:68]
      skip @[FIRFilter.scala 16:64]
    when io.valid : @[FIRFilter.scala 16:64]
      taps_4 <= taps_3 @[FIRFilter.scala 16:68]
      skip @[FIRFilter.scala 16:64]
    when io.valid : @[FIRFilter.scala 16:64]
      taps_5 <= taps_4 @[FIRFilter.scala 16:68]
      skip @[FIRFilter.scala 16:64]
    when io.valid : @[FIRFilter.scala 16:64]
      taps_6 <= taps_5 @[FIRFilter.scala 16:68]
      skip @[FIRFilter.scala 16:64]
    node _io_out_T = mul(io.in, io.consts[0]) @[FIRFilter.scala 18:56]
    node _io_out_T_1 = mul(taps_1, io.consts[1]) @[FIRFilter.scala 18:56]
    node _io_out_T_2 = mul(taps_2, io.consts[2]) @[FIRFilter.scala 18:56]
    node _io_out_T_3 = mul(taps_3, io.consts[3]) @[FIRFilter.scala 18:56]
    node _io_out_T_4 = mul(taps_4, io.consts[4]) @[FIRFilter.scala 18:56]
    node _io_out_T_5 = mul(taps_5, io.consts[5]) @[FIRFilter.scala 18:56]
    node _io_out_T_6 = mul(taps_6, io.consts[6]) @[FIRFilter.scala 18:56]
    node _io_out_T_7 = add(_io_out_T, _io_out_T_1) @[FIRFilter.scala 18:71]
    node _io_out_T_8 = tail(_io_out_T_7, 1) @[FIRFilter.scala 18:71]
    node _io_out_T_9 = add(_io_out_T_8, _io_out_T_2) @[FIRFilter.scala 18:71]
    node _io_out_T_10 = tail(_io_out_T_9, 1) @[FIRFilter.scala 18:71]
    node _io_out_T_11 = add(_io_out_T_10, _io_out_T_3) @[FIRFilter.scala 18:71]
    node _io_out_T_12 = tail(_io_out_T_11, 1) @[FIRFilter.scala 18:71]
    node _io_out_T_13 = add(_io_out_T_12, _io_out_T_4) @[FIRFilter.scala 18:71]
    node _io_out_T_14 = tail(_io_out_T_13, 1) @[FIRFilter.scala 18:71]
    node _io_out_T_15 = add(_io_out_T_14, _io_out_T_5) @[FIRFilter.scala 18:71]
    node _io_out_T_16 = tail(_io_out_T_15, 1) @[FIRFilter.scala 18:71]
    node _io_out_T_17 = add(_io_out_T_16, _io_out_T_6) @[FIRFilter.scala 18:71]
    node _io_out_T_18 = tail(_io_out_T_17, 1) @[FIRFilter.scala 18:71]
    io.out <= _io_out_T_18 @[FIRFilter.scala 18:10]
    
