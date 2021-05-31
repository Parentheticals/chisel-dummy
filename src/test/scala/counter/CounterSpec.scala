package counter

import chisel3._
import chisel3.tester._
import org.scalatest.FreeSpec
import chisel3.experimental.BundleLiterals._

class CounterSpec extends FreeSpec with ChiselScalatestTester {

  "Normal Counter" in {
    test(new Counter(3)) { dut =>
        dut.io.in.poke(0.U)
        dut.clock.step(6)
        dut.io.out.expect(6.U)
    }
  }

  "Bad Counter" in {
      test(new BadCounter(3)) { dut =>
        dut.io.in.poke(0.U)
        dut.clock.step(6)
        dut.io.out.expect(6.U)
      }
  }
}