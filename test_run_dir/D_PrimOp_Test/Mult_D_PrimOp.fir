;buildInfoPackage: chisel3, version: 3.4.3, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit Mult_D_PrimOp : 
  module EB_two : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}, out : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}}
    
    reg head : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[D_PrimOp.scala 49:21]
    reg tail : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[D_PrimOp.scala 50:21]
    reg full : UInt<1>[2], clock @[D_PrimOp.scala 52:17]
    reg data : SInt<5>[2], clock @[D_PrimOp.scala 53:17]
    node _T = asUInt(reset) @[D_PrimOp.scala 55:20]
    when _T : @[D_PrimOp.scala 55:24]
      full[UInt<1>("h00")] <= UInt<1>("h00") @[D_PrimOp.scala 56:15]
      full[UInt<1>("h01")] <= UInt<1>("h00") @[D_PrimOp.scala 57:15]
      data[UInt<1>("h00")] <= asSInt(UInt<1>("h00")) @[D_PrimOp.scala 58:15]
      data[UInt<1>("h01")] <= asSInt(UInt<1>("h00")) @[D_PrimOp.scala 59:15]
      skip @[D_PrimOp.scala 55:24]
    node _io_out_valid_T = or(full[0], full[1]) @[D_PrimOp.scala 62:27]
    io.out.valid <= _io_out_valid_T @[D_PrimOp.scala 62:16]
    node _io_in_ready_T = eq(full[0], UInt<1>("h00")) @[D_PrimOp.scala 63:18]
    node _io_in_ready_T_1 = eq(full[1], UInt<1>("h00")) @[D_PrimOp.scala 63:29]
    node _io_in_ready_T_2 = or(_io_in_ready_T, _io_in_ready_T_1) @[D_PrimOp.scala 63:26]
    io.in.ready <= _io_in_ready_T_2 @[D_PrimOp.scala 63:15]
    io.out.bits <= data[head] @[D_PrimOp.scala 64:15]
    node _T_1 = eq(full[tail], UInt<1>("h00")) @[D_PrimOp.scala 66:23]
    node _T_2 = and(io.in.valid, _T_1) @[D_PrimOp.scala 66:20]
    when _T_2 : @[D_PrimOp.scala 66:36]
      full[tail] <= UInt<1>("h01") @[D_PrimOp.scala 67:16]
      data[tail] <= io.in.bits @[D_PrimOp.scala 68:16]
      node _tail_T = eq(tail, UInt<1>("h00")) @[D_PrimOp.scala 69:13]
      tail <= _tail_T @[D_PrimOp.scala 69:10]
      skip @[D_PrimOp.scala 66:36]
    node _T_3 = and(io.out.ready, full[head]) @[D_PrimOp.scala 72:21]
    when _T_3 : @[D_PrimOp.scala 72:36]
      full[head] <= UInt<1>("h00") @[D_PrimOp.scala 73:16]
      node _head_T = eq(head, UInt<1>("h00")) @[D_PrimOp.scala 74:13]
      head <= _head_T @[D_PrimOp.scala 74:10]
      skip @[D_PrimOp.scala 72:36]
    
  module D_PrimOp_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip a : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}, flip b : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}, out : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}}
    
    inst EB of EB_two @[D_PrimOp.scala 31:18]
    EB.clock <= clock
    EB.reset <= reset
    node _EB_io_in_bits_T = add(io.a.bits, io.b.bits) @[Mult_D_PrimOp.scala 15:49]
    node _EB_io_in_bits_T_1 = tail(_EB_io_in_bits_T, 1) @[Mult_D_PrimOp.scala 15:49]
    node _EB_io_in_bits_T_2 = asSInt(_EB_io_in_bits_T_1) @[Mult_D_PrimOp.scala 15:49]
    EB.io.in.bits <= _EB_io_in_bits_T_2 @[D_PrimOp.scala 33:17]
    node _EB_io_in_valid_T = and(io.a.valid, io.b.valid) @[D_PrimOp.scala 34:32]
    EB.io.in.valid <= _EB_io_in_valid_T @[D_PrimOp.scala 34:18]
    io.a.ready <= EB.io.in.ready @[D_PrimOp.scala 35:14]
    io.b.ready <= EB.io.in.ready @[D_PrimOp.scala 36:14]
    io.out.bits <= EB.io.out.bits @[D_PrimOp.scala 38:15]
    io.out.valid <= EB.io.out.valid @[D_PrimOp.scala 39:16]
    EB.io.out.ready <= io.out.ready @[D_PrimOp.scala 40:19]
    
  module Mult_D_PrimOp : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip a : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}, flip b : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}, out : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}}
    
    inst l0_0 of D_PrimOp_1 @[Mult_D_PrimOp.scala 39:20]
    l0_0.clock <= clock
    l0_0.reset <= reset
    l0_0.io.a.bits <= io.a.bits @[Mult_D_PrimOp.scala 32:18]
    l0_0.io.a.valid <= io.a.valid @[Mult_D_PrimOp.scala 32:18]
    io.a.ready <= l0_0.io.a.ready @[Mult_D_PrimOp.scala 32:18]
    l0_0.io.b.bits <= io.b.bits @[Mult_D_PrimOp.scala 33:18]
    l0_0.io.b.valid <= io.b.valid @[Mult_D_PrimOp.scala 33:18]
    io.b.ready <= l0_0.io.b.ready @[Mult_D_PrimOp.scala 33:18]
    io.out.bits <= l0_0.io.out.bits @[Mult_D_PrimOp.scala 45:10]
    io.out.valid <= l0_0.io.out.valid @[Mult_D_PrimOp.scala 45:10]
    l0_0.io.out.ready <= io.out.ready @[Mult_D_PrimOp.scala 45:10]
    
