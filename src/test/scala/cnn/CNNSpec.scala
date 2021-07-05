package cnn

import chisel3._
import chisel3.tester._
import org.scalatest.FreeSpec

import scala.collection.mutable.ArrayBuffer
import scala.math.pow
import scala.util.Random

class CNNSpec extends FreeSpec with ChiselScalatestTester{
  "CNN Test" in {
    val inputs = 4
    val width = 7
    val numLayer = 2
    val ReLU: SInt => SInt = x => Mux(x <= 0.S, 0.S, x)

    val weights: ArrayBuffer[ArrayBuffer[ArrayBuffer[SInt]]] = ArrayBuffer[ArrayBuffer[ArrayBuffer[SInt]]]()

    val r = new Random()

    def initW(dut: CNN, inputs: Int, width: Int, numLayer: Int, r: Random): Unit = {
      for (i <- 0 until numLayer) {
        for (j <- 0 until inputs) {
          for (k <- 0 until inputs) {
            val max = pow(2, width).intValue()
            val in = if (r.nextBoolean()) {
              r.nextInt(max)
            } else {
              -r.nextInt(max)
            }
            dut.io.weights(i)(j)(k).poke(in.S)
          }
        }
      }
    }

    def initIn(dut: CNN, width: Int, r: Random): Unit ={
      dut.io.in.foreach{in =>
        val max = pow(2, width).intValue()
        val value = if (r.nextBoolean()) {
          r.nextInt(max)
        } else {
          -r.nextInt(max)
        }
        in.poke(value.S)
      }
    }

    test(new CNN(inputs, width, numLayer, ReLU)) { dut =>
      dut.io.vld_in.poke(true.B)
      initW(dut, inputs, width, numLayer, r)
      for (_ <- 0 until 5) {
        initIn(dut, width, r)
        dut.clock.step(1)
      }
    }
  }
}
