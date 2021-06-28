package useless

import chisel3._
import chisel3.util._

class Useless(width: Int) extends Module {
  val io = IO(new Bundle {
    val a = Flipped(Decoupled(new Bundle {
      val num0 = Vec(width, UInt(1.W))
      val num1 = Vec(width, UInt(1.W))
    }))

    val b = Input(Vec(width, UInt(1.W)))
    val rdy_b = Output(UInt(1.W))

    val op = Output(Vec(2, UInt(width.W)))

    val delayed = Output(Vec(2, UInt(width.W)))
    val vld_delay = Output(UInt(1.W))
  })

  val c_num0 = io.a.bits.num0.tail.foldLeft(io.a.bits.num0.head){
    case (acc, num) => Cat(acc, num)
  }
  val c_num1 = io.a.bits.num1.tail.foldLeft(io.a.bits.num1.head){
    case (acc, num) => Cat(acc, num)
  }
  val c_b = io.b.tail.foldLeft(io.b.head){
    case (acc, num) => Cat(acc, num)
  }

  when (io.a.valid) {
    io.op(0) := c_num0 + c_b
    io.op(1) := c_num1 + c_b
    io.a.ready := 0.U
  }.otherwise{
    io.op(0) := c_b
    io.op(1) := c_b
    io.a.ready := 1.U
  }

  // Second part of the circuit

  val store1 = RegInit(UInt(width.W), 0.U)
  val store2 = RegInit(UInt(width.W), 0.U)

  val cnt = new Counter(2)

  when (cnt.value === 0.U) {
    io.rdy_b := 1.U
    io.vld_delay := 0.U
  }.otherwise{
    io.rdy_b := 0.U
    io.vld_delay := 1.U
  }

  cnt.inc()

  when(io.rdy_b === 1.U){
    store1 := c_num0
    store2 := c_b
  }

  io.delayed(0) := store1
  io.delayed(1) := store2

}
