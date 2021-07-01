package EncryptDecrypt

import chisel3._
import chisel3.util._

import scala.util.Random
import scala.collection.mutable.ArrayBuffer

class EncryptDecrypt(cells: Int, widthPerCell: Int, depth: Int) extends Module{
  val io = IO(new Bundle {
    val in = Flipped(Decoupled(Vec(cells, UInt(widthPerCell.W))))
    val out = Decoupled(Vec(cells, UInt(widthPerCell.W)))

    val encrypt = Output(Vec(cells, UInt(widthPerCell.W)))
    val encrypt_vld = Output(Bool())
  })
  /**
   * Higher Level Setup
   */
  // No need to provide a specific seed
  val random = new Random()
  // Create depth amount of vectors that are going to be used for encryption. Initialize them all to 0
  var encryptorsOrder = ArrayBuffer[Array[Int]]()
  var decryptorsOrder = ArrayBuffer[Array[Int]]()

  // Setup the order for encryption
  for (_ <- 0 until depth) {
    encryptorsOrder += random.shuffle[Int, IndexedSeq](0 until cells).toArray
  }

  // Setup the order for decryption
  for (i <- 0 until depth) {
    var builder = Array.fill[Int](cells)(0)
    // Populate with order data
    for (j <- 0 until cells){
      builder(encryptorsOrder(depth - 1 - i)(j)) = j
    }
    decryptorsOrder += builder
  }

  /**
   * Lower Level Connections
   */

  val encryptors = Seq(io.in.bits) ++ Seq.fill(depth)(Seq.fill(cells)(RegInit(0.U(widthPerCell.W))))
  val decryptors = Seq(encryptors.last) ++ Seq.fill(depth)(Seq.fill(cells)(RegInit(0.U(widthPerCell.W))))

  // Chain that will be used for pipelining the validity of the things inside the shuffler
  val validChain = Seq(io.in.valid) ++ Seq.fill(2 * depth)(RegInit(false.B))

  // Only shift to next register if either the output ready is high or the last register is still not valid
  val shift: Bool = !validChain(validChain.length - 1) || io.out.ready

  var i = 0

  // Connect the registers for encryptions
  encryptors.zip(encryptors.tail).foreach {
    case (source, sink) => when (shift) {
      for (j <- 0 until sink.length) {
        sink(j) := source(encryptorsOrder(i)(j))
      }
      i += 1
    }
  }

  i = 0

  // Connect the registers for decryptions
  decryptors.zip(decryptors.tail).foreach {
    case (source, sink) => when (shift) {
      for (j <- 0 until sink.length) {
        sink(j) := source(decryptorsOrder(i)(j))
      }
      i += 1
    }
  }

  // Connect the valid port with the chain
  validChain.zip(validChain.tail).foreach {
    case (source, sink) => when(shift) {sink := source}
  }

  // Port connections
  io.in.ready := !validChain(validChain.length - 1) || io.out.ready
  io.encrypt := encryptors(encryptors.length - 1)
  io.encrypt_vld := validChain(validChain.length - depth - 1)
  io.out.bits := decryptors(decryptors.length - 1)
  io.out.valid := validChain(validChain.length - 1)

//  printf("Inputs\n")
//  for(in <- io.in.bits) {
//    printf("%d ", in)
//  }
//  printf("\nEncryptors\n")
//  for (enc <- encryptors) {
//    for (cell <- enc) {
//      printf("%d ", cell)
//    }
//    printf("\n")
//  }
//  printf("Decryptors\n")
//  for (dec <- decryptors) {
//    for (cell <- dec) {
//      printf("%d ", cell)
//    }
//    printf("\n")
//  }
//  printf("Outputs\n")
//  for(out <- io.out.bits) {
//    printf("%d ", out)
//  }
//  printf("\nValids\n")
//  for(value <- validChain){
//    printf("%d", value)
//  }
//
//  printf("\nio_in_ready = %d\n", io.in.ready)
//  printf("io.out.valid = %d\n", io.out.valid)
//  printf("io.encrypt_vld = %d\n", io.encrypt_vld)
//
//  printf("\n\n")
}
