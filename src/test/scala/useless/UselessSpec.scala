package useless

import chisel3._
import chisel3.tester._
import org.scalatest.FreeSpec

class UselessSpec extends FreeSpec with ChiselScalatestTester{
  "Useless test" in {
    test(new Useless(3)) { dut =>
      None
    }
  }
}
