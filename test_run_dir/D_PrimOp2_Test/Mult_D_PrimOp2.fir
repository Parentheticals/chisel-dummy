;buildInfoPackage: chisel3, version: 3.4.3, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit Mult_D_PrimOp2 : 
  module EB_two : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}, out : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}}
    
    reg head : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[D_PrimOp.scala 104:21]
    reg tail : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[D_PrimOp.scala 105:21]
    reg full : UInt<1>[2], clock @[D_PrimOp.scala 107:17]
    reg data : SInt<5>[2], clock @[D_PrimOp.scala 108:17]
    node _T = asUInt(reset) @[D_PrimOp.scala 110:20]
    when _T : @[D_PrimOp.scala 110:24]
      full[UInt<1>("h00")] <= UInt<1>("h00") @[D_PrimOp.scala 111:15]
      full[UInt<1>("h01")] <= UInt<1>("h00") @[D_PrimOp.scala 112:15]
      data[UInt<1>("h00")] <= asSInt(UInt<1>("h00")) @[D_PrimOp.scala 113:15]
      data[UInt<1>("h01")] <= asSInt(UInt<1>("h00")) @[D_PrimOp.scala 114:15]
      skip @[D_PrimOp.scala 110:24]
    node _io_out_valid_T = or(full[0], full[1]) @[D_PrimOp.scala 117:27]
    io.out.valid <= _io_out_valid_T @[D_PrimOp.scala 117:16]
    node _io_in_ready_T = eq(full[0], UInt<1>("h00")) @[D_PrimOp.scala 118:18]
    node _io_in_ready_T_1 = eq(full[1], UInt<1>("h00")) @[D_PrimOp.scala 118:29]
    node _io_in_ready_T_2 = or(_io_in_ready_T, _io_in_ready_T_1) @[D_PrimOp.scala 118:26]
    io.in.ready <= _io_in_ready_T_2 @[D_PrimOp.scala 118:15]
    io.out.bits <= data[head] @[D_PrimOp.scala 119:15]
    node _T_1 = eq(full[tail], UInt<1>("h00")) @[D_PrimOp.scala 121:23]
    node _T_2 = and(io.in.valid, _T_1) @[D_PrimOp.scala 121:20]
    when _T_2 : @[D_PrimOp.scala 121:36]
      full[tail] <= UInt<1>("h01") @[D_PrimOp.scala 122:16]
      data[tail] <= io.in.bits @[D_PrimOp.scala 123:16]
      node _tail_T = eq(tail, UInt<1>("h00")) @[D_PrimOp.scala 124:13]
      tail <= _tail_T @[D_PrimOp.scala 124:10]
      skip @[D_PrimOp.scala 121:36]
    node _T_3 = and(io.out.ready, full[head]) @[D_PrimOp.scala 127:21]
    when _T_3 : @[D_PrimOp.scala 127:36]
      full[head] <= UInt<1>("h00") @[D_PrimOp.scala 128:16]
      node _head_T = eq(head, UInt<1>("h00")) @[D_PrimOp.scala 129:13]
      head <= _head_T @[D_PrimOp.scala 129:10]
      skip @[D_PrimOp.scala 127:36]
    
  module D_PrimOp2_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip a : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}, flip b : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}, out : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}}
    
    inst EB of EB_two @[D_PrimOp.scala 67:18]
    EB.clock <= clock
    EB.reset <= reset
    node _EB_io_in_bits_T = add(io.a.bits, io.b.bits) @[Mult_D_PrimOp.scala 8:47]
    node _EB_io_in_bits_T_1 = tail(_EB_io_in_bits_T, 1) @[Mult_D_PrimOp.scala 8:47]
    node _EB_io_in_bits_T_2 = asSInt(_EB_io_in_bits_T_1) @[Mult_D_PrimOp.scala 8:47]
    EB.io.in.bits <= _EB_io_in_bits_T_2 @[D_PrimOp.scala 69:17]
    node _EB_io_in_valid_T = and(io.a.valid, io.b.valid) @[D_PrimOp.scala 70:32]
    EB.io.in.valid <= _EB_io_in_valid_T @[D_PrimOp.scala 70:18]
    io.a.ready <= EB.io.in.ready @[D_PrimOp.scala 71:14]
    io.b.ready <= EB.io.in.ready @[D_PrimOp.scala 72:14]
    io.out.bits <= EB.io.out.bits @[D_PrimOp.scala 74:15]
    io.out.valid <= EB.io.out.valid @[D_PrimOp.scala 75:16]
    EB.io.out.ready <= io.out.ready @[D_PrimOp.scala 76:19]
    
  module EB_two_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}, out : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}}
    
    reg head : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[D_PrimOp.scala 104:21]
    reg tail : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[D_PrimOp.scala 105:21]
    reg full : UInt<1>[2], clock @[D_PrimOp.scala 107:17]
    reg data : SInt<5>[2], clock @[D_PrimOp.scala 108:17]
    node _T = asUInt(reset) @[D_PrimOp.scala 110:20]
    when _T : @[D_PrimOp.scala 110:24]
      full[UInt<1>("h00")] <= UInt<1>("h00") @[D_PrimOp.scala 111:15]
      full[UInt<1>("h01")] <= UInt<1>("h00") @[D_PrimOp.scala 112:15]
      data[UInt<1>("h00")] <= asSInt(UInt<1>("h00")) @[D_PrimOp.scala 113:15]
      data[UInt<1>("h01")] <= asSInt(UInt<1>("h00")) @[D_PrimOp.scala 114:15]
      skip @[D_PrimOp.scala 110:24]
    node _io_out_valid_T = or(full[0], full[1]) @[D_PrimOp.scala 117:27]
    io.out.valid <= _io_out_valid_T @[D_PrimOp.scala 117:16]
    node _io_in_ready_T = eq(full[0], UInt<1>("h00")) @[D_PrimOp.scala 118:18]
    node _io_in_ready_T_1 = eq(full[1], UInt<1>("h00")) @[D_PrimOp.scala 118:29]
    node _io_in_ready_T_2 = or(_io_in_ready_T, _io_in_ready_T_1) @[D_PrimOp.scala 118:26]
    io.in.ready <= _io_in_ready_T_2 @[D_PrimOp.scala 118:15]
    io.out.bits <= data[head] @[D_PrimOp.scala 119:15]
    node _T_1 = eq(full[tail], UInt<1>("h00")) @[D_PrimOp.scala 121:23]
    node _T_2 = and(io.in.valid, _T_1) @[D_PrimOp.scala 121:20]
    when _T_2 : @[D_PrimOp.scala 121:36]
      full[tail] <= UInt<1>("h01") @[D_PrimOp.scala 122:16]
      data[tail] <= io.in.bits @[D_PrimOp.scala 123:16]
      node _tail_T = eq(tail, UInt<1>("h00")) @[D_PrimOp.scala 124:13]
      tail <= _tail_T @[D_PrimOp.scala 124:10]
      skip @[D_PrimOp.scala 121:36]
    node _T_3 = and(io.out.ready, full[head]) @[D_PrimOp.scala 127:21]
    when _T_3 : @[D_PrimOp.scala 127:36]
      full[head] <= UInt<1>("h00") @[D_PrimOp.scala 128:16]
      node _head_T = eq(head, UInt<1>("h00")) @[D_PrimOp.scala 129:13]
      head <= _head_T @[D_PrimOp.scala 129:10]
      skip @[D_PrimOp.scala 127:36]
    
  module D_PrimOp2_1_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip a : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}, flip b : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}, out : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}}
    
    inst EB of EB_two_1 @[D_PrimOp.scala 67:18]
    EB.clock <= clock
    EB.reset <= reset
    node _EB_io_in_bits_T = mul(io.a.bits, io.b.bits) @[Mult_D_PrimOp.scala 10:47]
    EB.io.in.bits <= _EB_io_in_bits_T @[D_PrimOp.scala 69:17]
    node _EB_io_in_valid_T = and(io.a.valid, io.b.valid) @[D_PrimOp.scala 70:32]
    EB.io.in.valid <= _EB_io_in_valid_T @[D_PrimOp.scala 70:18]
    io.a.ready <= EB.io.in.ready @[D_PrimOp.scala 71:14]
    io.b.ready <= EB.io.in.ready @[D_PrimOp.scala 72:14]
    io.out.bits <= EB.io.out.bits @[D_PrimOp.scala 74:15]
    io.out.valid <= EB.io.out.valid @[D_PrimOp.scala 75:16]
    EB.io.out.ready <= io.out.ready @[D_PrimOp.scala 76:19]
    
  module EB_two_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}, out : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}}
    
    reg head : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[D_PrimOp.scala 104:21]
    reg tail : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[D_PrimOp.scala 105:21]
    reg full : UInt<1>[2], clock @[D_PrimOp.scala 107:17]
    reg data : SInt<5>[2], clock @[D_PrimOp.scala 108:17]
    node _T = asUInt(reset) @[D_PrimOp.scala 110:20]
    when _T : @[D_PrimOp.scala 110:24]
      full[UInt<1>("h00")] <= UInt<1>("h00") @[D_PrimOp.scala 111:15]
      full[UInt<1>("h01")] <= UInt<1>("h00") @[D_PrimOp.scala 112:15]
      data[UInt<1>("h00")] <= asSInt(UInt<1>("h00")) @[D_PrimOp.scala 113:15]
      data[UInt<1>("h01")] <= asSInt(UInt<1>("h00")) @[D_PrimOp.scala 114:15]
      skip @[D_PrimOp.scala 110:24]
    node _io_out_valid_T = or(full[0], full[1]) @[D_PrimOp.scala 117:27]
    io.out.valid <= _io_out_valid_T @[D_PrimOp.scala 117:16]
    node _io_in_ready_T = eq(full[0], UInt<1>("h00")) @[D_PrimOp.scala 118:18]
    node _io_in_ready_T_1 = eq(full[1], UInt<1>("h00")) @[D_PrimOp.scala 118:29]
    node _io_in_ready_T_2 = or(_io_in_ready_T, _io_in_ready_T_1) @[D_PrimOp.scala 118:26]
    io.in.ready <= _io_in_ready_T_2 @[D_PrimOp.scala 118:15]
    io.out.bits <= data[head] @[D_PrimOp.scala 119:15]
    node _T_1 = eq(full[tail], UInt<1>("h00")) @[D_PrimOp.scala 121:23]
    node _T_2 = and(io.in.valid, _T_1) @[D_PrimOp.scala 121:20]
    when _T_2 : @[D_PrimOp.scala 121:36]
      full[tail] <= UInt<1>("h01") @[D_PrimOp.scala 122:16]
      data[tail] <= io.in.bits @[D_PrimOp.scala 123:16]
      node _tail_T = eq(tail, UInt<1>("h00")) @[D_PrimOp.scala 124:13]
      tail <= _tail_T @[D_PrimOp.scala 124:10]
      skip @[D_PrimOp.scala 121:36]
    node _T_3 = and(io.out.ready, full[head]) @[D_PrimOp.scala 127:21]
    when _T_3 : @[D_PrimOp.scala 127:36]
      full[head] <= UInt<1>("h00") @[D_PrimOp.scala 128:16]
      node _head_T = eq(head, UInt<1>("h00")) @[D_PrimOp.scala 129:13]
      head <= _head_T @[D_PrimOp.scala 129:10]
      skip @[D_PrimOp.scala 127:36]
    
  module D_PrimOp2_1_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip a : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}, flip b : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}, out : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}}
    
    inst EB of EB_two_2 @[D_PrimOp.scala 67:18]
    EB.clock <= clock
    EB.reset <= reset
    node _EB_io_in_bits_T = sub(io.a.bits, io.b.bits) @[Mult_D_PrimOp.scala 9:47]
    node _EB_io_in_bits_T_1 = tail(_EB_io_in_bits_T, 1) @[Mult_D_PrimOp.scala 9:47]
    node _EB_io_in_bits_T_2 = asSInt(_EB_io_in_bits_T_1) @[Mult_D_PrimOp.scala 9:47]
    EB.io.in.bits <= _EB_io_in_bits_T_2 @[D_PrimOp.scala 69:17]
    node _EB_io_in_valid_T = and(io.a.valid, io.b.valid) @[D_PrimOp.scala 70:32]
    EB.io.in.valid <= _EB_io_in_valid_T @[D_PrimOp.scala 70:18]
    io.a.ready <= EB.io.in.ready @[D_PrimOp.scala 71:14]
    io.b.ready <= EB.io.in.ready @[D_PrimOp.scala 72:14]
    io.out.bits <= EB.io.out.bits @[D_PrimOp.scala 74:15]
    io.out.valid <= EB.io.out.valid @[D_PrimOp.scala 75:16]
    EB.io.out.ready <= io.out.ready @[D_PrimOp.scala 76:19]
    
  module EB_two_3 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}, out : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}}
    
    reg head : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[D_PrimOp.scala 104:21]
    reg tail : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[D_PrimOp.scala 105:21]
    reg full : UInt<1>[2], clock @[D_PrimOp.scala 107:17]
    reg data : SInt<5>[2], clock @[D_PrimOp.scala 108:17]
    node _T = asUInt(reset) @[D_PrimOp.scala 110:20]
    when _T : @[D_PrimOp.scala 110:24]
      full[UInt<1>("h00")] <= UInt<1>("h00") @[D_PrimOp.scala 111:15]
      full[UInt<1>("h01")] <= UInt<1>("h00") @[D_PrimOp.scala 112:15]
      data[UInt<1>("h00")] <= asSInt(UInt<1>("h00")) @[D_PrimOp.scala 113:15]
      data[UInt<1>("h01")] <= asSInt(UInt<1>("h00")) @[D_PrimOp.scala 114:15]
      skip @[D_PrimOp.scala 110:24]
    node _io_out_valid_T = or(full[0], full[1]) @[D_PrimOp.scala 117:27]
    io.out.valid <= _io_out_valid_T @[D_PrimOp.scala 117:16]
    node _io_in_ready_T = eq(full[0], UInt<1>("h00")) @[D_PrimOp.scala 118:18]
    node _io_in_ready_T_1 = eq(full[1], UInt<1>("h00")) @[D_PrimOp.scala 118:29]
    node _io_in_ready_T_2 = or(_io_in_ready_T, _io_in_ready_T_1) @[D_PrimOp.scala 118:26]
    io.in.ready <= _io_in_ready_T_2 @[D_PrimOp.scala 118:15]
    io.out.bits <= data[head] @[D_PrimOp.scala 119:15]
    node _T_1 = eq(full[tail], UInt<1>("h00")) @[D_PrimOp.scala 121:23]
    node _T_2 = and(io.in.valid, _T_1) @[D_PrimOp.scala 121:20]
    when _T_2 : @[D_PrimOp.scala 121:36]
      full[tail] <= UInt<1>("h01") @[D_PrimOp.scala 122:16]
      data[tail] <= io.in.bits @[D_PrimOp.scala 123:16]
      node _tail_T = eq(tail, UInt<1>("h00")) @[D_PrimOp.scala 124:13]
      tail <= _tail_T @[D_PrimOp.scala 124:10]
      skip @[D_PrimOp.scala 121:36]
    node _T_3 = and(io.out.ready, full[head]) @[D_PrimOp.scala 127:21]
    when _T_3 : @[D_PrimOp.scala 127:36]
      full[head] <= UInt<1>("h00") @[D_PrimOp.scala 128:16]
      node _head_T = eq(head, UInt<1>("h00")) @[D_PrimOp.scala 129:13]
      head <= _head_T @[D_PrimOp.scala 129:10]
      skip @[D_PrimOp.scala 127:36]
    
  module D_PrimOp2_0 : 
    input clock : Clock
    input reset : Reset
    output io : {flip a : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}, out : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}}
    
    inst EB of EB_two_3 @[D_PrimOp.scala 30:18]
    EB.clock <= clock
    EB.reset <= reset
    node _EB_io_in_bits_T = sub(asSInt(UInt<1>("h00")), io.a.bits) @[Mult_D_PrimOp.scala 14:32]
    node _EB_io_in_bits_T_1 = tail(_EB_io_in_bits_T, 1) @[Mult_D_PrimOp.scala 14:32]
    node _EB_io_in_bits_T_2 = asSInt(_EB_io_in_bits_T_1) @[Mult_D_PrimOp.scala 14:32]
    EB.io.in.bits <= _EB_io_in_bits_T_2 @[D_PrimOp.scala 32:17]
    EB.io.in.valid <= io.a.valid @[D_PrimOp.scala 33:18]
    io.a.ready <= EB.io.in.ready @[D_PrimOp.scala 34:14]
    io.out.bits <= EB.io.out.bits @[D_PrimOp.scala 36:15]
    io.out.valid <= EB.io.out.valid @[D_PrimOp.scala 37:16]
    EB.io.out.ready <= io.out.ready @[D_PrimOp.scala 38:19]
    
  module EB_two_4 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}, out : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}}
    
    reg head : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[D_PrimOp.scala 104:21]
    reg tail : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[D_PrimOp.scala 105:21]
    reg full : UInt<1>[2], clock @[D_PrimOp.scala 107:17]
    reg data : SInt<5>[2], clock @[D_PrimOp.scala 108:17]
    node _T = asUInt(reset) @[D_PrimOp.scala 110:20]
    when _T : @[D_PrimOp.scala 110:24]
      full[UInt<1>("h00")] <= UInt<1>("h00") @[D_PrimOp.scala 111:15]
      full[UInt<1>("h01")] <= UInt<1>("h00") @[D_PrimOp.scala 112:15]
      data[UInt<1>("h00")] <= asSInt(UInt<1>("h00")) @[D_PrimOp.scala 113:15]
      data[UInt<1>("h01")] <= asSInt(UInt<1>("h00")) @[D_PrimOp.scala 114:15]
      skip @[D_PrimOp.scala 110:24]
    node _io_out_valid_T = or(full[0], full[1]) @[D_PrimOp.scala 117:27]
    io.out.valid <= _io_out_valid_T @[D_PrimOp.scala 117:16]
    node _io_in_ready_T = eq(full[0], UInt<1>("h00")) @[D_PrimOp.scala 118:18]
    node _io_in_ready_T_1 = eq(full[1], UInt<1>("h00")) @[D_PrimOp.scala 118:29]
    node _io_in_ready_T_2 = or(_io_in_ready_T, _io_in_ready_T_1) @[D_PrimOp.scala 118:26]
    io.in.ready <= _io_in_ready_T_2 @[D_PrimOp.scala 118:15]
    io.out.bits <= data[head] @[D_PrimOp.scala 119:15]
    node _T_1 = eq(full[tail], UInt<1>("h00")) @[D_PrimOp.scala 121:23]
    node _T_2 = and(io.in.valid, _T_1) @[D_PrimOp.scala 121:20]
    when _T_2 : @[D_PrimOp.scala 121:36]
      full[tail] <= UInt<1>("h01") @[D_PrimOp.scala 122:16]
      data[tail] <= io.in.bits @[D_PrimOp.scala 123:16]
      node _tail_T = eq(tail, UInt<1>("h00")) @[D_PrimOp.scala 124:13]
      tail <= _tail_T @[D_PrimOp.scala 124:10]
      skip @[D_PrimOp.scala 121:36]
    node _T_3 = and(io.out.ready, full[head]) @[D_PrimOp.scala 127:21]
    when _T_3 : @[D_PrimOp.scala 127:36]
      full[head] <= UInt<1>("h00") @[D_PrimOp.scala 128:16]
      node _head_T = eq(head, UInt<1>("h00")) @[D_PrimOp.scala 129:13]
      head <= _head_T @[D_PrimOp.scala 129:10]
      skip @[D_PrimOp.scala 127:36]
    
  module D_PrimOp2_1_3 : 
    input clock : Clock
    input reset : Reset
    output io : {flip a : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}, flip b : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}, out : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}}
    
    inst EB of EB_two_4 @[D_PrimOp.scala 67:18]
    EB.clock <= clock
    EB.reset <= reset
    node _EB_io_in_bits_T = and(io.a.bits, io.b.bits) @[Mult_D_PrimOp.scala 15:47]
    node _EB_io_in_bits_T_1 = asSInt(_EB_io_in_bits_T) @[Mult_D_PrimOp.scala 15:47]
    EB.io.in.bits <= _EB_io_in_bits_T_1 @[D_PrimOp.scala 69:17]
    node _EB_io_in_valid_T = and(io.a.valid, io.b.valid) @[D_PrimOp.scala 70:32]
    EB.io.in.valid <= _EB_io_in_valid_T @[D_PrimOp.scala 70:18]
    io.a.ready <= EB.io.in.ready @[D_PrimOp.scala 71:14]
    io.b.ready <= EB.io.in.ready @[D_PrimOp.scala 72:14]
    io.out.bits <= EB.io.out.bits @[D_PrimOp.scala 74:15]
    io.out.valid <= EB.io.out.valid @[D_PrimOp.scala 75:16]
    EB.io.out.ready <= io.out.ready @[D_PrimOp.scala 76:19]
    
  module EB_two_5 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}, out : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}}
    
    reg head : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[D_PrimOp.scala 104:21]
    reg tail : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[D_PrimOp.scala 105:21]
    reg full : UInt<1>[2], clock @[D_PrimOp.scala 107:17]
    reg data : SInt<5>[2], clock @[D_PrimOp.scala 108:17]
    node _T = asUInt(reset) @[D_PrimOp.scala 110:20]
    when _T : @[D_PrimOp.scala 110:24]
      full[UInt<1>("h00")] <= UInt<1>("h00") @[D_PrimOp.scala 111:15]
      full[UInt<1>("h01")] <= UInt<1>("h00") @[D_PrimOp.scala 112:15]
      data[UInt<1>("h00")] <= asSInt(UInt<1>("h00")) @[D_PrimOp.scala 113:15]
      data[UInt<1>("h01")] <= asSInt(UInt<1>("h00")) @[D_PrimOp.scala 114:15]
      skip @[D_PrimOp.scala 110:24]
    node _io_out_valid_T = or(full[0], full[1]) @[D_PrimOp.scala 117:27]
    io.out.valid <= _io_out_valid_T @[D_PrimOp.scala 117:16]
    node _io_in_ready_T = eq(full[0], UInt<1>("h00")) @[D_PrimOp.scala 118:18]
    node _io_in_ready_T_1 = eq(full[1], UInt<1>("h00")) @[D_PrimOp.scala 118:29]
    node _io_in_ready_T_2 = or(_io_in_ready_T, _io_in_ready_T_1) @[D_PrimOp.scala 118:26]
    io.in.ready <= _io_in_ready_T_2 @[D_PrimOp.scala 118:15]
    io.out.bits <= data[head] @[D_PrimOp.scala 119:15]
    node _T_1 = eq(full[tail], UInt<1>("h00")) @[D_PrimOp.scala 121:23]
    node _T_2 = and(io.in.valid, _T_1) @[D_PrimOp.scala 121:20]
    when _T_2 : @[D_PrimOp.scala 121:36]
      full[tail] <= UInt<1>("h01") @[D_PrimOp.scala 122:16]
      data[tail] <= io.in.bits @[D_PrimOp.scala 123:16]
      node _tail_T = eq(tail, UInt<1>("h00")) @[D_PrimOp.scala 124:13]
      tail <= _tail_T @[D_PrimOp.scala 124:10]
      skip @[D_PrimOp.scala 121:36]
    node _T_3 = and(io.out.ready, full[head]) @[D_PrimOp.scala 127:21]
    when _T_3 : @[D_PrimOp.scala 127:36]
      full[head] <= UInt<1>("h00") @[D_PrimOp.scala 128:16]
      node _head_T = eq(head, UInt<1>("h00")) @[D_PrimOp.scala 129:13]
      head <= _head_T @[D_PrimOp.scala 129:10]
      skip @[D_PrimOp.scala 127:36]
    
  module D_PrimOp2_1_4 : 
    input clock : Clock
    input reset : Reset
    output io : {flip a : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}, flip b : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}, out : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}}
    
    inst EB of EB_two_5 @[D_PrimOp.scala 67:18]
    EB.clock <= clock
    EB.reset <= reset
    node _EB_io_in_bits_T = add(io.a.bits, io.b.bits) @[Mult_D_PrimOp.scala 8:47]
    node _EB_io_in_bits_T_1 = tail(_EB_io_in_bits_T, 1) @[Mult_D_PrimOp.scala 8:47]
    node _EB_io_in_bits_T_2 = asSInt(_EB_io_in_bits_T_1) @[Mult_D_PrimOp.scala 8:47]
    EB.io.in.bits <= _EB_io_in_bits_T_2 @[D_PrimOp.scala 69:17]
    node _EB_io_in_valid_T = and(io.a.valid, io.b.valid) @[D_PrimOp.scala 70:32]
    EB.io.in.valid <= _EB_io_in_valid_T @[D_PrimOp.scala 70:18]
    io.a.ready <= EB.io.in.ready @[D_PrimOp.scala 71:14]
    io.b.ready <= EB.io.in.ready @[D_PrimOp.scala 72:14]
    io.out.bits <= EB.io.out.bits @[D_PrimOp.scala 74:15]
    io.out.valid <= EB.io.out.valid @[D_PrimOp.scala 75:16]
    EB.io.out.ready <= io.out.ready @[D_PrimOp.scala 76:19]
    
  module EB_two_6 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}, out : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}}
    
    reg head : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[D_PrimOp.scala 104:21]
    reg tail : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[D_PrimOp.scala 105:21]
    reg full : UInt<1>[2], clock @[D_PrimOp.scala 107:17]
    reg data : SInt<5>[2], clock @[D_PrimOp.scala 108:17]
    node _T = asUInt(reset) @[D_PrimOp.scala 110:20]
    when _T : @[D_PrimOp.scala 110:24]
      full[UInt<1>("h00")] <= UInt<1>("h00") @[D_PrimOp.scala 111:15]
      full[UInt<1>("h01")] <= UInt<1>("h00") @[D_PrimOp.scala 112:15]
      data[UInt<1>("h00")] <= asSInt(UInt<1>("h00")) @[D_PrimOp.scala 113:15]
      data[UInt<1>("h01")] <= asSInt(UInt<1>("h00")) @[D_PrimOp.scala 114:15]
      skip @[D_PrimOp.scala 110:24]
    node _io_out_valid_T = or(full[0], full[1]) @[D_PrimOp.scala 117:27]
    io.out.valid <= _io_out_valid_T @[D_PrimOp.scala 117:16]
    node _io_in_ready_T = eq(full[0], UInt<1>("h00")) @[D_PrimOp.scala 118:18]
    node _io_in_ready_T_1 = eq(full[1], UInt<1>("h00")) @[D_PrimOp.scala 118:29]
    node _io_in_ready_T_2 = or(_io_in_ready_T, _io_in_ready_T_1) @[D_PrimOp.scala 118:26]
    io.in.ready <= _io_in_ready_T_2 @[D_PrimOp.scala 118:15]
    io.out.bits <= data[head] @[D_PrimOp.scala 119:15]
    node _T_1 = eq(full[tail], UInt<1>("h00")) @[D_PrimOp.scala 121:23]
    node _T_2 = and(io.in.valid, _T_1) @[D_PrimOp.scala 121:20]
    when _T_2 : @[D_PrimOp.scala 121:36]
      full[tail] <= UInt<1>("h01") @[D_PrimOp.scala 122:16]
      data[tail] <= io.in.bits @[D_PrimOp.scala 123:16]
      node _tail_T = eq(tail, UInt<1>("h00")) @[D_PrimOp.scala 124:13]
      tail <= _tail_T @[D_PrimOp.scala 124:10]
      skip @[D_PrimOp.scala 121:36]
    node _T_3 = and(io.out.ready, full[head]) @[D_PrimOp.scala 127:21]
    when _T_3 : @[D_PrimOp.scala 127:36]
      full[head] <= UInt<1>("h00") @[D_PrimOp.scala 128:16]
      node _head_T = eq(head, UInt<1>("h00")) @[D_PrimOp.scala 129:13]
      head <= _head_T @[D_PrimOp.scala 129:10]
      skip @[D_PrimOp.scala 127:36]
    
  module D_PrimOp2_1_5 : 
    input clock : Clock
    input reset : Reset
    output io : {flip a : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}, flip b : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}, out : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}}
    
    inst EB of EB_two_6 @[D_PrimOp.scala 67:18]
    EB.clock <= clock
    EB.reset <= reset
    node _EB_io_in_bits_T = rem(io.a.bits, io.b.bits) @[Mult_D_PrimOp.scala 12:47]
    EB.io.in.bits <= _EB_io_in_bits_T @[D_PrimOp.scala 69:17]
    node _EB_io_in_valid_T = and(io.a.valid, io.b.valid) @[D_PrimOp.scala 70:32]
    EB.io.in.valid <= _EB_io_in_valid_T @[D_PrimOp.scala 70:18]
    io.a.ready <= EB.io.in.ready @[D_PrimOp.scala 71:14]
    io.b.ready <= EB.io.in.ready @[D_PrimOp.scala 72:14]
    io.out.bits <= EB.io.out.bits @[D_PrimOp.scala 74:15]
    io.out.valid <= EB.io.out.valid @[D_PrimOp.scala 75:16]
    EB.io.out.ready <= io.out.ready @[D_PrimOp.scala 76:19]
    
  module EB_two_7 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}, out : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}}
    
    reg head : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[D_PrimOp.scala 104:21]
    reg tail : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[D_PrimOp.scala 105:21]
    reg full : UInt<1>[2], clock @[D_PrimOp.scala 107:17]
    reg data : SInt<5>[2], clock @[D_PrimOp.scala 108:17]
    node _T = asUInt(reset) @[D_PrimOp.scala 110:20]
    when _T : @[D_PrimOp.scala 110:24]
      full[UInt<1>("h00")] <= UInt<1>("h00") @[D_PrimOp.scala 111:15]
      full[UInt<1>("h01")] <= UInt<1>("h00") @[D_PrimOp.scala 112:15]
      data[UInt<1>("h00")] <= asSInt(UInt<1>("h00")) @[D_PrimOp.scala 113:15]
      data[UInt<1>("h01")] <= asSInt(UInt<1>("h00")) @[D_PrimOp.scala 114:15]
      skip @[D_PrimOp.scala 110:24]
    node _io_out_valid_T = or(full[0], full[1]) @[D_PrimOp.scala 117:27]
    io.out.valid <= _io_out_valid_T @[D_PrimOp.scala 117:16]
    node _io_in_ready_T = eq(full[0], UInt<1>("h00")) @[D_PrimOp.scala 118:18]
    node _io_in_ready_T_1 = eq(full[1], UInt<1>("h00")) @[D_PrimOp.scala 118:29]
    node _io_in_ready_T_2 = or(_io_in_ready_T, _io_in_ready_T_1) @[D_PrimOp.scala 118:26]
    io.in.ready <= _io_in_ready_T_2 @[D_PrimOp.scala 118:15]
    io.out.bits <= data[head] @[D_PrimOp.scala 119:15]
    node _T_1 = eq(full[tail], UInt<1>("h00")) @[D_PrimOp.scala 121:23]
    node _T_2 = and(io.in.valid, _T_1) @[D_PrimOp.scala 121:20]
    when _T_2 : @[D_PrimOp.scala 121:36]
      full[tail] <= UInt<1>("h01") @[D_PrimOp.scala 122:16]
      data[tail] <= io.in.bits @[D_PrimOp.scala 123:16]
      node _tail_T = eq(tail, UInt<1>("h00")) @[D_PrimOp.scala 124:13]
      tail <= _tail_T @[D_PrimOp.scala 124:10]
      skip @[D_PrimOp.scala 121:36]
    node _T_3 = and(io.out.ready, full[head]) @[D_PrimOp.scala 127:21]
    when _T_3 : @[D_PrimOp.scala 127:36]
      full[head] <= UInt<1>("h00") @[D_PrimOp.scala 128:16]
      node _head_T = eq(head, UInt<1>("h00")) @[D_PrimOp.scala 129:13]
      head <= _head_T @[D_PrimOp.scala 129:10]
      skip @[D_PrimOp.scala 127:36]
    
  module D_PrimOp2_1_6 : 
    input clock : Clock
    input reset : Reset
    output io : {flip a : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}, flip b : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}, out : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}}
    
    inst EB of EB_two_7 @[D_PrimOp.scala 67:18]
    EB.clock <= clock
    EB.reset <= reset
    node _EB_io_in_bits_T = sub(io.a.bits, io.b.bits) @[Mult_D_PrimOp.scala 9:47]
    node _EB_io_in_bits_T_1 = tail(_EB_io_in_bits_T, 1) @[Mult_D_PrimOp.scala 9:47]
    node _EB_io_in_bits_T_2 = asSInt(_EB_io_in_bits_T_1) @[Mult_D_PrimOp.scala 9:47]
    EB.io.in.bits <= _EB_io_in_bits_T_2 @[D_PrimOp.scala 69:17]
    node _EB_io_in_valid_T = and(io.a.valid, io.b.valid) @[D_PrimOp.scala 70:32]
    EB.io.in.valid <= _EB_io_in_valid_T @[D_PrimOp.scala 70:18]
    io.a.ready <= EB.io.in.ready @[D_PrimOp.scala 71:14]
    io.b.ready <= EB.io.in.ready @[D_PrimOp.scala 72:14]
    io.out.bits <= EB.io.out.bits @[D_PrimOp.scala 74:15]
    io.out.valid <= EB.io.out.valid @[D_PrimOp.scala 75:16]
    EB.io.out.ready <= io.out.ready @[D_PrimOp.scala 76:19]
    
  module EB_two_8 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}, out : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}}
    
    reg head : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[D_PrimOp.scala 104:21]
    reg tail : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[D_PrimOp.scala 105:21]
    reg full : UInt<1>[2], clock @[D_PrimOp.scala 107:17]
    reg data : SInt<5>[2], clock @[D_PrimOp.scala 108:17]
    node _T = asUInt(reset) @[D_PrimOp.scala 110:20]
    when _T : @[D_PrimOp.scala 110:24]
      full[UInt<1>("h00")] <= UInt<1>("h00") @[D_PrimOp.scala 111:15]
      full[UInt<1>("h01")] <= UInt<1>("h00") @[D_PrimOp.scala 112:15]
      data[UInt<1>("h00")] <= asSInt(UInt<1>("h00")) @[D_PrimOp.scala 113:15]
      data[UInt<1>("h01")] <= asSInt(UInt<1>("h00")) @[D_PrimOp.scala 114:15]
      skip @[D_PrimOp.scala 110:24]
    node _io_out_valid_T = or(full[0], full[1]) @[D_PrimOp.scala 117:27]
    io.out.valid <= _io_out_valid_T @[D_PrimOp.scala 117:16]
    node _io_in_ready_T = eq(full[0], UInt<1>("h00")) @[D_PrimOp.scala 118:18]
    node _io_in_ready_T_1 = eq(full[1], UInt<1>("h00")) @[D_PrimOp.scala 118:29]
    node _io_in_ready_T_2 = or(_io_in_ready_T, _io_in_ready_T_1) @[D_PrimOp.scala 118:26]
    io.in.ready <= _io_in_ready_T_2 @[D_PrimOp.scala 118:15]
    io.out.bits <= data[head] @[D_PrimOp.scala 119:15]
    node _T_1 = eq(full[tail], UInt<1>("h00")) @[D_PrimOp.scala 121:23]
    node _T_2 = and(io.in.valid, _T_1) @[D_PrimOp.scala 121:20]
    when _T_2 : @[D_PrimOp.scala 121:36]
      full[tail] <= UInt<1>("h01") @[D_PrimOp.scala 122:16]
      data[tail] <= io.in.bits @[D_PrimOp.scala 123:16]
      node _tail_T = eq(tail, UInt<1>("h00")) @[D_PrimOp.scala 124:13]
      tail <= _tail_T @[D_PrimOp.scala 124:10]
      skip @[D_PrimOp.scala 121:36]
    node _T_3 = and(io.out.ready, full[head]) @[D_PrimOp.scala 127:21]
    when _T_3 : @[D_PrimOp.scala 127:36]
      full[head] <= UInt<1>("h00") @[D_PrimOp.scala 128:16]
      node _head_T = eq(head, UInt<1>("h00")) @[D_PrimOp.scala 129:13]
      head <= _head_T @[D_PrimOp.scala 129:10]
      skip @[D_PrimOp.scala 127:36]
    
  module D_PrimOp2_1_7 : 
    input clock : Clock
    input reset : Reset
    output io : {flip a : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}, flip b : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}, out : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}}
    
    inst EB of EB_two_8 @[D_PrimOp.scala 67:18]
    EB.clock <= clock
    EB.reset <= reset
    node _EB_io_in_bits_T = xor(io.a.bits, io.b.bits) @[Mult_D_PrimOp.scala 17:47]
    node _EB_io_in_bits_T_1 = asSInt(_EB_io_in_bits_T) @[Mult_D_PrimOp.scala 17:47]
    EB.io.in.bits <= _EB_io_in_bits_T_1 @[D_PrimOp.scala 69:17]
    node _EB_io_in_valid_T = and(io.a.valid, io.b.valid) @[D_PrimOp.scala 70:32]
    EB.io.in.valid <= _EB_io_in_valid_T @[D_PrimOp.scala 70:18]
    io.a.ready <= EB.io.in.ready @[D_PrimOp.scala 71:14]
    io.b.ready <= EB.io.in.ready @[D_PrimOp.scala 72:14]
    io.out.bits <= EB.io.out.bits @[D_PrimOp.scala 74:15]
    io.out.valid <= EB.io.out.valid @[D_PrimOp.scala 75:16]
    EB.io.out.ready <= io.out.ready @[D_PrimOp.scala 76:19]
    
  module EB_two_9 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}, out : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}}
    
    reg head : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[D_PrimOp.scala 104:21]
    reg tail : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[D_PrimOp.scala 105:21]
    reg full : UInt<1>[2], clock @[D_PrimOp.scala 107:17]
    reg data : SInt<5>[2], clock @[D_PrimOp.scala 108:17]
    node _T = asUInt(reset) @[D_PrimOp.scala 110:20]
    when _T : @[D_PrimOp.scala 110:24]
      full[UInt<1>("h00")] <= UInt<1>("h00") @[D_PrimOp.scala 111:15]
      full[UInt<1>("h01")] <= UInt<1>("h00") @[D_PrimOp.scala 112:15]
      data[UInt<1>("h00")] <= asSInt(UInt<1>("h00")) @[D_PrimOp.scala 113:15]
      data[UInt<1>("h01")] <= asSInt(UInt<1>("h00")) @[D_PrimOp.scala 114:15]
      skip @[D_PrimOp.scala 110:24]
    node _io_out_valid_T = or(full[0], full[1]) @[D_PrimOp.scala 117:27]
    io.out.valid <= _io_out_valid_T @[D_PrimOp.scala 117:16]
    node _io_in_ready_T = eq(full[0], UInt<1>("h00")) @[D_PrimOp.scala 118:18]
    node _io_in_ready_T_1 = eq(full[1], UInt<1>("h00")) @[D_PrimOp.scala 118:29]
    node _io_in_ready_T_2 = or(_io_in_ready_T, _io_in_ready_T_1) @[D_PrimOp.scala 118:26]
    io.in.ready <= _io_in_ready_T_2 @[D_PrimOp.scala 118:15]
    io.out.bits <= data[head] @[D_PrimOp.scala 119:15]
    node _T_1 = eq(full[tail], UInt<1>("h00")) @[D_PrimOp.scala 121:23]
    node _T_2 = and(io.in.valid, _T_1) @[D_PrimOp.scala 121:20]
    when _T_2 : @[D_PrimOp.scala 121:36]
      full[tail] <= UInt<1>("h01") @[D_PrimOp.scala 122:16]
      data[tail] <= io.in.bits @[D_PrimOp.scala 123:16]
      node _tail_T = eq(tail, UInt<1>("h00")) @[D_PrimOp.scala 124:13]
      tail <= _tail_T @[D_PrimOp.scala 124:10]
      skip @[D_PrimOp.scala 121:36]
    node _T_3 = and(io.out.ready, full[head]) @[D_PrimOp.scala 127:21]
    when _T_3 : @[D_PrimOp.scala 127:36]
      full[head] <= UInt<1>("h00") @[D_PrimOp.scala 128:16]
      node _head_T = eq(head, UInt<1>("h00")) @[D_PrimOp.scala 129:13]
      head <= _head_T @[D_PrimOp.scala 129:10]
      skip @[D_PrimOp.scala 127:36]
    
  module D_PrimOp2_1_8 : 
    input clock : Clock
    input reset : Reset
    output io : {flip a : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}, flip b : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}, out : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}}
    
    inst EB of EB_two_9 @[D_PrimOp.scala 67:18]
    EB.clock <= clock
    EB.reset <= reset
    node _EB_io_in_bits_T = mul(io.a.bits, io.b.bits) @[Mult_D_PrimOp.scala 10:47]
    EB.io.in.bits <= _EB_io_in_bits_T @[D_PrimOp.scala 69:17]
    node _EB_io_in_valid_T = and(io.a.valid, io.b.valid) @[D_PrimOp.scala 70:32]
    EB.io.in.valid <= _EB_io_in_valid_T @[D_PrimOp.scala 70:18]
    io.a.ready <= EB.io.in.ready @[D_PrimOp.scala 71:14]
    io.b.ready <= EB.io.in.ready @[D_PrimOp.scala 72:14]
    io.out.bits <= EB.io.out.bits @[D_PrimOp.scala 74:15]
    io.out.valid <= EB.io.out.valid @[D_PrimOp.scala 75:16]
    EB.io.out.ready <= io.out.ready @[D_PrimOp.scala 76:19]
    
  module Mult_D_PrimOp2 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip a : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}, flip b : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}, out : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<10>}}
    
    inst l0_0 of D_PrimOp2_1 @[Mult_D_PrimOp.scala 142:20]
    l0_0.clock <= clock
    l0_0.reset <= reset
    inst l0_1 of D_PrimOp2_1_1 @[Mult_D_PrimOp.scala 143:20]
    l0_1.clock <= clock
    l0_1.reset <= reset
    inst l0_2 of D_PrimOp2_1_2 @[Mult_D_PrimOp.scala 144:20]
    l0_2.clock <= clock
    l0_2.reset <= reset
    inst l0_3 of D_PrimOp2_0 @[Mult_D_PrimOp.scala 145:20]
    l0_3.clock <= clock
    l0_3.reset <= reset
    inst l0_4 of D_PrimOp2_1_3 @[Mult_D_PrimOp.scala 146:20]
    l0_4.clock <= clock
    l0_4.reset <= reset
    l0_0.io.a.bits <= io.a.bits @[Mult_D_PrimOp.scala 126:18]
    l0_0.io.a.valid <= io.a.valid @[Mult_D_PrimOp.scala 126:18]
    io.a.ready <= l0_0.io.a.ready @[Mult_D_PrimOp.scala 126:18]
    l0_0.io.b.bits <= io.b.bits @[Mult_D_PrimOp.scala 127:18]
    l0_0.io.b.valid <= io.b.valid @[Mult_D_PrimOp.scala 127:18]
    io.b.ready <= l0_0.io.b.ready @[Mult_D_PrimOp.scala 127:18]
    l0_1.io.a.bits <= io.a.bits @[Mult_D_PrimOp.scala 126:18]
    l0_1.io.a.valid <= io.a.valid @[Mult_D_PrimOp.scala 126:18]
    io.a.ready <= l0_1.io.a.ready @[Mult_D_PrimOp.scala 126:18]
    l0_1.io.b.bits <= io.b.bits @[Mult_D_PrimOp.scala 127:18]
    l0_1.io.b.valid <= io.b.valid @[Mult_D_PrimOp.scala 127:18]
    io.b.ready <= l0_1.io.b.ready @[Mult_D_PrimOp.scala 127:18]
    l0_2.io.a.bits <= io.a.bits @[Mult_D_PrimOp.scala 126:18]
    l0_2.io.a.valid <= io.a.valid @[Mult_D_PrimOp.scala 126:18]
    io.a.ready <= l0_2.io.a.ready @[Mult_D_PrimOp.scala 126:18]
    l0_2.io.b.bits <= io.b.bits @[Mult_D_PrimOp.scala 127:18]
    l0_2.io.b.valid <= io.b.valid @[Mult_D_PrimOp.scala 127:18]
    io.b.ready <= l0_2.io.b.ready @[Mult_D_PrimOp.scala 127:18]
    l0_3.io.a.bits <= io.a.bits @[Mult_D_PrimOp.scala 124:18]
    l0_3.io.a.valid <= io.a.valid @[Mult_D_PrimOp.scala 124:18]
    io.a.ready <= l0_3.io.a.ready @[Mult_D_PrimOp.scala 124:18]
    l0_4.io.a.bits <= io.a.bits @[Mult_D_PrimOp.scala 126:18]
    l0_4.io.a.valid <= io.a.valid @[Mult_D_PrimOp.scala 126:18]
    io.a.ready <= l0_4.io.a.ready @[Mult_D_PrimOp.scala 126:18]
    l0_4.io.b.bits <= io.b.bits @[Mult_D_PrimOp.scala 127:18]
    l0_4.io.b.valid <= io.b.valid @[Mult_D_PrimOp.scala 127:18]
    io.b.ready <= l0_4.io.b.ready @[Mult_D_PrimOp.scala 127:18]
    inst l1_0 of D_PrimOp2_1_4 @[Mult_D_PrimOp.scala 156:20]
    l1_0.clock <= clock
    l1_0.reset <= reset
    inst l1_1 of D_PrimOp2_1_5 @[Mult_D_PrimOp.scala 157:20]
    l1_1.clock <= clock
    l1_1.reset <= reset
    inst l1_2 of D_PrimOp2_1_6 @[Mult_D_PrimOp.scala 158:20]
    l1_2.clock <= clock
    l1_2.reset <= reset
    inst l1_3 of D_PrimOp2_1_7 @[Mult_D_PrimOp.scala 159:20]
    l1_3.clock <= clock
    l1_3.reset <= reset
    inst l1_4 of D_PrimOp2_1_8 @[Mult_D_PrimOp.scala 160:20]
    l1_4.clock <= clock
    l1_4.reset <= reset
    l1_0.io.a.bits <= l0_0.io.out.bits @[Mult_D_PrimOp.scala 126:18]
    l1_0.io.a.valid <= l0_0.io.out.valid @[Mult_D_PrimOp.scala 126:18]
    l0_0.io.out.ready <= l1_0.io.a.ready @[Mult_D_PrimOp.scala 126:18]
    l1_0.io.b.bits <= l0_1.io.out.bits @[Mult_D_PrimOp.scala 127:18]
    l1_0.io.b.valid <= l0_1.io.out.valid @[Mult_D_PrimOp.scala 127:18]
    l0_1.io.out.ready <= l1_0.io.b.ready @[Mult_D_PrimOp.scala 127:18]
    l1_1.io.a.bits <= l0_2.io.out.bits @[Mult_D_PrimOp.scala 126:18]
    l1_1.io.a.valid <= l0_2.io.out.valid @[Mult_D_PrimOp.scala 126:18]
    l0_2.io.out.ready <= l1_1.io.a.ready @[Mult_D_PrimOp.scala 126:18]
    l1_1.io.b.bits <= l0_1.io.out.bits @[Mult_D_PrimOp.scala 127:18]
    l1_1.io.b.valid <= l0_1.io.out.valid @[Mult_D_PrimOp.scala 127:18]
    l0_1.io.out.ready <= l1_1.io.b.ready @[Mult_D_PrimOp.scala 127:18]
    l1_2.io.a.bits <= l0_2.io.out.bits @[Mult_D_PrimOp.scala 126:18]
    l1_2.io.a.valid <= l0_2.io.out.valid @[Mult_D_PrimOp.scala 126:18]
    l0_2.io.out.ready <= l1_2.io.a.ready @[Mult_D_PrimOp.scala 126:18]
    l1_2.io.b.bits <= l0_3.io.out.bits @[Mult_D_PrimOp.scala 127:18]
    l1_2.io.b.valid <= l0_3.io.out.valid @[Mult_D_PrimOp.scala 127:18]
    l0_3.io.out.ready <= l1_2.io.b.ready @[Mult_D_PrimOp.scala 127:18]
    l1_3.io.a.bits <= l0_3.io.out.bits @[Mult_D_PrimOp.scala 126:18]
    l1_3.io.a.valid <= l0_3.io.out.valid @[Mult_D_PrimOp.scala 126:18]
    l0_3.io.out.ready <= l1_3.io.a.ready @[Mult_D_PrimOp.scala 126:18]
    l1_3.io.b.bits <= l0_4.io.out.bits @[Mult_D_PrimOp.scala 127:18]
    l1_3.io.b.valid <= l0_4.io.out.valid @[Mult_D_PrimOp.scala 127:18]
    l0_4.io.out.ready <= l1_3.io.b.ready @[Mult_D_PrimOp.scala 127:18]
    l1_4.io.a.bits <= l0_1.io.out.bits @[Mult_D_PrimOp.scala 126:18]
    l1_4.io.a.valid <= l0_1.io.out.valid @[Mult_D_PrimOp.scala 126:18]
    l0_1.io.out.ready <= l1_4.io.a.ready @[Mult_D_PrimOp.scala 126:18]
    l1_4.io.b.bits <= l0_4.io.out.bits @[Mult_D_PrimOp.scala 127:18]
    l1_4.io.b.valid <= l0_4.io.out.valid @[Mult_D_PrimOp.scala 127:18]
    l0_4.io.out.ready <= l1_4.io.b.ready @[Mult_D_PrimOp.scala 127:18]
    wire check1 : {valid : UInt<1>, ready : UInt<1>, bits : SInt<5>} @[Mult_D_PrimOp.scala 169:20]
    wire check2 : {valid : UInt<1>, ready : UInt<1>, bits : SInt<5>} @[Mult_D_PrimOp.scala 174:20]
    node _T = and(io.a.valid, io.b.valid) @[Mult_D_PrimOp.scala 180:20]
    when _T : @[Mult_D_PrimOp.scala 180:35]
      check1.bits <= l1_0.io.out.bits @[Mult_D_PrimOp.scala 181:12]
      l1_0.io.out.ready <= check1.ready @[Mult_D_PrimOp.scala 181:12]
      check1.valid <= l1_0.io.out.valid @[Mult_D_PrimOp.scala 181:12]
      check2.bits <= l1_2.io.out.bits @[Mult_D_PrimOp.scala 182:12]
      l1_2.io.out.ready <= check2.ready @[Mult_D_PrimOp.scala 182:12]
      check2.valid <= l1_2.io.out.valid @[Mult_D_PrimOp.scala 182:12]
      l1_1.io.out.ready <= io.out.ready @[Mult_D_PrimOp.scala 183:23]
      l1_3.io.out.ready <= io.out.ready @[Mult_D_PrimOp.scala 184:23]
      l1_4.io.out.ready <= io.out.ready @[Mult_D_PrimOp.scala 185:23]
      skip @[Mult_D_PrimOp.scala 180:35]
    else : @[Mult_D_PrimOp.scala 186:14]
      check1.bits <= l1_1.io.out.bits @[Mult_D_PrimOp.scala 187:12]
      l1_1.io.out.ready <= check1.ready @[Mult_D_PrimOp.scala 187:12]
      check1.valid <= l1_1.io.out.valid @[Mult_D_PrimOp.scala 187:12]
      check2.bits <= l1_3.io.out.bits @[Mult_D_PrimOp.scala 188:12]
      l1_3.io.out.ready <= check2.ready @[Mult_D_PrimOp.scala 188:12]
      check2.valid <= l1_3.io.out.valid @[Mult_D_PrimOp.scala 188:12]
      l1_0.io.out.ready <= io.out.ready @[Mult_D_PrimOp.scala 189:23]
      l1_2.io.out.ready <= io.out.ready @[Mult_D_PrimOp.scala 190:23]
      l1_4.io.out.ready <= io.out.ready @[Mult_D_PrimOp.scala 191:23]
      skip @[Mult_D_PrimOp.scala 186:14]
    node rawOut_lo = asUInt(check2.bits) @[Cat.scala 30:58]
    node rawOut_hi = asUInt(check1.bits) @[Cat.scala 30:58]
    node _rawOut_T = cat(rawOut_hi, rawOut_lo) @[Cat.scala 30:58]
    node rawOut = asSInt(_rawOut_T) @[Mult_D_PrimOp.scala 194:52]
    io.out.bits <= rawOut @[Mult_D_PrimOp.scala 196:15]
    node _io_out_valid_T = and(check1.valid, check2.valid) @[Mult_D_PrimOp.scala 197:32]
    io.out.valid <= _io_out_valid_T @[Mult_D_PrimOp.scala 197:16]
    check1.ready <= io.out.ready @[Mult_D_PrimOp.scala 198:16]
    check2.ready <= io.out.ready @[Mult_D_PrimOp.scala 199:16]
    
