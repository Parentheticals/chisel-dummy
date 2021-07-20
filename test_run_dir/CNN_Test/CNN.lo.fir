circuit CNN :
  module Neuron :
    input clock : Clock
    input reset : UInt<1>
    input io_in_0 : SInt<300>
    input io_in_1 : SInt<300>
    input io_weights_0 : SInt<300>
    input io_weights_1 : SInt<300>
    output io_out : SInt<300>

    node _mac_T = mul(io_in_0, io_weights_0) @[CNN.scala 14:65]
    node _mac_T_1 = mul(io_in_1, io_weights_1) @[CNN.scala 14:65]
    node _mac_T_2 = add(_mac_T, _mac_T_1) @[CNN.scala 14:77]
    node _mac_T_3 = tail(_mac_T_2, 1) @[CNN.scala 14:77]
    node mac = asSInt(_mac_T_3) @[CNN.scala 14:77]
    node _io_out_T = leq(mac, asSInt(UInt<1>("h0"))) @[CNNSpec.scala 16:41]
    node _io_out_T_1 = mux(_io_out_T, asSInt(UInt<1>("h0")), mac) @[CNNSpec.scala 16:38]
    io_out <= asSInt(bits(_io_out_T_1, 299, 0)) @[CNN.scala 15:10]

  module CNN :
    input clock : Clock
    input reset : UInt<1>
    input io_in_0 : SInt<300>
    input io_in_1 : SInt<300>
    input io_vld_in : UInt<1>
    input io_weights_0_0_0 : SInt<300>
    input io_weights_0_0_1 : SInt<300>
    input io_weights_0_1_0 : SInt<300>
    input io_weights_0_1_1 : SInt<300>
    input io_weights_1_0_0 : SInt<300>
    input io_weights_1_0_1 : SInt<300>
    input io_weights_1_1_0 : SInt<300>
    input io_weights_1_1_1 : SInt<300>
    input io_weights_2_0_0 : SInt<300>
    input io_weights_2_0_1 : SInt<300>
    input io_weights_2_1_0 : SInt<300>
    input io_weights_2_1_1 : SInt<300>
    output io_out_0 : SInt<300>
    output io_out_1 : SInt<300>
    output io_vld_out : UInt<1>

    inst network_0_0 of Neuron @[CNN.scala 28:78]
    inst network_0_1 of Neuron @[CNN.scala 28:78]
    inst network_1_0 of Neuron @[CNN.scala 28:78]
    inst network_1_1 of Neuron @[CNN.scala 28:78]
    inst network_2_0 of Neuron @[CNN.scala 28:78]
    inst network_2_1 of Neuron @[CNN.scala 28:78]
    reg reg_0 : SInt<300>, clock with :
      reset => (UInt<1>("h0"), reg_0) @[CNN.scala 54:37]
    reg reg_1 : SInt<300>, clock with :
      reset => (UInt<1>("h0"), reg_1) @[CNN.scala 54:37]
    reg reg_vld : UInt<1>, clock with :
      reset => (UInt<1>("h0"), reg_vld) @[CNN.scala 65:24]
    io_out_0 <= reg_0 @[CNN.scala 63:10]
    io_out_1 <= reg_1 @[CNN.scala 63:10]
    io_vld_out <= reg_vld @[CNN.scala 67:14]
    network_0_0.clock <= clock
    network_0_0.reset <= reset
    network_0_0.io_in_0 <= io_in_0 @[CNN.scala 33:20]
    network_0_0.io_in_1 <= io_in_1 @[CNN.scala 33:20]
    network_0_0.io_weights_0 <= io_weights_0_0_0 @[CNN.scala 34:25]
    network_0_0.io_weights_1 <= io_weights_0_0_1 @[CNN.scala 34:25]
    network_0_1.clock <= clock
    network_0_1.reset <= reset
    network_0_1.io_in_0 <= io_in_0 @[CNN.scala 33:20]
    network_0_1.io_in_1 <= io_in_1 @[CNN.scala 33:20]
    network_0_1.io_weights_0 <= io_weights_0_1_0 @[CNN.scala 34:25]
    network_0_1.io_weights_1 <= io_weights_0_1_1 @[CNN.scala 34:25]
    network_1_0.clock <= clock
    network_1_0.reset <= reset
    network_1_0.io_in_0 <= network_0_0.io_out @[CNN.scala 45:24]
    network_1_0.io_in_1 <= network_0_1.io_out @[CNN.scala 45:24]
    network_1_0.io_weights_0 <= io_weights_1_0_0 @[CNN.scala 46:29]
    network_1_0.io_weights_1 <= io_weights_1_0_1 @[CNN.scala 46:29]
    network_1_1.clock <= clock
    network_1_1.reset <= reset
    network_1_1.io_in_0 <= network_0_0.io_out @[CNN.scala 45:24]
    network_1_1.io_in_1 <= network_0_1.io_out @[CNN.scala 45:24]
    network_1_1.io_weights_0 <= io_weights_1_1_0 @[CNN.scala 46:29]
    network_1_1.io_weights_1 <= io_weights_1_1_1 @[CNN.scala 46:29]
    network_2_0.clock <= clock
    network_2_0.reset <= reset
    network_2_0.io_in_0 <= network_1_0.io_out @[CNN.scala 45:24]
    network_2_0.io_in_1 <= network_1_1.io_out @[CNN.scala 45:24]
    network_2_0.io_weights_0 <= io_weights_2_0_0 @[CNN.scala 46:29]
    network_2_0.io_weights_1 <= io_weights_2_0_1 @[CNN.scala 46:29]
    network_2_1.clock <= clock
    network_2_1.reset <= reset
    network_2_1.io_in_0 <= network_1_0.io_out @[CNN.scala 45:24]
    network_2_1.io_in_1 <= network_1_1.io_out @[CNN.scala 45:24]
    network_2_1.io_weights_0 <= io_weights_2_1_0 @[CNN.scala 46:29]
    network_2_1.io_weights_1 <= io_weights_2_1_1 @[CNN.scala 46:29]
    reg_0 <= mux(reset, asSInt(UInt<300>("h0")), network_2_1.io_out) @[CNN.scala 54:37 CNN.scala 54:37 CNN.scala 59:14]
    reg_1 <= mux(reset, asSInt(UInt<300>("h0")), reg_1) @[CNN.scala 54:37 CNN.scala 54:37 CNN.scala 54:37]
    reg_vld <= mux(reset, UInt<1>("h0"), io_vld_in) @[CNN.scala 65:24 CNN.scala 65:24 CNN.scala 66:11]
