`timescale 1ns / 1ps
`include "global_defines.vh"
`include "system.vh"
`include "axi.vh"
`include "xversat.vh"
`include "xdefs.vh"

module ConvolutionStage #(
      parameter ADDR_W = `ADDR_W,
      parameter DATA_W = `DATA_W,
      parameter AXI_ADDR_W = 32
   )
   (

   input run,
   
   output done,
   input [DATA_W-1:0]              in0,
   output [DATA_W-1:0]             out0,
   input [31:0]     ext_addr_00,
   input [9:0]     int_addr_01,
   input [10:0]     size_02,
   input [9:0]     iterA_03,
   input [9:0]     perA_04,
   input [9:0]     dutyA_05,
   input [9:0]     shiftA_06,
   input [9:0]     incrA_07,
   input [7:0]     length_08,
   input [0:0]     pingPong_09,
   input [9:0]     iterB_10,
   input [9:0]     perB_11,
   input [9:0]     dutyB_12,
   input [9:0]     startB_13,
   input [9:0]     shiftB_14,
   input [9:0]     incrB_15,
   input [0:0]     reverseB_16,
   input [0:0]     extB_17,
   input [9:0]     iter2B_18,
   input [9:0]     per2B_19,
   input [9:0]     shift2B_20,
   input [9:0]     incr2B_21,
   input [9:0]     ConvolutionStage_weights_iterA,
   input [9:0]     ConvolutionStage_weights_perA,
   input [9:0]     ConvolutionStage_weights_dutyA,
   input [9:0]     ConvolutionStage_weights_startA,
   input [9:0]     ConvolutionStage_weights_shiftA,
   input [9:0]     ConvolutionStage_weights_incrA,
   input [0:0]     ConvolutionStage_weights_reverseA,
   input [0:0]     ConvolutionStage_weights_extA,
   input [0:0]     ConvolutionStage_weights_in0_wr,
   input [9:0]     ConvolutionStage_weights_iter2A,
   input [9:0]     ConvolutionStage_weights_per2A,
   input [9:0]     ConvolutionStage_weights_shift2A,
   input [9:0]     ConvolutionStage_weights_incr2A,
   input [9:0]     ConvolutionStage_weights_iterB,
   input [9:0]     ConvolutionStage_weights_perB,
   input [9:0]     ConvolutionStage_weights_dutyB,
   input [9:0]     ConvolutionStage_weights_startB,
   input [9:0]     ConvolutionStage_weights_shiftB,
   input [9:0]     ConvolutionStage_weights_incrB,
   input [0:0]     ConvolutionStage_weights_reverseB,
   input [0:0]     ConvolutionStage_weights_extB,
   input [0:0]     ConvolutionStage_weights_in1_wr,
   input [9:0]     ConvolutionStage_weights_iter2B,
   input [9:0]     ConvolutionStage_weights_per2B,
   input [9:0]     ConvolutionStage_weights_shift2B,
   input [9:0]     ConvolutionStage_weights_incr2B,
   input [0:0]     ConvolutionStage_muladd_opcode,
   input [9:0]     ConvolutionStage_muladd_iterations,
   input [9:0]     ConvolutionStage_muladd_period,
   input [5:0]     ConvolutionStage_muladd_shift,
   input  [31:0]                   delay0,
   input  [31:0]                   delay1,
   input  [31:0]                   delay2,
   input  [31:0]                   delay3,
   // Databus master interface
   input [0:0]                databus_ready,
   output [0:0]               databus_valid,
   output [1 * AXI_ADDR_W-1:0]    databus_addr,
   input [`DATAPATH_W-1:0]                    databus_rdata,
   output [1 * `DATAPATH_W-1:0]   databus_wdata,
   output [1 * `DATAPATH_W/8-1:0] databus_wstrb,
   output [1 * 8-1:0]             databus_len,
   input  [0:0]               databus_last,
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
wire [2:0] unitDone;
assign done = &unitDone;
wire [31:0] output_0_0 , output_1_0 , output_2_0 , output_3_0 , output_4_0 ;

// Memory mapped
always @*
begin
   memoryMappedEnable = {1{1'b0}};
   if(valid)
   begin
   memoryMappedEnable[0] = 1'b1;
      end
end
reg [31:0] comb_res ; 

always @*
begin
comb_res = output_3_0 + in0;
      end
VRead  pixels_0 (
         .out0(output_1_0),
         .ext_addr(ext_addr_00),
         .int_addr(int_addr_01),
         .size(size_02),
         .iterA(iterA_03),
         .perA(perA_04),
         .dutyA(dutyA_05),
         .shiftA(shiftA_06),
         .incrA(incrA_07),
         .length(length_08),
         .pingPong(pingPong_09),
         .iterB(iterB_10),
         .perB(perB_11),
         .dutyB(dutyB_12),
         .startB(startB_13),
         .shiftB(shiftB_14),
         .incrB(incrB_15),
         .reverseB(reverseB_16),
         .extB(extB_17),
         .iter2B(iter2B_18),
         .per2B(per2B_19),
         .shift2B(shift2B_20),
         .incr2B(incr2B_21),
         .delay0(delay0),
         .databus_ready(databus_ready[0 +: 1]),
         .databus_valid(databus_valid[0 +: 1]),
         .databus_addr(databus_addr[0 +: 32]),
         .databus_rdata(databus_rdata),
         .databus_wdata(databus_wdata[0 +: 32]),
         .databus_wstrb(databus_wstrb[0 +: 4]),
         .databus_len(databus_len[0 +: 8]),
         .databus_last(databus_last[0 +: 1]),
         .run(run),

         .done(unitDone[0]),
         .clk(clk),
         .rst(rst)
      );
         Mem  weights_1 (
         .out0(output_2_0),
         .iterA(ConvolutionStage_weights_iterA),
         .perA(ConvolutionStage_weights_perA),
         .dutyA(ConvolutionStage_weights_dutyA),
         .startA(ConvolutionStage_weights_startA),
         .shiftA(ConvolutionStage_weights_shiftA),
         .incrA(ConvolutionStage_weights_incrA),
         .reverseA(ConvolutionStage_weights_reverseA),
         .extA(ConvolutionStage_weights_extA),
         .in0_wr(ConvolutionStage_weights_in0_wr),
         .iter2A(ConvolutionStage_weights_iter2A),
         .per2A(ConvolutionStage_weights_per2A),
         .shift2A(ConvolutionStage_weights_shift2A),
         .incr2A(ConvolutionStage_weights_incr2A),
         .iterB(ConvolutionStage_weights_iterB),
         .perB(ConvolutionStage_weights_perB),
         .dutyB(ConvolutionStage_weights_dutyB),
         .startB(ConvolutionStage_weights_startB),
         .shiftB(ConvolutionStage_weights_shiftB),
         .incrB(ConvolutionStage_weights_incrB),
         .reverseB(ConvolutionStage_weights_reverseB),
         .extB(ConvolutionStage_weights_extB),
         .in1_wr(ConvolutionStage_weights_in1_wr),
         .iter2B(ConvolutionStage_weights_iter2B),
         .per2B(ConvolutionStage_weights_per2B),
         .shift2B(ConvolutionStage_weights_shift2B),
         .incr2B(ConvolutionStage_weights_incr2B),
         .delay0(delay1),
         .delay1(delay2),
         .valid(memoryMappedEnable[0]),
         .wstrb(wstrb),
         .addr(addr[9:0]),
         .rdata(unitRData[0]),
         .ready(unitReady[0]),
         .wdata(wdata),
         .run(run),

         .done(unitDone[1]),
         .clk(clk),
         .rst(rst)
      );
         Muladd  muladd_2 (
         .out0(output_3_0),
         .in0(output_1_0),
         .in1(output_2_0),
         .opcode(ConvolutionStage_muladd_opcode),
         .iterations(ConvolutionStage_muladd_iterations),
         .period(ConvolutionStage_muladd_period),
         .shift(ConvolutionStage_muladd_shift),
         .delay0(delay3),
         .run(run),

         .done(unitDone[2]),
         .clk(clk),
         .rst(rst)
      );
         assign out0 = comb_res;
   endmodule
