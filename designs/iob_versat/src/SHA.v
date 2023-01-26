`timescale 1ns / 1ps
`include "global_defines.vh"
`include "system.vh"
`include "axi.vh"
`include "xversat.vh"
`include "xdefs.vh"

module SHA #(
      parameter ADDR_W = `ADDR_W,
      parameter DATA_W = `DATA_W,
      parameter AXI_ADDR_W = 32
   )
   (

   input run,
   
   output done,
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
   input [0:0]     enabled_22,
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
   input [5:0]     SHA_buffer0_amount,
   input [5:0]     SHA_buffer1_amount,
   input [5:0]     SHA_buffer2_amount,
   output [31:0]    currentValue_00_00_00,
   output [31:0]    currentValue_00_01_01,
   output [31:0]    currentValue_00_02_02,
   output [31:0]    currentValue_00_03_03,
   output [31:0]    currentValue_00_04_04,
   output [31:0]    currentValue_00_05_05,
   output [31:0]    currentValue_00_06_06,
   output [31:0]    currentValue_00_07_07,
   input  [31:0]                   delay0,
   input  [31:0]                   delay1,
   input  [31:0]                   delay2,
   input  [31:0]                   delay3,
   input  [31:0]                   delay4,
   input  [31:0]                   delay5,
   input  [31:0]                   delay6,
   input  [31:0]                   delay7,
   input  [31:0]                   delay8,
   input  [31:0]                   delay9,
   input  [31:0]                   delay10,
   input  [31:0]                   delay11,
   input  [31:0]                   delay12,
   input  [31:0]                   delay13,
   input  [31:0]                   delay14,
   input  [31:0]                   delay15,
   input  [31:0]                   delay16,
   input  [31:0]                   delay17,
   input  [31:0]                   delay18,
   input  [31:0]                   delay19,
   input  [31:0]                   delay20,
   input  [31:0]                   delay21,
   input  [31:0]                   delay22,
   input  [31:0]                   delay23,
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
   input [12:0] addr,
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
wire[4:0] unitReady;
reg [4:0] memoryMappedEnable;
wire [31:0] unitRData[4:0];

assign rdata = unitRdataFinal;
assign ready = wor_ready;
assign wor_ready = (|unitReady);

wire [31:0] rdata_0 , rdata_1 , rdata_2 , rdata_3 , rdata_4 ;

assign unitRdataFinal = (unitRData[0] |unitRData[1] |unitRData[2] |unitRData[3] |unitRData[4] );
wire [12:0] unitDone;
assign done = &unitDone;
wire [31:0] output_0_0 , output_1_0 , output_2_0 , output_2_1 , output_2_2 , output_2_3 , output_2_4 , output_2_5 , output_2_6 , output_2_7 , output_3_0 , output_3_1 , output_3_2 , output_3_3 , output_3_4 , output_3_5 , output_3_6 , output_3_7 , output_4_0 , output_4_1 , output_4_2 , output_4_3 , output_4_4 , output_4_5 , output_4_6 , output_4_7 , output_5_0 , output_5_1 , output_5_2 , output_5_3 , output_5_4 , output_5_5 , output_5_6 , output_5_7 , output_6_0 , output_7_0 , output_8_0 , output_9_0 , output_10_0 , output_11_0 , output_12_0 , output_13_0 , output_13_1 , output_13_2 , output_13_3 , output_13_4 , output_13_5 , output_13_6 , output_13_7 , output_14_0 , output_15_0 , output_16_0 ;

// Memory mapped
always @*
begin
   memoryMappedEnable = {5{1'b0}};
   if(valid)
   begin
   if(addr[12:11] == 2'b01)
            memoryMappedEnable[0] = 1'b1;
      if(addr[12:11] == 2'b11)
            memoryMappedEnable[1] = 1'b1;
      if(addr[12:10] == 3'b000)
            memoryMappedEnable[2] = 1'b1;
      if(addr[12:11] == 2'b10)
            memoryMappedEnable[3] = 1'b1;
      if(addr[12:10] == 3'b001)
            memoryMappedEnable[4] = 1'b1;
      end
end
VRead #(.ADDR_W(5)) MemRead_0 (
         .out0(output_0_0),
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
         SwapEndian  Swap_1 (
         .out0(output_1_0),
         .in0(output_0_0),
         .enabled(enabled_22),
         .run(run),

         .clk(clk),
         .rst(rst)
      );
         xunitF  F0_2 (
         .out0(output_2_0),
         .out1(output_2_1),
         .out2(output_2_2),
         .out3(output_2_3),
         .out4(output_2_4),
         .out5(output_2_5),
         .out6(output_2_6),
         .out7(output_2_7),
         .in0(output_13_0),
         .in1(output_13_1),
         .in2(output_13_2),
         .in3(output_13_3),
         .in4(output_13_4),
         .in5(output_13_5),
         .in6(output_13_6),
         .in7(output_13_7),
         .in8(output_9_0),
         .in9(output_16_0),
         .delay0(delay1),
         .run(run),

         .done(unitDone[1]),
         .clk(clk),
         .rst(rst)
      );
         xunitF  F1_3 (
         .out0(output_3_0),
         .out1(output_3_1),
         .out2(output_3_2),
         .out3(output_3_3),
         .out4(output_3_4),
         .out5(output_3_5),
         .out6(output_3_6),
         .out7(output_3_7),
         .in0(output_2_0),
         .in1(output_2_1),
         .in2(output_2_2),
         .in3(output_2_3),
         .in4(output_2_4),
         .in5(output_2_5),
         .in6(output_2_6),
         .in7(output_2_7),
         .in8(output_10_0),
         .in9(output_15_0),
         .delay0(delay2),
         .run(run),

         .done(unitDone[2]),
         .clk(clk),
         .rst(rst)
      );
         xunitF  F2_4 (
         .out0(output_4_0),
         .out1(output_4_1),
         .out2(output_4_2),
         .out3(output_4_3),
         .out4(output_4_4),
         .out5(output_4_5),
         .out6(output_4_6),
         .out7(output_4_7),
         .in0(output_3_0),
         .in1(output_3_1),
         .in2(output_3_2),
         .in3(output_3_3),
         .in4(output_3_4),
         .in5(output_3_5),
         .in6(output_3_6),
         .in7(output_3_7),
         .in8(output_11_0),
         .in9(output_14_0),
         .delay0(delay3),
         .run(run),

         .done(unitDone[3]),
         .clk(clk),
         .rst(rst)
      );
         xunitF  F3_5 (
         .out0(output_5_0),
         .out1(output_5_1),
         .out2(output_5_2),
         .out3(output_5_3),
         .out4(output_5_4),
         .out5(output_5_5),
         .out6(output_5_6),
         .out7(output_5_7),
         .in0(output_4_0),
         .in1(output_4_1),
         .in2(output_4_2),
         .in3(output_4_3),
         .in4(output_4_4),
         .in5(output_4_5),
         .in6(output_4_6),
         .in7(output_4_7),
         .in8(output_12_0),
         .in9(output_8_0),
         .delay0(delay4),
         .run(run),

         .done(unitDone[4]),
         .clk(clk),
         .rst(rst)
      );
         xunitM  M0_6 (
         .out0(output_6_0),
         .in0(output_1_0),
         .delay0(delay5),
         .run(run),

         .done(unitDone[5]),
         .clk(clk),
         .rst(rst)
      );
         xunitM  M1_7 (
         .out0(output_7_0),
         .in0(output_6_0),
         .delay0(delay6),
         .run(run),

         .done(unitDone[6]),
         .clk(clk),
         .rst(rst)
      );
         xunitM  M2_8 (
         .out0(output_8_0),
         .in0(output_7_0),
         .delay0(delay7),
         .run(run),

         .done(unitDone[7]),
         .clk(clk),
         .rst(rst)
      );
         Constants  cMem0_9 (
         .out0(output_9_0),
         .Constants_mem_iterA(Constants_mem_iterA),
         .Constants_mem_perA(Constants_mem_perA),
         .Constants_mem_dutyA(Constants_mem_dutyA),
         .Constants_mem_startA(Constants_mem_startA),
         .Constants_mem_shiftA(Constants_mem_shiftA),
         .Constants_mem_incrA(Constants_mem_incrA),
         .Constants_mem_reverseA(Constants_mem_reverseA),
         .Constants_mem_extA(Constants_mem_extA),
         .Constants_mem_in0_wr(Constants_mem_in0_wr),
         .Constants_mem_iter2A(Constants_mem_iter2A),
         .Constants_mem_per2A(Constants_mem_per2A),
         .Constants_mem_shift2A(Constants_mem_shift2A),
         .Constants_mem_incr2A(Constants_mem_incr2A),
         .Constants_mem_iterB(Constants_mem_iterB),
         .Constants_mem_perB(Constants_mem_perB),
         .Constants_mem_dutyB(Constants_mem_dutyB),
         .Constants_mem_startB(Constants_mem_startB),
         .Constants_mem_shiftB(Constants_mem_shiftB),
         .Constants_mem_incrB(Constants_mem_incrB),
         .Constants_mem_reverseB(Constants_mem_reverseB),
         .Constants_mem_extB(Constants_mem_extB),
         .Constants_mem_in1_wr(Constants_mem_in1_wr),
         .Constants_mem_iter2B(Constants_mem_iter2B),
         .Constants_mem_per2B(Constants_mem_per2B),
         .Constants_mem_shift2B(Constants_mem_shift2B),
         .Constants_mem_incr2B(Constants_mem_incr2B),
         .delay0(delay8),
         .delay1(delay9),
         .valid(memoryMappedEnable[0]),
         .wstrb(wstrb),
         .addr(addr[9:0]),
         .rdata(unitRData[0]),
         .ready(unitReady[0]),
         .wdata(wdata),
         .run(run),

         .done(unitDone[8]),
         .clk(clk),
         .rst(rst)
      );
         Constants  cMem1_10 (
         .out0(output_10_0),
         .Constants_mem_iterA(Constants_mem_iterA),
         .Constants_mem_perA(Constants_mem_perA),
         .Constants_mem_dutyA(Constants_mem_dutyA),
         .Constants_mem_startA(Constants_mem_startA),
         .Constants_mem_shiftA(Constants_mem_shiftA),
         .Constants_mem_incrA(Constants_mem_incrA),
         .Constants_mem_reverseA(Constants_mem_reverseA),
         .Constants_mem_extA(Constants_mem_extA),
         .Constants_mem_in0_wr(Constants_mem_in0_wr),
         .Constants_mem_iter2A(Constants_mem_iter2A),
         .Constants_mem_per2A(Constants_mem_per2A),
         .Constants_mem_shift2A(Constants_mem_shift2A),
         .Constants_mem_incr2A(Constants_mem_incr2A),
         .Constants_mem_iterB(Constants_mem_iterB),
         .Constants_mem_perB(Constants_mem_perB),
         .Constants_mem_dutyB(Constants_mem_dutyB),
         .Constants_mem_startB(Constants_mem_startB),
         .Constants_mem_shiftB(Constants_mem_shiftB),
         .Constants_mem_incrB(Constants_mem_incrB),
         .Constants_mem_reverseB(Constants_mem_reverseB),
         .Constants_mem_extB(Constants_mem_extB),
         .Constants_mem_in1_wr(Constants_mem_in1_wr),
         .Constants_mem_iter2B(Constants_mem_iter2B),
         .Constants_mem_per2B(Constants_mem_per2B),
         .Constants_mem_shift2B(Constants_mem_shift2B),
         .Constants_mem_incr2B(Constants_mem_incr2B),
         .delay0(delay10),
         .delay1(delay11),
         .valid(memoryMappedEnable[1]),
         .wstrb(wstrb),
         .addr(addr[9:0]),
         .rdata(unitRData[1]),
         .ready(unitReady[1]),
         .wdata(wdata),
         .run(run),

         .done(unitDone[9]),
         .clk(clk),
         .rst(rst)
      );
         Constants  cMem2_11 (
         .out0(output_11_0),
         .Constants_mem_iterA(Constants_mem_iterA),
         .Constants_mem_perA(Constants_mem_perA),
         .Constants_mem_dutyA(Constants_mem_dutyA),
         .Constants_mem_startA(Constants_mem_startA),
         .Constants_mem_shiftA(Constants_mem_shiftA),
         .Constants_mem_incrA(Constants_mem_incrA),
         .Constants_mem_reverseA(Constants_mem_reverseA),
         .Constants_mem_extA(Constants_mem_extA),
         .Constants_mem_in0_wr(Constants_mem_in0_wr),
         .Constants_mem_iter2A(Constants_mem_iter2A),
         .Constants_mem_per2A(Constants_mem_per2A),
         .Constants_mem_shift2A(Constants_mem_shift2A),
         .Constants_mem_incr2A(Constants_mem_incr2A),
         .Constants_mem_iterB(Constants_mem_iterB),
         .Constants_mem_perB(Constants_mem_perB),
         .Constants_mem_dutyB(Constants_mem_dutyB),
         .Constants_mem_startB(Constants_mem_startB),
         .Constants_mem_shiftB(Constants_mem_shiftB),
         .Constants_mem_incrB(Constants_mem_incrB),
         .Constants_mem_reverseB(Constants_mem_reverseB),
         .Constants_mem_extB(Constants_mem_extB),
         .Constants_mem_in1_wr(Constants_mem_in1_wr),
         .Constants_mem_iter2B(Constants_mem_iter2B),
         .Constants_mem_per2B(Constants_mem_per2B),
         .Constants_mem_shift2B(Constants_mem_shift2B),
         .Constants_mem_incr2B(Constants_mem_incr2B),
         .delay0(delay12),
         .delay1(delay13),
         .valid(memoryMappedEnable[2]),
         .wstrb(wstrb),
         .addr(addr[9:0]),
         .rdata(unitRData[2]),
         .ready(unitReady[2]),
         .wdata(wdata),
         .run(run),

         .done(unitDone[10]),
         .clk(clk),
         .rst(rst)
      );
         Constants  cMem3_12 (
         .out0(output_12_0),
         .Constants_mem_iterA(Constants_mem_iterA),
         .Constants_mem_perA(Constants_mem_perA),
         .Constants_mem_dutyA(Constants_mem_dutyA),
         .Constants_mem_startA(Constants_mem_startA),
         .Constants_mem_shiftA(Constants_mem_shiftA),
         .Constants_mem_incrA(Constants_mem_incrA),
         .Constants_mem_reverseA(Constants_mem_reverseA),
         .Constants_mem_extA(Constants_mem_extA),
         .Constants_mem_in0_wr(Constants_mem_in0_wr),
         .Constants_mem_iter2A(Constants_mem_iter2A),
         .Constants_mem_per2A(Constants_mem_per2A),
         .Constants_mem_shift2A(Constants_mem_shift2A),
         .Constants_mem_incr2A(Constants_mem_incr2A),
         .Constants_mem_iterB(Constants_mem_iterB),
         .Constants_mem_perB(Constants_mem_perB),
         .Constants_mem_dutyB(Constants_mem_dutyB),
         .Constants_mem_startB(Constants_mem_startB),
         .Constants_mem_shiftB(Constants_mem_shiftB),
         .Constants_mem_incrB(Constants_mem_incrB),
         .Constants_mem_reverseB(Constants_mem_reverseB),
         .Constants_mem_extB(Constants_mem_extB),
         .Constants_mem_in1_wr(Constants_mem_in1_wr),
         .Constants_mem_iter2B(Constants_mem_iter2B),
         .Constants_mem_per2B(Constants_mem_per2B),
         .Constants_mem_shift2B(Constants_mem_shift2B),
         .Constants_mem_incr2B(Constants_mem_incr2B),
         .delay0(delay14),
         .delay1(delay15),
         .valid(memoryMappedEnable[3]),
         .wstrb(wstrb),
         .addr(addr[9:0]),
         .rdata(unitRData[3]),
         .ready(unitReady[3]),
         .wdata(wdata),
         .run(run),

         .done(unitDone[11]),
         .clk(clk),
         .rst(rst)
      );
         ShaState  State_13 (
         .out0(output_13_0),
         .out1(output_13_1),
         .out2(output_13_2),
         .out3(output_13_3),
         .out4(output_13_4),
         .out5(output_13_5),
         .out6(output_13_6),
         .out7(output_13_7),
         .in0(output_5_0),
         .in1(output_5_1),
         .in2(output_5_2),
         .in3(output_5_3),
         .in4(output_5_4),
         .in5(output_5_5),
         .in6(output_5_6),
         .in7(output_5_7),
         .delay0(delay16),
         .delay1(delay17),
         .delay2(delay18),
         .delay3(delay19),
         .delay4(delay20),
         .delay5(delay21),
         .delay6(delay22),
         .delay7(delay23),
         .currentValue_00_00(currentValue_00_00_00),
         .currentValue_00_01(currentValue_00_01_01),
         .currentValue_00_02(currentValue_00_02_02),
         .currentValue_00_03(currentValue_00_03_03),
         .currentValue_00_04(currentValue_00_04_04),
         .currentValue_00_05(currentValue_00_05_05),
         .currentValue_00_06(currentValue_00_06_06),
         .currentValue_00_07(currentValue_00_07_07),
         .valid(memoryMappedEnable[4]),
         .wstrb(wstrb),
         .addr(addr[2:0]),
         .rdata(unitRData[4]),
         .ready(unitReady[4]),
         .wdata(wdata),
         .run(run),

         .done(unitDone[12]),
         .clk(clk),
         .rst(rst)
      );
         Buffer  buffer0_14 (
         .out0(output_14_0),
         .in0(output_7_0),
         .amount(SHA_buffer0_amount),
         .run(run),

         .clk(clk),
         .rst(rst)
      );
         Buffer  buffer1_15 (
         .out0(output_15_0),
         .in0(output_6_0),
         .amount(SHA_buffer1_amount),
         .run(run),

         .clk(clk),
         .rst(rst)
      );
         Buffer  buffer2_16 (
         .out0(output_16_0),
         .in0(output_1_0),
         .amount(SHA_buffer2_amount),
         .run(run),

         .clk(clk),
         .rst(rst)
      );
         endmodule
