circuit Adder :
  module Adder :
    input clock : Clock
    input reset : UInt<1>
    input io_in1 : UInt<16>
    input io_in2 : UInt<16>
    output io_out : UInt<16>

    node _io_out_T = add(io_in1, io_in2) @[adder.scala 22:22]
    io_out <= bits(_io_out_T, 15, 0) @[adder.scala 22:12]
