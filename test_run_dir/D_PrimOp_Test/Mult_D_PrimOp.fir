;buildInfoPackage: chisel3, version: 3.4.3, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit Mult_D_PrimOp : 
  module EB_two : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}, out : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}}
    
    reg head : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[D_PrimOp.scala 68:21]
    reg tail : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[D_PrimOp.scala 69:21]
    reg full : UInt<1>[2], clock @[D_PrimOp.scala 71:17]
    reg data : SInt<5>[2], clock @[D_PrimOp.scala 72:17]
    node _T = asUInt(reset) @[D_PrimOp.scala 74:20]
    when _T : @[D_PrimOp.scala 74:24]
      full[UInt<1>("h00")] <= UInt<1>("h00") @[D_PrimOp.scala 75:15]
      full[UInt<1>("h01")] <= UInt<1>("h00") @[D_PrimOp.scala 76:15]
      data[UInt<1>("h00")] <= asSInt(UInt<1>("h00")) @[D_PrimOp.scala 77:15]
      data[UInt<1>("h01")] <= asSInt(UInt<1>("h00")) @[D_PrimOp.scala 78:15]
      skip @[D_PrimOp.scala 74:24]
    node _io_out_valid_T = or(full[0], full[1]) @[D_PrimOp.scala 81:27]
    io.out.valid <= _io_out_valid_T @[D_PrimOp.scala 81:16]
    node _io_in_ready_T = eq(full[0], UInt<1>("h00")) @[D_PrimOp.scala 82:18]
    node _io_in_ready_T_1 = eq(full[1], UInt<1>("h00")) @[D_PrimOp.scala 82:29]
    node _io_in_ready_T_2 = or(_io_in_ready_T, _io_in_ready_T_1) @[D_PrimOp.scala 82:26]
    io.in.ready <= _io_in_ready_T_2 @[D_PrimOp.scala 82:15]
    io.out.bits <= data[head] @[D_PrimOp.scala 83:15]
    node _T_1 = eq(full[tail], UInt<1>("h00")) @[D_PrimOp.scala 85:23]
    node _T_2 = and(io.in.valid, _T_1) @[D_PrimOp.scala 85:20]
    when _T_2 : @[D_PrimOp.scala 85:36]
      full[tail] <= UInt<1>("h01") @[D_PrimOp.scala 86:16]
      data[tail] <= io.in.bits @[D_PrimOp.scala 87:16]
      node _tail_T = eq(tail, UInt<1>("h00")) @[D_PrimOp.scala 88:13]
      tail <= _tail_T @[D_PrimOp.scala 88:10]
      skip @[D_PrimOp.scala 85:36]
    node _T_3 = and(io.out.ready, full[head]) @[D_PrimOp.scala 91:21]
    when _T_3 : @[D_PrimOp.scala 91:36]
      full[head] <= UInt<1>("h00") @[D_PrimOp.scala 92:16]
      node _head_T = eq(head, UInt<1>("h00")) @[D_PrimOp.scala 93:13]
      head <= _head_T @[D_PrimOp.scala 93:10]
      skip @[D_PrimOp.scala 91:36]
    
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
    
  module EB_two_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}, out : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}}
    
    reg head : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[D_PrimOp.scala 68:21]
    reg tail : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[D_PrimOp.scala 69:21]
    reg full : UInt<1>[2], clock @[D_PrimOp.scala 71:17]
    reg data : SInt<5>[2], clock @[D_PrimOp.scala 72:17]
    node _T = asUInt(reset) @[D_PrimOp.scala 74:20]
    when _T : @[D_PrimOp.scala 74:24]
      full[UInt<1>("h00")] <= UInt<1>("h00") @[D_PrimOp.scala 75:15]
      full[UInt<1>("h01")] <= UInt<1>("h00") @[D_PrimOp.scala 76:15]
      data[UInt<1>("h00")] <= asSInt(UInt<1>("h00")) @[D_PrimOp.scala 77:15]
      data[UInt<1>("h01")] <= asSInt(UInt<1>("h00")) @[D_PrimOp.scala 78:15]
      skip @[D_PrimOp.scala 74:24]
    node _io_out_valid_T = or(full[0], full[1]) @[D_PrimOp.scala 81:27]
    io.out.valid <= _io_out_valid_T @[D_PrimOp.scala 81:16]
    node _io_in_ready_T = eq(full[0], UInt<1>("h00")) @[D_PrimOp.scala 82:18]
    node _io_in_ready_T_1 = eq(full[1], UInt<1>("h00")) @[D_PrimOp.scala 82:29]
    node _io_in_ready_T_2 = or(_io_in_ready_T, _io_in_ready_T_1) @[D_PrimOp.scala 82:26]
    io.in.ready <= _io_in_ready_T_2 @[D_PrimOp.scala 82:15]
    io.out.bits <= data[head] @[D_PrimOp.scala 83:15]
    node _T_1 = eq(full[tail], UInt<1>("h00")) @[D_PrimOp.scala 85:23]
    node _T_2 = and(io.in.valid, _T_1) @[D_PrimOp.scala 85:20]
    when _T_2 : @[D_PrimOp.scala 85:36]
      full[tail] <= UInt<1>("h01") @[D_PrimOp.scala 86:16]
      data[tail] <= io.in.bits @[D_PrimOp.scala 87:16]
      node _tail_T = eq(tail, UInt<1>("h00")) @[D_PrimOp.scala 88:13]
      tail <= _tail_T @[D_PrimOp.scala 88:10]
      skip @[D_PrimOp.scala 85:36]
    node _T_3 = and(io.out.ready, full[head]) @[D_PrimOp.scala 91:21]
    when _T_3 : @[D_PrimOp.scala 91:36]
      full[head] <= UInt<1>("h00") @[D_PrimOp.scala 92:16]
      node _head_T = eq(head, UInt<1>("h00")) @[D_PrimOp.scala 93:13]
      head <= _head_T @[D_PrimOp.scala 93:10]
      skip @[D_PrimOp.scala 91:36]
    
  module D_PrimOp_1_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip a : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}, flip b : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}, out : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}}
    
    inst EB of EB_two_1 @[D_PrimOp.scala 31:18]
    EB.clock <= clock
    EB.reset <= reset
    node _EB_io_in_bits_T = mul(io.a.bits, io.b.bits) @[Mult_D_PrimOp.scala 17:49]
    EB.io.in.bits <= _EB_io_in_bits_T @[D_PrimOp.scala 33:17]
    node _EB_io_in_valid_T = and(io.a.valid, io.b.valid) @[D_PrimOp.scala 34:32]
    EB.io.in.valid <= _EB_io_in_valid_T @[D_PrimOp.scala 34:18]
    io.a.ready <= EB.io.in.ready @[D_PrimOp.scala 35:14]
    io.b.ready <= EB.io.in.ready @[D_PrimOp.scala 36:14]
    io.out.bits <= EB.io.out.bits @[D_PrimOp.scala 38:15]
    io.out.valid <= EB.io.out.valid @[D_PrimOp.scala 39:16]
    EB.io.out.ready <= io.out.ready @[D_PrimOp.scala 40:19]
    
  module EB_two_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}, out : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}}
    
    reg head : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[D_PrimOp.scala 68:21]
    reg tail : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[D_PrimOp.scala 69:21]
    reg full : UInt<1>[2], clock @[D_PrimOp.scala 71:17]
    reg data : SInt<5>[2], clock @[D_PrimOp.scala 72:17]
    node _T = asUInt(reset) @[D_PrimOp.scala 74:20]
    when _T : @[D_PrimOp.scala 74:24]
      full[UInt<1>("h00")] <= UInt<1>("h00") @[D_PrimOp.scala 75:15]
      full[UInt<1>("h01")] <= UInt<1>("h00") @[D_PrimOp.scala 76:15]
      data[UInt<1>("h00")] <= asSInt(UInt<1>("h00")) @[D_PrimOp.scala 77:15]
      data[UInt<1>("h01")] <= asSInt(UInt<1>("h00")) @[D_PrimOp.scala 78:15]
      skip @[D_PrimOp.scala 74:24]
    node _io_out_valid_T = or(full[0], full[1]) @[D_PrimOp.scala 81:27]
    io.out.valid <= _io_out_valid_T @[D_PrimOp.scala 81:16]
    node _io_in_ready_T = eq(full[0], UInt<1>("h00")) @[D_PrimOp.scala 82:18]
    node _io_in_ready_T_1 = eq(full[1], UInt<1>("h00")) @[D_PrimOp.scala 82:29]
    node _io_in_ready_T_2 = or(_io_in_ready_T, _io_in_ready_T_1) @[D_PrimOp.scala 82:26]
    io.in.ready <= _io_in_ready_T_2 @[D_PrimOp.scala 82:15]
    io.out.bits <= data[head] @[D_PrimOp.scala 83:15]
    node _T_1 = eq(full[tail], UInt<1>("h00")) @[D_PrimOp.scala 85:23]
    node _T_2 = and(io.in.valid, _T_1) @[D_PrimOp.scala 85:20]
    when _T_2 : @[D_PrimOp.scala 85:36]
      full[tail] <= UInt<1>("h01") @[D_PrimOp.scala 86:16]
      data[tail] <= io.in.bits @[D_PrimOp.scala 87:16]
      node _tail_T = eq(tail, UInt<1>("h00")) @[D_PrimOp.scala 88:13]
      tail <= _tail_T @[D_PrimOp.scala 88:10]
      skip @[D_PrimOp.scala 85:36]
    node _T_3 = and(io.out.ready, full[head]) @[D_PrimOp.scala 91:21]
    when _T_3 : @[D_PrimOp.scala 91:36]
      full[head] <= UInt<1>("h00") @[D_PrimOp.scala 92:16]
      node _head_T = eq(head, UInt<1>("h00")) @[D_PrimOp.scala 93:13]
      head <= _head_T @[D_PrimOp.scala 93:10]
      skip @[D_PrimOp.scala 91:36]
    
  module D_PrimOp_1_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip a : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}, flip b : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}, out : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}}
    
    inst EB of EB_two_2 @[D_PrimOp.scala 31:18]
    EB.clock <= clock
    EB.reset <= reset
    node _EB_io_in_bits_T = sub(io.a.bits, io.b.bits) @[Mult_D_PrimOp.scala 16:49]
    node _EB_io_in_bits_T_1 = tail(_EB_io_in_bits_T, 1) @[Mult_D_PrimOp.scala 16:49]
    node _EB_io_in_bits_T_2 = asSInt(_EB_io_in_bits_T_1) @[Mult_D_PrimOp.scala 16:49]
    EB.io.in.bits <= _EB_io_in_bits_T_2 @[D_PrimOp.scala 33:17]
    node _EB_io_in_valid_T = and(io.a.valid, io.b.valid) @[D_PrimOp.scala 34:32]
    EB.io.in.valid <= _EB_io_in_valid_T @[D_PrimOp.scala 34:18]
    io.a.ready <= EB.io.in.ready @[D_PrimOp.scala 35:14]
    io.b.ready <= EB.io.in.ready @[D_PrimOp.scala 36:14]
    io.out.bits <= EB.io.out.bits @[D_PrimOp.scala 38:15]
    io.out.valid <= EB.io.out.valid @[D_PrimOp.scala 39:16]
    EB.io.out.ready <= io.out.ready @[D_PrimOp.scala 40:19]
    
  module EB_two_3 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}, out : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}}
    
    reg head : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[D_PrimOp.scala 68:21]
    reg tail : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[D_PrimOp.scala 69:21]
    reg full : UInt<1>[2], clock @[D_PrimOp.scala 71:17]
    reg data : SInt<5>[2], clock @[D_PrimOp.scala 72:17]
    node _T = asUInt(reset) @[D_PrimOp.scala 74:20]
    when _T : @[D_PrimOp.scala 74:24]
      full[UInt<1>("h00")] <= UInt<1>("h00") @[D_PrimOp.scala 75:15]
      full[UInt<1>("h01")] <= UInt<1>("h00") @[D_PrimOp.scala 76:15]
      data[UInt<1>("h00")] <= asSInt(UInt<1>("h00")) @[D_PrimOp.scala 77:15]
      data[UInt<1>("h01")] <= asSInt(UInt<1>("h00")) @[D_PrimOp.scala 78:15]
      skip @[D_PrimOp.scala 74:24]
    node _io_out_valid_T = or(full[0], full[1]) @[D_PrimOp.scala 81:27]
    io.out.valid <= _io_out_valid_T @[D_PrimOp.scala 81:16]
    node _io_in_ready_T = eq(full[0], UInt<1>("h00")) @[D_PrimOp.scala 82:18]
    node _io_in_ready_T_1 = eq(full[1], UInt<1>("h00")) @[D_PrimOp.scala 82:29]
    node _io_in_ready_T_2 = or(_io_in_ready_T, _io_in_ready_T_1) @[D_PrimOp.scala 82:26]
    io.in.ready <= _io_in_ready_T_2 @[D_PrimOp.scala 82:15]
    io.out.bits <= data[head] @[D_PrimOp.scala 83:15]
    node _T_1 = eq(full[tail], UInt<1>("h00")) @[D_PrimOp.scala 85:23]
    node _T_2 = and(io.in.valid, _T_1) @[D_PrimOp.scala 85:20]
    when _T_2 : @[D_PrimOp.scala 85:36]
      full[tail] <= UInt<1>("h01") @[D_PrimOp.scala 86:16]
      data[tail] <= io.in.bits @[D_PrimOp.scala 87:16]
      node _tail_T = eq(tail, UInt<1>("h00")) @[D_PrimOp.scala 88:13]
      tail <= _tail_T @[D_PrimOp.scala 88:10]
      skip @[D_PrimOp.scala 85:36]
    node _T_3 = and(io.out.ready, full[head]) @[D_PrimOp.scala 91:21]
    when _T_3 : @[D_PrimOp.scala 91:36]
      full[head] <= UInt<1>("h00") @[D_PrimOp.scala 92:16]
      node _head_T = eq(head, UInt<1>("h00")) @[D_PrimOp.scala 93:13]
      head <= _head_T @[D_PrimOp.scala 93:10]
      skip @[D_PrimOp.scala 91:36]
    
  module D_PrimOp_1_3 : 
    input clock : Clock
    input reset : Reset
    output io : {flip a : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}, flip b : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}, out : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}}
    
    inst EB of EB_two_3 @[D_PrimOp.scala 31:18]
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
    
  module EB_two_4 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}, out : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}}
    
    reg head : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[D_PrimOp.scala 68:21]
    reg tail : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[D_PrimOp.scala 69:21]
    reg full : UInt<1>[2], clock @[D_PrimOp.scala 71:17]
    reg data : SInt<5>[2], clock @[D_PrimOp.scala 72:17]
    node _T = asUInt(reset) @[D_PrimOp.scala 74:20]
    when _T : @[D_PrimOp.scala 74:24]
      full[UInt<1>("h00")] <= UInt<1>("h00") @[D_PrimOp.scala 75:15]
      full[UInt<1>("h01")] <= UInt<1>("h00") @[D_PrimOp.scala 76:15]
      data[UInt<1>("h00")] <= asSInt(UInt<1>("h00")) @[D_PrimOp.scala 77:15]
      data[UInt<1>("h01")] <= asSInt(UInt<1>("h00")) @[D_PrimOp.scala 78:15]
      skip @[D_PrimOp.scala 74:24]
    node _io_out_valid_T = or(full[0], full[1]) @[D_PrimOp.scala 81:27]
    io.out.valid <= _io_out_valid_T @[D_PrimOp.scala 81:16]
    node _io_in_ready_T = eq(full[0], UInt<1>("h00")) @[D_PrimOp.scala 82:18]
    node _io_in_ready_T_1 = eq(full[1], UInt<1>("h00")) @[D_PrimOp.scala 82:29]
    node _io_in_ready_T_2 = or(_io_in_ready_T, _io_in_ready_T_1) @[D_PrimOp.scala 82:26]
    io.in.ready <= _io_in_ready_T_2 @[D_PrimOp.scala 82:15]
    io.out.bits <= data[head] @[D_PrimOp.scala 83:15]
    node _T_1 = eq(full[tail], UInt<1>("h00")) @[D_PrimOp.scala 85:23]
    node _T_2 = and(io.in.valid, _T_1) @[D_PrimOp.scala 85:20]
    when _T_2 : @[D_PrimOp.scala 85:36]
      full[tail] <= UInt<1>("h01") @[D_PrimOp.scala 86:16]
      data[tail] <= io.in.bits @[D_PrimOp.scala 87:16]
      node _tail_T = eq(tail, UInt<1>("h00")) @[D_PrimOp.scala 88:13]
      tail <= _tail_T @[D_PrimOp.scala 88:10]
      skip @[D_PrimOp.scala 85:36]
    node _T_3 = and(io.out.ready, full[head]) @[D_PrimOp.scala 91:21]
    when _T_3 : @[D_PrimOp.scala 91:36]
      full[head] <= UInt<1>("h00") @[D_PrimOp.scala 92:16]
      node _head_T = eq(head, UInt<1>("h00")) @[D_PrimOp.scala 93:13]
      head <= _head_T @[D_PrimOp.scala 93:10]
      skip @[D_PrimOp.scala 91:36]
    
  module D_PrimOp_1_4 : 
    input clock : Clock
    input reset : Reset
    output io : {flip a : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}, flip b : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}, out : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}}
    
    inst EB of EB_two_4 @[D_PrimOp.scala 31:18]
    EB.clock <= clock
    EB.reset <= reset
    node _EB_io_in_bits_T = rem(io.a.bits, io.b.bits) @[Mult_D_PrimOp.scala 19:49]
    EB.io.in.bits <= _EB_io_in_bits_T @[D_PrimOp.scala 33:17]
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
    inst l0_1 of D_PrimOp_1_1 @[Mult_D_PrimOp.scala 40:20]
    l0_1.clock <= clock
    l0_1.reset <= reset
    inst l0_2 of D_PrimOp_1_2 @[Mult_D_PrimOp.scala 41:20]
    l0_2.clock <= clock
    l0_2.reset <= reset
    l0_0.io.a.bits <= io.a.bits @[Mult_D_PrimOp.scala 32:18]
    l0_0.io.a.valid <= io.a.valid @[Mult_D_PrimOp.scala 32:18]
    io.a.ready <= l0_0.io.a.ready @[Mult_D_PrimOp.scala 32:18]
    l0_0.io.b.bits <= io.b.bits @[Mult_D_PrimOp.scala 33:18]
    l0_0.io.b.valid <= io.b.valid @[Mult_D_PrimOp.scala 33:18]
    io.b.ready <= l0_0.io.b.ready @[Mult_D_PrimOp.scala 33:18]
    l0_1.io.a.bits <= io.a.bits @[Mult_D_PrimOp.scala 32:18]
    l0_1.io.a.valid <= io.a.valid @[Mult_D_PrimOp.scala 32:18]
    io.a.ready <= l0_1.io.a.ready @[Mult_D_PrimOp.scala 32:18]
    l0_1.io.b.bits <= io.b.bits @[Mult_D_PrimOp.scala 33:18]
    l0_1.io.b.valid <= io.b.valid @[Mult_D_PrimOp.scala 33:18]
    io.b.ready <= l0_1.io.b.ready @[Mult_D_PrimOp.scala 33:18]
    l0_2.io.a.bits <= io.a.bits @[Mult_D_PrimOp.scala 32:18]
    l0_2.io.a.valid <= io.a.valid @[Mult_D_PrimOp.scala 32:18]
    io.a.ready <= l0_2.io.a.ready @[Mult_D_PrimOp.scala 32:18]
    l0_2.io.b.bits <= io.b.bits @[Mult_D_PrimOp.scala 33:18]
    l0_2.io.b.valid <= io.b.valid @[Mult_D_PrimOp.scala 33:18]
    io.b.ready <= l0_2.io.b.ready @[Mult_D_PrimOp.scala 33:18]
    inst l1_0 of D_PrimOp_1_3 @[Mult_D_PrimOp.scala 49:20]
    l1_0.clock <= clock
    l1_0.reset <= reset
    inst l1_1 of D_PrimOp_1_4 @[Mult_D_PrimOp.scala 50:20]
    l1_1.clock <= clock
    l1_1.reset <= reset
    l1_0.io.a.bits <= l0_0.io.out.bits @[Mult_D_PrimOp.scala 32:18]
    l1_0.io.a.valid <= l0_0.io.out.valid @[Mult_D_PrimOp.scala 32:18]
    l0_0.io.out.ready <= l1_0.io.a.ready @[Mult_D_PrimOp.scala 32:18]
    l1_0.io.b.bits <= l0_1.io.out.bits @[Mult_D_PrimOp.scala 33:18]
    l1_0.io.b.valid <= l0_1.io.out.valid @[Mult_D_PrimOp.scala 33:18]
    l0_1.io.out.ready <= l1_0.io.b.ready @[Mult_D_PrimOp.scala 33:18]
    l1_1.io.a.bits <= l0_2.io.out.bits @[Mult_D_PrimOp.scala 32:18]
    l1_1.io.a.valid <= l0_2.io.out.valid @[Mult_D_PrimOp.scala 32:18]
    l0_2.io.out.ready <= l1_1.io.a.ready @[Mult_D_PrimOp.scala 32:18]
    l1_1.io.b.bits <= l0_1.io.out.bits @[Mult_D_PrimOp.scala 33:18]
    l1_1.io.b.valid <= l0_1.io.out.valid @[Mult_D_PrimOp.scala 33:18]
    l0_1.io.out.ready <= l1_1.io.b.ready @[Mult_D_PrimOp.scala 33:18]
    node _T = and(io.a.valid, io.b.valid) @[Mult_D_PrimOp.scala 57:20]
    when _T : @[Mult_D_PrimOp.scala 57:35]
      io.out.bits <= l1_0.io.out.bits @[Mult_D_PrimOp.scala 58:12]
      io.out.valid <= l1_0.io.out.valid @[Mult_D_PrimOp.scala 58:12]
      l1_0.io.out.ready <= io.out.ready @[Mult_D_PrimOp.scala 58:12]
      l1_1.io.out.ready <= io.out.ready @[Mult_D_PrimOp.scala 59:23]
      skip @[Mult_D_PrimOp.scala 57:35]
    else : @[Mult_D_PrimOp.scala 60:14]
      io.out.bits <= l1_1.io.out.bits @[Mult_D_PrimOp.scala 61:12]
      io.out.valid <= l1_1.io.out.valid @[Mult_D_PrimOp.scala 61:12]
      l1_1.io.out.ready <= io.out.ready @[Mult_D_PrimOp.scala 61:12]
      l1_0.io.out.ready <= io.out.ready @[Mult_D_PrimOp.scala 62:23]
      skip @[Mult_D_PrimOp.scala 60:14]
    
