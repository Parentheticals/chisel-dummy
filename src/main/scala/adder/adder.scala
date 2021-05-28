package adder

import chisel3._
import chisel3.util._

// class AdderInputBundle(val w: Int) extends Bundle {
//   val in1 = UInt(w.W)
//   val in2 = UInt(w.W)
// }

// class AdderOutputBundle(val w: Int) extends Bundle {
//   val out = UInt(w.W)
// }

class Adder(width: Int) extends Module {
    val io = IO(new Bundle {
        val in1 = Input(UInt(width.W))
        val in2 = Input(UInt(width.W))
        val out = Output(UInt(width.W))
    })

    io.out := io.in1 +& io.in2
}