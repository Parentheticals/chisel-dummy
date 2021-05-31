package counter

import chisel3._
import chisel3.util._

class BadCounter(width: Int) extends Module {
  val io = IO(new Bundle {
    val out = Output(UInt(width.W))
  })
  
  val reg1 = Reg(UInt(width.W))
  val reg2 = RegInit(0.U(width.W))
  reg1 := 1.U
  reg2 := reg2 + reg1
  io.out := reg2
}