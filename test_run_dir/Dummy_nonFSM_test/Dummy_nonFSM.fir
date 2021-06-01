;buildInfoPackage: chisel3, version: 3.4.3, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit Dummy_nonFSM : 
  module Dummy_nonFSM : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<4>}, out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<4>}}
    
    node _io_in_ready_T = and(io.in.valid, io.out.ready) @[dummy_nonFSM copy.scala 13:32]
    node _io_in_ready_T_1 = eq(_io_in_ready_T, UInt<1>("h00")) @[dummy_nonFSM copy.scala 13:18]
    io.in.ready <= _io_in_ready_T_1 @[dummy_nonFSM copy.scala 13:15]
    reg enable : UInt<1>, clock @[dummy_nonFSM copy.scala 14:23]
    enable <= io.in.ready @[dummy_nonFSM copy.scala 14:23]
    reg value : UInt<3>, clock with : (reset => (reset, UInt<3>("h00"))) @[Counter.scala 60:40]
    node _T = eq(enable, UInt<1>("h00")) @[dummy_nonFSM copy.scala 17:8]
    when _T : @[dummy_nonFSM copy.scala 17:17]
      node wrap = eq(value, UInt<3>("h07")) @[Counter.scala 72:24]
      node _value_T = add(value, UInt<1>("h01")) @[Counter.scala 76:24]
      node _value_T_1 = tail(_value_T, 1) @[Counter.scala 76:24]
      value <= _value_T_1 @[Counter.scala 76:15]
      skip @[dummy_nonFSM copy.scala 17:17]
    node _T_1 = add(UInt<3>("h06"), UInt<1>("h01")) @[dummy_nonFSM copy.scala 21:31]
    node _T_2 = tail(_T_1, 1) @[dummy_nonFSM copy.scala 21:31]
    node _T_3 = eq(value, _T_2) @[dummy_nonFSM copy.scala 21:22]
    when _T_3 : @[dummy_nonFSM copy.scala 21:38]
      value <= UInt<1>("h00") @[Counter.scala 97:11]
      node _io_out_bits_T = add(io.in.bits, UInt<1>("h01")) @[dummy_nonFSM copy.scala 23:31]
      node _io_out_bits_T_1 = tail(_io_out_bits_T, 1) @[dummy_nonFSM copy.scala 23:31]
      io.out.bits <= _io_out_bits_T_1 @[dummy_nonFSM copy.scala 23:17]
      io.out.valid <= UInt<1>("h01") @[dummy_nonFSM copy.scala 24:18]
      skip @[dummy_nonFSM copy.scala 21:38]
    else : @[dummy_nonFSM copy.scala 25:15]
      io.out.bits <= UInt<1>("h00") @[dummy_nonFSM copy.scala 26:17]
      io.out.valid <= UInt<1>("h00") @[dummy_nonFSM copy.scala 27:18]
      skip @[dummy_nonFSM copy.scala 25:15]
    
