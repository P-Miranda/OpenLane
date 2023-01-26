`timescale 1ns / 1ps
`include "global_defines.vh"
`include "system.vh"
`include "axi.vh"
`include "xversat.vh"
`include "xdefs.vh"

module ShiftRows #(
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

wire [31:0] output_0_0 , output_1_0 , output_2_0 , output_3_0 , output_4_0 , output_5_0 , output_6_0 , output_7_0 , output_8_0 , output_9_0 , output_10_0 , output_11_0 , output_12_0 , output_13_0 , output_14_0 , output_15_0 ;

assign out0 = in0;
   assign out1 = in1;
   assign out2 = in2;
   assign out3 = in3;
   assign out7 = in4;
   assign out4 = in5;
   assign out5 = in6;
   assign out6 = in7;
   assign out10 = in8;
   assign out11 = in9;
   assign out8 = in10;
   assign out9 = in11;
   assign out13 = in12;
   assign out14 = in13;
   assign out15 = in14;
   assign out12 = in15;
   endmodule
