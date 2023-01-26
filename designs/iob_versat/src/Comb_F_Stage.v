`timescale 1ns / 1ps
`include "global_defines.vh"
`include "system.vh"
`include "axi.vh"
`include "xversat.vh"
`include "xdefs.vh"

module Comb_F_Stage #(
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

wire [31:0] output_0_0 , output_1_0 , output_2_0 , output_3_0 , output_4_0 , output_5_0 , output_6_0 , output_7_0 , output_8_0 , output_9_0 , output_10_0 , output_10_1 , output_11_0 , output_12_0 ;

reg [31:0] comb_a1 ,comb_a2 ; 

always @*
begin
comb_a1 = output_10_0 + output_10_1;
      comb_a2 = in3 + output_10_0;
      end
T_Stage  t_0 (
         .out0(output_10_0),
         .out1(output_10_1),
         .in0(in0), // a
         .in1(in1), // b
         .in2(in2), // c
         .in3(in4), // e
         .in4(in5), // f
         .in5(in6), // g
         .in6(in7), // h
         .in7(in8), // k
         .in8(in9), // w
         .constant_00_00_00(Comb_F_Stage_t_constant_00_00_00),
         .constant_01_01_01(Comb_F_Stage_t_constant_01_01_01),
         .constant_02_02_02(Comb_F_Stage_t_constant_02_02_02),
         .constant_00_00_03(Comb_F_Stage_t_constant_00_00_03),
         .constant_01_01_04(Comb_F_Stage_t_constant_01_01_04),
         .constant_02_02_05(Comb_F_Stage_t_constant_02_02_05),
         .run(run),

         .clk(clk),
         .rst(rst)
      );
         assign out0 = comb_a1;
   assign out1 = in0;
   assign out2 = in1;
   assign out3 = in2;
   assign out4 = comb_a2;
   assign out5 = in4;
   assign out6 = in5;
   assign out7 = in6;
   endmodule
