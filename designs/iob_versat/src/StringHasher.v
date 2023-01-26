`timescale 1ns / 1ps
`include "global_defines.vh"
`include "system.vh"
`include "axi.vh"
`include "xversat.vh"
`include "xdefs.vh"

module StringHasher #(
      parameter ADDR_W = `ADDR_W,
      parameter DATA_W = `DATA_W,
      parameter AXI_ADDR_W = 32
   )
   (

   input run,
   
   output done,
   input [31:0]     constant_00,
   input [31:0]     constant_01,
   input [31:0]     constant_02,
   input [31:0]     constant_03,
   input [31:0]     constant_04,
   input [9:0]     iterA_05,
   input [9:0]     perA_06,
   input [9:0]     dutyA_07,
   input [9:0]     startA_08,
   input [9:0]     shiftA_09,
   input [9:0]     incrA_10,
   input [0:0]     reverseA_11,
   input [0:0]     extA_12,
   input [0:0]     in0_wr_13,
   input [9:0]     iter2A_14,
   input [9:0]     per2A_15,
   input [9:0]     shift2A_16,
   input [9:0]     incr2A_17,
   input [9:0]     iterB_18,
   input [9:0]     perB_19,
   input [9:0]     dutyB_20,
   input [9:0]     startB_21,
   input [9:0]     shiftB_22,
   input [9:0]     incrB_23,
   input [0:0]     reverseB_24,
   input [0:0]     extB_25,
   input [0:0]     in1_wr_26,
   input [9:0]     iter2B_27,
   input [9:0]     per2B_28,
   input [9:0]     shift2B_29,
   input [9:0]     incr2B_30,
   input [9:0]     iterA_31,
   input [9:0]     perA_32,
   input [9:0]     dutyA_33,
   input [9:0]     startA_34,
   input [9:0]     shiftA_35,
   input [9:0]     incrA_36,
   input [0:0]     reverseA_37,
   input [0:0]     extA_38,
   input [0:0]     in0_wr_39,
   input [9:0]     iter2A_40,
   input [9:0]     per2A_41,
   input [9:0]     shift2A_42,
   input [9:0]     incr2A_43,
   input [9:0]     iterB_44,
   input [9:0]     perB_45,
   input [9:0]     dutyB_46,
   input [9:0]     startB_47,
   input [9:0]     shiftB_48,
   input [9:0]     incrB_49,
   input [0:0]     reverseB_50,
   input [0:0]     extB_51,
   input [0:0]     in1_wr_52,
   input [9:0]     iter2B_53,
   input [9:0]     per2B_54,
   input [9:0]     shift2B_55,
   input [9:0]     incr2B_56,
   input [0:0]     StaticMuladd_mul_opcode,
   input [9:0]     StaticMuladd_mul_iterations,
   input [9:0]     StaticMuladd_mul_period,
   input [5:0]     StaticMuladd_mul_shift,
   input [5:0]     StringHasher_buffer0_amount,
   input [5:0]     StringHasher_buffer1_amount,
   input [5:0]     StringHasher_buffer2_amount,
   input [5:0]     StringHasher_buffer3_amount,
   input  [31:0]                   delay0,
   input  [31:0]                   delay1,
   input  [31:0]                   delay2,
   input  [31:0]                   delay3,
   input  [31:0]                   delay4,
   input  [31:0]                   delay5,
   input  [31:0]                   delay6,
   input  [31:0]                   delay7,
   input  [31:0]                   delay8,
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
wire [6:0] unitDone;
assign done = &unitDone;
wire [31:0] output_0_0 , output_1_0 , output_2_0 , output_3_0 , output_4_0 , output_5_0 , output_6_0 , output_7_0 , output_8_0 , output_9_0 , output_10_0 , output_12_0 , output_13_0 , output_14_0 , output_15_0 , output_16_0 , output_17_0 , output_18_0 , output_19_0 ;

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
reg [31:0] comb_a1 ,comb_a2 ,comb_a3 ,comb_a4 ; 

always @*
begin
comb_a1 = output_5_0 + output_6_0;
      comb_a2 = output_7_0 + output_8_0;
      comb_a3 = comb_a1 + comb_a2;
      comb_a4 = comb_a3 + output_9_0;
      end
Const  weight1_0 (
         .out0(output_0_0),
         .constant(constant_00),
         .run(run),

         .clk(clk),
         .rst(rst)
      );
         Const  weight2_1 (
         .out0(output_1_0),
         .constant(constant_01),
         .run(run),

         .clk(clk),
         .rst(rst)
      );
         Const  weight3_2 (
         .out0(output_2_0),
         .constant(constant_02),
         .run(run),

         .clk(clk),
         .rst(rst)
      );
         Const  weight4_3 (
         .out0(output_3_0),
         .constant(constant_03),
         .run(run),

         .clk(clk),
         .rst(rst)
      );
         Const  weight5_4 (
         .out0(output_4_0),
         .constant(constant_04),
         .run(run),

         .clk(clk),
         .rst(rst)
      );
         StaticMuladd  mul1_5 (
         .out0(output_5_0),
         .in1(output_0_0),
         .in0(output_16_0),
         .StaticMuladd_mul_opcode(StaticMuladd_mul_opcode),
         .StaticMuladd_mul_iterations(StaticMuladd_mul_iterations),
         .StaticMuladd_mul_period(StaticMuladd_mul_period),
         .StaticMuladd_mul_shift(StaticMuladd_mul_shift),
         .delay0(delay0),
         .run(run),

         .done(unitDone[0]),
         .clk(clk),
         .rst(rst)
      );
         StaticMuladd  mul2_6 (
         .out0(output_6_0),
         .in1(output_1_0),
         .in0(output_17_0),
         .StaticMuladd_mul_opcode(StaticMuladd_mul_opcode),
         .StaticMuladd_mul_iterations(StaticMuladd_mul_iterations),
         .StaticMuladd_mul_period(StaticMuladd_mul_period),
         .StaticMuladd_mul_shift(StaticMuladd_mul_shift),
         .delay0(delay1),
         .run(run),

         .done(unitDone[1]),
         .clk(clk),
         .rst(rst)
      );
         StaticMuladd  mul3_7 (
         .out0(output_7_0),
         .in1(output_2_0),
         .in0(output_18_0),
         .StaticMuladd_mul_opcode(StaticMuladd_mul_opcode),
         .StaticMuladd_mul_iterations(StaticMuladd_mul_iterations),
         .StaticMuladd_mul_period(StaticMuladd_mul_period),
         .StaticMuladd_mul_shift(StaticMuladd_mul_shift),
         .delay0(delay2),
         .run(run),

         .done(unitDone[2]),
         .clk(clk),
         .rst(rst)
      );
         StaticMuladd  mul4_8 (
         .out0(output_8_0),
         .in1(output_3_0),
         .in0(output_19_0),
         .StaticMuladd_mul_opcode(StaticMuladd_mul_opcode),
         .StaticMuladd_mul_iterations(StaticMuladd_mul_iterations),
         .StaticMuladd_mul_period(StaticMuladd_mul_period),
         .StaticMuladd_mul_shift(StaticMuladd_mul_shift),
         .delay0(delay3),
         .run(run),

         .done(unitDone[3]),
         .clk(clk),
         .rst(rst)
      );
         StaticMuladd  mul5_9 (
         .out0(output_9_0),
         .in0(output_10_0),
         .in1(output_4_0),
         .StaticMuladd_mul_opcode(StaticMuladd_mul_opcode),
         .StaticMuladd_mul_iterations(StaticMuladd_mul_iterations),
         .StaticMuladd_mul_period(StaticMuladd_mul_period),
         .StaticMuladd_mul_shift(StaticMuladd_mul_shift),
         .delay0(delay4),
         .run(run),

         .done(unitDone[4]),
         .clk(clk),
         .rst(rst)
      );
         Mem  bytesIn_10 (
         .out0(output_10_0),
         .iterA(iterA_05),
         .perA(perA_06),
         .dutyA(dutyA_07),
         .startA(startA_08),
         .shiftA(shiftA_09),
         .incrA(incrA_10),
         .reverseA(reverseA_11),
         .extA(extA_12),
         .in0_wr(in0_wr_13),
         .iter2A(iter2A_14),
         .per2A(per2A_15),
         .shift2A(shift2A_16),
         .incr2A(incr2A_17),
         .iterB(iterB_18),
         .perB(perB_19),
         .dutyB(dutyB_20),
         .startB(startB_21),
         .shiftB(shiftB_22),
         .incrB(incrB_23),
         .reverseB(reverseB_24),
         .extB(extB_25),
         .in1_wr(in1_wr_26),
         .iter2B(iter2B_27),
         .per2B(per2B_28),
         .shift2B(shift2B_29),
         .incr2B(incr2B_30),
         .delay0(delay5),
         .delay1(delay6),
         .valid(memoryMappedEnable[0]),
         .wstrb(wstrb),
         .addr(addr[9:0]),
         .rdata(unitRData[0]),
         .ready(unitReady[0]),
         .wdata(wdata),
         .run(run),

         .done(unitDone[5]),
         .clk(clk),
         .rst(rst)
      );
         Mem  bytesOut_11 (
         .in0(comb_a4),
         .iterA(iterA_31),
         .perA(perA_32),
         .dutyA(dutyA_33),
         .startA(startA_34),
         .shiftA(shiftA_35),
         .incrA(incrA_36),
         .reverseA(reverseA_37),
         .extA(extA_38),
         .in0_wr(in0_wr_39),
         .iter2A(iter2A_40),
         .per2A(per2A_41),
         .shift2A(shift2A_42),
         .incr2A(incr2A_43),
         .iterB(iterB_44),
         .perB(perB_45),
         .dutyB(dutyB_46),
         .startB(startB_47),
         .shiftB(shiftB_48),
         .incrB(incrB_49),
         .reverseB(reverseB_50),
         .extB(extB_51),
         .in1_wr(in1_wr_52),
         .iter2B(iter2B_53),
         .per2B(per2B_54),
         .shift2B(shift2B_55),
         .incr2B(incr2B_56),
         .delay0(delay7),
         .delay1(delay8),
         .valid(memoryMappedEnable[1]),
         .wstrb(wstrb),
         .addr(addr[9:0]),
         .rdata(unitRData[1]),
         .ready(unitReady[1]),
         .wdata(wdata),
         .run(run),

         .done(unitDone[6]),
         .clk(clk),
         .rst(rst)
      );
         Buffer  buffer0_12 (
         .out0(output_16_0),
         .in0(output_10_0),
         .amount(StringHasher_buffer0_amount),
         .run(run),

         .clk(clk),
         .rst(rst)
      );
         Buffer  buffer1_13 (
         .out0(output_17_0),
         .in0(output_10_0),
         .amount(StringHasher_buffer1_amount),
         .run(run),

         .clk(clk),
         .rst(rst)
      );
         Buffer  buffer2_14 (
         .out0(output_18_0),
         .in0(output_10_0),
         .amount(StringHasher_buffer2_amount),
         .run(run),

         .clk(clk),
         .rst(rst)
      );
         Buffer  buffer3_15 (
         .out0(output_19_0),
         .in0(output_10_0),
         .amount(StringHasher_buffer3_amount),
         .run(run),

         .clk(clk),
         .rst(rst)
      );
         endmodule
