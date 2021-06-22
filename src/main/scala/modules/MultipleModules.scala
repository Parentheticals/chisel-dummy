package modules

import chisel3._
import chisel3.util._

class MultipleModules(width: Int, pipes: Int) extends Module {
  val io = IO(new Bundle {
    val in1 = Flipped(Decoupled(UInt(width.W)))
    val in2 = Flipped(Decoupled(UInt(width.W)))
    val out1 = Decoupled(UInt(width.W))
    val out2 = Decoupled(UInt(width.W))
  })

  val pipeline = for (i <- 0 until pipes) yield {
    Module(new Ope(width))
  }

  when(io.in1.valid) {
    pipeline.head.io.a := io.in1.bits
  }.otherwise{
    pipeline.head.io.a := 0.U
  }

  when(io.in2.valid) {
    pipeline.head.io.b := io.in2.bits
  }.otherwise{
    pipeline.head.io.b := 0.U
  }

  pipeline.zip(pipeline.tail).foreach{ case (x, y) => {
      when(io.in1.valid) {
        y.io.a := x.io.out_a
      }.otherwise{
        y.io.a := 0.U
      }
      when(io.in2.valid) {
        y.io.b := x.io.out_b
      }.otherwise{
        y.io.b := 0.U
      }
    }
  }

//  printf("start\n")
//  for (pipe <- pipeline) {
//    printf("Ope out_a: %d   Ope out_b: %d\n", pipe.io.out_a, pipe.io.out_b)
//  }

  io.in1.ready := true.B
  io.in2.ready := true.B

  io.out1.bits := pipeline(pipes-1).io.out_a
  io.out2.bits := pipeline(pipes-1).io.out_b

  io.out1.valid := pipeline(pipes-1).io.out_a =/= 0.U
  io.out2.valid := pipeline(pipes-1).io.out_b =/= 0.U
}

class Ope(width: Int) extends Module {
  val io = IO(new Bundle {
    val a = Input(UInt(width.W))
    val b = Input(UInt(width.W))
    val out_a = Output(UInt(width.W))
    val out_b = Output(UInt(width.W))
  })

  val op1 = Module(new Ope1(width))
  val op2 = Module(new Ope2(width))

  op1.io.a := io.a
  op2.io.a := io.b

  io.out_a := op1.io.out
  io.out_b := op2.io.out
}

class Ope1(width: Int) extends Module {
  val io = IO(new Bundle {
    val a = Input(UInt(width.W))
    val out = Output(UInt(width.W))
  })

  val reg_a = RegInit(0.U(width.W))

  reg_a := io.a

  io.out := reg_a
}

class Ope2(width: Int) extends Module {
  val io = IO(new Bundle {
    val a = Input(UInt(width.W))
    val out = Output(UInt(width.W))
  })

  val reg_a = RegInit(0.U(width.W))
  val reg_b = RegInit(0.U(width.W))

  reg_a := io.a
  reg_b := reg_a

  when(reg_b % 2.U === 0.U) {
    io.out := reg_b
  }.otherwise{
    io.out := reg_a
  }
}