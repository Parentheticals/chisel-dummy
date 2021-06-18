package firFilter

import chisel3._
import chisel3.util._

class FIRFilter(length: Int, width: Int) extends Module {
  val io = IO(new Bundle {
    val in = Input(UInt(width.W))
    val valid = Input(Bool())
    val out = Output(UInt(width.W))
    val consts = Input(Vec(length, UInt(width.W)))
  })
  
  // Such concision! You'll learn what all this means later.
  val taps = Seq(io.in) ++ Seq.fill(io.consts.length - 1)(RegInit(0.U(width.W)))
  taps.zip(taps.tail).foreach { case (a, b) => when (io.valid) { b := a } }

  io.out := taps.zip(io.consts).map { case (a, b) => a * b }.reduce(_ + _)
}