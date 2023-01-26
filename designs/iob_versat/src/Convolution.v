`timescale 1ns / 1ps
`include "global_defines.vh"
`include "system.vh"
`include "axi.vh"
`include "xversat.vh"
`include "xdefs.vh"

module Convolution #(
      parameter ADDR_W = `ADDR_W,
      parameter DATA_W = `DATA_W,
      parameter AXI_ADDR_W = 32
   )
   (

   input run,
   
   output done,
   input [31:0]     ext_addr_00_00,
   input [9:0]     int_addr_01_01,
   input [10:0]     size_02_02,
   input [9:0]     iterA_03_03,
   input [9:0]     perA_04_04,
   input [9:0]     dutyA_05_05,
   input [9:0]     shiftA_06_06,
   input [9:0]     incrA_07_07,
   input [7:0]     length_08_08,
   input [0:0]     pingPong_09_09,
   input [9:0]     iterB_10_10,
   input [9:0]     perB_11_11,
   input [9:0]     dutyB_12_12,
   input [9:0]     startB_13_13,
   input [9:0]     shiftB_14_14,
   input [9:0]     incrB_15_15,
   input [0:0]     reverseB_16_16,
   input [0:0]     extB_17_17,
   input [9:0]     iter2B_18_18,
   input [9:0]     per2B_19_19,
   input [9:0]     shift2B_20_20,
   input [9:0]     incr2B_21_21,
   input [31:0]     ext_addr_00_22,
   input [9:0]     int_addr_01_23,
   input [10:0]     size_02_24,
   input [9:0]     iterA_03_25,
   input [9:0]     perA_04_26,
   input [9:0]     dutyA_05_27,
   input [9:0]     shiftA_06_28,
   input [9:0]     incrA_07_29,
   input [7:0]     length_08_30,
   input [0:0]     pingPong_09_31,
   input [9:0]     iterB_10_32,
   input [9:0]     perB_11_33,
   input [9:0]     dutyB_12_34,
   input [9:0]     startB_13_35,
   input [9:0]     shiftB_14_36,
   input [9:0]     incrB_15_37,
   input [0:0]     reverseB_16_38,
   input [0:0]     extB_17_39,
   input [9:0]     iter2B_18_40,
   input [9:0]     per2B_19_41,
   input [9:0]     shift2B_20_42,
   input [9:0]     incr2B_21_43,
   input [31:0]     ext_addr_00_44,
   input [9:0]     int_addr_01_45,
   input [10:0]     size_02_46,
   input [9:0]     iterA_03_47,
   input [9:0]     perA_04_48,
   input [9:0]     dutyA_05_49,
   input [9:0]     shiftA_06_50,
   input [9:0]     incrA_07_51,
   input [7:0]     length_08_52,
   input [0:0]     pingPong_09_53,
   input [9:0]     iterB_10_54,
   input [9:0]     perB_11_55,
   input [9:0]     dutyB_12_56,
   input [9:0]     startB_13_57,
   input [9:0]     shiftB_14_58,
   input [9:0]     incrB_15_59,
   input [0:0]     reverseB_16_60,
   input [0:0]     extB_17_61,
   input [9:0]     iter2B_18_62,
   input [9:0]     per2B_19_63,
   input [9:0]     shift2B_20_64,
   input [9:0]     incr2B_21_65,
   input [31:0]     ext_addr_00_66,
   input [9:0]     int_addr_01_67,
   input [10:0]     size_02_68,
   input [9:0]     iterA_03_69,
   input [9:0]     perA_04_70,
   input [9:0]     dutyA_05_71,
   input [9:0]     shiftA_06_72,
   input [9:0]     incrA_07_73,
   input [7:0]     length_08_74,
   input [0:0]     pingPong_09_75,
   input [9:0]     iterB_10_76,
   input [9:0]     perB_11_77,
   input [9:0]     dutyB_12_78,
   input [9:0]     startB_13_79,
   input [9:0]     shiftB_14_80,
   input [9:0]     incrB_15_81,
   input [0:0]     reverseB_16_82,
   input [0:0]     extB_17_83,
   input [9:0]     iter2B_18_84,
   input [9:0]     per2B_19_85,
   input [9:0]     shift2B_20_86,
   input [9:0]     incr2B_21_87,
   input [31:0]     ext_addr_00_88,
   input [9:0]     int_addr_01_89,
   input [10:0]     size_02_90,
   input [9:0]     iterA_03_91,
   input [9:0]     perA_04_92,
   input [9:0]     dutyA_05_93,
   input [9:0]     shiftA_06_94,
   input [9:0]     incrA_07_95,
   input [7:0]     length_08_96,
   input [0:0]     pingPong_09_97,
   input [9:0]     iterB_10_98,
   input [9:0]     perB_11_99,
   input [9:0]     dutyB_12_100,
   input [9:0]     startB_13_101,
   input [9:0]     shiftB_14_102,
   input [9:0]     incrB_15_103,
   input [0:0]     reverseB_16_104,
   input [0:0]     extB_17_105,
   input [9:0]     iter2B_18_106,
   input [9:0]     per2B_19_107,
   input [9:0]     shift2B_20_108,
   input [9:0]     incr2B_21_109,
   input [9:0]     iterA_110,
   input [9:0]     perA_111,
   input [9:0]     dutyA_112,
   input [9:0]     startA_113,
   input [9:0]     shiftA_114,
   input [9:0]     incrA_115,
   input [0:0]     reverseA_116,
   input [0:0]     extA_117,
   input [0:0]     in0_wr_118,
   input [9:0]     iter2A_119,
   input [9:0]     per2A_120,
   input [9:0]     shift2A_121,
   input [9:0]     incr2A_122,
   input [9:0]     iterB_123,
   input [9:0]     perB_124,
   input [9:0]     dutyB_125,
   input [9:0]     startB_126,
   input [9:0]     shiftB_127,
   input [9:0]     incrB_128,
   input [0:0]     reverseB_129,
   input [0:0]     extB_130,
   input [0:0]     in1_wr_131,
   input [9:0]     iter2B_132,
   input [9:0]     per2B_133,
   input [9:0]     shift2B_134,
   input [9:0]     incr2B_135,
   input [31:0]     constant_136,
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
   // Databus master interface
   input [4:0]                databus_ready,
   output [4:0]               databus_valid,
   output [5 * AXI_ADDR_W-1:0]    databus_addr,
   input [`DATAPATH_W-1:0]                    databus_rdata,
   output [5 * `DATAPATH_W-1:0]   databus_wdata,
   output [5 * `DATAPATH_W/8-1:0] databus_wstrb,
   output [5 * 8-1:0]             databus_len,
   input  [4:0]               databus_last,
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
wire[5:0] unitReady;
reg [5:0] memoryMappedEnable;
wire [31:0] unitRData[5:0];

assign rdata = unitRdataFinal;
assign ready = wor_ready;
assign wor_ready = (|unitReady);

wire [31:0] rdata_0 , rdata_1 , rdata_2 , rdata_3 , rdata_4 , rdata_5 ;

assign unitRdataFinal = (unitRData[0] |unitRData[1] |unitRData[2] |unitRData[3] |unitRData[4] |unitRData[5] );
wire [5:0] unitDone;
assign done = &unitDone;
wire [31:0] output_0_0 , output_1_0 , output_2_0 , output_3_0 , output_4_0 , output_6_0 ;

// Memory mapped
always @*
begin
   memoryMappedEnable = {6{1'b0}};
   if(valid)
   begin
   if(addr[12:10] == 3'b001)
            memoryMappedEnable[0] = 1'b1;
      if(addr[12:11] == 2'b11)
            memoryMappedEnable[1] = 1'b1;
      if(addr[12:10] == 3'b000)
            memoryMappedEnable[2] = 1'b1;
      if(addr[12:11] == 2'b10)
            memoryMappedEnable[3] = 1'b1;
      if(addr[12:10] == 3'b010)
            memoryMappedEnable[4] = 1'b1;
      if(addr[12:10] == 3'b011)
            memoryMappedEnable[5] = 1'b1;
      end
end
ConvolutionStage  stage0_0 (
         .out0(output_0_0),
         .in0(output_6_0),
         .ext_addr_00(ext_addr_00_00),
         .int_addr_01(int_addr_01_01),
         .size_02(size_02_02),
         .iterA_03(iterA_03_03),
         .perA_04(perA_04_04),
         .dutyA_05(dutyA_05_05),
         .shiftA_06(shiftA_06_06),
         .incrA_07(incrA_07_07),
         .length_08(length_08_08),
         .pingPong_09(pingPong_09_09),
         .iterB_10(iterB_10_10),
         .perB_11(perB_11_11),
         .dutyB_12(dutyB_12_12),
         .startB_13(startB_13_13),
         .shiftB_14(shiftB_14_14),
         .incrB_15(incrB_15_15),
         .reverseB_16(reverseB_16_16),
         .extB_17(extB_17_17),
         .iter2B_18(iter2B_18_18),
         .per2B_19(per2B_19_19),
         .shift2B_20(shift2B_20_20),
         .incr2B_21(incr2B_21_21),
         .ConvolutionStage_weights_iterA(ConvolutionStage_weights_iterA),
         .ConvolutionStage_weights_perA(ConvolutionStage_weights_perA),
         .ConvolutionStage_weights_dutyA(ConvolutionStage_weights_dutyA),
         .ConvolutionStage_weights_startA(ConvolutionStage_weights_startA),
         .ConvolutionStage_weights_shiftA(ConvolutionStage_weights_shiftA),
         .ConvolutionStage_weights_incrA(ConvolutionStage_weights_incrA),
         .ConvolutionStage_weights_reverseA(ConvolutionStage_weights_reverseA),
         .ConvolutionStage_weights_extA(ConvolutionStage_weights_extA),
         .ConvolutionStage_weights_in0_wr(ConvolutionStage_weights_in0_wr),
         .ConvolutionStage_weights_iter2A(ConvolutionStage_weights_iter2A),
         .ConvolutionStage_weights_per2A(ConvolutionStage_weights_per2A),
         .ConvolutionStage_weights_shift2A(ConvolutionStage_weights_shift2A),
         .ConvolutionStage_weights_incr2A(ConvolutionStage_weights_incr2A),
         .ConvolutionStage_weights_iterB(ConvolutionStage_weights_iterB),
         .ConvolutionStage_weights_perB(ConvolutionStage_weights_perB),
         .ConvolutionStage_weights_dutyB(ConvolutionStage_weights_dutyB),
         .ConvolutionStage_weights_startB(ConvolutionStage_weights_startB),
         .ConvolutionStage_weights_shiftB(ConvolutionStage_weights_shiftB),
         .ConvolutionStage_weights_incrB(ConvolutionStage_weights_incrB),
         .ConvolutionStage_weights_reverseB(ConvolutionStage_weights_reverseB),
         .ConvolutionStage_weights_extB(ConvolutionStage_weights_extB),
         .ConvolutionStage_weights_in1_wr(ConvolutionStage_weights_in1_wr),
         .ConvolutionStage_weights_iter2B(ConvolutionStage_weights_iter2B),
         .ConvolutionStage_weights_per2B(ConvolutionStage_weights_per2B),
         .ConvolutionStage_weights_shift2B(ConvolutionStage_weights_shift2B),
         .ConvolutionStage_weights_incr2B(ConvolutionStage_weights_incr2B),
         .ConvolutionStage_muladd_opcode(ConvolutionStage_muladd_opcode),
         .ConvolutionStage_muladd_iterations(ConvolutionStage_muladd_iterations),
         .ConvolutionStage_muladd_period(ConvolutionStage_muladd_period),
         .ConvolutionStage_muladd_shift(ConvolutionStage_muladd_shift),
         .delay0(delay0),
         .delay1(delay1),
         .delay2(delay2),
         .delay3(delay3),
         .valid(memoryMappedEnable[0]),
         .wstrb(wstrb),
         .addr(addr[9:0]),
         .rdata(unitRData[0]),
         .ready(unitReady[0]),
         .wdata(wdata),
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
         ConvolutionStage  stage1_1 (
         .out0(output_1_0),
         .in0(output_0_0),
         .ext_addr_00(ext_addr_00_22),
         .int_addr_01(int_addr_01_23),
         .size_02(size_02_24),
         .iterA_03(iterA_03_25),
         .perA_04(perA_04_26),
         .dutyA_05(dutyA_05_27),
         .shiftA_06(shiftA_06_28),
         .incrA_07(incrA_07_29),
         .length_08(length_08_30),
         .pingPong_09(pingPong_09_31),
         .iterB_10(iterB_10_32),
         .perB_11(perB_11_33),
         .dutyB_12(dutyB_12_34),
         .startB_13(startB_13_35),
         .shiftB_14(shiftB_14_36),
         .incrB_15(incrB_15_37),
         .reverseB_16(reverseB_16_38),
         .extB_17(extB_17_39),
         .iter2B_18(iter2B_18_40),
         .per2B_19(per2B_19_41),
         .shift2B_20(shift2B_20_42),
         .incr2B_21(incr2B_21_43),
         .ConvolutionStage_weights_iterA(ConvolutionStage_weights_iterA),
         .ConvolutionStage_weights_perA(ConvolutionStage_weights_perA),
         .ConvolutionStage_weights_dutyA(ConvolutionStage_weights_dutyA),
         .ConvolutionStage_weights_startA(ConvolutionStage_weights_startA),
         .ConvolutionStage_weights_shiftA(ConvolutionStage_weights_shiftA),
         .ConvolutionStage_weights_incrA(ConvolutionStage_weights_incrA),
         .ConvolutionStage_weights_reverseA(ConvolutionStage_weights_reverseA),
         .ConvolutionStage_weights_extA(ConvolutionStage_weights_extA),
         .ConvolutionStage_weights_in0_wr(ConvolutionStage_weights_in0_wr),
         .ConvolutionStage_weights_iter2A(ConvolutionStage_weights_iter2A),
         .ConvolutionStage_weights_per2A(ConvolutionStage_weights_per2A),
         .ConvolutionStage_weights_shift2A(ConvolutionStage_weights_shift2A),
         .ConvolutionStage_weights_incr2A(ConvolutionStage_weights_incr2A),
         .ConvolutionStage_weights_iterB(ConvolutionStage_weights_iterB),
         .ConvolutionStage_weights_perB(ConvolutionStage_weights_perB),
         .ConvolutionStage_weights_dutyB(ConvolutionStage_weights_dutyB),
         .ConvolutionStage_weights_startB(ConvolutionStage_weights_startB),
         .ConvolutionStage_weights_shiftB(ConvolutionStage_weights_shiftB),
         .ConvolutionStage_weights_incrB(ConvolutionStage_weights_incrB),
         .ConvolutionStage_weights_reverseB(ConvolutionStage_weights_reverseB),
         .ConvolutionStage_weights_extB(ConvolutionStage_weights_extB),
         .ConvolutionStage_weights_in1_wr(ConvolutionStage_weights_in1_wr),
         .ConvolutionStage_weights_iter2B(ConvolutionStage_weights_iter2B),
         .ConvolutionStage_weights_per2B(ConvolutionStage_weights_per2B),
         .ConvolutionStage_weights_shift2B(ConvolutionStage_weights_shift2B),
         .ConvolutionStage_weights_incr2B(ConvolutionStage_weights_incr2B),
         .ConvolutionStage_muladd_opcode(ConvolutionStage_muladd_opcode),
         .ConvolutionStage_muladd_iterations(ConvolutionStage_muladd_iterations),
         .ConvolutionStage_muladd_period(ConvolutionStage_muladd_period),
         .ConvolutionStage_muladd_shift(ConvolutionStage_muladd_shift),
         .delay0(delay4),
         .delay1(delay5),
         .delay2(delay6),
         .delay3(delay7),
         .valid(memoryMappedEnable[1]),
         .wstrb(wstrb),
         .addr(addr[9:0]),
         .rdata(unitRData[1]),
         .ready(unitReady[1]),
         .wdata(wdata),
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
         ConvolutionStage  stage2_2 (
         .out0(output_2_0),
         .in0(output_1_0),
         .ext_addr_00(ext_addr_00_44),
         .int_addr_01(int_addr_01_45),
         .size_02(size_02_46),
         .iterA_03(iterA_03_47),
         .perA_04(perA_04_48),
         .dutyA_05(dutyA_05_49),
         .shiftA_06(shiftA_06_50),
         .incrA_07(incrA_07_51),
         .length_08(length_08_52),
         .pingPong_09(pingPong_09_53),
         .iterB_10(iterB_10_54),
         .perB_11(perB_11_55),
         .dutyB_12(dutyB_12_56),
         .startB_13(startB_13_57),
         .shiftB_14(shiftB_14_58),
         .incrB_15(incrB_15_59),
         .reverseB_16(reverseB_16_60),
         .extB_17(extB_17_61),
         .iter2B_18(iter2B_18_62),
         .per2B_19(per2B_19_63),
         .shift2B_20(shift2B_20_64),
         .incr2B_21(incr2B_21_65),
         .ConvolutionStage_weights_iterA(ConvolutionStage_weights_iterA),
         .ConvolutionStage_weights_perA(ConvolutionStage_weights_perA),
         .ConvolutionStage_weights_dutyA(ConvolutionStage_weights_dutyA),
         .ConvolutionStage_weights_startA(ConvolutionStage_weights_startA),
         .ConvolutionStage_weights_shiftA(ConvolutionStage_weights_shiftA),
         .ConvolutionStage_weights_incrA(ConvolutionStage_weights_incrA),
         .ConvolutionStage_weights_reverseA(ConvolutionStage_weights_reverseA),
         .ConvolutionStage_weights_extA(ConvolutionStage_weights_extA),
         .ConvolutionStage_weights_in0_wr(ConvolutionStage_weights_in0_wr),
         .ConvolutionStage_weights_iter2A(ConvolutionStage_weights_iter2A),
         .ConvolutionStage_weights_per2A(ConvolutionStage_weights_per2A),
         .ConvolutionStage_weights_shift2A(ConvolutionStage_weights_shift2A),
         .ConvolutionStage_weights_incr2A(ConvolutionStage_weights_incr2A),
         .ConvolutionStage_weights_iterB(ConvolutionStage_weights_iterB),
         .ConvolutionStage_weights_perB(ConvolutionStage_weights_perB),
         .ConvolutionStage_weights_dutyB(ConvolutionStage_weights_dutyB),
         .ConvolutionStage_weights_startB(ConvolutionStage_weights_startB),
         .ConvolutionStage_weights_shiftB(ConvolutionStage_weights_shiftB),
         .ConvolutionStage_weights_incrB(ConvolutionStage_weights_incrB),
         .ConvolutionStage_weights_reverseB(ConvolutionStage_weights_reverseB),
         .ConvolutionStage_weights_extB(ConvolutionStage_weights_extB),
         .ConvolutionStage_weights_in1_wr(ConvolutionStage_weights_in1_wr),
         .ConvolutionStage_weights_iter2B(ConvolutionStage_weights_iter2B),
         .ConvolutionStage_weights_per2B(ConvolutionStage_weights_per2B),
         .ConvolutionStage_weights_shift2B(ConvolutionStage_weights_shift2B),
         .ConvolutionStage_weights_incr2B(ConvolutionStage_weights_incr2B),
         .ConvolutionStage_muladd_opcode(ConvolutionStage_muladd_opcode),
         .ConvolutionStage_muladd_iterations(ConvolutionStage_muladd_iterations),
         .ConvolutionStage_muladd_period(ConvolutionStage_muladd_period),
         .ConvolutionStage_muladd_shift(ConvolutionStage_muladd_shift),
         .delay0(delay8),
         .delay1(delay9),
         .delay2(delay10),
         .delay3(delay11),
         .valid(memoryMappedEnable[2]),
         .wstrb(wstrb),
         .addr(addr[9:0]),
         .rdata(unitRData[2]),
         .ready(unitReady[2]),
         .wdata(wdata),
         .databus_ready(databus_ready[2 +: 1]),
         .databus_valid(databus_valid[2 +: 1]),
         .databus_addr(databus_addr[64 +: 32]),
         .databus_rdata(databus_rdata),
         .databus_wdata(databus_wdata[64 +: 32]),
         .databus_wstrb(databus_wstrb[8 +: 4]),
         .databus_len(databus_len[16 +: 8]),
         .databus_last(databus_last[2 +: 1]),
         .run(run),

         .done(unitDone[2]),
         .clk(clk),
         .rst(rst)
      );
         ConvolutionStage  stage3_3 (
         .out0(output_3_0),
         .in0(output_2_0),
         .ext_addr_00(ext_addr_00_66),
         .int_addr_01(int_addr_01_67),
         .size_02(size_02_68),
         .iterA_03(iterA_03_69),
         .perA_04(perA_04_70),
         .dutyA_05(dutyA_05_71),
         .shiftA_06(shiftA_06_72),
         .incrA_07(incrA_07_73),
         .length_08(length_08_74),
         .pingPong_09(pingPong_09_75),
         .iterB_10(iterB_10_76),
         .perB_11(perB_11_77),
         .dutyB_12(dutyB_12_78),
         .startB_13(startB_13_79),
         .shiftB_14(shiftB_14_80),
         .incrB_15(incrB_15_81),
         .reverseB_16(reverseB_16_82),
         .extB_17(extB_17_83),
         .iter2B_18(iter2B_18_84),
         .per2B_19(per2B_19_85),
         .shift2B_20(shift2B_20_86),
         .incr2B_21(incr2B_21_87),
         .ConvolutionStage_weights_iterA(ConvolutionStage_weights_iterA),
         .ConvolutionStage_weights_perA(ConvolutionStage_weights_perA),
         .ConvolutionStage_weights_dutyA(ConvolutionStage_weights_dutyA),
         .ConvolutionStage_weights_startA(ConvolutionStage_weights_startA),
         .ConvolutionStage_weights_shiftA(ConvolutionStage_weights_shiftA),
         .ConvolutionStage_weights_incrA(ConvolutionStage_weights_incrA),
         .ConvolutionStage_weights_reverseA(ConvolutionStage_weights_reverseA),
         .ConvolutionStage_weights_extA(ConvolutionStage_weights_extA),
         .ConvolutionStage_weights_in0_wr(ConvolutionStage_weights_in0_wr),
         .ConvolutionStage_weights_iter2A(ConvolutionStage_weights_iter2A),
         .ConvolutionStage_weights_per2A(ConvolutionStage_weights_per2A),
         .ConvolutionStage_weights_shift2A(ConvolutionStage_weights_shift2A),
         .ConvolutionStage_weights_incr2A(ConvolutionStage_weights_incr2A),
         .ConvolutionStage_weights_iterB(ConvolutionStage_weights_iterB),
         .ConvolutionStage_weights_perB(ConvolutionStage_weights_perB),
         .ConvolutionStage_weights_dutyB(ConvolutionStage_weights_dutyB),
         .ConvolutionStage_weights_startB(ConvolutionStage_weights_startB),
         .ConvolutionStage_weights_shiftB(ConvolutionStage_weights_shiftB),
         .ConvolutionStage_weights_incrB(ConvolutionStage_weights_incrB),
         .ConvolutionStage_weights_reverseB(ConvolutionStage_weights_reverseB),
         .ConvolutionStage_weights_extB(ConvolutionStage_weights_extB),
         .ConvolutionStage_weights_in1_wr(ConvolutionStage_weights_in1_wr),
         .ConvolutionStage_weights_iter2B(ConvolutionStage_weights_iter2B),
         .ConvolutionStage_weights_per2B(ConvolutionStage_weights_per2B),
         .ConvolutionStage_weights_shift2B(ConvolutionStage_weights_shift2B),
         .ConvolutionStage_weights_incr2B(ConvolutionStage_weights_incr2B),
         .ConvolutionStage_muladd_opcode(ConvolutionStage_muladd_opcode),
         .ConvolutionStage_muladd_iterations(ConvolutionStage_muladd_iterations),
         .ConvolutionStage_muladd_period(ConvolutionStage_muladd_period),
         .ConvolutionStage_muladd_shift(ConvolutionStage_muladd_shift),
         .delay0(delay12),
         .delay1(delay13),
         .delay2(delay14),
         .delay3(delay15),
         .valid(memoryMappedEnable[3]),
         .wstrb(wstrb),
         .addr(addr[9:0]),
         .rdata(unitRData[3]),
         .ready(unitReady[3]),
         .wdata(wdata),
         .databus_ready(databus_ready[3 +: 1]),
         .databus_valid(databus_valid[3 +: 1]),
         .databus_addr(databus_addr[96 +: 32]),
         .databus_rdata(databus_rdata),
         .databus_wdata(databus_wdata[96 +: 32]),
         .databus_wstrb(databus_wstrb[12 +: 4]),
         .databus_len(databus_len[24 +: 8]),
         .databus_last(databus_last[3 +: 1]),
         .run(run),

         .done(unitDone[3]),
         .clk(clk),
         .rst(rst)
      );
         ConvolutionStage  stage4_4 (
         .out0(output_4_0),
         .in0(output_3_0),
         .ext_addr_00(ext_addr_00_88),
         .int_addr_01(int_addr_01_89),
         .size_02(size_02_90),
         .iterA_03(iterA_03_91),
         .perA_04(perA_04_92),
         .dutyA_05(dutyA_05_93),
         .shiftA_06(shiftA_06_94),
         .incrA_07(incrA_07_95),
         .length_08(length_08_96),
         .pingPong_09(pingPong_09_97),
         .iterB_10(iterB_10_98),
         .perB_11(perB_11_99),
         .dutyB_12(dutyB_12_100),
         .startB_13(startB_13_101),
         .shiftB_14(shiftB_14_102),
         .incrB_15(incrB_15_103),
         .reverseB_16(reverseB_16_104),
         .extB_17(extB_17_105),
         .iter2B_18(iter2B_18_106),
         .per2B_19(per2B_19_107),
         .shift2B_20(shift2B_20_108),
         .incr2B_21(incr2B_21_109),
         .ConvolutionStage_weights_iterA(ConvolutionStage_weights_iterA),
         .ConvolutionStage_weights_perA(ConvolutionStage_weights_perA),
         .ConvolutionStage_weights_dutyA(ConvolutionStage_weights_dutyA),
         .ConvolutionStage_weights_startA(ConvolutionStage_weights_startA),
         .ConvolutionStage_weights_shiftA(ConvolutionStage_weights_shiftA),
         .ConvolutionStage_weights_incrA(ConvolutionStage_weights_incrA),
         .ConvolutionStage_weights_reverseA(ConvolutionStage_weights_reverseA),
         .ConvolutionStage_weights_extA(ConvolutionStage_weights_extA),
         .ConvolutionStage_weights_in0_wr(ConvolutionStage_weights_in0_wr),
         .ConvolutionStage_weights_iter2A(ConvolutionStage_weights_iter2A),
         .ConvolutionStage_weights_per2A(ConvolutionStage_weights_per2A),
         .ConvolutionStage_weights_shift2A(ConvolutionStage_weights_shift2A),
         .ConvolutionStage_weights_incr2A(ConvolutionStage_weights_incr2A),
         .ConvolutionStage_weights_iterB(ConvolutionStage_weights_iterB),
         .ConvolutionStage_weights_perB(ConvolutionStage_weights_perB),
         .ConvolutionStage_weights_dutyB(ConvolutionStage_weights_dutyB),
         .ConvolutionStage_weights_startB(ConvolutionStage_weights_startB),
         .ConvolutionStage_weights_shiftB(ConvolutionStage_weights_shiftB),
         .ConvolutionStage_weights_incrB(ConvolutionStage_weights_incrB),
         .ConvolutionStage_weights_reverseB(ConvolutionStage_weights_reverseB),
         .ConvolutionStage_weights_extB(ConvolutionStage_weights_extB),
         .ConvolutionStage_weights_in1_wr(ConvolutionStage_weights_in1_wr),
         .ConvolutionStage_weights_iter2B(ConvolutionStage_weights_iter2B),
         .ConvolutionStage_weights_per2B(ConvolutionStage_weights_per2B),
         .ConvolutionStage_weights_shift2B(ConvolutionStage_weights_shift2B),
         .ConvolutionStage_weights_incr2B(ConvolutionStage_weights_incr2B),
         .ConvolutionStage_muladd_opcode(ConvolutionStage_muladd_opcode),
         .ConvolutionStage_muladd_iterations(ConvolutionStage_muladd_iterations),
         .ConvolutionStage_muladd_period(ConvolutionStage_muladd_period),
         .ConvolutionStage_muladd_shift(ConvolutionStage_muladd_shift),
         .delay0(delay16),
         .delay1(delay17),
         .delay2(delay18),
         .delay3(delay19),
         .valid(memoryMappedEnable[4]),
         .wstrb(wstrb),
         .addr(addr[9:0]),
         .rdata(unitRData[4]),
         .ready(unitReady[4]),
         .wdata(wdata),
         .databus_ready(databus_ready[4 +: 1]),
         .databus_valid(databus_valid[4 +: 1]),
         .databus_addr(databus_addr[128 +: 32]),
         .databus_rdata(databus_rdata),
         .databus_wdata(databus_wdata[128 +: 32]),
         .databus_wstrb(databus_wstrb[16 +: 4]),
         .databus_len(databus_len[32 +: 8]),
         .databus_last(databus_last[4 +: 1]),
         .run(run),

         .done(unitDone[4]),
         .clk(clk),
         .rst(rst)
      );
         Mem  res_5 (
         .in0(output_4_0),
         .iterA(iterA_110),
         .perA(perA_111),
         .dutyA(dutyA_112),
         .startA(startA_113),
         .shiftA(shiftA_114),
         .incrA(incrA_115),
         .reverseA(reverseA_116),
         .extA(extA_117),
         .in0_wr(in0_wr_118),
         .iter2A(iter2A_119),
         .per2A(per2A_120),
         .shift2A(shift2A_121),
         .incr2A(incr2A_122),
         .iterB(iterB_123),
         .perB(perB_124),
         .dutyB(dutyB_125),
         .startB(startB_126),
         .shiftB(shiftB_127),
         .incrB(incrB_128),
         .reverseB(reverseB_129),
         .extB(extB_130),
         .in1_wr(in1_wr_131),
         .iter2B(iter2B_132),
         .per2B(per2B_133),
         .shift2B(shift2B_134),
         .incr2B(incr2B_135),
         .delay0(delay20),
         .delay1(delay21),
         .valid(memoryMappedEnable[5]),
         .wstrb(wstrb),
         .addr(addr[9:0]),
         .rdata(unitRData[5]),
         .ready(unitReady[5]),
         .wdata(wdata),
         .run(run),

         .done(unitDone[5]),
         .clk(clk),
         .rst(rst)
      );
         Const  bias_6 (
         .out0(output_6_0),
         .constant(constant_136),
         .run(run),

         .clk(clk),
         .rst(rst)
      );
         endmodule
