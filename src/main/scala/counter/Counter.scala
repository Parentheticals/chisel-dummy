package counter

import chisel3._
import chisel3.util._

class Counter(width: Int) extends Module {
  val io = IO(new Bundle {
    val in  = Input(UInt(width.W))
    val out = Output(UInt(width.W))
  })
  
  io.out := RegNext(io.in + 1.U)
}