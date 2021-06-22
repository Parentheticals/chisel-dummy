;buildInfoPackage: chisel3, version: 3.4.3, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit MultipleModules : 
  module Ope1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip a : UInt<7>, out : UInt<7>}
    
    reg reg_a : UInt<7>, clock with : (reset => (reset, UInt<7>("h00"))) @[MultipleModules.scala 83:22]
    reg_a <= io.a @[MultipleModules.scala 85:9]
    io.out <= reg_a @[MultipleModules.scala 87:10]
    
  module Ope2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip a : UInt<7>, out : UInt<7>}
    
    reg reg_a : UInt<7>, clock with : (reset => (reset, UInt<7>("h00"))) @[MultipleModules.scala 96:22]
    reg reg_b : UInt<7>, clock with : (reset => (reset, UInt<7>("h00"))) @[MultipleModules.scala 97:22]
    reg_a <= io.a @[MultipleModules.scala 99:9]
    reg_b <= reg_a @[MultipleModules.scala 100:9]
    node _T = rem(reg_b, UInt<2>("h02")) @[MultipleModules.scala 102:14]
    node _T_1 = eq(_T, UInt<1>("h00")) @[MultipleModules.scala 102:20]
    when _T_1 : @[MultipleModules.scala 102:29]
      io.out <= reg_b @[MultipleModules.scala 103:12]
      skip @[MultipleModules.scala 102:29]
    else : @[MultipleModules.scala 104:14]
      io.out <= reg_a @[MultipleModules.scala 105:12]
      skip @[MultipleModules.scala 104:14]
    
  module Ope : 
    input clock : Clock
    input reset : Reset
    output io : {flip a : UInt<7>, flip b : UInt<7>, out_a : UInt<7>, out_b : UInt<7>}
    
    inst op1 of Ope1 @[MultipleModules.scala 67:19]
    op1.clock <= clock
    op1.reset <= reset
    inst op2 of Ope2 @[MultipleModules.scala 68:19]
    op2.clock <= clock
    op2.reset <= reset
    op1.io.a <= io.a @[MultipleModules.scala 70:12]
    op2.io.a <= io.b @[MultipleModules.scala 71:12]
    io.out_a <= op1.io.out @[MultipleModules.scala 73:12]
    io.out_b <= op2.io.out @[MultipleModules.scala 74:12]
    
  module Ope1_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip a : UInt<7>, out : UInt<7>}
    
    reg reg_a : UInt<7>, clock with : (reset => (reset, UInt<7>("h00"))) @[MultipleModules.scala 83:22]
    reg_a <= io.a @[MultipleModules.scala 85:9]
    io.out <= reg_a @[MultipleModules.scala 87:10]
    
  module Ope2_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip a : UInt<7>, out : UInt<7>}
    
    reg reg_a : UInt<7>, clock with : (reset => (reset, UInt<7>("h00"))) @[MultipleModules.scala 96:22]
    reg reg_b : UInt<7>, clock with : (reset => (reset, UInt<7>("h00"))) @[MultipleModules.scala 97:22]
    reg_a <= io.a @[MultipleModules.scala 99:9]
    reg_b <= reg_a @[MultipleModules.scala 100:9]
    node _T = rem(reg_b, UInt<2>("h02")) @[MultipleModules.scala 102:14]
    node _T_1 = eq(_T, UInt<1>("h00")) @[MultipleModules.scala 102:20]
    when _T_1 : @[MultipleModules.scala 102:29]
      io.out <= reg_b @[MultipleModules.scala 103:12]
      skip @[MultipleModules.scala 102:29]
    else : @[MultipleModules.scala 104:14]
      io.out <= reg_a @[MultipleModules.scala 105:12]
      skip @[MultipleModules.scala 104:14]
    
  module Ope_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip a : UInt<7>, flip b : UInt<7>, out_a : UInt<7>, out_b : UInt<7>}
    
    inst op1 of Ope1_1 @[MultipleModules.scala 67:19]
    op1.clock <= clock
    op1.reset <= reset
    inst op2 of Ope2_1 @[MultipleModules.scala 68:19]
    op2.clock <= clock
    op2.reset <= reset
    op1.io.a <= io.a @[MultipleModules.scala 70:12]
    op2.io.a <= io.b @[MultipleModules.scala 71:12]
    io.out_a <= op1.io.out @[MultipleModules.scala 73:12]
    io.out_b <= op2.io.out @[MultipleModules.scala 74:12]
    
  module Ope1_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip a : UInt<7>, out : UInt<7>}
    
    reg reg_a : UInt<7>, clock with : (reset => (reset, UInt<7>("h00"))) @[MultipleModules.scala 83:22]
    reg_a <= io.a @[MultipleModules.scala 85:9]
    io.out <= reg_a @[MultipleModules.scala 87:10]
    
  module Ope2_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip a : UInt<7>, out : UInt<7>}
    
    reg reg_a : UInt<7>, clock with : (reset => (reset, UInt<7>("h00"))) @[MultipleModules.scala 96:22]
    reg reg_b : UInt<7>, clock with : (reset => (reset, UInt<7>("h00"))) @[MultipleModules.scala 97:22]
    reg_a <= io.a @[MultipleModules.scala 99:9]
    reg_b <= reg_a @[MultipleModules.scala 100:9]
    node _T = rem(reg_b, UInt<2>("h02")) @[MultipleModules.scala 102:14]
    node _T_1 = eq(_T, UInt<1>("h00")) @[MultipleModules.scala 102:20]
    when _T_1 : @[MultipleModules.scala 102:29]
      io.out <= reg_b @[MultipleModules.scala 103:12]
      skip @[MultipleModules.scala 102:29]
    else : @[MultipleModules.scala 104:14]
      io.out <= reg_a @[MultipleModules.scala 105:12]
      skip @[MultipleModules.scala 104:14]
    
  module Ope_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip a : UInt<7>, flip b : UInt<7>, out_a : UInt<7>, out_b : UInt<7>}
    
    inst op1 of Ope1_2 @[MultipleModules.scala 67:19]
    op1.clock <= clock
    op1.reset <= reset
    inst op2 of Ope2_2 @[MultipleModules.scala 68:19]
    op2.clock <= clock
    op2.reset <= reset
    op1.io.a <= io.a @[MultipleModules.scala 70:12]
    op2.io.a <= io.b @[MultipleModules.scala 71:12]
    io.out_a <= op1.io.out @[MultipleModules.scala 73:12]
    io.out_b <= op2.io.out @[MultipleModules.scala 74:12]
    
  module Ope1_3 : 
    input clock : Clock
    input reset : Reset
    output io : {flip a : UInt<7>, out : UInt<7>}
    
    reg reg_a : UInt<7>, clock with : (reset => (reset, UInt<7>("h00"))) @[MultipleModules.scala 83:22]
    reg_a <= io.a @[MultipleModules.scala 85:9]
    io.out <= reg_a @[MultipleModules.scala 87:10]
    
  module Ope2_3 : 
    input clock : Clock
    input reset : Reset
    output io : {flip a : UInt<7>, out : UInt<7>}
    
    reg reg_a : UInt<7>, clock with : (reset => (reset, UInt<7>("h00"))) @[MultipleModules.scala 96:22]
    reg reg_b : UInt<7>, clock with : (reset => (reset, UInt<7>("h00"))) @[MultipleModules.scala 97:22]
    reg_a <= io.a @[MultipleModules.scala 99:9]
    reg_b <= reg_a @[MultipleModules.scala 100:9]
    node _T = rem(reg_b, UInt<2>("h02")) @[MultipleModules.scala 102:14]
    node _T_1 = eq(_T, UInt<1>("h00")) @[MultipleModules.scala 102:20]
    when _T_1 : @[MultipleModules.scala 102:29]
      io.out <= reg_b @[MultipleModules.scala 103:12]
      skip @[MultipleModules.scala 102:29]
    else : @[MultipleModules.scala 104:14]
      io.out <= reg_a @[MultipleModules.scala 105:12]
      skip @[MultipleModules.scala 104:14]
    
  module Ope_3 : 
    input clock : Clock
    input reset : Reset
    output io : {flip a : UInt<7>, flip b : UInt<7>, out_a : UInt<7>, out_b : UInt<7>}
    
    inst op1 of Ope1_3 @[MultipleModules.scala 67:19]
    op1.clock <= clock
    op1.reset <= reset
    inst op2 of Ope2_3 @[MultipleModules.scala 68:19]
    op2.clock <= clock
    op2.reset <= reset
    op1.io.a <= io.a @[MultipleModules.scala 70:12]
    op2.io.a <= io.b @[MultipleModules.scala 71:12]
    io.out_a <= op1.io.out @[MultipleModules.scala 73:12]
    io.out_b <= op2.io.out @[MultipleModules.scala 74:12]
    
  module Ope1_4 : 
    input clock : Clock
    input reset : Reset
    output io : {flip a : UInt<7>, out : UInt<7>}
    
    reg reg_a : UInt<7>, clock with : (reset => (reset, UInt<7>("h00"))) @[MultipleModules.scala 83:22]
    reg_a <= io.a @[MultipleModules.scala 85:9]
    io.out <= reg_a @[MultipleModules.scala 87:10]
    
  module Ope2_4 : 
    input clock : Clock
    input reset : Reset
    output io : {flip a : UInt<7>, out : UInt<7>}
    
    reg reg_a : UInt<7>, clock with : (reset => (reset, UInt<7>("h00"))) @[MultipleModules.scala 96:22]
    reg reg_b : UInt<7>, clock with : (reset => (reset, UInt<7>("h00"))) @[MultipleModules.scala 97:22]
    reg_a <= io.a @[MultipleModules.scala 99:9]
    reg_b <= reg_a @[MultipleModules.scala 100:9]
    node _T = rem(reg_b, UInt<2>("h02")) @[MultipleModules.scala 102:14]
    node _T_1 = eq(_T, UInt<1>("h00")) @[MultipleModules.scala 102:20]
    when _T_1 : @[MultipleModules.scala 102:29]
      io.out <= reg_b @[MultipleModules.scala 103:12]
      skip @[MultipleModules.scala 102:29]
    else : @[MultipleModules.scala 104:14]
      io.out <= reg_a @[MultipleModules.scala 105:12]
      skip @[MultipleModules.scala 104:14]
    
  module Ope_4 : 
    input clock : Clock
    input reset : Reset
    output io : {flip a : UInt<7>, flip b : UInt<7>, out_a : UInt<7>, out_b : UInt<7>}
    
    inst op1 of Ope1_4 @[MultipleModules.scala 67:19]
    op1.clock <= clock
    op1.reset <= reset
    inst op2 of Ope2_4 @[MultipleModules.scala 68:19]
    op2.clock <= clock
    op2.reset <= reset
    op1.io.a <= io.a @[MultipleModules.scala 70:12]
    op2.io.a <= io.b @[MultipleModules.scala 71:12]
    io.out_a <= op1.io.out @[MultipleModules.scala 73:12]
    io.out_b <= op2.io.out @[MultipleModules.scala 74:12]
    
  module Ope1_5 : 
    input clock : Clock
    input reset : Reset
    output io : {flip a : UInt<7>, out : UInt<7>}
    
    reg reg_a : UInt<7>, clock with : (reset => (reset, UInt<7>("h00"))) @[MultipleModules.scala 83:22]
    reg_a <= io.a @[MultipleModules.scala 85:9]
    io.out <= reg_a @[MultipleModules.scala 87:10]
    
  module Ope2_5 : 
    input clock : Clock
    input reset : Reset
    output io : {flip a : UInt<7>, out : UInt<7>}
    
    reg reg_a : UInt<7>, clock with : (reset => (reset, UInt<7>("h00"))) @[MultipleModules.scala 96:22]
    reg reg_b : UInt<7>, clock with : (reset => (reset, UInt<7>("h00"))) @[MultipleModules.scala 97:22]
    reg_a <= io.a @[MultipleModules.scala 99:9]
    reg_b <= reg_a @[MultipleModules.scala 100:9]
    node _T = rem(reg_b, UInt<2>("h02")) @[MultipleModules.scala 102:14]
    node _T_1 = eq(_T, UInt<1>("h00")) @[MultipleModules.scala 102:20]
    when _T_1 : @[MultipleModules.scala 102:29]
      io.out <= reg_b @[MultipleModules.scala 103:12]
      skip @[MultipleModules.scala 102:29]
    else : @[MultipleModules.scala 104:14]
      io.out <= reg_a @[MultipleModules.scala 105:12]
      skip @[MultipleModules.scala 104:14]
    
  module Ope_5 : 
    input clock : Clock
    input reset : Reset
    output io : {flip a : UInt<7>, flip b : UInt<7>, out_a : UInt<7>, out_b : UInt<7>}
    
    inst op1 of Ope1_5 @[MultipleModules.scala 67:19]
    op1.clock <= clock
    op1.reset <= reset
    inst op2 of Ope2_5 @[MultipleModules.scala 68:19]
    op2.clock <= clock
    op2.reset <= reset
    op1.io.a <= io.a @[MultipleModules.scala 70:12]
    op2.io.a <= io.b @[MultipleModules.scala 71:12]
    io.out_a <= op1.io.out @[MultipleModules.scala 73:12]
    io.out_b <= op2.io.out @[MultipleModules.scala 74:12]
    
  module Ope1_6 : 
    input clock : Clock
    input reset : Reset
    output io : {flip a : UInt<7>, out : UInt<7>}
    
    reg reg_a : UInt<7>, clock with : (reset => (reset, UInt<7>("h00"))) @[MultipleModules.scala 83:22]
    reg_a <= io.a @[MultipleModules.scala 85:9]
    io.out <= reg_a @[MultipleModules.scala 87:10]
    
  module Ope2_6 : 
    input clock : Clock
    input reset : Reset
    output io : {flip a : UInt<7>, out : UInt<7>}
    
    reg reg_a : UInt<7>, clock with : (reset => (reset, UInt<7>("h00"))) @[MultipleModules.scala 96:22]
    reg reg_b : UInt<7>, clock with : (reset => (reset, UInt<7>("h00"))) @[MultipleModules.scala 97:22]
    reg_a <= io.a @[MultipleModules.scala 99:9]
    reg_b <= reg_a @[MultipleModules.scala 100:9]
    node _T = rem(reg_b, UInt<2>("h02")) @[MultipleModules.scala 102:14]
    node _T_1 = eq(_T, UInt<1>("h00")) @[MultipleModules.scala 102:20]
    when _T_1 : @[MultipleModules.scala 102:29]
      io.out <= reg_b @[MultipleModules.scala 103:12]
      skip @[MultipleModules.scala 102:29]
    else : @[MultipleModules.scala 104:14]
      io.out <= reg_a @[MultipleModules.scala 105:12]
      skip @[MultipleModules.scala 104:14]
    
  module Ope_6 : 
    input clock : Clock
    input reset : Reset
    output io : {flip a : UInt<7>, flip b : UInt<7>, out_a : UInt<7>, out_b : UInt<7>}
    
    inst op1 of Ope1_6 @[MultipleModules.scala 67:19]
    op1.clock <= clock
    op1.reset <= reset
    inst op2 of Ope2_6 @[MultipleModules.scala 68:19]
    op2.clock <= clock
    op2.reset <= reset
    op1.io.a <= io.a @[MultipleModules.scala 70:12]
    op2.io.a <= io.b @[MultipleModules.scala 71:12]
    io.out_a <= op1.io.out @[MultipleModules.scala 73:12]
    io.out_b <= op2.io.out @[MultipleModules.scala 74:12]
    
  module Ope1_7 : 
    input clock : Clock
    input reset : Reset
    output io : {flip a : UInt<7>, out : UInt<7>}
    
    reg reg_a : UInt<7>, clock with : (reset => (reset, UInt<7>("h00"))) @[MultipleModules.scala 83:22]
    reg_a <= io.a @[MultipleModules.scala 85:9]
    io.out <= reg_a @[MultipleModules.scala 87:10]
    
  module Ope2_7 : 
    input clock : Clock
    input reset : Reset
    output io : {flip a : UInt<7>, out : UInt<7>}
    
    reg reg_a : UInt<7>, clock with : (reset => (reset, UInt<7>("h00"))) @[MultipleModules.scala 96:22]
    reg reg_b : UInt<7>, clock with : (reset => (reset, UInt<7>("h00"))) @[MultipleModules.scala 97:22]
    reg_a <= io.a @[MultipleModules.scala 99:9]
    reg_b <= reg_a @[MultipleModules.scala 100:9]
    node _T = rem(reg_b, UInt<2>("h02")) @[MultipleModules.scala 102:14]
    node _T_1 = eq(_T, UInt<1>("h00")) @[MultipleModules.scala 102:20]
    when _T_1 : @[MultipleModules.scala 102:29]
      io.out <= reg_b @[MultipleModules.scala 103:12]
      skip @[MultipleModules.scala 102:29]
    else : @[MultipleModules.scala 104:14]
      io.out <= reg_a @[MultipleModules.scala 105:12]
      skip @[MultipleModules.scala 104:14]
    
  module Ope_7 : 
    input clock : Clock
    input reset : Reset
    output io : {flip a : UInt<7>, flip b : UInt<7>, out_a : UInt<7>, out_b : UInt<7>}
    
    inst op1 of Ope1_7 @[MultipleModules.scala 67:19]
    op1.clock <= clock
    op1.reset <= reset
    inst op2 of Ope2_7 @[MultipleModules.scala 68:19]
    op2.clock <= clock
    op2.reset <= reset
    op1.io.a <= io.a @[MultipleModules.scala 70:12]
    op2.io.a <= io.b @[MultipleModules.scala 71:12]
    io.out_a <= op1.io.out @[MultipleModules.scala 73:12]
    io.out_b <= op2.io.out @[MultipleModules.scala 74:12]
    
  module Ope1_8 : 
    input clock : Clock
    input reset : Reset
    output io : {flip a : UInt<7>, out : UInt<7>}
    
    reg reg_a : UInt<7>, clock with : (reset => (reset, UInt<7>("h00"))) @[MultipleModules.scala 83:22]
    reg_a <= io.a @[MultipleModules.scala 85:9]
    io.out <= reg_a @[MultipleModules.scala 87:10]
    
  module Ope2_8 : 
    input clock : Clock
    input reset : Reset
    output io : {flip a : UInt<7>, out : UInt<7>}
    
    reg reg_a : UInt<7>, clock with : (reset => (reset, UInt<7>("h00"))) @[MultipleModules.scala 96:22]
    reg reg_b : UInt<7>, clock with : (reset => (reset, UInt<7>("h00"))) @[MultipleModules.scala 97:22]
    reg_a <= io.a @[MultipleModules.scala 99:9]
    reg_b <= reg_a @[MultipleModules.scala 100:9]
    node _T = rem(reg_b, UInt<2>("h02")) @[MultipleModules.scala 102:14]
    node _T_1 = eq(_T, UInt<1>("h00")) @[MultipleModules.scala 102:20]
    when _T_1 : @[MultipleModules.scala 102:29]
      io.out <= reg_b @[MultipleModules.scala 103:12]
      skip @[MultipleModules.scala 102:29]
    else : @[MultipleModules.scala 104:14]
      io.out <= reg_a @[MultipleModules.scala 105:12]
      skip @[MultipleModules.scala 104:14]
    
  module Ope_8 : 
    input clock : Clock
    input reset : Reset
    output io : {flip a : UInt<7>, flip b : UInt<7>, out_a : UInt<7>, out_b : UInt<7>}
    
    inst op1 of Ope1_8 @[MultipleModules.scala 67:19]
    op1.clock <= clock
    op1.reset <= reset
    inst op2 of Ope2_8 @[MultipleModules.scala 68:19]
    op2.clock <= clock
    op2.reset <= reset
    op1.io.a <= io.a @[MultipleModules.scala 70:12]
    op2.io.a <= io.b @[MultipleModules.scala 71:12]
    io.out_a <= op1.io.out @[MultipleModules.scala 73:12]
    io.out_b <= op2.io.out @[MultipleModules.scala 74:12]
    
  module Ope1_9 : 
    input clock : Clock
    input reset : Reset
    output io : {flip a : UInt<7>, out : UInt<7>}
    
    reg reg_a : UInt<7>, clock with : (reset => (reset, UInt<7>("h00"))) @[MultipleModules.scala 83:22]
    reg_a <= io.a @[MultipleModules.scala 85:9]
    io.out <= reg_a @[MultipleModules.scala 87:10]
    
  module Ope2_9 : 
    input clock : Clock
    input reset : Reset
    output io : {flip a : UInt<7>, out : UInt<7>}
    
    reg reg_a : UInt<7>, clock with : (reset => (reset, UInt<7>("h00"))) @[MultipleModules.scala 96:22]
    reg reg_b : UInt<7>, clock with : (reset => (reset, UInt<7>("h00"))) @[MultipleModules.scala 97:22]
    reg_a <= io.a @[MultipleModules.scala 99:9]
    reg_b <= reg_a @[MultipleModules.scala 100:9]
    node _T = rem(reg_b, UInt<2>("h02")) @[MultipleModules.scala 102:14]
    node _T_1 = eq(_T, UInt<1>("h00")) @[MultipleModules.scala 102:20]
    when _T_1 : @[MultipleModules.scala 102:29]
      io.out <= reg_b @[MultipleModules.scala 103:12]
      skip @[MultipleModules.scala 102:29]
    else : @[MultipleModules.scala 104:14]
      io.out <= reg_a @[MultipleModules.scala 105:12]
      skip @[MultipleModules.scala 104:14]
    
  module Ope_9 : 
    input clock : Clock
    input reset : Reset
    output io : {flip a : UInt<7>, flip b : UInt<7>, out_a : UInt<7>, out_b : UInt<7>}
    
    inst op1 of Ope1_9 @[MultipleModules.scala 67:19]
    op1.clock <= clock
    op1.reset <= reset
    inst op2 of Ope2_9 @[MultipleModules.scala 68:19]
    op2.clock <= clock
    op2.reset <= reset
    op1.io.a <= io.a @[MultipleModules.scala 70:12]
    op2.io.a <= io.b @[MultipleModules.scala 71:12]
    io.out_a <= op1.io.out @[MultipleModules.scala 73:12]
    io.out_b <= op2.io.out @[MultipleModules.scala 74:12]
    
  module MultipleModules : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in1 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<7>}, flip in2 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<7>}, out1 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<7>}, out2 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<7>}}
    
    inst pipeline_0 of Ope @[MultipleModules.scala 15:11]
    pipeline_0.clock <= clock
    pipeline_0.reset <= reset
    inst pipeline_1 of Ope_1 @[MultipleModules.scala 15:11]
    pipeline_1.clock <= clock
    pipeline_1.reset <= reset
    inst pipeline_2 of Ope_2 @[MultipleModules.scala 15:11]
    pipeline_2.clock <= clock
    pipeline_2.reset <= reset
    inst pipeline_3 of Ope_3 @[MultipleModules.scala 15:11]
    pipeline_3.clock <= clock
    pipeline_3.reset <= reset
    inst pipeline_4 of Ope_4 @[MultipleModules.scala 15:11]
    pipeline_4.clock <= clock
    pipeline_4.reset <= reset
    inst pipeline_5 of Ope_5 @[MultipleModules.scala 15:11]
    pipeline_5.clock <= clock
    pipeline_5.reset <= reset
    inst pipeline_6 of Ope_6 @[MultipleModules.scala 15:11]
    pipeline_6.clock <= clock
    pipeline_6.reset <= reset
    inst pipeline_7 of Ope_7 @[MultipleModules.scala 15:11]
    pipeline_7.clock <= clock
    pipeline_7.reset <= reset
    inst pipeline_8 of Ope_8 @[MultipleModules.scala 15:11]
    pipeline_8.clock <= clock
    pipeline_8.reset <= reset
    inst pipeline_9 of Ope_9 @[MultipleModules.scala 15:11]
    pipeline_9.clock <= clock
    pipeline_9.reset <= reset
    when io.in1.valid : @[MultipleModules.scala 18:22]
      pipeline_0.io.a <= io.in1.bits @[MultipleModules.scala 19:24]
      skip @[MultipleModules.scala 18:22]
    else : @[MultipleModules.scala 20:14]
      pipeline_0.io.a <= UInt<1>("h00") @[MultipleModules.scala 21:24]
      skip @[MultipleModules.scala 20:14]
    when io.in2.valid : @[MultipleModules.scala 24:22]
      pipeline_0.io.b <= io.in2.bits @[MultipleModules.scala 25:24]
      skip @[MultipleModules.scala 24:22]
    else : @[MultipleModules.scala 26:14]
      pipeline_0.io.b <= UInt<1>("h00") @[MultipleModules.scala 27:24]
      skip @[MultipleModules.scala 26:14]
    when io.in1.valid : @[MultipleModules.scala 31:26]
      pipeline_1.io.a <= pipeline_0.io.out_a @[MultipleModules.scala 32:16]
      skip @[MultipleModules.scala 31:26]
    else : @[MultipleModules.scala 33:18]
      pipeline_1.io.a <= UInt<1>("h00") @[MultipleModules.scala 34:16]
      skip @[MultipleModules.scala 33:18]
    when io.in2.valid : @[MultipleModules.scala 36:26]
      pipeline_1.io.b <= pipeline_0.io.out_b @[MultipleModules.scala 37:16]
      skip @[MultipleModules.scala 36:26]
    else : @[MultipleModules.scala 38:18]
      pipeline_1.io.b <= UInt<1>("h00") @[MultipleModules.scala 39:16]
      skip @[MultipleModules.scala 38:18]
    when io.in1.valid : @[MultipleModules.scala 31:26]
      pipeline_2.io.a <= pipeline_1.io.out_a @[MultipleModules.scala 32:16]
      skip @[MultipleModules.scala 31:26]
    else : @[MultipleModules.scala 33:18]
      pipeline_2.io.a <= UInt<1>("h00") @[MultipleModules.scala 34:16]
      skip @[MultipleModules.scala 33:18]
    when io.in2.valid : @[MultipleModules.scala 36:26]
      pipeline_2.io.b <= pipeline_1.io.out_b @[MultipleModules.scala 37:16]
      skip @[MultipleModules.scala 36:26]
    else : @[MultipleModules.scala 38:18]
      pipeline_2.io.b <= UInt<1>("h00") @[MultipleModules.scala 39:16]
      skip @[MultipleModules.scala 38:18]
    when io.in1.valid : @[MultipleModules.scala 31:26]
      pipeline_3.io.a <= pipeline_2.io.out_a @[MultipleModules.scala 32:16]
      skip @[MultipleModules.scala 31:26]
    else : @[MultipleModules.scala 33:18]
      pipeline_3.io.a <= UInt<1>("h00") @[MultipleModules.scala 34:16]
      skip @[MultipleModules.scala 33:18]
    when io.in2.valid : @[MultipleModules.scala 36:26]
      pipeline_3.io.b <= pipeline_2.io.out_b @[MultipleModules.scala 37:16]
      skip @[MultipleModules.scala 36:26]
    else : @[MultipleModules.scala 38:18]
      pipeline_3.io.b <= UInt<1>("h00") @[MultipleModules.scala 39:16]
      skip @[MultipleModules.scala 38:18]
    when io.in1.valid : @[MultipleModules.scala 31:26]
      pipeline_4.io.a <= pipeline_3.io.out_a @[MultipleModules.scala 32:16]
      skip @[MultipleModules.scala 31:26]
    else : @[MultipleModules.scala 33:18]
      pipeline_4.io.a <= UInt<1>("h00") @[MultipleModules.scala 34:16]
      skip @[MultipleModules.scala 33:18]
    when io.in2.valid : @[MultipleModules.scala 36:26]
      pipeline_4.io.b <= pipeline_3.io.out_b @[MultipleModules.scala 37:16]
      skip @[MultipleModules.scala 36:26]
    else : @[MultipleModules.scala 38:18]
      pipeline_4.io.b <= UInt<1>("h00") @[MultipleModules.scala 39:16]
      skip @[MultipleModules.scala 38:18]
    when io.in1.valid : @[MultipleModules.scala 31:26]
      pipeline_5.io.a <= pipeline_4.io.out_a @[MultipleModules.scala 32:16]
      skip @[MultipleModules.scala 31:26]
    else : @[MultipleModules.scala 33:18]
      pipeline_5.io.a <= UInt<1>("h00") @[MultipleModules.scala 34:16]
      skip @[MultipleModules.scala 33:18]
    when io.in2.valid : @[MultipleModules.scala 36:26]
      pipeline_5.io.b <= pipeline_4.io.out_b @[MultipleModules.scala 37:16]
      skip @[MultipleModules.scala 36:26]
    else : @[MultipleModules.scala 38:18]
      pipeline_5.io.b <= UInt<1>("h00") @[MultipleModules.scala 39:16]
      skip @[MultipleModules.scala 38:18]
    when io.in1.valid : @[MultipleModules.scala 31:26]
      pipeline_6.io.a <= pipeline_5.io.out_a @[MultipleModules.scala 32:16]
      skip @[MultipleModules.scala 31:26]
    else : @[MultipleModules.scala 33:18]
      pipeline_6.io.a <= UInt<1>("h00") @[MultipleModules.scala 34:16]
      skip @[MultipleModules.scala 33:18]
    when io.in2.valid : @[MultipleModules.scala 36:26]
      pipeline_6.io.b <= pipeline_5.io.out_b @[MultipleModules.scala 37:16]
      skip @[MultipleModules.scala 36:26]
    else : @[MultipleModules.scala 38:18]
      pipeline_6.io.b <= UInt<1>("h00") @[MultipleModules.scala 39:16]
      skip @[MultipleModules.scala 38:18]
    when io.in1.valid : @[MultipleModules.scala 31:26]
      pipeline_7.io.a <= pipeline_6.io.out_a @[MultipleModules.scala 32:16]
      skip @[MultipleModules.scala 31:26]
    else : @[MultipleModules.scala 33:18]
      pipeline_7.io.a <= UInt<1>("h00") @[MultipleModules.scala 34:16]
      skip @[MultipleModules.scala 33:18]
    when io.in2.valid : @[MultipleModules.scala 36:26]
      pipeline_7.io.b <= pipeline_6.io.out_b @[MultipleModules.scala 37:16]
      skip @[MultipleModules.scala 36:26]
    else : @[MultipleModules.scala 38:18]
      pipeline_7.io.b <= UInt<1>("h00") @[MultipleModules.scala 39:16]
      skip @[MultipleModules.scala 38:18]
    when io.in1.valid : @[MultipleModules.scala 31:26]
      pipeline_8.io.a <= pipeline_7.io.out_a @[MultipleModules.scala 32:16]
      skip @[MultipleModules.scala 31:26]
    else : @[MultipleModules.scala 33:18]
      pipeline_8.io.a <= UInt<1>("h00") @[MultipleModules.scala 34:16]
      skip @[MultipleModules.scala 33:18]
    when io.in2.valid : @[MultipleModules.scala 36:26]
      pipeline_8.io.b <= pipeline_7.io.out_b @[MultipleModules.scala 37:16]
      skip @[MultipleModules.scala 36:26]
    else : @[MultipleModules.scala 38:18]
      pipeline_8.io.b <= UInt<1>("h00") @[MultipleModules.scala 39:16]
      skip @[MultipleModules.scala 38:18]
    when io.in1.valid : @[MultipleModules.scala 31:26]
      pipeline_9.io.a <= pipeline_8.io.out_a @[MultipleModules.scala 32:16]
      skip @[MultipleModules.scala 31:26]
    else : @[MultipleModules.scala 33:18]
      pipeline_9.io.a <= UInt<1>("h00") @[MultipleModules.scala 34:16]
      skip @[MultipleModules.scala 33:18]
    when io.in2.valid : @[MultipleModules.scala 36:26]
      pipeline_9.io.b <= pipeline_8.io.out_b @[MultipleModules.scala 37:16]
      skip @[MultipleModules.scala 36:26]
    else : @[MultipleModules.scala 38:18]
      pipeline_9.io.b <= UInt<1>("h00") @[MultipleModules.scala 39:16]
      skip @[MultipleModules.scala 38:18]
    io.in1.ready <= UInt<1>("h01") @[MultipleModules.scala 49:16]
    io.in2.ready <= UInt<1>("h01") @[MultipleModules.scala 50:16]
    io.out1.bits <= pipeline_9.io.out_a @[MultipleModules.scala 52:16]
    io.out2.bits <= pipeline_9.io.out_b @[MultipleModules.scala 53:16]
    node _io_out1_valid_T = neq(pipeline_9.io.out_a, UInt<1>("h00")) @[MultipleModules.scala 55:47]
    io.out1.valid <= _io_out1_valid_T @[MultipleModules.scala 55:17]
    node _io_out2_valid_T = neq(pipeline_9.io.out_b, UInt<1>("h00")) @[MultipleModules.scala 56:47]
    io.out2.valid <= _io_out2_valid_T @[MultipleModules.scala 56:17]
    
