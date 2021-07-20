package D_PrimOp

import chisel3._
import chisel3.util._
import chisel3.experimental._

class Mult_D_PrimOp(width: Int) extends Module {
  val io = IO(new Bundle {
    val a = Flipped(Decoupled(SInt(width.W)))
    val b = Flipped(Decoupled(SInt(width.W)))
    val out = Decoupled(SInt(width.W))
  })

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

  // Connections
  conn(io.a, io.b, l0_0)
  conn(io.a, io.b, l0_1)
  conn(io.a, io.b, l0_2)

  // Second Layer
  val l1_0 = Module(new D_PrimOp_1(width, Prim.add))
  val l1_1 = Module(new D_PrimOp_1(width, Prim.mod))

  // Connections
  conn(l0_0.io.out, l0_1.io.out, l1_0)
  conn(l0_2.io.out, l0_1.io.out, l1_1)

  // The last connection
  when (io.a.valid && io.b.valid) {
    io.out <> l1_0.io.out
    l1_1.io.out.ready := io.out.ready
  }.otherwise{
    io.out <> l1_1.io.out
    l1_0.io.out.ready := io.out.ready
  }

//  printf("\nIteration")
//  printf("\nSum: %d\n", io.out.bits)
//  printf("V: %d\n", io.out.valid)
//  printf("R_a: %d\n", io.a.ready)
//  printf("R_b: %d\n", io.b.ready)
}
