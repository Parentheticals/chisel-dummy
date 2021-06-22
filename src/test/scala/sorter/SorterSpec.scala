package sorter

import chisel3._
import chisel3.tester._
import org.scalatest.FreeSpec

class SorterSpec extends FreeSpec with ChiselScalatestTester{
  val tosort1: Vector[UInt] = Vector(3.U,10.U,2.U,16.U,5.U,1.U,12.U)
  val tosort2: Vector[UInt] = Vector(30.U,16.U,16.U,2.U,28.U,1.U,7.U)
  "Sorter test" in {
    test(new Sorter(5,tosort1.length)) { dut =>
      dut.io.out.ready.poke(false.B)
      dut.io.in.valid.poke(true.B)

      for (i <- 0 until tosort1.length) {
        dut.io.in.bits.poke(tosort1(i))
        dut.clock.step(1)
      }

      dut.io.out.ready.poke(true.B)

      for (i <- 0 until tosort1.length) {
        peekatout(dut)
      }

      // println("Should have ended")

      dut.io.out.ready.poke(false.B)

      for (i <- 0 until tosort2.length) {
        dut.io.in.bits.poke(tosort2(i))
        dut.clock.step(1)
      }

      dut.io.out.ready.poke(true.B)

      for (i <- 0 until tosort1.length) {
        peekatout(dut)
      }
    }
  }

  def peekatout(dut: Sorter): Unit = {
    // print("valid: " + dut.io.out.valid.peek() + " with value: " + dut.io.out.bits.peek().litValue().intValue() + "\n")
    dut.clock.step(1)
  }
}