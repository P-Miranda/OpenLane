`timescale 1ns / 1ps
`include "global_defines.vh"
`include "system.vh"
`include "axi.vh"
`include "xversat.vh"
`include "xdefs.vh"

module MatrixMultiplication #(
      parameter ADDR_W = `ADDR_W,
      parameter DATA_W = `DATA_W,
      parameter AXI_ADDR_W = 32
   )
   (

   input run,
   
   output done,
   input [9:0]     iterA_00,
   input [9:0]     perA_01,
   input [9:0]     dutyA_02,
   input [9:0]     startA_03,
   input [9:0]     shiftA_04,
   input [9:0]     incrA_05,
   input [0:0]     reverseA_06,
   input [0:0]     extA_07,
   input [0:0]     in0_wr_08,
   input [9:0]     iter2A_09,
   input [9:0]     per2A_10,
   input [9:0]     shift2A_11,
   input [9:0]     incr2A_12,
   input [9:0]     iterB_13,
   input [9:0]     perB_14,
   input [9:0]     dutyB_15,
   input [9:0]     startB_16,
   input [9:0]     shiftB_17,
   input [9:0]     incrB_18,
   input [0:0]     reverseB_19,
   input [0:0]     extB_20,
   input [0:0]     in1_wr_21,
   input [9:0]     iter2B_22,
   input [9:0]     per2B_23,
   input [9:0]     shift2B_24,
   input [9:0]     incr2B_25,
   input [9:0]     iterA_26,
   input [9:0]     perA_27,
   input [9:0]     dutyA_28,
   input [9:0]     startA_29,
   input [9:0]     shiftA_30,
   input [9:0]     incrA_31,
   input [0:0]     reverseA_32,
   input [0:0]     extA_33,
   input [0:0]     in0_wr_34,
   input [9:0]     iter2A_35,
   input [9:0]     per2A_36,
   input [9:0]     shift2A_37,
   input [9:0]     incr2A_38,
   input [9:0]     iterB_39,
   input [9:0]     perB_40,
   input [9:0]     dutyB_41,
   input [9:0]     startB_42,
   input [9:0]     shiftB_43,
   input [9:0]     incrB_44,
   input [0:0]     reverseB_45,
   input [0:0]     extB_46,
   input [0:0]     in1_wr_47,
   input [9:0]     iter2B_48,
   input [9:0]     per2B_49,
   input [9:0]     shift2B_50,
   input [9:0]     incr2B_51,
   input [0:0]     opcode_52,
   input [9:0]     iterations_53,
   input [9:0]     period_54,
   input [5:0]     shift_55,
   input [9:0]     iterA_56,
   input [9:0]     perA_57,
   input [9:0]     dutyA_58,
   input [9:0]     startA_59,
   input [9:0]     shiftA_60,
   input [9:0]     incrA_61,
   input [0:0]     reverseA_62,
   input [0:0]     extA_63,
   input [0:0]     in0_wr_64,
   input [9:0]     iter2A_65,
   input [9:0]     per2A_66,
   input [9:0]     shift2A_67,
   input [9:0]     incr2A_68,
   input [9:0]     iterB_69,
   input [9:0]     perB_70,
   input [9:0]     dutyB_71,
   input [9:0]     startB_72,
   input [9:0]     shiftB_73,
   input [9:0]     incrB_74,
   input [0:0]     reverseB_75,
   input [0:0]     extB_76,
   input [0:0]     in1_wr_77,
   input [9:0]     iter2B_78,
   input [9:0]     per2B_79,
   input [9:0]     shift2B_80,
   input [9:0]     incr2B_81,
   input  [31:0]                   delay0,
   input  [31:0]                   delay1,
   input  [31:0]                   delay2,
   input  [31:0]                   delay3,
   input  [31:0]                   delay4,
   input  [31:0]                   delay5,
   input  [31:0]                   delay6,
   // data/control interface
   input                           valid,
   input [11:0] addr,
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
wire[2:0] unitReady;
reg [2:0] memoryMappedEnable;
wire [31:0] unitRData[2:0];

assign rdata = unitRdataFinal;
assign ready = wor_ready;
assign wor_ready = (|unitReady);

wire [31:0] rdata_0 , rdata_1 , rdata_2 ;

assign unitRdataFinal = (unitRData[0] |unitRData[1] |unitRData[2] );
wire [3:0] unitDone;
assign done = &unitDone;
wire [31:0] output_0_0 , output_1_0 , output_2_0 ;

// Memory mapped
always @*
begin
   memoryMappedEnable = {3{1'b0}};
   if(valid)
   begin
   if(addr[11:10] == 2'b01)
            memoryMappedEnable[0] = 1'b1;
      if(addr[11:10] == 2'b00)
            memoryMappedEnable[1] = 1'b1;
      if(addr[11:11] == 1'b1)
            memoryMappedEnable[2] = 1'b1;
      end
end
Mem  matA_0 (
         .out0(output_0_0),
         .iterA(iterA_00),
         .perA(perA_01),
         .dutyA(dutyA_02),
         .startA(startA_03),
         .shiftA(shiftA_04),
         .incrA(incrA_05),
         .reverseA(reverseA_06),
         .extA(extA_07),
         .in0_wr(in0_wr_08),
         .iter2A(iter2A_09),
         .per2A(per2A_10),
         .shift2A(shift2A_11),
         .incr2A(incr2A_12),
         .iterB(iterB_13),
         .perB(perB_14),
         .dutyB(dutyB_15),
         .startB(startB_16),
         .shiftB(shiftB_17),
         .incrB(incrB_18),
         .reverseB(reverseB_19),
         .extB(extB_20),
         .in1_wr(in1_wr_21),
         .iter2B(iter2B_22),
         .per2B(per2B_23),
         .shift2B(shift2B_24),
         .incr2B(incr2B_25),
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
         Mem  matB_1 (
         .out0(output_1_0),
         .iterA(iterA_26),
         .perA(perA_27),
         .dutyA(dutyA_28),
         .startA(startA_29),
         .shiftA(shiftA_30),
         .incrA(incrA_31),
         .reverseA(reverseA_32),
         .extA(extA_33),
         .in0_wr(in0_wr_34),
         .iter2A(iter2A_35),
         .per2A(per2A_36),
         .shift2A(shift2A_37),
         .incr2A(incr2A_38),
         .iterB(iterB_39),
         .perB(perB_40),
         .dutyB(dutyB_41),
         .startB(startB_42),
         .shiftB(shiftB_43),
         .incrB(incrB_44),
         .reverseB(reverseB_45),
         .extB(extB_46),
         .in1_wr(in1_wr_47),
         .iter2B(iter2B_48),
         .per2B(per2B_49),
         .shift2B(shift2B_50),
         .incr2B(incr2B_51),
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
         Muladd  ma_2 (
         .out0(output_2_0),
         .in0(output_0_0),
         .in1(output_1_0),
         .opcode(opcode_52),
         .iterations(iterations_53),
         .period(period_54),
         .shift(shift_55),
         .delay0(delay4),
         .run(run),

         .done(unitDone[2]),
         .clk(clk),
         .rst(rst)
      );
         Mem  res_3 (
         .in0(output_2_0),
         .iterA(iterA_56),
         .perA(perA_57),
         .dutyA(dutyA_58),
         .startA(startA_59),
         .shiftA(shiftA_60),
         .incrA(incrA_61),
         .reverseA(reverseA_62),
         .extA(extA_63),
         .in0_wr(in0_wr_64),
         .iter2A(iter2A_65),
         .per2A(per2A_66),
         .shift2A(shift2A_67),
         .incr2A(incr2A_68),
         .iterB(iterB_69),
         .perB(perB_70),
         .dutyB(dutyB_71),
         .startB(startB_72),
         .shiftB(shiftB_73),
         .incrB(incrB_74),
         .reverseB(reverseB_75),
         .extB(extB_76),
         .in1_wr(in1_wr_77),
         .iter2B(iter2B_78),
         .per2B(per2B_79),
         .shift2B(shift2B_80),
         .incr2B(incr2B_81),
         .delay0(delay5),
         .delay1(delay6),
         .valid(memoryMappedEnable[2]),
         .wstrb(wstrb),
         .addr(addr[9:0]),
         .rdata(unitRData[2]),
         .ready(unitReady[2]),
         .wdata(wdata),
         .run(run),

         .done(unitDone[3]),
         .clk(clk),
         .rst(rst)
      );
         endmodule
