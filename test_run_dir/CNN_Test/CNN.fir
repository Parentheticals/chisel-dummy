;buildInfoPackage: chisel3, version: 3.4.3, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit CNN : 
  module Neuron : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : SInt<3>[2], flip weights : SInt<3>[2], out : SInt<3>}
    
    node _mac_T = mul(io.in[0], io.weights[0]) @[CNN.scala 14:65]
    node _mac_T_1 = mul(io.in[1], io.weights[1]) @[CNN.scala 14:65]
    node _mac_T_2 = add(_mac_T, _mac_T_1) @[CNN.scala 14:77]
    node _mac_T_3 = tail(_mac_T_2, 1) @[CNN.scala 14:77]
    node mac = asSInt(_mac_T_3) @[CNN.scala 14:77]
    node _io_out_T = leq(mac, asSInt(UInt<1>("h00"))) @[CNNSpec.scala 16:41]
    node _io_out_T_1 = mux(_io_out_T, asSInt(UInt<1>("h00")), mac) @[CNNSpec.scala 16:38]
    io.out <= _io_out_T_1 @[CNN.scala 15:10]
    
  module Neuron_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : SInt<3>[2], flip weights : SInt<3>[2], out : SInt<3>}
    
    node _mac_T = mul(io.in[0], io.weights[0]) @[CNN.scala 14:65]
    node _mac_T_1 = mul(io.in[1], io.weights[1]) @[CNN.scala 14:65]
    node _mac_T_2 = add(_mac_T, _mac_T_1) @[CNN.scala 14:77]
    node _mac_T_3 = tail(_mac_T_2, 1) @[CNN.scala 14:77]
    node mac = asSInt(_mac_T_3) @[CNN.scala 14:77]
    node _io_out_T = leq(mac, asSInt(UInt<1>("h00"))) @[CNNSpec.scala 16:41]
    node _io_out_T_1 = mux(_io_out_T, asSInt(UInt<1>("h00")), mac) @[CNNSpec.scala 16:38]
    io.out <= _io_out_T_1 @[CNN.scala 15:10]
    
  module Neuron_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : SInt<3>[2], flip weights : SInt<3>[2], out : SInt<3>}
    
    node _mac_T = mul(io.in[0], io.weights[0]) @[CNN.scala 14:65]
    node _mac_T_1 = mul(io.in[1], io.weights[1]) @[CNN.scala 14:65]
    node _mac_T_2 = add(_mac_T, _mac_T_1) @[CNN.scala 14:77]
    node _mac_T_3 = tail(_mac_T_2, 1) @[CNN.scala 14:77]
    node mac = asSInt(_mac_T_3) @[CNN.scala 14:77]
    node _io_out_T = leq(mac, asSInt(UInt<1>("h00"))) @[CNNSpec.scala 16:41]
    node _io_out_T_1 = mux(_io_out_T, asSInt(UInt<1>("h00")), mac) @[CNNSpec.scala 16:38]
    io.out <= _io_out_T_1 @[CNN.scala 15:10]
    
  module Neuron_3 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : SInt<3>[2], flip weights : SInt<3>[2], out : SInt<3>}
    
    node _mac_T = mul(io.in[0], io.weights[0]) @[CNN.scala 14:65]
    node _mac_T_1 = mul(io.in[1], io.weights[1]) @[CNN.scala 14:65]
    node _mac_T_2 = add(_mac_T, _mac_T_1) @[CNN.scala 14:77]
    node _mac_T_3 = tail(_mac_T_2, 1) @[CNN.scala 14:77]
    node mac = asSInt(_mac_T_3) @[CNN.scala 14:77]
    node _io_out_T = leq(mac, asSInt(UInt<1>("h00"))) @[CNNSpec.scala 16:41]
    node _io_out_T_1 = mux(_io_out_T, asSInt(UInt<1>("h00")), mac) @[CNNSpec.scala 16:38]
    io.out <= _io_out_T_1 @[CNN.scala 15:10]
    
  module Neuron_4 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : SInt<3>[2], flip weights : SInt<3>[2], out : SInt<3>}
    
    node _mac_T = mul(io.in[0], io.weights[0]) @[CNN.scala 14:65]
    node _mac_T_1 = mul(io.in[1], io.weights[1]) @[CNN.scala 14:65]
    node _mac_T_2 = add(_mac_T, _mac_T_1) @[CNN.scala 14:77]
    node _mac_T_3 = tail(_mac_T_2, 1) @[CNN.scala 14:77]
    node mac = asSInt(_mac_T_3) @[CNN.scala 14:77]
    node _io_out_T = leq(mac, asSInt(UInt<1>("h00"))) @[CNNSpec.scala 16:41]
    node _io_out_T_1 = mux(_io_out_T, asSInt(UInt<1>("h00")), mac) @[CNNSpec.scala 16:38]
    io.out <= _io_out_T_1 @[CNN.scala 15:10]
    
  module Neuron_5 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : SInt<3>[2], flip weights : SInt<3>[2], out : SInt<3>}
    
    node _mac_T = mul(io.in[0], io.weights[0]) @[CNN.scala 14:65]
    node _mac_T_1 = mul(io.in[1], io.weights[1]) @[CNN.scala 14:65]
    node _mac_T_2 = add(_mac_T, _mac_T_1) @[CNN.scala 14:77]
    node _mac_T_3 = tail(_mac_T_2, 1) @[CNN.scala 14:77]
    node mac = asSInt(_mac_T_3) @[CNN.scala 14:77]
    node _io_out_T = leq(mac, asSInt(UInt<1>("h00"))) @[CNNSpec.scala 16:41]
    node _io_out_T_1 = mux(_io_out_T, asSInt(UInt<1>("h00")), mac) @[CNNSpec.scala 16:38]
    io.out <= _io_out_T_1 @[CNN.scala 15:10]
    
  module CNN : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in : SInt<3>[2], flip vld_in : UInt<1>, flip weights : SInt<3>[2][2][3], out : SInt<3>[2], vld_out : UInt<1>}
    
    inst network_0_0 of Neuron @[CNN.scala 28:78]
    network_0_0.clock <= clock
    network_0_0.reset <= reset
    inst network_0_1 of Neuron_1 @[CNN.scala 28:78]
    network_0_1.clock <= clock
    network_0_1.reset <= reset
    inst network_1_0 of Neuron_2 @[CNN.scala 28:78]
    network_1_0.clock <= clock
    network_1_0.reset <= reset
    inst network_1_1 of Neuron_3 @[CNN.scala 28:78]
    network_1_1.clock <= clock
    network_1_1.reset <= reset
    inst network_2_0 of Neuron_4 @[CNN.scala 28:78]
    network_2_0.clock <= clock
    network_2_0.reset <= reset
    inst network_2_1 of Neuron_5 @[CNN.scala 28:78]
    network_2_1.clock <= clock
    network_2_1.reset <= reset
    network_0_0.io.in[0] <= io.in[0] @[CNN.scala 33:20]
    network_0_0.io.in[1] <= io.in[1] @[CNN.scala 33:20]
    network_0_0.io.weights[0] <= io.weights[0][0][0] @[CNN.scala 34:25]
    network_0_0.io.weights[1] <= io.weights[0][0][1] @[CNN.scala 34:25]
    network_0_1.io.in[0] <= io.in[0] @[CNN.scala 33:20]
    network_0_1.io.in[1] <= io.in[1] @[CNN.scala 33:20]
    network_0_1.io.weights[0] <= io.weights[0][1][0] @[CNN.scala 34:25]
    network_0_1.io.weights[1] <= io.weights[0][1][1] @[CNN.scala 34:25]
    network_1_0.io.in[0] <= network_0_0.io.out @[CNN.scala 45:24]
    network_1_0.io.in[1] <= network_0_1.io.out @[CNN.scala 45:24]
    network_1_0.io.weights[0] <= io.weights[1][0][0] @[CNN.scala 46:29]
    network_1_0.io.weights[1] <= io.weights[1][0][1] @[CNN.scala 46:29]
    network_1_1.io.in[0] <= network_0_0.io.out @[CNN.scala 45:24]
    network_1_1.io.in[1] <= network_0_1.io.out @[CNN.scala 45:24]
    network_1_1.io.weights[0] <= io.weights[1][1][0] @[CNN.scala 46:29]
    network_1_1.io.weights[1] <= io.weights[1][1][1] @[CNN.scala 46:29]
    network_2_0.io.in[0] <= network_1_0.io.out @[CNN.scala 45:24]
    network_2_0.io.in[1] <= network_1_1.io.out @[CNN.scala 45:24]
    network_2_0.io.weights[0] <= io.weights[2][0][0] @[CNN.scala 46:29]
    network_2_0.io.weights[1] <= io.weights[2][0][1] @[CNN.scala 46:29]
    network_2_1.io.in[0] <= network_1_0.io.out @[CNN.scala 45:24]
    network_2_1.io.in[1] <= network_1_1.io.out @[CNN.scala 45:24]
    network_2_1.io.weights[0] <= io.weights[2][1][0] @[CNN.scala 46:29]
    network_2_1.io.weights[1] <= io.weights[2][1][1] @[CNN.scala 46:29]
    reg reg_0 : SInt<3>, clock with : (reset => (reset, asSInt(UInt<3>("h00")))) @[CNN.scala 54:37]
    reg reg_1 : SInt<3>, clock with : (reset => (reset, asSInt(UInt<3>("h00")))) @[CNN.scala 54:37]
    reg_0 <= network_2_0.io.out @[CNN.scala 59:14]
    reg_0 <= network_2_1.io.out @[CNN.scala 59:14]
    io.out[0] <= reg_0 @[CNN.scala 63:10]
    io.out[1] <= reg_1 @[CNN.scala 63:10]
    reg reg_vld : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[CNN.scala 65:24]
    reg_vld <= io.vld_in @[CNN.scala 66:11]
    io.vld_out <= reg_vld @[CNN.scala 67:14]
    
