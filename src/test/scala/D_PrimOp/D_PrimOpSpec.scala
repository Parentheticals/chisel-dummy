package D_PrimOp

import chisel3._
import chisel3.tester._
import org.scalatest.FreeSpec

import scala.math.pow
import scala.util.Random

class D_PrimOpSpec extends FreeSpec with ChiselScalatestTester{
  "D_PrimOp Test" in {
    test(new Mult_D_PrimOp(width = 5)){dut =>
      val r = new Random(123456)
      dut.io.a.valid.poke(true.B)
      dut.io.b.valid.poke(false.B)
      dut.io.out.ready.poke(true.B)

      for (_ <- 0 until 10) {
        setInput(dut, 5, r)
        dut.clock.step(1)
      }

      dut.io.b.valid.poke(true.B)
      for (i <- 0 until 10) {
        setInput(dut, 5, r)
        dut.clock.step(1)
        if (i == 5) {
          dut.io.out.ready.poke(false.B)
        }
      }
    }
  }

  def setInput(dut: Mult_D_PrimOp, width: Int, r: Random): Unit = {
    val max = pow(2, width).intValue()
    dut.io.a.bits.poke(r.nextInt(max).S)
    dut.io.b.bits.poke(r.nextInt(max).S)
  }

}
