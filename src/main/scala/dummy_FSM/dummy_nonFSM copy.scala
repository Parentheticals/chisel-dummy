package dummy_fsm

import chisel3._
import chisel3.util._

// Stars when ready is asserted 
class Dummy_nonFSM(width: Int, time: UInt) extends Module {
  val io = IO(new Bundle {
    val in = Flipped(Decoupled(UInt(width.W)))
    val out = Decoupled(UInt(width.W))
  })

  io.in.ready := !(io.in.valid && io.out.ready)

  val counter = Counter(8)
  when(!io.in.ready) {
    counter.inc()
  }

  when(counter.value === time) {
    counter.reset()
    io.out.bits := io.in.bits + 1.U
    io.out.valid := true.B
  }.otherwise {
    io.out.bits := 0.U
    io.out.valid := false.B
  }
}