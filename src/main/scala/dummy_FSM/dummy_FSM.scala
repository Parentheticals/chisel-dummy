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

  // Wires
  val en_counter = Wire(Bool())

  // FSM
  state := idle
  io.in.ready := false.B
  io.out.valid := false.B
  io.out.bits := 0.U
  en_counter := false.B

  switch (state) {
    // Case of IDLE
    is (idle) {
      when (io.in.valid && io.out.ready) {
        state := stuff
      }.otherwise {
        io.in.ready := true.B
      }
    }
    // Case of STUFF
    is (stuff) {
      when (counter.value === time) {
        state := done
      }.otherwise {
        en_counter := true.B
      }
    }
    // Case of Done
    is (done) {
      state := idle
      io.out.bits := io.in.bits + 1.U
      io.out.valid := true.B
      counter.reset()
    }
  }
  
  val counter = Counter(3)
  when (en_counter) {
    counter.inc()
  }. otherwise {
    counter.reset()
  }
}