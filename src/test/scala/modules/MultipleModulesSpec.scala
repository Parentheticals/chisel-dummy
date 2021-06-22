package modules

import chisel3._
import chisel3.tester._
import org.scalatest.FreeSpec

class MultipleModulesSpec extends FreeSpec with ChiselScalatestTester{
  "MultMod test" in {
    test(new MultipleModules(7, 10)) { dut =>
      dut.io.out1.ready.poke(false.B)
      dut.io.out2.ready.poke(false.B)
      dut.io.in1.valid.poke(true.B)
      dut.io.in2.valid.poke(true.B)

      for (i <- 0 until 100) {
//        print("Out1: " + dut.io.out1.bits.peek().litValue().intValue() +
//          " Out2: " + dut.io.out2.bits.peek().litValue().intValue() + "\n")
        dut.io.in1.bits.poke(i.U)
        dut.io.in2.bits.poke(i.U)
        dut.clock.step(1)
      }
    }
  }
}
