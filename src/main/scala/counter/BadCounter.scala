package counter

import chisel3._
import chisel3.util._

class BadCounter(width: Int) extends Module {
  val io = IO(new Bundle {
    val out = Output(UInt(width.W))
  })
  
  val reg1 = RegInit(1.U(width.W))
  val reg2 = RegInit(0.U(width.W))
  reg1 := reg1 + 0.U
  reg2 := reg2 + reg1
  io.out := reg2
}