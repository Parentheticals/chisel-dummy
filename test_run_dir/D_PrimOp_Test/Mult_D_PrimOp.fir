;buildInfoPackage: chisel3, version: 3.4.3, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit Mult_D_PrimOp : 
  module EB_one : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}, out : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}}
    
    reg vld : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[D_PrimOp.scala 84:20]
    reg rdy : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[D_PrimOp.scala 85:20]
    reg data : SInt<5>, clock with : (reset => (reset, asSInt(UInt<5>("h00")))) @[D_PrimOp.scala 86:21]
    vld <= io.in.valid @[D_PrimOp.scala 88:7]
    rdy <= io.out.ready @[D_PrimOp.scala 89:7]
    data <= io.in.bits @[D_PrimOp.scala 90:8]
    io.out.valid <= vld @[D_PrimOp.scala 92:16]
    io.in.ready <= rdy @[D_PrimOp.scala 93:15]
    io.out.bits <= data @[D_PrimOp.scala 94:15]
    
  module D_PrimOp_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip a : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}, flip b : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}, out : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}}
    
    inst EB of EB_one @[D_PrimOp.scala 48:18]
    EB.clock <= clock
    EB.reset <= reset
    node _EB_io_in_bits_T = add(io.a.bits, io.b.bits) @[Mult_D_PrimOp.scala 8:47]
    node _EB_io_in_bits_T_1 = tail(_EB_io_in_bits_T, 1) @[Mult_D_PrimOp.scala 8:47]
    node _EB_io_in_bits_T_2 = asSInt(_EB_io_in_bits_T_1) @[Mult_D_PrimOp.scala 8:47]
    EB.io.in.bits <= _EB_io_in_bits_T_2 @[D_PrimOp.scala 50:17]
    node _EB_io_in_valid_T = and(io.a.valid, io.b.valid) @[D_PrimOp.scala 51:32]
    EB.io.in.valid <= _EB_io_in_valid_T @[D_PrimOp.scala 51:18]
    io.a.ready <= EB.io.in.ready @[D_PrimOp.scala 52:14]
    io.b.ready <= EB.io.in.ready @[D_PrimOp.scala 53:14]
    io.out.bits <= EB.io.out.bits @[D_PrimOp.scala 55:15]
    io.out.valid <= EB.io.out.valid @[D_PrimOp.scala 56:16]
    EB.io.out.ready <= io.out.ready @[D_PrimOp.scala 57:19]
    
  module EB_one_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}, out : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}}
    
    reg vld : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[D_PrimOp.scala 84:20]
    reg rdy : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[D_PrimOp.scala 85:20]
    reg data : SInt<5>, clock with : (reset => (reset, asSInt(UInt<5>("h00")))) @[D_PrimOp.scala 86:21]
    vld <= io.in.valid @[D_PrimOp.scala 88:7]
    rdy <= io.out.ready @[D_PrimOp.scala 89:7]
    data <= io.in.bits @[D_PrimOp.scala 90:8]
    io.out.valid <= vld @[D_PrimOp.scala 92:16]
    io.in.ready <= rdy @[D_PrimOp.scala 93:15]
    io.out.bits <= data @[D_PrimOp.scala 94:15]
    
  module D_PrimOp_1_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip a : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}, flip b : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}, out : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}}
    
    inst EB of EB_one_1 @[D_PrimOp.scala 48:18]
    EB.clock <= clock
    EB.reset <= reset
    node _EB_io_in_bits_T = mul(io.a.bits, io.b.bits) @[Mult_D_PrimOp.scala 10:47]
    EB.io.in.bits <= _EB_io_in_bits_T @[D_PrimOp.scala 50:17]
    node _EB_io_in_valid_T = and(io.a.valid, io.b.valid) @[D_PrimOp.scala 51:32]
    EB.io.in.valid <= _EB_io_in_valid_T @[D_PrimOp.scala 51:18]
    io.a.ready <= EB.io.in.ready @[D_PrimOp.scala 52:14]
    io.b.ready <= EB.io.in.ready @[D_PrimOp.scala 53:14]
    io.out.bits <= EB.io.out.bits @[D_PrimOp.scala 55:15]
    io.out.valid <= EB.io.out.valid @[D_PrimOp.scala 56:16]
    EB.io.out.ready <= io.out.ready @[D_PrimOp.scala 57:19]
    
  module EB_one_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}, out : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}}
    
    reg vld : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[D_PrimOp.scala 84:20]
    reg rdy : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[D_PrimOp.scala 85:20]
    reg data : SInt<5>, clock with : (reset => (reset, asSInt(UInt<5>("h00")))) @[D_PrimOp.scala 86:21]
    vld <= io.in.valid @[D_PrimOp.scala 88:7]
    rdy <= io.out.ready @[D_PrimOp.scala 89:7]
    data <= io.in.bits @[D_PrimOp.scala 90:8]
    io.out.valid <= vld @[D_PrimOp.scala 92:16]
    io.in.ready <= rdy @[D_PrimOp.scala 93:15]
    io.out.bits <= data @[D_PrimOp.scala 94:15]
    
  module D_PrimOp_1_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip a : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}, flip b : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}, out : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}}
    
    inst EB of EB_one_2 @[D_PrimOp.scala 48:18]
    EB.clock <= clock
    EB.reset <= reset
    node _EB_io_in_bits_T = sub(io.a.bits, io.b.bits) @[Mult_D_PrimOp.scala 9:47]
    node _EB_io_in_bits_T_1 = tail(_EB_io_in_bits_T, 1) @[Mult_D_PrimOp.scala 9:47]
    node _EB_io_in_bits_T_2 = asSInt(_EB_io_in_bits_T_1) @[Mult_D_PrimOp.scala 9:47]
    EB.io.in.bits <= _EB_io_in_bits_T_2 @[D_PrimOp.scala 50:17]
    node _EB_io_in_valid_T = and(io.a.valid, io.b.valid) @[D_PrimOp.scala 51:32]
    EB.io.in.valid <= _EB_io_in_valid_T @[D_PrimOp.scala 51:18]
    io.a.ready <= EB.io.in.ready @[D_PrimOp.scala 52:14]
    io.b.ready <= EB.io.in.ready @[D_PrimOp.scala 53:14]
    io.out.bits <= EB.io.out.bits @[D_PrimOp.scala 55:15]
    io.out.valid <= EB.io.out.valid @[D_PrimOp.scala 56:16]
    EB.io.out.ready <= io.out.ready @[D_PrimOp.scala 57:19]
    
  module EB_one_3 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}, out : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}}
    
    reg vld : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[D_PrimOp.scala 84:20]
    reg rdy : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[D_PrimOp.scala 85:20]
    reg data : SInt<5>, clock with : (reset => (reset, asSInt(UInt<5>("h00")))) @[D_PrimOp.scala 86:21]
    vld <= io.in.valid @[D_PrimOp.scala 88:7]
    rdy <= io.out.ready @[D_PrimOp.scala 89:7]
    data <= io.in.bits @[D_PrimOp.scala 90:8]
    io.out.valid <= vld @[D_PrimOp.scala 92:16]
    io.in.ready <= rdy @[D_PrimOp.scala 93:15]
    io.out.bits <= data @[D_PrimOp.scala 94:15]
    
  module D_PrimOp_0 : 
    input clock : Clock
    input reset : Reset
    output io : {flip a : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}, out : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}}
    
    inst EB of EB_one_3 @[D_PrimOp.scala 13:18]
    EB.clock <= clock
    EB.reset <= reset
    node _EB_io_in_bits_T = sub(asSInt(UInt<1>("h00")), io.a.bits) @[Mult_D_PrimOp.scala 14:32]
    node _EB_io_in_bits_T_1 = tail(_EB_io_in_bits_T, 1) @[Mult_D_PrimOp.scala 14:32]
    node _EB_io_in_bits_T_2 = asSInt(_EB_io_in_bits_T_1) @[Mult_D_PrimOp.scala 14:32]
    EB.io.in.bits <= _EB_io_in_bits_T_2 @[D_PrimOp.scala 15:17]
    EB.io.in.valid <= io.a.valid @[D_PrimOp.scala 16:18]
    io.a.ready <= EB.io.in.ready @[D_PrimOp.scala 17:14]
    io.out.bits <= EB.io.out.bits @[D_PrimOp.scala 19:15]
    io.out.valid <= EB.io.out.valid @[D_PrimOp.scala 20:16]
    EB.io.out.ready <= io.out.ready @[D_PrimOp.scala 21:19]
    
  module EB_one_4 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}, out : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}}
    
    reg vld : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[D_PrimOp.scala 84:20]
    reg rdy : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[D_PrimOp.scala 85:20]
    reg data : SInt<5>, clock with : (reset => (reset, asSInt(UInt<5>("h00")))) @[D_PrimOp.scala 86:21]
    vld <= io.in.valid @[D_PrimOp.scala 88:7]
    rdy <= io.out.ready @[D_PrimOp.scala 89:7]
    data <= io.in.bits @[D_PrimOp.scala 90:8]
    io.out.valid <= vld @[D_PrimOp.scala 92:16]
    io.in.ready <= rdy @[D_PrimOp.scala 93:15]
    io.out.bits <= data @[D_PrimOp.scala 94:15]
    
  module D_PrimOp_1_3 : 
    input clock : Clock
    input reset : Reset
    output io : {flip a : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}, flip b : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}, out : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}}
    
    inst EB of EB_one_4 @[D_PrimOp.scala 48:18]
    EB.clock <= clock
    EB.reset <= reset
    node _EB_io_in_bits_T = and(io.a.bits, io.b.bits) @[Mult_D_PrimOp.scala 15:47]
    node _EB_io_in_bits_T_1 = asSInt(_EB_io_in_bits_T) @[Mult_D_PrimOp.scala 15:47]
    EB.io.in.bits <= _EB_io_in_bits_T_1 @[D_PrimOp.scala 50:17]
    node _EB_io_in_valid_T = and(io.a.valid, io.b.valid) @[D_PrimOp.scala 51:32]
    EB.io.in.valid <= _EB_io_in_valid_T @[D_PrimOp.scala 51:18]
    io.a.ready <= EB.io.in.ready @[D_PrimOp.scala 52:14]
    io.b.ready <= EB.io.in.ready @[D_PrimOp.scala 53:14]
    io.out.bits <= EB.io.out.bits @[D_PrimOp.scala 55:15]
    io.out.valid <= EB.io.out.valid @[D_PrimOp.scala 56:16]
    EB.io.out.ready <= io.out.ready @[D_PrimOp.scala 57:19]
    
  module EB_one_5 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}, out : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}}
    
    reg vld : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[D_PrimOp.scala 84:20]
    reg rdy : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[D_PrimOp.scala 85:20]
    reg data : SInt<5>, clock with : (reset => (reset, asSInt(UInt<5>("h00")))) @[D_PrimOp.scala 86:21]
    vld <= io.in.valid @[D_PrimOp.scala 88:7]
    rdy <= io.out.ready @[D_PrimOp.scala 89:7]
    data <= io.in.bits @[D_PrimOp.scala 90:8]
    io.out.valid <= vld @[D_PrimOp.scala 92:16]
    io.in.ready <= rdy @[D_PrimOp.scala 93:15]
    io.out.bits <= data @[D_PrimOp.scala 94:15]
    
  module D_PrimOp_1_4 : 
    input clock : Clock
    input reset : Reset
    output io : {flip a : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}, flip b : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}, out : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}}
    
    inst EB of EB_one_5 @[D_PrimOp.scala 48:18]
    EB.clock <= clock
    EB.reset <= reset
    node _EB_io_in_bits_T = add(io.a.bits, io.b.bits) @[Mult_D_PrimOp.scala 8:47]
    node _EB_io_in_bits_T_1 = tail(_EB_io_in_bits_T, 1) @[Mult_D_PrimOp.scala 8:47]
    node _EB_io_in_bits_T_2 = asSInt(_EB_io_in_bits_T_1) @[Mult_D_PrimOp.scala 8:47]
    EB.io.in.bits <= _EB_io_in_bits_T_2 @[D_PrimOp.scala 50:17]
    node _EB_io_in_valid_T = and(io.a.valid, io.b.valid) @[D_PrimOp.scala 51:32]
    EB.io.in.valid <= _EB_io_in_valid_T @[D_PrimOp.scala 51:18]
    io.a.ready <= EB.io.in.ready @[D_PrimOp.scala 52:14]
    io.b.ready <= EB.io.in.ready @[D_PrimOp.scala 53:14]
    io.out.bits <= EB.io.out.bits @[D_PrimOp.scala 55:15]
    io.out.valid <= EB.io.out.valid @[D_PrimOp.scala 56:16]
    EB.io.out.ready <= io.out.ready @[D_PrimOp.scala 57:19]
    
  module EB_one_6 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}, out : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}}
    
    reg vld : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[D_PrimOp.scala 84:20]
    reg rdy : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[D_PrimOp.scala 85:20]
    reg data : SInt<5>, clock with : (reset => (reset, asSInt(UInt<5>("h00")))) @[D_PrimOp.scala 86:21]
    vld <= io.in.valid @[D_PrimOp.scala 88:7]
    rdy <= io.out.ready @[D_PrimOp.scala 89:7]
    data <= io.in.bits @[D_PrimOp.scala 90:8]
    io.out.valid <= vld @[D_PrimOp.scala 92:16]
    io.in.ready <= rdy @[D_PrimOp.scala 93:15]
    io.out.bits <= data @[D_PrimOp.scala 94:15]
    
  module D_PrimOp_1_5 : 
    input clock : Clock
    input reset : Reset
    output io : {flip a : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}, flip b : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}, out : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}}
    
    inst EB of EB_one_6 @[D_PrimOp.scala 48:18]
    EB.clock <= clock
    EB.reset <= reset
    node _EB_io_in_bits_T = rem(io.a.bits, io.b.bits) @[Mult_D_PrimOp.scala 12:47]
    EB.io.in.bits <= _EB_io_in_bits_T @[D_PrimOp.scala 50:17]
    node _EB_io_in_valid_T = and(io.a.valid, io.b.valid) @[D_PrimOp.scala 51:32]
    EB.io.in.valid <= _EB_io_in_valid_T @[D_PrimOp.scala 51:18]
    io.a.ready <= EB.io.in.ready @[D_PrimOp.scala 52:14]
    io.b.ready <= EB.io.in.ready @[D_PrimOp.scala 53:14]
    io.out.bits <= EB.io.out.bits @[D_PrimOp.scala 55:15]
    io.out.valid <= EB.io.out.valid @[D_PrimOp.scala 56:16]
    EB.io.out.ready <= io.out.ready @[D_PrimOp.scala 57:19]
    
  module EB_one_7 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}, out : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}}
    
    reg vld : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[D_PrimOp.scala 84:20]
    reg rdy : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[D_PrimOp.scala 85:20]
    reg data : SInt<5>, clock with : (reset => (reset, asSInt(UInt<5>("h00")))) @[D_PrimOp.scala 86:21]
    vld <= io.in.valid @[D_PrimOp.scala 88:7]
    rdy <= io.out.ready @[D_PrimOp.scala 89:7]
    data <= io.in.bits @[D_PrimOp.scala 90:8]
    io.out.valid <= vld @[D_PrimOp.scala 92:16]
    io.in.ready <= rdy @[D_PrimOp.scala 93:15]
    io.out.bits <= data @[D_PrimOp.scala 94:15]
    
  module D_PrimOp_1_6 : 
    input clock : Clock
    input reset : Reset
    output io : {flip a : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}, flip b : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}, out : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}}
    
    inst EB of EB_one_7 @[D_PrimOp.scala 48:18]
    EB.clock <= clock
    EB.reset <= reset
    node _EB_io_in_bits_T = sub(io.a.bits, io.b.bits) @[Mult_D_PrimOp.scala 9:47]
    node _EB_io_in_bits_T_1 = tail(_EB_io_in_bits_T, 1) @[Mult_D_PrimOp.scala 9:47]
    node _EB_io_in_bits_T_2 = asSInt(_EB_io_in_bits_T_1) @[Mult_D_PrimOp.scala 9:47]
    EB.io.in.bits <= _EB_io_in_bits_T_2 @[D_PrimOp.scala 50:17]
    node _EB_io_in_valid_T = and(io.a.valid, io.b.valid) @[D_PrimOp.scala 51:32]
    EB.io.in.valid <= _EB_io_in_valid_T @[D_PrimOp.scala 51:18]
    io.a.ready <= EB.io.in.ready @[D_PrimOp.scala 52:14]
    io.b.ready <= EB.io.in.ready @[D_PrimOp.scala 53:14]
    io.out.bits <= EB.io.out.bits @[D_PrimOp.scala 55:15]
    io.out.valid <= EB.io.out.valid @[D_PrimOp.scala 56:16]
    EB.io.out.ready <= io.out.ready @[D_PrimOp.scala 57:19]
    
  module EB_one_8 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}, out : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}}
    
    reg vld : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[D_PrimOp.scala 84:20]
    reg rdy : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[D_PrimOp.scala 85:20]
    reg data : SInt<5>, clock with : (reset => (reset, asSInt(UInt<5>("h00")))) @[D_PrimOp.scala 86:21]
    vld <= io.in.valid @[D_PrimOp.scala 88:7]
    rdy <= io.out.ready @[D_PrimOp.scala 89:7]
    data <= io.in.bits @[D_PrimOp.scala 90:8]
    io.out.valid <= vld @[D_PrimOp.scala 92:16]
    io.in.ready <= rdy @[D_PrimOp.scala 93:15]
    io.out.bits <= data @[D_PrimOp.scala 94:15]
    
  module D_PrimOp_1_7 : 
    input clock : Clock
    input reset : Reset
    output io : {flip a : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}, flip b : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}, out : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}}
    
    inst EB of EB_one_8 @[D_PrimOp.scala 48:18]
    EB.clock <= clock
    EB.reset <= reset
    node _EB_io_in_bits_T = xor(io.a.bits, io.b.bits) @[Mult_D_PrimOp.scala 17:47]
    node _EB_io_in_bits_T_1 = asSInt(_EB_io_in_bits_T) @[Mult_D_PrimOp.scala 17:47]
    EB.io.in.bits <= _EB_io_in_bits_T_1 @[D_PrimOp.scala 50:17]
    node _EB_io_in_valid_T = and(io.a.valid, io.b.valid) @[D_PrimOp.scala 51:32]
    EB.io.in.valid <= _EB_io_in_valid_T @[D_PrimOp.scala 51:18]
    io.a.ready <= EB.io.in.ready @[D_PrimOp.scala 52:14]
    io.b.ready <= EB.io.in.ready @[D_PrimOp.scala 53:14]
    io.out.bits <= EB.io.out.bits @[D_PrimOp.scala 55:15]
    io.out.valid <= EB.io.out.valid @[D_PrimOp.scala 56:16]
    EB.io.out.ready <= io.out.ready @[D_PrimOp.scala 57:19]
    
  module EB_one_9 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}, out : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}}
    
    reg vld : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[D_PrimOp.scala 84:20]
    reg rdy : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[D_PrimOp.scala 85:20]
    reg data : SInt<5>, clock with : (reset => (reset, asSInt(UInt<5>("h00")))) @[D_PrimOp.scala 86:21]
    vld <= io.in.valid @[D_PrimOp.scala 88:7]
    rdy <= io.out.ready @[D_PrimOp.scala 89:7]
    data <= io.in.bits @[D_PrimOp.scala 90:8]
    io.out.valid <= vld @[D_PrimOp.scala 92:16]
    io.in.ready <= rdy @[D_PrimOp.scala 93:15]
    io.out.bits <= data @[D_PrimOp.scala 94:15]
    
  module D_PrimOp_1_8 : 
    input clock : Clock
    input reset : Reset
    output io : {flip a : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}, flip b : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}, out : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}}
    
    inst EB of EB_one_9 @[D_PrimOp.scala 48:18]
    EB.clock <= clock
    EB.reset <= reset
    node _EB_io_in_bits_T = mul(io.a.bits, io.b.bits) @[Mult_D_PrimOp.scala 10:47]
    EB.io.in.bits <= _EB_io_in_bits_T @[D_PrimOp.scala 50:17]
    node _EB_io_in_valid_T = and(io.a.valid, io.b.valid) @[D_PrimOp.scala 51:32]
    EB.io.in.valid <= _EB_io_in_valid_T @[D_PrimOp.scala 51:18]
    io.a.ready <= EB.io.in.ready @[D_PrimOp.scala 52:14]
    io.b.ready <= EB.io.in.ready @[D_PrimOp.scala 53:14]
    io.out.bits <= EB.io.out.bits @[D_PrimOp.scala 55:15]
    io.out.valid <= EB.io.out.valid @[D_PrimOp.scala 56:16]
    EB.io.out.ready <= io.out.ready @[D_PrimOp.scala 57:19]
    
  module Mult_D_PrimOp : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip a : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}, flip b : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<5>}, out : {flip ready : UInt<1>, valid : UInt<1>, bits : SInt<10>}}
    
    inst l0_0 of D_PrimOp_1 @[Mult_D_PrimOp.scala 48:20]
    l0_0.clock <= clock
    l0_0.reset <= reset
    inst l0_1 of D_PrimOp_1_1 @[Mult_D_PrimOp.scala 49:20]
    l0_1.clock <= clock
    l0_1.reset <= reset
    inst l0_2 of D_PrimOp_1_2 @[Mult_D_PrimOp.scala 50:20]
    l0_2.clock <= clock
    l0_2.reset <= reset
    inst l0_3 of D_PrimOp_0 @[Mult_D_PrimOp.scala 51:20]
    l0_3.clock <= clock
    l0_3.reset <= reset
    inst l0_4 of D_PrimOp_1_3 @[Mult_D_PrimOp.scala 52:20]
    l0_4.clock <= clock
    l0_4.reset <= reset
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
    l0_3.io.a.bits <= io.a.bits @[Mult_D_PrimOp.scala 30:18]
    l0_3.io.a.valid <= io.a.valid @[Mult_D_PrimOp.scala 30:18]
    io.a.ready <= l0_3.io.a.ready @[Mult_D_PrimOp.scala 30:18]
    l0_4.io.a.bits <= io.a.bits @[Mult_D_PrimOp.scala 32:18]
    l0_4.io.a.valid <= io.a.valid @[Mult_D_PrimOp.scala 32:18]
    io.a.ready <= l0_4.io.a.ready @[Mult_D_PrimOp.scala 32:18]
    l0_4.io.b.bits <= io.b.bits @[Mult_D_PrimOp.scala 33:18]
    l0_4.io.b.valid <= io.b.valid @[Mult_D_PrimOp.scala 33:18]
    io.b.ready <= l0_4.io.b.ready @[Mult_D_PrimOp.scala 33:18]
    inst l1_0 of D_PrimOp_1_4 @[Mult_D_PrimOp.scala 62:20]
    l1_0.clock <= clock
    l1_0.reset <= reset
    inst l1_1 of D_PrimOp_1_5 @[Mult_D_PrimOp.scala 63:20]
    l1_1.clock <= clock
    l1_1.reset <= reset
    inst l1_2 of D_PrimOp_1_6 @[Mult_D_PrimOp.scala 64:20]
    l1_2.clock <= clock
    l1_2.reset <= reset
    inst l1_3 of D_PrimOp_1_7 @[Mult_D_PrimOp.scala 65:20]
    l1_3.clock <= clock
    l1_3.reset <= reset
    inst l1_4 of D_PrimOp_1_8 @[Mult_D_PrimOp.scala 66:20]
    l1_4.clock <= clock
    l1_4.reset <= reset
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
    l1_2.io.a.bits <= l0_2.io.out.bits @[Mult_D_PrimOp.scala 32:18]
    l1_2.io.a.valid <= l0_2.io.out.valid @[Mult_D_PrimOp.scala 32:18]
    l0_2.io.out.ready <= l1_2.io.a.ready @[Mult_D_PrimOp.scala 32:18]
    l1_2.io.b.bits <= l0_3.io.out.bits @[Mult_D_PrimOp.scala 33:18]
    l1_2.io.b.valid <= l0_3.io.out.valid @[Mult_D_PrimOp.scala 33:18]
    l0_3.io.out.ready <= l1_2.io.b.ready @[Mult_D_PrimOp.scala 33:18]
    l1_3.io.a.bits <= l0_3.io.out.bits @[Mult_D_PrimOp.scala 32:18]
    l1_3.io.a.valid <= l0_3.io.out.valid @[Mult_D_PrimOp.scala 32:18]
    l0_3.io.out.ready <= l1_3.io.a.ready @[Mult_D_PrimOp.scala 32:18]
    l1_3.io.b.bits <= l0_4.io.out.bits @[Mult_D_PrimOp.scala 33:18]
    l1_3.io.b.valid <= l0_4.io.out.valid @[Mult_D_PrimOp.scala 33:18]
    l0_4.io.out.ready <= l1_3.io.b.ready @[Mult_D_PrimOp.scala 33:18]
    l1_4.io.a.bits <= l0_1.io.out.bits @[Mult_D_PrimOp.scala 32:18]
    l1_4.io.a.valid <= l0_1.io.out.valid @[Mult_D_PrimOp.scala 32:18]
    l0_1.io.out.ready <= l1_4.io.a.ready @[Mult_D_PrimOp.scala 32:18]
    l1_4.io.b.bits <= l0_4.io.out.bits @[Mult_D_PrimOp.scala 33:18]
    l1_4.io.b.valid <= l0_4.io.out.valid @[Mult_D_PrimOp.scala 33:18]
    l0_4.io.out.ready <= l1_4.io.b.ready @[Mult_D_PrimOp.scala 33:18]
    wire check1 : {valid : UInt<1>, ready : UInt<1>, bits : SInt<5>} @[Mult_D_PrimOp.scala 75:20]
    wire check2 : {valid : UInt<1>, ready : UInt<1>, bits : SInt<5>} @[Mult_D_PrimOp.scala 80:20]
    node _T = and(io.a.valid, io.b.valid) @[Mult_D_PrimOp.scala 86:20]
    when _T : @[Mult_D_PrimOp.scala 86:35]
      check1.bits <= l1_0.io.out.bits @[Mult_D_PrimOp.scala 87:12]
      l1_0.io.out.ready <= check1.ready @[Mult_D_PrimOp.scala 87:12]
      check1.valid <= l1_0.io.out.valid @[Mult_D_PrimOp.scala 87:12]
      check2.bits <= l1_2.io.out.bits @[Mult_D_PrimOp.scala 88:12]
      l1_2.io.out.ready <= check2.ready @[Mult_D_PrimOp.scala 88:12]
      check2.valid <= l1_2.io.out.valid @[Mult_D_PrimOp.scala 88:12]
      l1_1.io.out.ready <= io.out.ready @[Mult_D_PrimOp.scala 89:23]
      l1_3.io.out.ready <= io.out.ready @[Mult_D_PrimOp.scala 90:23]
      l1_4.io.out.ready <= io.out.ready @[Mult_D_PrimOp.scala 91:23]
      skip @[Mult_D_PrimOp.scala 86:35]
    else : @[Mult_D_PrimOp.scala 92:14]
      check1.bits <= l1_1.io.out.bits @[Mult_D_PrimOp.scala 93:12]
      l1_1.io.out.ready <= check1.ready @[Mult_D_PrimOp.scala 93:12]
      check1.valid <= l1_1.io.out.valid @[Mult_D_PrimOp.scala 93:12]
      check2.bits <= l1_3.io.out.bits @[Mult_D_PrimOp.scala 94:12]
      l1_3.io.out.ready <= check2.ready @[Mult_D_PrimOp.scala 94:12]
      check2.valid <= l1_3.io.out.valid @[Mult_D_PrimOp.scala 94:12]
      l1_0.io.out.ready <= io.out.ready @[Mult_D_PrimOp.scala 95:23]
      l1_2.io.out.ready <= io.out.ready @[Mult_D_PrimOp.scala 96:23]
      l1_4.io.out.ready <= io.out.ready @[Mult_D_PrimOp.scala 97:23]
      skip @[Mult_D_PrimOp.scala 92:14]
    node rawOut_lo = asUInt(check2.bits) @[Cat.scala 30:58]
    node rawOut_hi = asUInt(check1.bits) @[Cat.scala 30:58]
    node _rawOut_T = cat(rawOut_hi, rawOut_lo) @[Cat.scala 30:58]
    node rawOut = asSInt(_rawOut_T) @[Mult_D_PrimOp.scala 100:52]
    io.out.bits <= rawOut @[Mult_D_PrimOp.scala 102:15]
    node _io_out_valid_T = and(check1.valid, check2.valid) @[Mult_D_PrimOp.scala 103:32]
    io.out.valid <= _io_out_valid_T @[Mult_D_PrimOp.scala 103:16]
    check1.ready <= io.out.ready @[Mult_D_PrimOp.scala 104:16]
    check2.ready <= io.out.ready @[Mult_D_PrimOp.scala 105:16]
    
