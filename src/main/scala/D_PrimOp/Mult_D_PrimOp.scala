package D_PrimOp

import chisel3._
import chisel3.util._
import chisel3.experimental._

object Prim extends ChiselEnum {
  val add: (SInt, SInt) => SInt = (a, b) => a + b
  val sub: (SInt, SInt) => SInt = (a, b) => a - b
  val mul: (SInt, SInt) => SInt = (a, b) => a * b
  val div: (SInt, SInt) => SInt = (a, b) => a / b
  val mod: (SInt, SInt) => SInt = (a, b) => a % b

  val not: SInt => SInt = a => -a
  val and: (SInt, SInt) => SInt = (a, b) => a & b
  val or: (SInt, SInt) => SInt = (a, b) => a | b
  val xor: (SInt, SInt) => SInt = (a, b) => a ^ b
}

class Mult_D_PrimOp(width: Int) extends Module {
  val io = IO(new Bundle {
    val a = Flipped(Decoupled(SInt(width.W)))
    val b = Flipped(Decoupled(SInt(width.W)))
    val out = Decoupled(SInt((2 * width).W))
  })

  def conn[T](in0: DecoupledIO[SInt], in1: DecoupledIO[SInt], curr: T): Unit = {
    curr match {
      case op0: D_PrimOp_0 =>
        op0.io.a <> in0
      case op1: D_PrimOp_1 =>
        op1.io.a <> in0
        op1.io.b <> in1
      case _ =>
    }
  }

  // First Layer
  val l0_0 = Module(new D_PrimOp_1(width, Prim.add))
  val l0_1 = Module(new D_PrimOp_1(width, Prim.mul))
  val l0_2 = Module(new D_PrimOp_1(width, Prim.sub))
  val l0_3 = Module(new D_PrimOp_0(width, Prim.not))
  val l0_4 = Module(new D_PrimOp_1(width, Prim.and))

  // Connections
  conn(io.a, io.b, l0_0)
  conn(io.a, io.b, l0_1)
  conn(io.a, io.b, l0_2)
  conn(io.a, io.b, l0_3)
  conn(io.a, io.b, l0_4)

  // Second Layer
  val l1_0 = Module(new D_PrimOp_1(width, Prim.add))
  val l1_1 = Module(new D_PrimOp_1(width, Prim.mod))
  val l1_2 = Module(new D_PrimOp_1(width, Prim.sub))
  val l1_3 = Module(new D_PrimOp_1(width, Prim.xor))
  val l1_4 = Module(new D_PrimOp_1(width, Prim.mul))

  // Connections
  conn(l0_0.io.out, l0_1.io.out, l1_0)
  conn(l0_2.io.out, l0_1.io.out, l1_1)
  conn(l0_2.io.out, l0_3.io.out, l1_2)
  conn(l0_3.io.out, l0_4.io.out, l1_3)
  conn(l0_1.io.out, l0_4.io.out, l1_4)

  val check1 = Wire(new Bundle() {
    val valid = Bool()
    val ready = Bool()
    val bits = SInt(width.W)
  })
  val check2 = Wire(new Bundle() {
    val valid = Bool()
    val ready = Bool()
    val bits = SInt(width.W)
  })

  when (io.a.valid && io.b.valid) {
    check1 <> l1_0.io.out
    check2 <> l1_2.io.out
    l1_1.io.out.ready := io.out.ready
    l1_3.io.out.ready := io.out.ready
    l1_4.io.out.ready := io.out.ready
  }.otherwise{
    check1 <> l1_1.io.out
    check2 <> l1_3.io.out
    l1_0.io.out.ready := io.out.ready
    l1_2.io.out.ready := io.out.ready
    l1_4.io.out.ready := io.out.ready
  }

  val rawOut = Cat(check1.bits, check2.bits).asSInt()

  io.out.bits := rawOut
  io.out.valid := check1.valid && check2.valid
  check1.ready := io.out.ready
  check2.ready := io.out.ready

//  printf("\nIteration")
//  printf("\nSum: %d\n", io.out.bits)
//  printf("V: %d\n", io.out.valid)
//  printf("R_a: %d\n", io.a.ready)
//  printf("R_b: %d\n", io.b.ready)
}

class Mult_D_PrimOp2(width: Int) extends Module {
  val io = IO(new Bundle {
    val a = Flipped(Decoupled(SInt(width.W)))
    val b = Flipped(Decoupled(SInt(width.W)))
    val out = Decoupled(SInt((2 * width).W))
  })

  def conn[T](in0: DecoupledIO[SInt], in1: DecoupledIO[SInt], curr: T): Unit = {
    curr match {
      case op0: D_PrimOp2_0 =>
        op0.io.a <> in0
      case op1: D_PrimOp2_1 =>
        op1.io.a <> in0
        op1.io.b <> in1
      case _ =>
    }
  }

  // First Layer
  val l0_0 = Module(new D_PrimOp2_1(width, Prim.add))
  val l0_1 = Module(new D_PrimOp2_1(width, Prim.mul))
  val l0_2 = Module(new D_PrimOp2_1(width, Prim.sub))
  val l0_3 = Module(new D_PrimOp2_0(width, Prim.not))
  val l0_4 = Module(new D_PrimOp2_1(width, Prim.and))

  // Connections
  conn(io.a, io.b, l0_0)
  conn(io.a, io.b, l0_1)
  conn(io.a, io.b, l0_2)
  conn(io.a, io.b, l0_3)
  conn(io.a, io.b, l0_4)

  // Second Layer
  val l1_0 = Module(new D_PrimOp2_1(width, Prim.add))
  val l1_1 = Module(new D_PrimOp2_1(width, Prim.mod))
  val l1_2 = Module(new D_PrimOp2_1(width, Prim.sub))
  val l1_3 = Module(new D_PrimOp2_1(width, Prim.xor))
  val l1_4 = Module(new D_PrimOp2_1(width, Prim.mul))

  // Connections
  conn(l0_0.io.out, l0_1.io.out, l1_0)
  conn(l0_2.io.out, l0_1.io.out, l1_1)
  conn(l0_2.io.out, l0_3.io.out, l1_2)
  conn(l0_3.io.out, l0_4.io.out, l1_3)
  conn(l0_1.io.out, l0_4.io.out, l1_4)

  val check1 = Wire(new Bundle() {
    val valid = Bool()
    val ready = Bool()
    val bits = SInt(width.W)
  })
  val check2 = Wire(new Bundle() {
    val valid = Bool()
    val ready = Bool()
    val bits = SInt(width.W)
  })

  when (io.a.valid && io.b.valid) {
    check1 <> l1_0.io.out
    check2 <> l1_2.io.out
    l1_1.io.out.ready := io.out.ready
    l1_3.io.out.ready := io.out.ready
    l1_4.io.out.ready := io.out.ready
  }.otherwise{
    check1 <> l1_1.io.out
    check2 <> l1_3.io.out
    l1_0.io.out.ready := io.out.ready
    l1_2.io.out.ready := io.out.ready
    l1_4.io.out.ready := io.out.ready
  }

  val rawOut = Cat(check1.bits, check2.bits).asSInt()

  io.out.bits := rawOut
  io.out.valid := check1.valid && check2.valid
  check1.ready := io.out.ready
  check2.ready := io.out.ready

  //  printf("\nIteration")
  //  printf("\nSum: %d\n", io.out.bits)
  //  printf("V: %d\n", io.out.valid)
  //  printf("R_a: %d\n", io.a.ready)
  //  printf("R_b: %d\n", io.b.ready)
}