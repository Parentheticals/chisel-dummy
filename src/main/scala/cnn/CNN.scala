package cnn

import chisel3._
import chisel3.util._
import chisel3.experimental._

class Neuron(inputs: Int, width: Int,  act: SInt => SInt) extends Module {
  val io = IO(new Bundle {
    val in      = Input(Vec(inputs, SInt(width.W)))
    val weights = Input(Vec(inputs, SInt(width.W)))
    val out     = Output(SInt(width.W))
  })

  val mac = io.in.zip(io.weights).map{ case(a:SInt, b:SInt) => a*b}.reduce(_+_)
  io.out := act(mac)
}

class CNN(inputs: Int, width: Int, numLayers: Int, act: SInt => SInt) extends Module {
  val io = IO(new Bundle {
    val in      = Input(Vec(inputs, SInt(width.W)))
    val vld_in  = Input(Bool())
    val weights = Input(Vec(numLayers, Vec(inputs, Vec(inputs, SInt(width.W)))))
    val out     = Output(Vec(inputs, SInt(width.W)))
    val vld_out = Output(Bool())
  })

  // Setup the raw network of neurons
  val network: Seq[Seq[Neuron]] = Seq.fill(numLayers)(Seq.fill(inputs)(Module(new Neuron(inputs, width, act))))
  // Setup first connection
  var i, j = 0
  network.head.zip(io.weights.head).foreach{
    case (neuron, weights) =>
      neuron.io.in := io.in
      neuron.io.weights := weights
  }
  // Reset j and increment i
  i += 1
  network.zip(network.tail).foreach{
    case (prev, curr) =>
      // Make a vector of outputs
      val prevOutputs = prev.map(neuron => neuron.io.out)

      curr.foreach {
        neuron => {
          neuron.io.in := prevOutputs
          neuron.io.weights := io.weights(i)(j)
          j += 1
        }
      }
      j = 0
      i += 1
  }
  // Make the few last connections
  val reg = Seq.fill(inputs)(RegInit(0.S(width.W)))
  // Reset j again
  j = 0
  network.last.foreach {
    neuron => {
      reg(j) := neuron.io.out
    }
  }

  io.out := reg

  val reg_vld = RegInit(false.B)
  reg_vld := io.vld_in
  io.vld_out := reg_vld


  printf("Input Values\n")
  for (bits <- io.in){
    printf("%d ", bits)
  }
  printf("\nWeights\n")
  for (w0 <- io.weights) {
    for (w1 <- w0) {
      for (w2 <- w1){
        printf("%d ", w2)
      }
      printf("| ")
    }
    printf("\n")
  }
  printf("Output Values\n")
  for (layer <- network){
    for (neuron <- layer) {
      printf("%d ", neuron.io.out)
    }
    printf("\n")
  }
  printf("\n")

}