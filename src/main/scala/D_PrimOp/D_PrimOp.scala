package D_PrimOp

import chisel3._
import chisel3.util._
import chisel3.experimental._

class D_PrimOp_0(width: Int, f: SInt => SInt) extends Module{
  val io = IO(new Bundle {
    val a = Flipped(Decoupled(SInt(width.W)))
    val out = Decoupled(SInt(width.W))
  })

  val EB = Module(new EB_one(width))

  EB.io.in.bits := f(io.a.bits)
  EB.io.in.valid := io.a.valid
  io.a.ready := EB.io.in.ready

  io.out.bits := EB.io.out.bits
  io.out.valid := EB.io.out.valid
  EB.io.out.ready := io.out.ready
}

class D_PrimOp2_0(width: Int, f: SInt => SInt) extends Module{
  val io = IO(new Bundle {
    val a = Flipped(Decoupled(SInt(width.W)))
    val out = Decoupled(SInt(width.W))
  })

  val EB = Module(new EB_two(width))

  EB.io.in.bits := f(io.a.bits)
  EB.io.in.valid := io.a.valid
  io.a.ready := EB.io.in.ready

  io.out.bits := EB.io.out.bits
  io.out.valid := EB.io.out.valid
  EB.io.out.ready := io.out.ready
}

class D_PrimOp_1(width: Int, f: (SInt, SInt) => SInt) extends Module{
  val io = IO(new Bundle {
    val a = Flipped(Decoupled(SInt(width.W)))
    val b = Flipped(Decoupled(SInt(width.W)))
    val out = Decoupled(SInt(width.W))
  })

  val EB = Module(new EB_one(width))

  EB.io.in.bits := f(io.a.bits, io.b.bits)
  EB.io.in.valid := io.a.valid & io.b.valid
  io.a.ready := EB.io.in.ready
  io.b.ready := EB.io.in.ready

  io.out.bits := EB.io.out.bits
  io.out.valid := EB.io.out.valid
  EB.io.out.ready := io.out.ready
}

class D_PrimOp2_1(width: Int, f: (SInt, SInt) => SInt) extends Module{
  val io = IO(new Bundle {
    val a = Flipped(Decoupled(SInt(width.W)))
    val b = Flipped(Decoupled(SInt(width.W)))
    val out = Decoupled(SInt(width.W))
  })

  val EB = Module(new EB_two(width))

  EB.io.in.bits := f(io.a.bits, io.b.bits)
  EB.io.in.valid := io.a.valid & io.b.valid
  io.a.ready := EB.io.in.ready
  io.b.ready := EB.io.in.ready

  io.out.bits := EB.io.out.bits
  io.out.valid := EB.io.out.valid
  EB.io.out.ready := io.out.ready
}

class EB_one(width: Int) extends Module{
  val io = IO(new Bundle {
    val in = Flipped(Decoupled(SInt(width.W)))
    val out = Decoupled(SInt(width.W))
  })
  val vld = RegInit(false.B)
  val rdy = RegInit(false.B)
  val data = RegInit(0.S(width.W))

  vld := io.in.valid
  rdy := io.out.ready
  data := io.in.bits

  io.out.valid := vld
  io.in.ready := rdy
  io.out.bits := data

}

class EB_two(width: Int) extends Module{
  val io = IO(new Bundle {
    val in = Flipped(Decoupled(SInt(width.W)))
    val out = Decoupled(SInt(width.W))
  })

  val head = RegInit(0.U(1.W))
  val tail = RegInit(0.U(1.W))

  val full = Reg(Vec(2, Bool()))
  val data = Reg(Vec(2, SInt(width.W)))

  when(reset.asBool()) {
    full(0.U) := false.B
    full(1.U) := false.B
    data(0.U) := 0.S
    data(1.U) := 0.S
  }

  io.out.valid := full(0) || full(1)
  io.in.ready := !full(0)|| !full(1)
  io.out.bits := data(head)

  when(io.in.valid && !full(tail)) {
    full(tail) := true.B
    data(tail) := io.in.bits
    tail := !tail
  }

  when(io.out.ready && full(head)) {
    full(head) := false.B
    head := !head
  }

//  for (d <- data) {
//    printf("%d ", d)
//  }
//  printf("\nFull\n")
//  for (f <- full) {
//    printf("%d ", f)
//  }
//  printf("\nIn %d\n", io.in.bits)
//  printf("Out %d\n", io.out.bits)
}
