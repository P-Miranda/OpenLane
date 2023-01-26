`timescale 1ns / 1ps
`include "global_defines.vh"
`include "system.vh"
`include "axi.vh"
`include "xversat.vh"
`include "xdefs.vh"

module SemiComplexAdder #(
      parameter ADDR_W = `ADDR_W,
      parameter DATA_W = `DATA_W,
      parameter AXI_ADDR_W = 32
   )
   (

   input run,
   
   output done,
   input [31:0]     constant_00,
   input [9:0]     iterA_01,
   input [9:0]     perA_02,
   input [9:0]     dutyA_03,
   input [9:0]     startA_04,
   input [9:0]     shiftA_05,
   input [9:0]     incrA_06,
   input [0:0]     reverseA_07,
   input [0:0]     extA_08,
   input [0:0]     in0_wr_09,
   input [9:0]     iter2A_10,
   input [9:0]     per2A_11,
   input [9:0]     shift2A_12,
   input [9:0]     incr2A_13,
   input [9:0]     iterB_14,
   input [9:0]     perB_15,
   input [9:0]     dutyB_16,
   input [9:0]     startB_17,
   input [9:0]     shiftB_18,
   input [9:0]     incrB_19,
   input [0:0]     reverseB_20,
   input [0:0]     extB_21,
   input [0:0]     in1_wr_22,
   input [9:0]     iter2B_23,
   input [9:0]     per2B_24,
   input [9:0]     shift2B_25,
   input [9:0]     incr2B_26,
   input [9:0]     iterA_27,
   input [9:0]     perA_28,
   input [9:0]     dutyA_29,
   input [9:0]     startA_30,
   input [9:0]     shiftA_31,
   input [9:0]     incrA_32,
   input [0:0]     reverseA_33,
   input [0:0]     extA_34,
   input [0:0]     in0_wr_35,
   input [9:0]     iter2A_36,
   input [9:0]     per2A_37,
   input [9:0]     shift2A_38,
   input [9:0]     incr2A_39,
   input [9:0]     iterB_40,
   input [9:0]     perB_41,
   input [9:0]     dutyB_42,
   input [9:0]     startB_43,
   input [9:0]     shiftB_44,
   input [9:0]     incrB_45,
   input [0:0]     reverseB_46,
   input [0:0]     extB_47,
   input [0:0]     in1_wr_48,
   input [9:0]     iter2B_49,
   input [9:0]     per2B_50,
   input [9:0]     shift2B_51,
   input [9:0]     incr2B_52,
   input  [31:0]                   delay0,
   input  [31:0]                   delay1,
   input  [31:0]                   delay2,
   input  [31:0]                   delay3,
   // data/control interface
   input                           valid,
   input [10:0] addr,
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
wire[1:0] unitReady;
reg [1:0] memoryMappedEnable;
wire [31:0] unitRData[1:0];

assign rdata = unitRdataFinal;
assign ready = wor_ready;
assign wor_ready = (|unitReady);

wire [31:0] rdata_0 , rdata_1 ;

assign unitRdataFinal = (unitRData[0] |unitRData[1] );
wire [1:0] unitDone;
assign done = &unitDone;
wire [31:0] output_0_0 , output_1_0 , output_3_0 ;

// Memory mapped
always @*
begin
   memoryMappedEnable = {2{1'b0}};
   if(valid)
   begin
   if(addr[10:10] == 1'b1)
            memoryMappedEnable[0] = 1'b1;
      if(addr[10:10] == 1'b0)
            memoryMappedEnable[1] = 1'b1;
      end
end
reg [31:0] comb_d ; 

always @*
begin
comb_d = output_0_0 + output_1_0;
      end
Const  d1_0 (
         .out0(output_0_0),
         .constant(constant_00),
         .run(run),

         .clk(clk),
         .rst(rst)
      );
         Mem  d2_1 (
         .out0(output_1_0),
         .iterA(iterA_01),
         .perA(perA_02),
         .dutyA(dutyA_03),
         .startA(startA_04),
         .shiftA(shiftA_05),
         .incrA(incrA_06),
         .reverseA(reverseA_07),
         .extA(extA_08),
         .in0_wr(in0_wr_09),
         .iter2A(iter2A_10),
         .per2A(per2A_11),
         .shift2A(shift2A_12),
         .incr2A(incr2A_13),
         .iterB(iterB_14),
         .perB(perB_15),
         .dutyB(dutyB_16),
         .startB(startB_17),
         .shiftB(shiftB_18),
         .incrB(incrB_19),
         .reverseB(reverseB_20),
         .extB(extB_21),
         .in1_wr(in1_wr_22),
         .iter2B(iter2B_23),
         .per2B(per2B_24),
         .shift2B(shift2B_25),
         .incr2B(incr2B_26),
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
         Mem  memOut3_2 (
         .in0(comb_d),
         .iterA(iterA_27),
         .perA(perA_28),
         .dutyA(dutyA_29),
         .startA(startA_30),
         .shiftA(shiftA_31),
         .incrA(incrA_32),
         .reverseA(reverseA_33),
         .extA(extA_34),
         .in0_wr(in0_wr_35),
         .iter2A(iter2A_36),
         .per2A(per2A_37),
         .shift2A(shift2A_38),
         .incr2A(incr2A_39),
         .iterB(iterB_40),
         .perB(perB_41),
         .dutyB(dutyB_42),
         .startB(startB_43),
         .shiftB(shiftB_44),
         .incrB(incrB_45),
         .reverseB(reverseB_46),
         .extB(extB_47),
         .in1_wr(in1_wr_48),
         .iter2B(iter2B_49),
         .per2B(per2B_50),
         .shift2B(shift2B_51),
         .incr2B(incr2B_52),
         .delay0(delay2),
         .delay1(delay3),
         .valid(memoryMappedEnable[1]),
         .wstrb(wstrb),
         .addr(addr[9:0]),
         .rdata(unitRData[1]),
         .ready(unitReady[1]),
         .wdata(wdata),
         .run(run),

         .done(unitDone[1]),
         .clk(clk),
         .rst(rst)
      );
         endmodule
