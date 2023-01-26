`timescale 1ns / 1ps
`include "global_defines.vh"
`include "system.vh"
`include "axi.vh"
`include "xversat.vh"
`include "xdefs.vh"

module Constants #(
      parameter ADDR_W = `ADDR_W,
      parameter DATA_W = `DATA_W,
      parameter AXI_ADDR_W = 32
   )
   (

   input run,
   
   output done,
   output [DATA_W-1:0]             out0,
   input [9:0]     Constants_mem_iterA,
   input [9:0]     Constants_mem_perA,
   input [9:0]     Constants_mem_dutyA,
   input [9:0]     Constants_mem_startA,
   input [9:0]     Constants_mem_shiftA,
   input [9:0]     Constants_mem_incrA,
   input [0:0]     Constants_mem_reverseA,
   input [0:0]     Constants_mem_extA,
   input [0:0]     Constants_mem_in0_wr,
   input [9:0]     Constants_mem_iter2A,
   input [9:0]     Constants_mem_per2A,
   input [9:0]     Constants_mem_shift2A,
   input [9:0]     Constants_mem_incr2A,
   input [9:0]     Constants_mem_iterB,
   input [9:0]     Constants_mem_perB,
   input [9:0]     Constants_mem_dutyB,
   input [9:0]     Constants_mem_startB,
   input [9:0]     Constants_mem_shiftB,
   input [9:0]     Constants_mem_incrB,
   input [0:0]     Constants_mem_reverseB,
   input [0:0]     Constants_mem_extB,
   input [0:0]     Constants_mem_in1_wr,
   input [9:0]     Constants_mem_iter2B,
   input [9:0]     Constants_mem_per2B,
   input [9:0]     Constants_mem_shift2B,
   input [9:0]     Constants_mem_incr2B,
   input  [31:0]                   delay0,
   input  [31:0]                   delay1,
   // data/control interface
   input                           valid,
   input [9:0] addr,
   input [DATA_W/8-1:0]            wstrb,
   input [DATA_W-1:0]              wdata,
   output                          ready,
   output [DATA_W-1:0]             rdata,
   input                           clk,
   input                           rst
   );

wire wor_ready;

wire [31:0] unitRdataFinal;
reg [31:0] stateRead;

// Memory access
wire we = (|wstrb);
wire[0:0] unitReady;
reg [0:0] memoryMappedEnable;
wire [31:0] unitRData[0:0];

assign rdata = unitRdataFinal;
assign ready = wor_ready;
assign wor_ready = (|unitReady);

wire [31:0] rdata_0 ;

assign unitRdataFinal = (unitRData[0] );
wire [0:0] unitDone;
assign done = &unitDone;
wire [31:0] output_0_0 ;

// Memory mapped
always @*
begin
   memoryMappedEnable = {1{1'b0}};
   if(valid)
   begin
   memoryMappedEnable[0] = 1'b1;
      end
end
Mem #(.ADDR_W(5)) mem_0 (
         .out0(output_0_0),
         .iterA(Constants_mem_iterA),
         .perA(Constants_mem_perA),
         .dutyA(Constants_mem_dutyA),
         .startA(Constants_mem_startA),
         .shiftA(Constants_mem_shiftA),
         .incrA(Constants_mem_incrA),
         .reverseA(Constants_mem_reverseA),
         .extA(Constants_mem_extA),
         .in0_wr(Constants_mem_in0_wr),
         .iter2A(Constants_mem_iter2A),
         .per2A(Constants_mem_per2A),
         .shift2A(Constants_mem_shift2A),
         .incr2A(Constants_mem_incr2A),
         .iterB(Constants_mem_iterB),
         .perB(Constants_mem_perB),
         .dutyB(Constants_mem_dutyB),
         .startB(Constants_mem_startB),
         .shiftB(Constants_mem_shiftB),
         .incrB(Constants_mem_incrB),
         .reverseB(Constants_mem_reverseB),
         .extB(Constants_mem_extB),
         .in1_wr(Constants_mem_in1_wr),
         .iter2B(Constants_mem_iter2B),
         .per2B(Constants_mem_per2B),
         .shift2B(Constants_mem_shift2B),
         .incr2B(Constants_mem_incr2B),
         .delay0(delay0),
         .delay1(delay1),
         .valid(memoryMappedEnable[0]),
         .wstrb(wstrb),
         .addr(addr[9:0]),
         .rdata(unitRData[0]),
         .ready(unitReady[0]),
         .wdata(wdata),
         .run(run),

         .done(unitDone[0]),
         .clk(clk),
         .rst(rst)
      );
         assign out0 = output_0_0;
   endmodule
