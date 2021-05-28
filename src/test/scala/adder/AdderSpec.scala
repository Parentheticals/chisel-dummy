package adder

import chisel3._
import chisel3.tester._
import org.scalatest.FreeSpec
import chisel3.experimental.BundleLiterals._

class GCDSpec extends FreeSpec with ChiselScalatestTester {

  "Adder should sum two values and truncate if there is overflow" in {
    test(new Adder(16)) { dut =>
      dut.input.initSource()
    //   dut.input.setSourceClock(dut.clock)
      dut.output.initSink()
    //   dut.output.setSinkClock(dut.clock)

    dut.io.input.in1.poke(0.U)
    dut.io.input.in2.poke(1.U)
    dut.io.output.out.expect(1.U)

    }
  }
}