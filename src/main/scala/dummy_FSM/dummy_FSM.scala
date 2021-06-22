package dummy_fsm

import chisel3._
import chisel3.util._

// Stars when ready is asserted 
class Dummy_FSM(width: Int, time: UInt) extends Module {
  val io = IO(new Bundle {
    val in = Flipped(Decoupled(UInt(width.W)))
    val out = Decoupled(UInt(width.W))
  })

  val idle :: stuff :: done :: Nil = Enum(3)

  // The register
  val state = RegInit(UInt(2.W), idle)
  val newval = RegInit(UInt(width.W), 0.U)

  // Wires
  val en_counter = Reg(Bool())

  // FSM
  state := idle
  io.in.ready := false.B
  io.out.bits := newval
  io.out.valid := false.B
  en_counter := false.B

  val counter = Counter(8)
  when (en_counter) {
    counter.inc()
  }. otherwise {
    counter.reset()
  }

  switch (state) {
    // Case of IDLE
    is (idle) {
      when (io.in.valid) {
        state := stuff
        en_counter := true.B
      }
      io.in.ready := true.B
    }
    // Case of STUFF
    is (stuff) {
      when (counter.value === time) {
        state := done
        newval := io.in.bits + 1.U
      }.otherwise {
        state := stuff
        en_counter := true.B
      }
    }
    // Case of Done
    is (done) {
      when(io.out.ready) {
        state := idle
        counter.reset()
      }.otherwise{
        state := done
      }
      io.out.valid := true.B
    }
  }
}