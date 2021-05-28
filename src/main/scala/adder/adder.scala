package adder

import chisel3._
import chisel3.util._

class AdderInputBundle(val w: Int) extends Bundle {
  val in1 = UInt(w.W)
  val in2 = UInt(w.W)
}

class AdderOutputBundle(val w: Int) extends Bundle {
  val out = UInt(w.W)
}

class Adder(width: Int) extends Module {
    val io = IO(new Bundle {
        val input = IO(new AdderInputBundle(width))
        val output = IO(new AdderOutputBundle(width))
    })

    io.output := io.input.in1 +& io.input.ine
}