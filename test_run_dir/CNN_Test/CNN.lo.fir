circuit CNN :
  module Neuron :
    input clock : Clock
    input reset : UInt<1>
    input io_in_0 : SInt<7>
    input io_in_1 : SInt<7>
    input io_in_2 : SInt<7>
    input io_in_3 : SInt<7>
    input io_weights_0 : SInt<7>
    input io_weights_1 : SInt<7>
    input io_weights_2 : SInt<7>
    input io_weights_3 : SInt<7>
    output io_out : SInt<7>

    node _mac_T = mul(io_in_0, io_weights_0) @[CNN.scala 14:65]
    node _mac_T_1 = mul(io_in_1, io_weights_1) @[CNN.scala 14:65]
    node _mac_T_2 = mul(io_in_2, io_weights_2) @[CNN.scala 14:65]
    node _mac_T_3 = mul(io_in_3, io_weights_3) @[CNN.scala 14:65]
    node _mac_T_4 = add(_mac_T, _mac_T_1) @[CNN.scala 14:77]
    node _mac_T_5 = tail(_mac_T_4, 1) @[CNN.scala 14:77]
    node _mac_T_6 = asSInt(_mac_T_5) @[CNN.scala 14:77]
    node _mac_T_7 = add(_mac_T_6, _mac_T_2) @[CNN.scala 14:77]
    node _mac_T_8 = tail(_mac_T_7, 1) @[CNN.scala 14:77]
    node _mac_T_9 = asSInt(_mac_T_8) @[CNN.scala 14:77]
    node _mac_T_10 = add(_mac_T_9, _mac_T_3) @[CNN.scala 14:77]
    node _mac_T_11 = tail(_mac_T_10, 1) @[CNN.scala 14:77]
    node mac = asSInt(_mac_T_11) @[CNN.scala 14:77]
    node _io_out_T = leq(mac, asSInt(UInt<1>("h0"))) @[CNNSpec.scala 16:41]
    node _io_out_T_1 = mux(_io_out_T, asSInt(UInt<1>("h0")), mac) @[CNNSpec.scala 16:38]
    io_out <= asSInt(bits(_io_out_T_1, 6, 0)) @[CNN.scala 15:10]

  module CNN :
    input clock : Clock
    input reset : UInt<1>
    input io_in_0 : SInt<7>
    input io_in_1 : SInt<7>
    input io_in_2 : SInt<7>
    input io_in_3 : SInt<7>
    input io_vld_in : UInt<1>
    input io_weights_0_0_0 : SInt<7>
    input io_weights_0_0_1 : SInt<7>
    input io_weights_0_0_2 : SInt<7>
    input io_weights_0_0_3 : SInt<7>
    input io_weights_0_1_0 : SInt<7>
    input io_weights_0_1_1 : SInt<7>
    input io_weights_0_1_2 : SInt<7>
    input io_weights_0_1_3 : SInt<7>
    input io_weights_0_2_0 : SInt<7>
    input io_weights_0_2_1 : SInt<7>
    input io_weights_0_2_2 : SInt<7>
    input io_weights_0_2_3 : SInt<7>
    input io_weights_0_3_0 : SInt<7>
    input io_weights_0_3_1 : SInt<7>
    input io_weights_0_3_2 : SInt<7>
    input io_weights_0_3_3 : SInt<7>
    input io_weights_1_0_0 : SInt<7>
    input io_weights_1_0_1 : SInt<7>
    input io_weights_1_0_2 : SInt<7>
    input io_weights_1_0_3 : SInt<7>
    input io_weights_1_1_0 : SInt<7>
    input io_weights_1_1_1 : SInt<7>
    input io_weights_1_1_2 : SInt<7>
    input io_weights_1_1_3 : SInt<7>
    input io_weights_1_2_0 : SInt<7>
    input io_weights_1_2_1 : SInt<7>
    input io_weights_1_2_2 : SInt<7>
    input io_weights_1_2_3 : SInt<7>
    input io_weights_1_3_0 : SInt<7>
    input io_weights_1_3_1 : SInt<7>
    input io_weights_1_3_2 : SInt<7>
    input io_weights_1_3_3 : SInt<7>
    output io_out_0 : SInt<7>
    output io_out_1 : SInt<7>
    output io_out_2 : SInt<7>
    output io_out_3 : SInt<7>
    output io_vld_out : UInt<1>

    inst network_0_0 of Neuron @[CNN.scala 28:78]
    inst network_0_1 of Neuron @[CNN.scala 28:78]
    inst network_0_2 of Neuron @[CNN.scala 28:78]
    inst network_0_3 of Neuron @[CNN.scala 28:78]
    inst network_1_0 of Neuron @[CNN.scala 28:78]
    inst network_1_1 of Neuron @[CNN.scala 28:78]
    inst network_1_2 of Neuron @[CNN.scala 28:78]
    inst network_1_3 of Neuron @[CNN.scala 28:78]
    reg reg_0 : SInt<7>, clock with :
      reset => (UInt<1>("h0"), reg_0) @[CNN.scala 54:37]
    reg reg_1 : SInt<7>, clock with :
      reset => (UInt<1>("h0"), reg_1) @[CNN.scala 54:37]
    reg reg_2 : SInt<7>, clock with :
      reset => (UInt<1>("h0"), reg_2) @[CNN.scala 54:37]
    reg reg_3 : SInt<7>, clock with :
      reset => (UInt<1>("h0"), reg_3) @[CNN.scala 54:37]
    reg reg_vld : UInt<1>, clock with :
      reset => (UInt<1>("h0"), reg_vld) @[CNN.scala 65:24]
    node _T = bits(reset, 0, 0) @[CNN.scala 70:9]
    node _T_1 = eq(_T, UInt<1>("h0")) @[CNN.scala 70:9]
    node _T_2 = bits(reset, 0, 0) @[CNN.scala 72:11]
    node _T_3 = eq(_T_2, UInt<1>("h0")) @[CNN.scala 72:11]
    node _T_4 = bits(reset, 0, 0) @[CNN.scala 72:11]
    node _T_5 = eq(_T_4, UInt<1>("h0")) @[CNN.scala 72:11]
    node _T_6 = bits(reset, 0, 0) @[CNN.scala 72:11]
    node _T_7 = eq(_T_6, UInt<1>("h0")) @[CNN.scala 72:11]
    node _T_8 = bits(reset, 0, 0) @[CNN.scala 72:11]
    node _T_9 = eq(_T_8, UInt<1>("h0")) @[CNN.scala 72:11]
    node _T_10 = bits(reset, 0, 0) @[CNN.scala 74:9]
    node _T_11 = eq(_T_10, UInt<1>("h0")) @[CNN.scala 74:9]
    node _T_12 = bits(reset, 0, 0) @[CNN.scala 78:15]
    node _T_13 = eq(_T_12, UInt<1>("h0")) @[CNN.scala 78:15]
    node _T_14 = bits(reset, 0, 0) @[CNN.scala 78:15]
    node _T_15 = eq(_T_14, UInt<1>("h0")) @[CNN.scala 78:15]
    node _T_16 = bits(reset, 0, 0) @[CNN.scala 78:15]
    node _T_17 = eq(_T_16, UInt<1>("h0")) @[CNN.scala 78:15]
    node _T_18 = bits(reset, 0, 0) @[CNN.scala 78:15]
    node _T_19 = eq(_T_18, UInt<1>("h0")) @[CNN.scala 78:15]
    node _T_20 = bits(reset, 0, 0) @[CNN.scala 80:13]
    node _T_21 = eq(_T_20, UInt<1>("h0")) @[CNN.scala 80:13]
    node _T_22 = bits(reset, 0, 0) @[CNN.scala 78:15]
    node _T_23 = eq(_T_22, UInt<1>("h0")) @[CNN.scala 78:15]
    node _T_24 = bits(reset, 0, 0) @[CNN.scala 78:15]
    node _T_25 = eq(_T_24, UInt<1>("h0")) @[CNN.scala 78:15]
    node _T_26 = bits(reset, 0, 0) @[CNN.scala 78:15]
    node _T_27 = eq(_T_26, UInt<1>("h0")) @[CNN.scala 78:15]
    node _T_28 = bits(reset, 0, 0) @[CNN.scala 78:15]
    node _T_29 = eq(_T_28, UInt<1>("h0")) @[CNN.scala 78:15]
    node _T_30 = bits(reset, 0, 0) @[CNN.scala 80:13]
    node _T_31 = eq(_T_30, UInt<1>("h0")) @[CNN.scala 80:13]
    node _T_32 = bits(reset, 0, 0) @[CNN.scala 78:15]
    node _T_33 = eq(_T_32, UInt<1>("h0")) @[CNN.scala 78:15]
    node _T_34 = bits(reset, 0, 0) @[CNN.scala 78:15]
    node _T_35 = eq(_T_34, UInt<1>("h0")) @[CNN.scala 78:15]
    node _T_36 = bits(reset, 0, 0) @[CNN.scala 78:15]
    node _T_37 = eq(_T_36, UInt<1>("h0")) @[CNN.scala 78:15]
    node _T_38 = bits(reset, 0, 0) @[CNN.scala 78:15]
    node _T_39 = eq(_T_38, UInt<1>("h0")) @[CNN.scala 78:15]
    node _T_40 = bits(reset, 0, 0) @[CNN.scala 80:13]
    node _T_41 = eq(_T_40, UInt<1>("h0")) @[CNN.scala 80:13]
    node _T_42 = bits(reset, 0, 0) @[CNN.scala 78:15]
    node _T_43 = eq(_T_42, UInt<1>("h0")) @[CNN.scala 78:15]
    node _T_44 = bits(reset, 0, 0) @[CNN.scala 78:15]
    node _T_45 = eq(_T_44, UInt<1>("h0")) @[CNN.scala 78:15]
    node _T_46 = bits(reset, 0, 0) @[CNN.scala 78:15]
    node _T_47 = eq(_T_46, UInt<1>("h0")) @[CNN.scala 78:15]
    node _T_48 = bits(reset, 0, 0) @[CNN.scala 78:15]
    node _T_49 = eq(_T_48, UInt<1>("h0")) @[CNN.scala 78:15]
    node _T_50 = bits(reset, 0, 0) @[CNN.scala 80:13]
    node _T_51 = eq(_T_50, UInt<1>("h0")) @[CNN.scala 80:13]
    node _T_52 = bits(reset, 0, 0) @[CNN.scala 82:11]
    node _T_53 = eq(_T_52, UInt<1>("h0")) @[CNN.scala 82:11]
    node _T_54 = bits(reset, 0, 0) @[CNN.scala 78:15]
    node _T_55 = eq(_T_54, UInt<1>("h0")) @[CNN.scala 78:15]
    node _T_56 = bits(reset, 0, 0) @[CNN.scala 78:15]
    node _T_57 = eq(_T_56, UInt<1>("h0")) @[CNN.scala 78:15]
    node _T_58 = bits(reset, 0, 0) @[CNN.scala 78:15]
    node _T_59 = eq(_T_58, UInt<1>("h0")) @[CNN.scala 78:15]
    node _T_60 = bits(reset, 0, 0) @[CNN.scala 78:15]
    node _T_61 = eq(_T_60, UInt<1>("h0")) @[CNN.scala 78:15]
    node _T_62 = bits(reset, 0, 0) @[CNN.scala 80:13]
    node _T_63 = eq(_T_62, UInt<1>("h0")) @[CNN.scala 80:13]
    node _T_64 = bits(reset, 0, 0) @[CNN.scala 78:15]
    node _T_65 = eq(_T_64, UInt<1>("h0")) @[CNN.scala 78:15]
    node _T_66 = bits(reset, 0, 0) @[CNN.scala 78:15]
    node _T_67 = eq(_T_66, UInt<1>("h0")) @[CNN.scala 78:15]
    node _T_68 = bits(reset, 0, 0) @[CNN.scala 78:15]
    node _T_69 = eq(_T_68, UInt<1>("h0")) @[CNN.scala 78:15]
    node _T_70 = bits(reset, 0, 0) @[CNN.scala 78:15]
    node _T_71 = eq(_T_70, UInt<1>("h0")) @[CNN.scala 78:15]
    node _T_72 = bits(reset, 0, 0) @[CNN.scala 80:13]
    node _T_73 = eq(_T_72, UInt<1>("h0")) @[CNN.scala 80:13]
    node _T_74 = bits(reset, 0, 0) @[CNN.scala 78:15]
    node _T_75 = eq(_T_74, UInt<1>("h0")) @[CNN.scala 78:15]
    node _T_76 = bits(reset, 0, 0) @[CNN.scala 78:15]
    node _T_77 = eq(_T_76, UInt<1>("h0")) @[CNN.scala 78:15]
    node _T_78 = bits(reset, 0, 0) @[CNN.scala 78:15]
    node _T_79 = eq(_T_78, UInt<1>("h0")) @[CNN.scala 78:15]
    node _T_80 = bits(reset, 0, 0) @[CNN.scala 78:15]
    node _T_81 = eq(_T_80, UInt<1>("h0")) @[CNN.scala 78:15]
    node _T_82 = bits(reset, 0, 0) @[CNN.scala 80:13]
    node _T_83 = eq(_T_82, UInt<1>("h0")) @[CNN.scala 80:13]
    node _T_84 = bits(reset, 0, 0) @[CNN.scala 78:15]
    node _T_85 = eq(_T_84, UInt<1>("h0")) @[CNN.scala 78:15]
    node _T_86 = bits(reset, 0, 0) @[CNN.scala 78:15]
    node _T_87 = eq(_T_86, UInt<1>("h0")) @[CNN.scala 78:15]
    node _T_88 = bits(reset, 0, 0) @[CNN.scala 78:15]
    node _T_89 = eq(_T_88, UInt<1>("h0")) @[CNN.scala 78:15]
    node _T_90 = bits(reset, 0, 0) @[CNN.scala 78:15]
    node _T_91 = eq(_T_90, UInt<1>("h0")) @[CNN.scala 78:15]
    node _T_92 = bits(reset, 0, 0) @[CNN.scala 80:13]
    node _T_93 = eq(_T_92, UInt<1>("h0")) @[CNN.scala 80:13]
    node _T_94 = bits(reset, 0, 0) @[CNN.scala 82:11]
    node _T_95 = eq(_T_94, UInt<1>("h0")) @[CNN.scala 82:11]
    node _T_96 = bits(reset, 0, 0) @[CNN.scala 84:9]
    node _T_97 = eq(_T_96, UInt<1>("h0")) @[CNN.scala 84:9]
    node _T_98 = bits(reset, 0, 0) @[CNN.scala 87:13]
    node _T_99 = eq(_T_98, UInt<1>("h0")) @[CNN.scala 87:13]
    node _T_100 = bits(reset, 0, 0) @[CNN.scala 87:13]
    node _T_101 = eq(_T_100, UInt<1>("h0")) @[CNN.scala 87:13]
    node _T_102 = bits(reset, 0, 0) @[CNN.scala 87:13]
    node _T_103 = eq(_T_102, UInt<1>("h0")) @[CNN.scala 87:13]
    node _T_104 = bits(reset, 0, 0) @[CNN.scala 87:13]
    node _T_105 = eq(_T_104, UInt<1>("h0")) @[CNN.scala 87:13]
    node _T_106 = bits(reset, 0, 0) @[CNN.scala 89:11]
    node _T_107 = eq(_T_106, UInt<1>("h0")) @[CNN.scala 89:11]
    node _T_108 = bits(reset, 0, 0) @[CNN.scala 87:13]
    node _T_109 = eq(_T_108, UInt<1>("h0")) @[CNN.scala 87:13]
    node _T_110 = bits(reset, 0, 0) @[CNN.scala 87:13]
    node _T_111 = eq(_T_110, UInt<1>("h0")) @[CNN.scala 87:13]
    node _T_112 = bits(reset, 0, 0) @[CNN.scala 87:13]
    node _T_113 = eq(_T_112, UInt<1>("h0")) @[CNN.scala 87:13]
    node _T_114 = bits(reset, 0, 0) @[CNN.scala 87:13]
    node _T_115 = eq(_T_114, UInt<1>("h0")) @[CNN.scala 87:13]
    node _T_116 = bits(reset, 0, 0) @[CNN.scala 89:11]
    node _T_117 = eq(_T_116, UInt<1>("h0")) @[CNN.scala 89:11]
    node _T_118 = bits(reset, 0, 0) @[CNN.scala 91:9]
    node _T_119 = eq(_T_118, UInt<1>("h0")) @[CNN.scala 91:9]
    io_out_0 <= reg_0 @[CNN.scala 63:10]
    io_out_1 <= reg_1 @[CNN.scala 63:10]
    io_out_2 <= reg_2 @[CNN.scala 63:10]
    io_out_3 <= reg_3 @[CNN.scala 63:10]
    io_vld_out <= reg_vld @[CNN.scala 67:14]
    network_0_0.clock <= clock
    network_0_0.reset <= reset
    network_0_0.io_in_0 <= io_in_0 @[CNN.scala 33:20]
    network_0_0.io_in_1 <= io_in_1 @[CNN.scala 33:20]
    network_0_0.io_in_2 <= io_in_2 @[CNN.scala 33:20]
    network_0_0.io_in_3 <= io_in_3 @[CNN.scala 33:20]
    network_0_0.io_weights_0 <= io_weights_0_0_0 @[CNN.scala 34:25]
    network_0_0.io_weights_1 <= io_weights_0_0_1 @[CNN.scala 34:25]
    network_0_0.io_weights_2 <= io_weights_0_0_2 @[CNN.scala 34:25]
    network_0_0.io_weights_3 <= io_weights_0_0_3 @[CNN.scala 34:25]
    network_0_1.clock <= clock
    network_0_1.reset <= reset
    network_0_1.io_in_0 <= io_in_0 @[CNN.scala 33:20]
    network_0_1.io_in_1 <= io_in_1 @[CNN.scala 33:20]
    network_0_1.io_in_2 <= io_in_2 @[CNN.scala 33:20]
    network_0_1.io_in_3 <= io_in_3 @[CNN.scala 33:20]
    network_0_1.io_weights_0 <= io_weights_0_1_0 @[CNN.scala 34:25]
    network_0_1.io_weights_1 <= io_weights_0_1_1 @[CNN.scala 34:25]
    network_0_1.io_weights_2 <= io_weights_0_1_2 @[CNN.scala 34:25]
    network_0_1.io_weights_3 <= io_weights_0_1_3 @[CNN.scala 34:25]
    network_0_2.clock <= clock
    network_0_2.reset <= reset
    network_0_2.io_in_0 <= io_in_0 @[CNN.scala 33:20]
    network_0_2.io_in_1 <= io_in_1 @[CNN.scala 33:20]
    network_0_2.io_in_2 <= io_in_2 @[CNN.scala 33:20]
    network_0_2.io_in_3 <= io_in_3 @[CNN.scala 33:20]
    network_0_2.io_weights_0 <= io_weights_0_2_0 @[CNN.scala 34:25]
    network_0_2.io_weights_1 <= io_weights_0_2_1 @[CNN.scala 34:25]
    network_0_2.io_weights_2 <= io_weights_0_2_2 @[CNN.scala 34:25]
    network_0_2.io_weights_3 <= io_weights_0_2_3 @[CNN.scala 34:25]
    network_0_3.clock <= clock
    network_0_3.reset <= reset
    network_0_3.io_in_0 <= io_in_0 @[CNN.scala 33:20]
    network_0_3.io_in_1 <= io_in_1 @[CNN.scala 33:20]
    network_0_3.io_in_2 <= io_in_2 @[CNN.scala 33:20]
    network_0_3.io_in_3 <= io_in_3 @[CNN.scala 33:20]
    network_0_3.io_weights_0 <= io_weights_0_3_0 @[CNN.scala 34:25]
    network_0_3.io_weights_1 <= io_weights_0_3_1 @[CNN.scala 34:25]
    network_0_3.io_weights_2 <= io_weights_0_3_2 @[CNN.scala 34:25]
    network_0_3.io_weights_3 <= io_weights_0_3_3 @[CNN.scala 34:25]
    network_1_0.clock <= clock
    network_1_0.reset <= reset
    network_1_0.io_in_0 <= network_0_0.io_out @[CNN.scala 45:24]
    network_1_0.io_in_1 <= network_0_1.io_out @[CNN.scala 45:24]
    network_1_0.io_in_2 <= network_0_2.io_out @[CNN.scala 45:24]
    network_1_0.io_in_3 <= network_0_3.io_out @[CNN.scala 45:24]
    network_1_0.io_weights_0 <= io_weights_1_0_0 @[CNN.scala 46:29]
    network_1_0.io_weights_1 <= io_weights_1_0_1 @[CNN.scala 46:29]
    network_1_0.io_weights_2 <= io_weights_1_0_2 @[CNN.scala 46:29]
    network_1_0.io_weights_3 <= io_weights_1_0_3 @[CNN.scala 46:29]
    network_1_1.clock <= clock
    network_1_1.reset <= reset
    network_1_1.io_in_0 <= network_0_0.io_out @[CNN.scala 45:24]
    network_1_1.io_in_1 <= network_0_1.io_out @[CNN.scala 45:24]
    network_1_1.io_in_2 <= network_0_2.io_out @[CNN.scala 45:24]
    network_1_1.io_in_3 <= network_0_3.io_out @[CNN.scala 45:24]
    network_1_1.io_weights_0 <= io_weights_1_1_0 @[CNN.scala 46:29]
    network_1_1.io_weights_1 <= io_weights_1_1_1 @[CNN.scala 46:29]
    network_1_1.io_weights_2 <= io_weights_1_1_2 @[CNN.scala 46:29]
    network_1_1.io_weights_3 <= io_weights_1_1_3 @[CNN.scala 46:29]
    network_1_2.clock <= clock
    network_1_2.reset <= reset
    network_1_2.io_in_0 <= network_0_0.io_out @[CNN.scala 45:24]
    network_1_2.io_in_1 <= network_0_1.io_out @[CNN.scala 45:24]
    network_1_2.io_in_2 <= network_0_2.io_out @[CNN.scala 45:24]
    network_1_2.io_in_3 <= network_0_3.io_out @[CNN.scala 45:24]
    network_1_2.io_weights_0 <= io_weights_1_2_0 @[CNN.scala 46:29]
    network_1_2.io_weights_1 <= io_weights_1_2_1 @[CNN.scala 46:29]
    network_1_2.io_weights_2 <= io_weights_1_2_2 @[CNN.scala 46:29]
    network_1_2.io_weights_3 <= io_weights_1_2_3 @[CNN.scala 46:29]
    network_1_3.clock <= clock
    network_1_3.reset <= reset
    network_1_3.io_in_0 <= network_0_0.io_out @[CNN.scala 45:24]
    network_1_3.io_in_1 <= network_0_1.io_out @[CNN.scala 45:24]
    network_1_3.io_in_2 <= network_0_2.io_out @[CNN.scala 45:24]
    network_1_3.io_in_3 <= network_0_3.io_out @[CNN.scala 45:24]
    network_1_3.io_weights_0 <= io_weights_1_3_0 @[CNN.scala 46:29]
    network_1_3.io_weights_1 <= io_weights_1_3_1 @[CNN.scala 46:29]
    network_1_3.io_weights_2 <= io_weights_1_3_2 @[CNN.scala 46:29]
    network_1_3.io_weights_3 <= io_weights_1_3_3 @[CNN.scala 46:29]
    reg_0 <= mux(reset, asSInt(UInt<7>("h0")), network_1_3.io_out) @[CNN.scala 54:37 CNN.scala 54:37 CNN.scala 59:14]
    reg_1 <= mux(reset, asSInt(UInt<7>("h0")), reg_1) @[CNN.scala 54:37 CNN.scala 54:37 CNN.scala 54:37]
    reg_2 <= mux(reset, asSInt(UInt<7>("h0")), reg_2) @[CNN.scala 54:37 CNN.scala 54:37 CNN.scala 54:37]
    reg_3 <= mux(reset, asSInt(UInt<7>("h0")), reg_3) @[CNN.scala 54:37 CNN.scala 54:37 CNN.scala 54:37]
    reg_vld <= mux(reset, UInt<1>("h0"), io_vld_in) @[CNN.scala 65:24 CNN.scala 65:24 CNN.scala 66:11]
    printf(clock, and(and(UInt<1>("h1"), _T_1), UInt<1>("h1")), "Input Values\n") @[CNN.scala 70:9]
    printf(clock, and(and(UInt<1>("h1"), _T_3), UInt<1>("h1")), "%d ", io_in_0) @[CNN.scala 72:11]
    printf(clock, and(and(UInt<1>("h1"), _T_5), UInt<1>("h1")), "%d ", io_in_1) @[CNN.scala 72:11]
    printf(clock, and(and(UInt<1>("h1"), _T_7), UInt<1>("h1")), "%d ", io_in_2) @[CNN.scala 72:11]
    printf(clock, and(and(UInt<1>("h1"), _T_9), UInt<1>("h1")), "%d ", io_in_3) @[CNN.scala 72:11]
    printf(clock, and(and(UInt<1>("h1"), _T_11), UInt<1>("h1")), "\nWeights\n") @[CNN.scala 74:9]
    printf(clock, and(and(UInt<1>("h1"), _T_13), UInt<1>("h1")), "%d ", io_weights_0_0_0) @[CNN.scala 78:15]
    printf(clock, and(and(UInt<1>("h1"), _T_15), UInt<1>("h1")), "%d ", io_weights_0_0_1) @[CNN.scala 78:15]
    printf(clock, and(and(UInt<1>("h1"), _T_17), UInt<1>("h1")), "%d ", io_weights_0_0_2) @[CNN.scala 78:15]
    printf(clock, and(and(UInt<1>("h1"), _T_19), UInt<1>("h1")), "%d ", io_weights_0_0_3) @[CNN.scala 78:15]
    printf(clock, and(and(UInt<1>("h1"), _T_21), UInt<1>("h1")), "| ") @[CNN.scala 80:13]
    printf(clock, and(and(UInt<1>("h1"), _T_23), UInt<1>("h1")), "%d ", io_weights_0_1_0) @[CNN.scala 78:15]
    printf(clock, and(and(UInt<1>("h1"), _T_25), UInt<1>("h1")), "%d ", io_weights_0_1_1) @[CNN.scala 78:15]
    printf(clock, and(and(UInt<1>("h1"), _T_27), UInt<1>("h1")), "%d ", io_weights_0_1_2) @[CNN.scala 78:15]
    printf(clock, and(and(UInt<1>("h1"), _T_29), UInt<1>("h1")), "%d ", io_weights_0_1_3) @[CNN.scala 78:15]
    printf(clock, and(and(UInt<1>("h1"), _T_31), UInt<1>("h1")), "| ") @[CNN.scala 80:13]
    printf(clock, and(and(UInt<1>("h1"), _T_33), UInt<1>("h1")), "%d ", io_weights_0_2_0) @[CNN.scala 78:15]
    printf(clock, and(and(UInt<1>("h1"), _T_35), UInt<1>("h1")), "%d ", io_weights_0_2_1) @[CNN.scala 78:15]
    printf(clock, and(and(UInt<1>("h1"), _T_37), UInt<1>("h1")), "%d ", io_weights_0_2_2) @[CNN.scala 78:15]
    printf(clock, and(and(UInt<1>("h1"), _T_39), UInt<1>("h1")), "%d ", io_weights_0_2_3) @[CNN.scala 78:15]
    printf(clock, and(and(UInt<1>("h1"), _T_41), UInt<1>("h1")), "| ") @[CNN.scala 80:13]
    printf(clock, and(and(UInt<1>("h1"), _T_43), UInt<1>("h1")), "%d ", io_weights_0_3_0) @[CNN.scala 78:15]
    printf(clock, and(and(UInt<1>("h1"), _T_45), UInt<1>("h1")), "%d ", io_weights_0_3_1) @[CNN.scala 78:15]
    printf(clock, and(and(UInt<1>("h1"), _T_47), UInt<1>("h1")), "%d ", io_weights_0_3_2) @[CNN.scala 78:15]
    printf(clock, and(and(UInt<1>("h1"), _T_49), UInt<1>("h1")), "%d ", io_weights_0_3_3) @[CNN.scala 78:15]
    printf(clock, and(and(UInt<1>("h1"), _T_51), UInt<1>("h1")), "| ") @[CNN.scala 80:13]
    printf(clock, and(and(UInt<1>("h1"), _T_53), UInt<1>("h1")), "\n") @[CNN.scala 82:11]
    printf(clock, and(and(UInt<1>("h1"), _T_55), UInt<1>("h1")), "%d ", io_weights_1_0_0) @[CNN.scala 78:15]
    printf(clock, and(and(UInt<1>("h1"), _T_57), UInt<1>("h1")), "%d ", io_weights_1_0_1) @[CNN.scala 78:15]
    printf(clock, and(and(UInt<1>("h1"), _T_59), UInt<1>("h1")), "%d ", io_weights_1_0_2) @[CNN.scala 78:15]
    printf(clock, and(and(UInt<1>("h1"), _T_61), UInt<1>("h1")), "%d ", io_weights_1_0_3) @[CNN.scala 78:15]
    printf(clock, and(and(UInt<1>("h1"), _T_63), UInt<1>("h1")), "| ") @[CNN.scala 80:13]
    printf(clock, and(and(UInt<1>("h1"), _T_65), UInt<1>("h1")), "%d ", io_weights_1_1_0) @[CNN.scala 78:15]
    printf(clock, and(and(UInt<1>("h1"), _T_67), UInt<1>("h1")), "%d ", io_weights_1_1_1) @[CNN.scala 78:15]
    printf(clock, and(and(UInt<1>("h1"), _T_69), UInt<1>("h1")), "%d ", io_weights_1_1_2) @[CNN.scala 78:15]
    printf(clock, and(and(UInt<1>("h1"), _T_71), UInt<1>("h1")), "%d ", io_weights_1_1_3) @[CNN.scala 78:15]
    printf(clock, and(and(UInt<1>("h1"), _T_73), UInt<1>("h1")), "| ") @[CNN.scala 80:13]
    printf(clock, and(and(UInt<1>("h1"), _T_75), UInt<1>("h1")), "%d ", io_weights_1_2_0) @[CNN.scala 78:15]
    printf(clock, and(and(UInt<1>("h1"), _T_77), UInt<1>("h1")), "%d ", io_weights_1_2_1) @[CNN.scala 78:15]
    printf(clock, and(and(UInt<1>("h1"), _T_79), UInt<1>("h1")), "%d ", io_weights_1_2_2) @[CNN.scala 78:15]
    printf(clock, and(and(UInt<1>("h1"), _T_81), UInt<1>("h1")), "%d ", io_weights_1_2_3) @[CNN.scala 78:15]
    printf(clock, and(and(UInt<1>("h1"), _T_83), UInt<1>("h1")), "| ") @[CNN.scala 80:13]
    printf(clock, and(and(UInt<1>("h1"), _T_85), UInt<1>("h1")), "%d ", io_weights_1_3_0) @[CNN.scala 78:15]
    printf(clock, and(and(UInt<1>("h1"), _T_87), UInt<1>("h1")), "%d ", io_weights_1_3_1) @[CNN.scala 78:15]
    printf(clock, and(and(UInt<1>("h1"), _T_89), UInt<1>("h1")), "%d ", io_weights_1_3_2) @[CNN.scala 78:15]
    printf(clock, and(and(UInt<1>("h1"), _T_91), UInt<1>("h1")), "%d ", io_weights_1_3_3) @[CNN.scala 78:15]
    printf(clock, and(and(UInt<1>("h1"), _T_93), UInt<1>("h1")), "| ") @[CNN.scala 80:13]
    printf(clock, and(and(UInt<1>("h1"), _T_95), UInt<1>("h1")), "\n") @[CNN.scala 82:11]
    printf(clock, and(and(UInt<1>("h1"), _T_97), UInt<1>("h1")), "Output Values\n") @[CNN.scala 84:9]
    printf(clock, and(and(UInt<1>("h1"), _T_99), UInt<1>("h1")), "%d ", network_0_0.io_out) @[CNN.scala 87:13]
    printf(clock, and(and(UInt<1>("h1"), _T_101), UInt<1>("h1")), "%d ", network_0_1.io_out) @[CNN.scala 87:13]
    printf(clock, and(and(UInt<1>("h1"), _T_103), UInt<1>("h1")), "%d ", network_0_2.io_out) @[CNN.scala 87:13]
    printf(clock, and(and(UInt<1>("h1"), _T_105), UInt<1>("h1")), "%d ", network_0_3.io_out) @[CNN.scala 87:13]
    printf(clock, and(and(UInt<1>("h1"), _T_107), UInt<1>("h1")), "\n") @[CNN.scala 89:11]
    printf(clock, and(and(UInt<1>("h1"), _T_109), UInt<1>("h1")), "%d ", network_1_0.io_out) @[CNN.scala 87:13]
    printf(clock, and(and(UInt<1>("h1"), _T_111), UInt<1>("h1")), "%d ", network_1_1.io_out) @[CNN.scala 87:13]
    printf(clock, and(and(UInt<1>("h1"), _T_113), UInt<1>("h1")), "%d ", network_1_2.io_out) @[CNN.scala 87:13]
    printf(clock, and(and(UInt<1>("h1"), _T_115), UInt<1>("h1")), "%d ", network_1_3.io_out) @[CNN.scala 87:13]
    printf(clock, and(and(UInt<1>("h1"), _T_117), UInt<1>("h1")), "\n") @[CNN.scala 89:11]
    printf(clock, and(and(UInt<1>("h1"), _T_119), UInt<1>("h1")), "\n") @[CNN.scala 91:9]
