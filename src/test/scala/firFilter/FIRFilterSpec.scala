package firFilter

import chisel3._
import chisel3.tester._
import org.scalatest.FreeSpec

class FIRFilterSpec extends FreeSpec with ChiselScalatestTester{
  // Initialize a vector
  val consts: Vector[UInt] = Vector(100.U,22.U,530.U,814.U,72.U,3.U,286.U)
  "FIRFilter test" in {
    test(new FIRFilter(7, 10)) { dut =>
      None
    }
  }
}
