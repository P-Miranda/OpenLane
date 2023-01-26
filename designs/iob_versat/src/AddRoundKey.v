`timescale 1ns / 1ps
`include "global_defines.vh"
`include "system.vh"
`include "axi.vh"
`include "xversat.vh"
`include "xdefs.vh"

module AddRoundKey #(
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
   input [DATA_W-1:0]              in10,
   input [DATA_W-1:0]              in11,
   input [DATA_W-1:0]              in12,
   input [DATA_W-1:0]              in13,
   input [DATA_W-1:0]              in14,
   input [DATA_W-1:0]              in15,
   input [DATA_W-1:0]              in16,
   input [DATA_W-1:0]              in17,
   input [DATA_W-1:0]              in18,
   input [DATA_W-1:0]              in19,
   input [DATA_W-1:0]              in20,
   input [DATA_W-1:0]              in21,
   input [DATA_W-1:0]              in22,
   input [DATA_W-1:0]              in23,
   input [DATA_W-1:0]              in24,
   input [DATA_W-1:0]              in25,
   input [DATA_W-1:0]              in26,
   input [DATA_W-1:0]              in27,
   input [DATA_W-1:0]              in28,
   input [DATA_W-1:0]              in29,
   input [DATA_W-1:0]              in30,
   input [DATA_W-1:0]              in31,
   output [DATA_W-1:0]             out0,
   output [DATA_W-1:0]             out1,
   output [DATA_W-1:0]             out2,
   output [DATA_W-1:0]             out3,
   output [DATA_W-1:0]             out4,
   output [DATA_W-1:0]             out5,
   output [DATA_W-1:0]             out6,
   output [DATA_W-1:0]             out7,
   output [DATA_W-1:0]             out8,
   output [DATA_W-1:0]             out9,
   output [DATA_W-1:0]             out10,
   output [DATA_W-1:0]             out11,
   output [DATA_W-1:0]             out12,
   output [DATA_W-1:0]             out13,
   output [DATA_W-1:0]             out14,
   output [DATA_W-1:0]             out15,
   input                           clk,
   input                           rst
   );

wire wor_ready;

wire [31:0] unitRdataFinal;
reg [31:0] stateRead;

wire [31:0] output_0_0 , output_1_0 , output_2_0 , output_3_0 , output_4_0 , output_5_0 , output_6_0 , output_7_0 , output_8_0 , output_9_0 , output_10_0 , output_11_0 , output_12_0 , output_13_0 , output_14_0 , output_15_0 , output_16_0 , output_17_0 , output_18_0 , output_19_0 , output_20_0 , output_21_0 , output_22_0 , output_23_0 , output_24_0 , output_25_0 , output_26_0 , output_27_0 , output_28_0 , output_29_0 , output_30_0 , output_31_0 , output_32_0 , output_33_0 , output_34_0 , output_35_0 , output_36_0 , output_37_0 , output_38_0 , output_39_0 , output_40_0 , output_41_0 , output_42_0 , output_43_0 , output_44_0 , output_45_0 , output_46_0 , output_47_0 ;

reg [31:0] comb_a0 ,comb_a1 ,comb_a2 ,comb_a3 ,comb_a4 ,comb_a5 ,comb_a6 ,comb_a7 ,comb_a8 ,comb_a9 ,comb_aa ,comb_ab ,comb_ac ,comb_ad ,comb_ae ,comb_af ; 

always @*
begin
comb_a0 = in0 ^ in16;
      comb_a1 = in1 ^ in17;
      comb_a2 = in2 ^ in18;
      comb_a3 = in3 ^ in19;
      comb_a4 = in4 ^ in20;
      comb_a5 = in5 ^ in21;
      comb_a6 = in6 ^ in22;
      comb_a7 = in7 ^ in23;
      comb_a8 = in8 ^ in24;
      comb_a9 = in9 ^ in25;
      comb_aa = in10 ^ in26;
      comb_ab = in11 ^ in27;
      comb_ac = in12 ^ in28;
      comb_ad = in13 ^ in29;
      comb_ae = in14 ^ in30;
      comb_af = in15 ^ in31;
      end
assign out0 = comb_a0;
   assign out1 = comb_a1;
   assign out2 = comb_a2;
   assign out3 = comb_a3;
   assign out4 = comb_a4;
   assign out5 = comb_a5;
   assign out6 = comb_a6;
   assign out7 = comb_a7;
   assign out8 = comb_a8;
   assign out9 = comb_a9;
   assign out10 = comb_aa;
   assign out11 = comb_ab;
   assign out12 = comb_ac;
   assign out13 = comb_ad;
   assign out14 = comb_ae;
   assign out15 = comb_af;
   endmodule
