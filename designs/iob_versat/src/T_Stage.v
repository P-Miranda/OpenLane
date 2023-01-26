`timescale 1ns / 1ps
`include "global_defines.vh"
`include "system.vh"
`include "axi.vh"
`include "xversat.vh"
`include "xdefs.vh"

module T_Stage #(
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
   output [DATA_W-1:0]             out0,
   output [DATA_W-1:0]             out1,
   input [31:0]     constant_00_00_00,
   input [31:0]     constant_01_01_01,
   input [31:0]     constant_02_02_02,
   input [31:0]     constant_00_00_03,
   input [31:0]     constant_01_01_04,
   input [31:0]     constant_02_02_05,
   input                           clk,
   input                           rst
   );

wire wor_ready;

wire [31:0] unitRdataFinal;
reg [31:0] stateRead;

wire [31:0] output_0_0 , output_1_0 , output_2_0 , output_3_0 , output_4_0 , output_5_0 , output_6_0 , output_7_0 , output_8_0 , output_9_0 , output_10_0 ;

T1  t1_0 (
         .out0(output_9_0),
         .in0(in3), // e
         .in1(in4), // f
         .in2(in5), // g
         .in3(in6), // h
         .in4(in7), // k
         .in5(in8), // w
         .constant_00_00(constant_00_00_00),
         .constant_01_01(constant_01_01_01),
         .constant_02_02(constant_02_02_02),
         .run(run),

         .clk(clk),
         .rst(rst)
      );
         T2  t2_1 (
         .out0(output_10_0),
         .in0(in0), // a
         .in1(in1), // b
         .in2(in2), // c
         .constant_00_00(constant_00_00_03),
         .constant_01_01(constant_01_01_04),
         .constant_02_02(constant_02_02_05),
         .run(run),

         .clk(clk),
         .rst(rst)
      );
         assign out0 = output_9_0;
   assign out1 = output_10_0;
   endmodule
