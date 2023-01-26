`timescale 1ns / 1ps
`include "global_defines.vh"
`include "system.vh"
`include "axi.vh"
`include "xversat.vh"
`include "xdefs.vh"

module VReadToVWrite #(
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
   input [31:0]     ext_addr_22,
   input [9:0]     int_addr_23,
   input [10:0]     size_24,
   input [9:0]     iterA_25,
   input [9:0]     perA_26,
   input [9:0]     dutyA_27,
   input [9:0]     shiftA_28,
   input [9:0]     incrA_29,
   input [7:0]     length_30,
   input [0:0]     pingPong_31,
   input [9:0]     iterB_32,
   input [9:0]     perB_33,
   input [9:0]     dutyB_34,
   input [9:0]     startB_35,
   input [9:0]     shiftB_36,
   input [9:0]     incrB_37,
   input [0:0]     reverseB_38,
   input [0:0]     extB_39,
   input [9:0]     iter2B_40,
   input [9:0]     per2B_41,
   input [9:0]     shift2B_42,
   input [9:0]     incr2B_43,
   input  [31:0]                   delay0,
   input  [31:0]                   delay1,
   // Databus master interface
   input [1:0]                databus_ready,
   output [1:0]               databus_valid,
   output [2 * AXI_ADDR_W-1:0]    databus_addr,
   input [`DATAPATH_W-1:0]                    databus_rdata,
   output [2 * `DATAPATH_W-1:0]   databus_wdata,
   output [2 * `DATAPATH_W/8-1:0] databus_wstrb,
   output [2 * 8-1:0]             databus_len,
   input  [1:0]               databus_last,
   input                           clk,
   input                           rst
   );

wire wor_ready;

wire [31:0] unitRdataFinal;
reg [31:0] stateRead;

wire [1:0] unitDone;
assign done = &unitDone;
wire [31:0] output_0_0 ;

VRead  read_0 (
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
         VWrite  write_1 (
         .in0(output_0_0),
         .ext_addr(ext_addr_22),
         .int_addr(int_addr_23),
         .size(size_24),
         .iterA(iterA_25),
         .perA(perA_26),
         .dutyA(dutyA_27),
         .shiftA(shiftA_28),
         .incrA(incrA_29),
         .length(length_30),
         .pingPong(pingPong_31),
         .iterB(iterB_32),
         .perB(perB_33),
         .dutyB(dutyB_34),
         .startB(startB_35),
         .shiftB(shiftB_36),
         .incrB(incrB_37),
         .reverseB(reverseB_38),
         .extB(extB_39),
         .iter2B(iter2B_40),
         .per2B(per2B_41),
         .shift2B(shift2B_42),
         .incr2B(incr2B_43),
         .delay0(delay1),
         .databus_ready(databus_ready[1 +: 1]),
         .databus_valid(databus_valid[1 +: 1]),
         .databus_addr(databus_addr[32 +: 32]),
         .databus_rdata(databus_rdata),
         .databus_wdata(databus_wdata[32 +: 32]),
         .databus_wstrb(databus_wstrb[4 +: 4]),
         .databus_len(databus_len[8 +: 8]),
         .databus_last(databus_last[1 +: 1]),
         .run(run),

         .done(unitDone[1]),
         .clk(clk),
         .rst(rst)
      );
         endmodule
