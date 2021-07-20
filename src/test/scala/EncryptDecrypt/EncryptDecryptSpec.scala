package EncryptDecrypt

import chisel3._
import chisel3.tester._
import org.scalatest.FreeSpec

import scala.collection.mutable.ArrayBuffer
import scala.math.pow
import scala.util.Random

class EncryptDecryptSpec extends FreeSpec with ChiselScalatestTester{
  val toenc: ArrayBuffer[ArrayBuffer[UInt]] = ArrayBuffer[ArrayBuffer[UInt]]()

  val r = new Random()

  var enc = 0
  var dec = 0

  def initEnc(toenc: ArrayBuffer[ArrayBuffer[UInt]], n: Int, cells: Int, width: Int, r: Random): Unit = {
    for (_ <- 0 until n) {
      var builder = ArrayBuffer[UInt]()
      for (_ <- 0 until cells) {
        builder += BigInt(width, r).U
      }
      toenc += builder
    }
  }

  "EncDec test" in {
    val cells = 10
    val widthPerCell = 256
    val depth = 2
    val numInputs = 3
    test(new EncryptDecrypt(cells, widthPerCell, depth)) { dut =>
      dut.io.out.ready.poke(true.B)
      dut.io.in.valid.poke(true.B)
      initEnc(toenc, numInputs, cells, widthPerCell, r)

      for (i <- 0 until numInputs) {
        // Inputs
        for (j <- toenc(i).indices) {
          dut.io.in.bits(j).poke(toenc(i)(j))
        }
        dut.clock.step(1)
      }
      // ENd of inputs
      dut.io.in.valid.poke(false.B)

      // Set ready to false to halt
      dut.io.out.ready.poke(false.B)

      for (i <- 0 until 3) {
        dut.clock.step(1)
      }

      // Resume
      dut.io.out.ready.poke(true.B)

      while(dut.io.out.valid.peek().litToBoolean) {
        dut.clock.step(1)
      }
    }
  }
}
