package adder

import chisel3._
import chisel3.tester._
import org.scalatest.FreeSpec
import chisel3.experimental.BundleLiterals._

class GCDSpec extends FreeSpec with ChiselScalatestTester {

  "Adder should sum two values and truncate if there is overflow" in {
    test(new Adder(16)) { dut =>
      dut.io.in1.initSource()
      dut.io.in2.initSource()
    //   dut.input.setSourceClock(dut.clock)
      dut.io.out.initSink()
    //   dut.output.setSinkClock(dut.clock)

        dut.io.in1.poke(0.U)
        dut.io.in2.poke(1.U)
        dut.io.out.expect(1.U)

    }
  }
}