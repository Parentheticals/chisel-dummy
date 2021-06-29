package sorter

import chisel3._
import chisel3.util._

class Sorter(width: Int, length: Int) extends Module {
  val io = IO(new Bundle {
    val in = Flipped(Decoupled(UInt(width.W)))
    val out = Decoupled(UInt(width.W))
  })

  val full = RegInit(false.B)
  val first = RegInit(true.B)

  full := false.B

  val nums = Seq.fill(length + 1)(RegInit(UInt(width.W), 0.U))

  // The invariable is that, every time a new number is inserted, nums is already sorted
  when(first){
    nums(1) := io.in.bits
    first := false.B
  }.otherwise{
    nums.zip(nums.tail).foreach{ case (a , b) =>
      // Insertion sort if it is not full
      when (!full) {
        // Needs to be in between a or b, or b is equal to 0
        when ((a <= io.in.bits) && (io.in.bits < b || b === 0.U)) {
          // If a happens to be 0 and b too, then do not add the number (this case already covered by first)
          when (a =/= 0.U || b =/= 0.U) {
            b := io.in.bits
          }
        }.otherwise {
          // Then this means we already added the number and need to shift
          when ((io.in.bits < b) || b === 0.U) {
            b := a
          }
        }
      }.otherwise{
        // Check if output is ready to receive
        when (io.out.ready) {
          b := a
        }
      }
    }
    first := false.B
  }

  // Have a counter to track amount of numbers inside
  val cntfull = Counter(length)
  val cntempty = Counter(length)

  // If counter not full, increment. Keeps track on how many numbers have been placed
  when (io.in.valid && !full) {
    when (cntfull.value === (length - 1).U) {
      full := true.B
      cntempty.reset()
    }.otherwise{
      full := false.B
      cntfull.inc()
    }
  }

  // If counter not full, increments. Keeps track on how many numbers have been evicted
  when(full && io.out.ready) {
    when (cntempty.value === (length - 1).U) {
      full := false.B
      first := true.B
      cntfull.reset()
    }.otherwise{
      full := true.B
      cntempty.inc()
    }
  }

  // Connect the wires with outputs
  io.out.bits := nums(length)
  io.out.valid := full
  io.in.ready := !full


//  for(num <- nums) {
//    printf("%d ", num)
//  }
//  printf("\n")
}
