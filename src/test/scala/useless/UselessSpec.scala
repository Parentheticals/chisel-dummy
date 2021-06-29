package useless

import chisel3._
import chisel3.tester._
import org.scalatest.FreeSpec

class UselessSpec extends FreeSpec with ChiselScalatestTester{
  val n0: Vector[Vector[UInt]] = Vector(Vector(1.U, 0.U, 1.U),
    Vector(0.U, 1.U, 0.U),
    Vector(1.U, 1.U, 0.U))
  val n1: Vector[Vector[UInt]] = Vector(Vector(0.U, 1.U, 1.U),
    Vector(0.U, 0.U, 0.U),
    Vector(1.U, 1.U, 1.U))
  val b: Vector[Vector[UInt]] = Vector(Vector(0.U, 0.U, 1.U),
    Vector(0.U, 1.U, 1.U),
    Vector(1.U, 1.U, 1.U))
  "Useless test" in {
    test(new Useless(3)) { dut =>
      for (i <- 0 until 3) {
        init(dut, i)
        checkAndPrint(dut)
      }
      checkAndPrint(dut)
    }
  }

  def init(dut: Useless, j: Int): Unit = {
    // Initialize
    var i = 0
    for (a <- dut.io.a.bits.num0) {
      a.poke(n0(j)(i))
      i += 1
    }
    i = 0
    for (a <- dut.io.a.bits.num1) {
      a.poke(n1(j)(i))
      i += 1
    }
    i = 0
    for (bn <- dut.io.b) {
      bn.poke(b(j)(i))
      i += 1
    }
    // Set up decoupled stuff
    dut.io.a.valid.poke(true.B)
  }

  def checkAndPrint(dut : Useless): Unit = {
    print("A Ready: " + dut.io.a.ready.peek().litValue().intValue() + "\n")
    print("B Ready: " + dut.io.rdy_b.peek().litValue().intValue() + "\n")
    print("OP 0: " + dut.io.op(0).peek().litValue().intValue() + "\n")
    print("OP 1: " + dut.io.op(1).peek().litValue().intValue() + "\n")
    print("Delayed 0: " + dut.io.delayed(0).peek().litValue().intValue() + "\n")
    print("Delayed 1: " + dut.io.delayed(1).peek().litValue().intValue() + "\n")
    print("Valid Delayed: " + dut.io.vld_delay.peek().litValue().intValue() + "\n\n")

    dut.clock.step(1)
  }
}
