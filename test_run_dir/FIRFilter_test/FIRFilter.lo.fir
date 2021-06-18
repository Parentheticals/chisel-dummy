circuit FIRFilter :
  module FIRFilter :
    input clock : Clock
    input reset : UInt<1>
    input io_in : UInt<10>
    input io_valid : UInt<1>
    output io_out : UInt<10>
    input io_consts_0 : UInt<10>
    input io_consts_1 : UInt<10>
    input io_consts_2 : UInt<10>
    input io_consts_3 : UInt<10>
    input io_consts_4 : UInt<10>
    input io_consts_5 : UInt<10>
    input io_consts_6 : UInt<10>

    reg taps_1 : UInt<10>, clock with :
      reset => (UInt<1>("h0"), taps_1) @[FIRFilter.scala 15:66]
    reg taps_2 : UInt<10>, clock with :
      reset => (UInt<1>("h0"), taps_2) @[FIRFilter.scala 15:66]
    reg taps_3 : UInt<10>, clock with :
      reset => (UInt<1>("h0"), taps_3) @[FIRFilter.scala 15:66]
    reg taps_4 : UInt<10>, clock with :
      reset => (UInt<1>("h0"), taps_4) @[FIRFilter.scala 15:66]
    reg taps_5 : UInt<10>, clock with :
      reset => (UInt<1>("h0"), taps_5) @[FIRFilter.scala 15:66]
    reg taps_6 : UInt<10>, clock with :
      reset => (UInt<1>("h0"), taps_6) @[FIRFilter.scala 15:66]
    node _GEN_0 = mux(io_valid, io_in, taps_1) @[FIRFilter.scala 16:64 FIRFilter.scala 16:68 FIRFilter.scala 15:66]
    node _GEN_1 = mux(io_valid, taps_1, taps_2) @[FIRFilter.scala 16:64 FIRFilter.scala 16:68 FIRFilter.scala 15:66]
    node _GEN_2 = mux(io_valid, taps_2, taps_3) @[FIRFilter.scala 16:64 FIRFilter.scala 16:68 FIRFilter.scala 15:66]
    node _GEN_3 = mux(io_valid, taps_3, taps_4) @[FIRFilter.scala 16:64 FIRFilter.scala 16:68 FIRFilter.scala 15:66]
    node _GEN_4 = mux(io_valid, taps_4, taps_5) @[FIRFilter.scala 16:64 FIRFilter.scala 16:68 FIRFilter.scala 15:66]
    node _GEN_5 = mux(io_valid, taps_5, taps_6) @[FIRFilter.scala 16:64 FIRFilter.scala 16:68 FIRFilter.scala 15:66]
    node _io_out_T = mul(io_in, io_consts_0) @[FIRFilter.scala 18:56]
    node _io_out_T_1 = mul(taps_1, io_consts_1) @[FIRFilter.scala 18:56]
    node _io_out_T_2 = mul(taps_2, io_consts_2) @[FIRFilter.scala 18:56]
    node _io_out_T_3 = mul(taps_3, io_consts_3) @[FIRFilter.scala 18:56]
    node _io_out_T_4 = mul(taps_4, io_consts_4) @[FIRFilter.scala 18:56]
    node _io_out_T_5 = mul(taps_5, io_consts_5) @[FIRFilter.scala 18:56]
    node _io_out_T_6 = mul(taps_6, io_consts_6) @[FIRFilter.scala 18:56]
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
    io_out <= bits(_io_out_T_18, 9, 0) @[FIRFilter.scala 18:10]
    taps_1 <= mux(reset, UInt<10>("h0"), _GEN_0) @[FIRFilter.scala 15:66 FIRFilter.scala 15:66]
    taps_2 <= mux(reset, UInt<10>("h0"), _GEN_1) @[FIRFilter.scala 15:66 FIRFilter.scala 15:66]
    taps_3 <= mux(reset, UInt<10>("h0"), _GEN_2) @[FIRFilter.scala 15:66 FIRFilter.scala 15:66]
    taps_4 <= mux(reset, UInt<10>("h0"), _GEN_3) @[FIRFilter.scala 15:66 FIRFilter.scala 15:66]
    taps_5 <= mux(reset, UInt<10>("h0"), _GEN_4) @[FIRFilter.scala 15:66 FIRFilter.scala 15:66]
    taps_6 <= mux(reset, UInt<10>("h0"), _GEN_5) @[FIRFilter.scala 15:66 FIRFilter.scala 15:66]
