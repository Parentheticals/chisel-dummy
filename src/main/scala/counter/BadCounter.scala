package counter

import chisel3._
import chisel3.util._

class Counter(width: Int) extends Module {
  val io = IO(new Bundle {
    val in  = Input(UInt(width.W))
    val out = Output(UInt(width.W))
  })
  
  val register = RegInit(0.U(width.W))
  register := io.in + 2.U
  io.out := register - 1.U
}