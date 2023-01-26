`timescale 1ns / 1ps
`include "global_defines.vh"
`include "system.vh"
`include "axi.vh"
`include "xversat.vh"
`include "xdefs.vh"

module F #(
      parameter ADDR_W = `ADDR_W,
      parameter DATA_W = `DATA_W,
      parameter AXI_ADDR_W = 32
   )
   (

   input run,
   
   input [DATA_W-1:0]              in0,
   input [DATA_W-1:0]              in1,
   input [DATA_W-1:0]              in2,
   input [DATA_W-1:0]              in3,
   input [DATA_W-1:0]              in4,
   input [DATA_W-1:0]              in5,
   input [DATA_W-1:0]              in6,
   input [DATA_W-1:0]              in7,
   input [DATA_W-1:0]              in8,
   input [DATA_W-1:0]              in9,
   output [DATA_W-1:0]             out0,
   output [DATA_W-1:0]             out1,
   output [DATA_W-1:0]             out2,
   output [DATA_W-1:0]             out3,
   output [DATA_W-1:0]             out4,
   output [DATA_W-1:0]             out5,
   output [DATA_W-1:0]             out6,
   output [DATA_W-1:0]             out7,
   input [31:0]     Comb_F_Stage_t_constant_00_00_00,
   input [31:0]     Comb_F_Stage_t_constant_01_01_01,
   input [31:0]     Comb_F_Stage_t_constant_02_02_02,
   input [31:0]     Comb_F_Stage_t_constant_00_00_03,
   input [31:0]     Comb_F_Stage_t_constant_01_01_04,
   input [31:0]     Comb_F_Stage_t_constant_02_02_05,
   input                           clk,
   input                           rst
   );

wire wor_ready;

wire [31:0] unitRdataFinal;
reg [31:0] stateRead;

wire [31:0] output_0_0 , output_1_0 , output_2_0 , output_3_0 , output_4_0 , output_5_0 , output_6_0 , output_7_0 , output_8_0 , output_9_0 , output_10_0 , output_10_1 , output_10_2 , output_10_3 , output_10_4 , output_10_5 , output_10_6 , output_10_7 , output_11_0 , output_11_1 , output_11_2 , output_11_3 , output_11_4 , output_11_5 , output_11_6 , output_11_7 , output_12_0 , output_12_1 , output_12_2 , output_12_3 , output_12_4 , output_12_5 , output_12_6 , output_12_7 , output_13_0 , output_13_1 , output_13_2 , output_13_3 , output_13_4 , output_13_5 , output_13_6 , output_13_7 , output_14_0 , output_14_1 , output_14_2 , output_14_3 , output_14_4 , output_14_5 , output_14_6 , output_14_7 , output_15_0 , output_15_1 , output_15_2 , output_15_3 , output_15_4 , output_15_5 , output_15_6 , output_15_7 , output_16_0 , output_16_1 , output_16_2 , output_16_3 , output_16_4 , output_16_5 , output_16_6 , output_16_7 , output_17_0 , output_17_1 , output_17_2 , output_17_3 , output_17_4 , output_17_5 , output_17_6 , output_17_7 , output_18_0 , output_18_1 , output_18_2 , output_18_3 , output_18_4 , output_18_5 , output_18_6 , output_18_7 , output_19_0 , output_19_1 , output_19_2 , output_19_3 , output_19_4 , output_19_5 , output_19_6 , output_19_7 , output_20_0 , output_20_1 , output_20_2 , output_20_3 , output_20_4 , output_20_5 , output_20_6 , output_20_7 , output_21_0 , output_21_1 , output_21_2 , output_21_3 , output_21_4 , output_21_5 , output_21_6 , output_21_7 , output_22_0 , output_22_1 , output_22_2 , output_22_3 , output_22_4 , output_22_5 , output_22_6 , output_22_7 , output_23_0 , output_23_1 , output_23_2 , output_23_3 , output_23_4 , output_23_5 , output_23_6 , output_23_7 , output_24_0 , output_24_1 , output_24_2 , output_24_3 , output_24_4 , output_24_5 , output_24_6 , output_24_7 , output_25_0 , output_25_1 , output_25_2 , output_25_3 , output_25_4 , output_25_5 , output_25_6 , output_25_7 ;

F_Stage  f0_0 (
         .out0(output_10_0),
         .out1(output_10_1),
         .out2(output_10_2),
         .out3(output_10_3),
         .out4(output_10_4),
         .out5(output_10_5),
         .out6(output_10_6),
         .out7(output_10_7),
         .in0(in0), // a
         .in1(in1), // b
         .in2(in2), // c
         .in3(in3), // d
         .in4(in4), // e
         .in5(in5), // f
         .in6(in6), // g
         .in7(in7), // h
         .in8(in8), // k
         .in9(in9), // w
         .Comb_F_Stage_t_constant_00_00_00(Comb_F_Stage_t_constant_00_00_00),
         .Comb_F_Stage_t_constant_01_01_01(Comb_F_Stage_t_constant_01_01_01),
         .Comb_F_Stage_t_constant_02_02_02(Comb_F_Stage_t_constant_02_02_02),
         .Comb_F_Stage_t_constant_00_00_03(Comb_F_Stage_t_constant_00_00_03),
         .Comb_F_Stage_t_constant_01_01_04(Comb_F_Stage_t_constant_01_01_04),
         .Comb_F_Stage_t_constant_02_02_05(Comb_F_Stage_t_constant_02_02_05),
         .run(run),

         .clk(clk),
         .rst(rst)
      );
         F_Stage  f1_1 (
         .out0(output_11_0),
         .out1(output_11_1),
         .out2(output_11_2),
         .out3(output_11_3),
         .out4(output_11_4),
         .out5(output_11_5),
         .out6(output_11_6),
         .out7(output_11_7),
         .in0(output_10_0),
         .in1(output_10_1),
         .in2(output_10_2),
         .in3(output_10_3),
         .in4(output_10_4),
         .in5(output_10_5),
         .in6(output_10_6),
         .in7(output_10_7),
         .in8(in8), // k
         .in9(in9), // w
         .Comb_F_Stage_t_constant_00_00_00(Comb_F_Stage_t_constant_00_00_00),
         .Comb_F_Stage_t_constant_01_01_01(Comb_F_Stage_t_constant_01_01_01),
         .Comb_F_Stage_t_constant_02_02_02(Comb_F_Stage_t_constant_02_02_02),
         .Comb_F_Stage_t_constant_00_00_03(Comb_F_Stage_t_constant_00_00_03),
         .Comb_F_Stage_t_constant_01_01_04(Comb_F_Stage_t_constant_01_01_04),
         .Comb_F_Stage_t_constant_02_02_05(Comb_F_Stage_t_constant_02_02_05),
         .run(run),

         .clk(clk),
         .rst(rst)
      );
         F_Stage  f2_2 (
         .out0(output_12_0),
         .out1(output_12_1),
         .out2(output_12_2),
         .out3(output_12_3),
         .out4(output_12_4),
         .out5(output_12_5),
         .out6(output_12_6),
         .out7(output_12_7),
         .in0(output_11_0),
         .in1(output_11_1),
         .in2(output_11_2),
         .in3(output_11_3),
         .in4(output_11_4),
         .in5(output_11_5),
         .in6(output_11_6),
         .in7(output_11_7),
         .in8(in8), // k
         .in9(in9), // w
         .Comb_F_Stage_t_constant_00_00_00(Comb_F_Stage_t_constant_00_00_00),
         .Comb_F_Stage_t_constant_01_01_01(Comb_F_Stage_t_constant_01_01_01),
         .Comb_F_Stage_t_constant_02_02_02(Comb_F_Stage_t_constant_02_02_02),
         .Comb_F_Stage_t_constant_00_00_03(Comb_F_Stage_t_constant_00_00_03),
         .Comb_F_Stage_t_constant_01_01_04(Comb_F_Stage_t_constant_01_01_04),
         .Comb_F_Stage_t_constant_02_02_05(Comb_F_Stage_t_constant_02_02_05),
         .run(run),

         .clk(clk),
         .rst(rst)
      );
         F_Stage  f3_3 (
         .out0(output_13_0),
         .out1(output_13_1),
         .out2(output_13_2),
         .out3(output_13_3),
         .out4(output_13_4),
         .out5(output_13_5),
         .out6(output_13_6),
         .out7(output_13_7),
         .in0(output_12_0),
         .in1(output_12_1),
         .in2(output_12_2),
         .in3(output_12_3),
         .in4(output_12_4),
         .in5(output_12_5),
         .in6(output_12_6),
         .in7(output_12_7),
         .in8(in8), // k
         .in9(in9), // w
         .Comb_F_Stage_t_constant_00_00_00(Comb_F_Stage_t_constant_00_00_00),
         .Comb_F_Stage_t_constant_01_01_01(Comb_F_Stage_t_constant_01_01_01),
         .Comb_F_Stage_t_constant_02_02_02(Comb_F_Stage_t_constant_02_02_02),
         .Comb_F_Stage_t_constant_00_00_03(Comb_F_Stage_t_constant_00_00_03),
         .Comb_F_Stage_t_constant_01_01_04(Comb_F_Stage_t_constant_01_01_04),
         .Comb_F_Stage_t_constant_02_02_05(Comb_F_Stage_t_constant_02_02_05),
         .run(run),

         .clk(clk),
         .rst(rst)
      );
         F_Stage  f4_4 (
         .out0(output_14_0),
         .out1(output_14_1),
         .out2(output_14_2),
         .out3(output_14_3),
         .out4(output_14_4),
         .out5(output_14_5),
         .out6(output_14_6),
         .out7(output_14_7),
         .in0(output_13_0),
         .in1(output_13_1),
         .in2(output_13_2),
         .in3(output_13_3),
         .in4(output_13_4),
         .in5(output_13_5),
         .in6(output_13_6),
         .in7(output_13_7),
         .in8(in8), // k
         .in9(in9), // w
         .Comb_F_Stage_t_constant_00_00_00(Comb_F_Stage_t_constant_00_00_00),
         .Comb_F_Stage_t_constant_01_01_01(Comb_F_Stage_t_constant_01_01_01),
         .Comb_F_Stage_t_constant_02_02_02(Comb_F_Stage_t_constant_02_02_02),
         .Comb_F_Stage_t_constant_00_00_03(Comb_F_Stage_t_constant_00_00_03),
         .Comb_F_Stage_t_constant_01_01_04(Comb_F_Stage_t_constant_01_01_04),
         .Comb_F_Stage_t_constant_02_02_05(Comb_F_Stage_t_constant_02_02_05),
         .run(run),

         .clk(clk),
         .rst(rst)
      );
         F_Stage  f5_5 (
         .out0(output_15_0),
         .out1(output_15_1),
         .out2(output_15_2),
         .out3(output_15_3),
         .out4(output_15_4),
         .out5(output_15_5),
         .out6(output_15_6),
         .out7(output_15_7),
         .in0(output_14_0),
         .in1(output_14_1),
         .in2(output_14_2),
         .in3(output_14_3),
         .in4(output_14_4),
         .in5(output_14_5),
         .in6(output_14_6),
         .in7(output_14_7),
         .in8(in8), // k
         .in9(in9), // w
         .Comb_F_Stage_t_constant_00_00_00(Comb_F_Stage_t_constant_00_00_00),
         .Comb_F_Stage_t_constant_01_01_01(Comb_F_Stage_t_constant_01_01_01),
         .Comb_F_Stage_t_constant_02_02_02(Comb_F_Stage_t_constant_02_02_02),
         .Comb_F_Stage_t_constant_00_00_03(Comb_F_Stage_t_constant_00_00_03),
         .Comb_F_Stage_t_constant_01_01_04(Comb_F_Stage_t_constant_01_01_04),
         .Comb_F_Stage_t_constant_02_02_05(Comb_F_Stage_t_constant_02_02_05),
         .run(run),

         .clk(clk),
         .rst(rst)
      );
         F_Stage  f6_6 (
         .out0(output_16_0),
         .out1(output_16_1),
         .out2(output_16_2),
         .out3(output_16_3),
         .out4(output_16_4),
         .out5(output_16_5),
         .out6(output_16_6),
         .out7(output_16_7),
         .in0(output_15_0),
         .in1(output_15_1),
         .in2(output_15_2),
         .in3(output_15_3),
         .in4(output_15_4),
         .in5(output_15_5),
         .in6(output_15_6),
         .in7(output_15_7),
         .in8(in8), // k
         .in9(in9), // w
         .Comb_F_Stage_t_constant_00_00_00(Comb_F_Stage_t_constant_00_00_00),
         .Comb_F_Stage_t_constant_01_01_01(Comb_F_Stage_t_constant_01_01_01),
         .Comb_F_Stage_t_constant_02_02_02(Comb_F_Stage_t_constant_02_02_02),
         .Comb_F_Stage_t_constant_00_00_03(Comb_F_Stage_t_constant_00_00_03),
         .Comb_F_Stage_t_constant_01_01_04(Comb_F_Stage_t_constant_01_01_04),
         .Comb_F_Stage_t_constant_02_02_05(Comb_F_Stage_t_constant_02_02_05),
         .run(run),

         .clk(clk),
         .rst(rst)
      );
         F_Stage  f7_7 (
         .out0(output_17_0),
         .out1(output_17_1),
         .out2(output_17_2),
         .out3(output_17_3),
         .out4(output_17_4),
         .out5(output_17_5),
         .out6(output_17_6),
         .out7(output_17_7),
         .in0(output_16_0),
         .in1(output_16_1),
         .in2(output_16_2),
         .in3(output_16_3),
         .in4(output_16_4),
         .in5(output_16_5),
         .in6(output_16_6),
         .in7(output_16_7),
         .in8(in8), // k
         .in9(in9), // w
         .Comb_F_Stage_t_constant_00_00_00(Comb_F_Stage_t_constant_00_00_00),
         .Comb_F_Stage_t_constant_01_01_01(Comb_F_Stage_t_constant_01_01_01),
         .Comb_F_Stage_t_constant_02_02_02(Comb_F_Stage_t_constant_02_02_02),
         .Comb_F_Stage_t_constant_00_00_03(Comb_F_Stage_t_constant_00_00_03),
         .Comb_F_Stage_t_constant_01_01_04(Comb_F_Stage_t_constant_01_01_04),
         .Comb_F_Stage_t_constant_02_02_05(Comb_F_Stage_t_constant_02_02_05),
         .run(run),

         .clk(clk),
         .rst(rst)
      );
         F_Stage  f8_8 (
         .out0(output_18_0),
         .out1(output_18_1),
         .out2(output_18_2),
         .out3(output_18_3),
         .out4(output_18_4),
         .out5(output_18_5),
         .out6(output_18_6),
         .out7(output_18_7),
         .in0(output_17_0),
         .in1(output_17_1),
         .in2(output_17_2),
         .in3(output_17_3),
         .in4(output_17_4),
         .in5(output_17_5),
         .in6(output_17_6),
         .in7(output_17_7),
         .in8(in8), // k
         .in9(in9), // w
         .Comb_F_Stage_t_constant_00_00_00(Comb_F_Stage_t_constant_00_00_00),
         .Comb_F_Stage_t_constant_01_01_01(Comb_F_Stage_t_constant_01_01_01),
         .Comb_F_Stage_t_constant_02_02_02(Comb_F_Stage_t_constant_02_02_02),
         .Comb_F_Stage_t_constant_00_00_03(Comb_F_Stage_t_constant_00_00_03),
         .Comb_F_Stage_t_constant_01_01_04(Comb_F_Stage_t_constant_01_01_04),
         .Comb_F_Stage_t_constant_02_02_05(Comb_F_Stage_t_constant_02_02_05),
         .run(run),

         .clk(clk),
         .rst(rst)
      );
         F_Stage  f9_9 (
         .out0(output_19_0),
         .out1(output_19_1),
         .out2(output_19_2),
         .out3(output_19_3),
         .out4(output_19_4),
         .out5(output_19_5),
         .out6(output_19_6),
         .out7(output_19_7),
         .in0(output_18_0),
         .in1(output_18_1),
         .in2(output_18_2),
         .in3(output_18_3),
         .in4(output_18_4),
         .in5(output_18_5),
         .in6(output_18_6),
         .in7(output_18_7),
         .in8(in8), // k
         .in9(in9), // w
         .Comb_F_Stage_t_constant_00_00_00(Comb_F_Stage_t_constant_00_00_00),
         .Comb_F_Stage_t_constant_01_01_01(Comb_F_Stage_t_constant_01_01_01),
         .Comb_F_Stage_t_constant_02_02_02(Comb_F_Stage_t_constant_02_02_02),
         .Comb_F_Stage_t_constant_00_00_03(Comb_F_Stage_t_constant_00_00_03),
         .Comb_F_Stage_t_constant_01_01_04(Comb_F_Stage_t_constant_01_01_04),
         .Comb_F_Stage_t_constant_02_02_05(Comb_F_Stage_t_constant_02_02_05),
         .run(run),

         .clk(clk),
         .rst(rst)
      );
         F_Stage  fa_10 (
         .out0(output_20_0),
         .out1(output_20_1),
         .out2(output_20_2),
         .out3(output_20_3),
         .out4(output_20_4),
         .out5(output_20_5),
         .out6(output_20_6),
         .out7(output_20_7),
         .in0(output_19_0),
         .in1(output_19_1),
         .in2(output_19_2),
         .in3(output_19_3),
         .in4(output_19_4),
         .in5(output_19_5),
         .in6(output_19_6),
         .in7(output_19_7),
         .in8(in8), // k
         .in9(in9), // w
         .Comb_F_Stage_t_constant_00_00_00(Comb_F_Stage_t_constant_00_00_00),
         .Comb_F_Stage_t_constant_01_01_01(Comb_F_Stage_t_constant_01_01_01),
         .Comb_F_Stage_t_constant_02_02_02(Comb_F_Stage_t_constant_02_02_02),
         .Comb_F_Stage_t_constant_00_00_03(Comb_F_Stage_t_constant_00_00_03),
         .Comb_F_Stage_t_constant_01_01_04(Comb_F_Stage_t_constant_01_01_04),
         .Comb_F_Stage_t_constant_02_02_05(Comb_F_Stage_t_constant_02_02_05),
         .run(run),

         .clk(clk),
         .rst(rst)
      );
         F_Stage  fb_11 (
         .out0(output_21_0),
         .out1(output_21_1),
         .out2(output_21_2),
         .out3(output_21_3),
         .out4(output_21_4),
         .out5(output_21_5),
         .out6(output_21_6),
         .out7(output_21_7),
         .in0(output_20_0),
         .in1(output_20_1),
         .in2(output_20_2),
         .in3(output_20_3),
         .in4(output_20_4),
         .in5(output_20_5),
         .in6(output_20_6),
         .in7(output_20_7),
         .in8(in8), // k
         .in9(in9), // w
         .Comb_F_Stage_t_constant_00_00_00(Comb_F_Stage_t_constant_00_00_00),
         .Comb_F_Stage_t_constant_01_01_01(Comb_F_Stage_t_constant_01_01_01),
         .Comb_F_Stage_t_constant_02_02_02(Comb_F_Stage_t_constant_02_02_02),
         .Comb_F_Stage_t_constant_00_00_03(Comb_F_Stage_t_constant_00_00_03),
         .Comb_F_Stage_t_constant_01_01_04(Comb_F_Stage_t_constant_01_01_04),
         .Comb_F_Stage_t_constant_02_02_05(Comb_F_Stage_t_constant_02_02_05),
         .run(run),

         .clk(clk),
         .rst(rst)
      );
         F_Stage  fc_12 (
         .out0(output_22_0),
         .out1(output_22_1),
         .out2(output_22_2),
         .out3(output_22_3),
         .out4(output_22_4),
         .out5(output_22_5),
         .out6(output_22_6),
         .out7(output_22_7),
         .in0(output_21_0),
         .in1(output_21_1),
         .in2(output_21_2),
         .in3(output_21_3),
         .in4(output_21_4),
         .in5(output_21_5),
         .in6(output_21_6),
         .in7(output_21_7),
         .in8(in8), // k
         .in9(in9), // w
         .Comb_F_Stage_t_constant_00_00_00(Comb_F_Stage_t_constant_00_00_00),
         .Comb_F_Stage_t_constant_01_01_01(Comb_F_Stage_t_constant_01_01_01),
         .Comb_F_Stage_t_constant_02_02_02(Comb_F_Stage_t_constant_02_02_02),
         .Comb_F_Stage_t_constant_00_00_03(Comb_F_Stage_t_constant_00_00_03),
         .Comb_F_Stage_t_constant_01_01_04(Comb_F_Stage_t_constant_01_01_04),
         .Comb_F_Stage_t_constant_02_02_05(Comb_F_Stage_t_constant_02_02_05),
         .run(run),

         .clk(clk),
         .rst(rst)
      );
         F_Stage  fd_13 (
         .out0(output_23_0),
         .out1(output_23_1),
         .out2(output_23_2),
         .out3(output_23_3),
         .out4(output_23_4),
         .out5(output_23_5),
         .out6(output_23_6),
         .out7(output_23_7),
         .in0(output_22_0),
         .in1(output_22_1),
         .in2(output_22_2),
         .in3(output_22_3),
         .in4(output_22_4),
         .in5(output_22_5),
         .in6(output_22_6),
         .in7(output_22_7),
         .in8(in8), // k
         .in9(in9), // w
         .Comb_F_Stage_t_constant_00_00_00(Comb_F_Stage_t_constant_00_00_00),
         .Comb_F_Stage_t_constant_01_01_01(Comb_F_Stage_t_constant_01_01_01),
         .Comb_F_Stage_t_constant_02_02_02(Comb_F_Stage_t_constant_02_02_02),
         .Comb_F_Stage_t_constant_00_00_03(Comb_F_Stage_t_constant_00_00_03),
         .Comb_F_Stage_t_constant_01_01_04(Comb_F_Stage_t_constant_01_01_04),
         .Comb_F_Stage_t_constant_02_02_05(Comb_F_Stage_t_constant_02_02_05),
         .run(run),

         .clk(clk),
         .rst(rst)
      );
         F_Stage  fe_14 (
         .out0(output_24_0),
         .out1(output_24_1),
         .out2(output_24_2),
         .out3(output_24_3),
         .out4(output_24_4),
         .out5(output_24_5),
         .out6(output_24_6),
         .out7(output_24_7),
         .in0(output_23_0),
         .in1(output_23_1),
         .in2(output_23_2),
         .in3(output_23_3),
         .in4(output_23_4),
         .in5(output_23_5),
         .in6(output_23_6),
         .in7(output_23_7),
         .in8(in8), // k
         .in9(in9), // w
         .Comb_F_Stage_t_constant_00_00_00(Comb_F_Stage_t_constant_00_00_00),
         .Comb_F_Stage_t_constant_01_01_01(Comb_F_Stage_t_constant_01_01_01),
         .Comb_F_Stage_t_constant_02_02_02(Comb_F_Stage_t_constant_02_02_02),
         .Comb_F_Stage_t_constant_00_00_03(Comb_F_Stage_t_constant_00_00_03),
         .Comb_F_Stage_t_constant_01_01_04(Comb_F_Stage_t_constant_01_01_04),
         .Comb_F_Stage_t_constant_02_02_05(Comb_F_Stage_t_constant_02_02_05),
         .run(run),

         .clk(clk),
         .rst(rst)
      );
         F_Stage  ff_15 (
         .out0(output_25_0),
         .out1(output_25_1),
         .out2(output_25_2),
         .out3(output_25_3),
         .out4(output_25_4),
         .out5(output_25_5),
         .out6(output_25_6),
         .out7(output_25_7),
         .in0(output_24_0),
         .in1(output_24_1),
         .in2(output_24_2),
         .in3(output_24_3),
         .in4(output_24_4),
         .in5(output_24_5),
         .in6(output_24_6),
         .in7(output_24_7),
         .in8(in8), // k
         .in9(in9), // w
         .Comb_F_Stage_t_constant_00_00_00(Comb_F_Stage_t_constant_00_00_00),
         .Comb_F_Stage_t_constant_01_01_01(Comb_F_Stage_t_constant_01_01_01),
         .Comb_F_Stage_t_constant_02_02_02(Comb_F_Stage_t_constant_02_02_02),
         .Comb_F_Stage_t_constant_00_00_03(Comb_F_Stage_t_constant_00_00_03),
         .Comb_F_Stage_t_constant_01_01_04(Comb_F_Stage_t_constant_01_01_04),
         .Comb_F_Stage_t_constant_02_02_05(Comb_F_Stage_t_constant_02_02_05),
         .run(run),

         .clk(clk),
         .rst(rst)
      );
         assign out0 = output_25_0;
   assign out1 = output_25_1;
   assign out2 = output_25_2;
   assign out3 = output_25_3;
   assign out4 = output_25_4;
   assign out5 = output_25_5;
   assign out6 = output_25_6;
   assign out7 = output_25_7;
   endmodule
