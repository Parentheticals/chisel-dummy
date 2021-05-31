package counter

import chisel3._
import chisel3.util._

class Counter(width: Int) extends Module {
  val io = IO(new Bundle {
    val out = Output(UInt(width.W))
  })
  
  val register = RegInit(0.U(width.W))
  register := register + 1.U
  io.out := register
}