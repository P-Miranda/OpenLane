`timescale 1ns / 1ps
`include "global_defines.vh"
`include "system.vh"
`include "axi.vh"
`include "xversat.vh"
`include "xdefs.vh"

module F_Stage #(
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

wire [31:0] output_0_0 , output_1_0 , output_2_0 , output_3_0 , output_4_0 , output_5_0 , output_6_0 , output_7_0 , output_8_0 , output_9_0 , output_10_0 , output_10_1 , output_10_2 , output_10_3 , output_10_4 , output_10_5 , output_10_6 , output_10_7 , output_11_0 , output_12_0 , output_13_0 , output_14_0 , output_15_0 , output_16_0 , output_17_0 , output_18_0 ;

reg [31:0] seq_d0 ,seq_d1 ,seq_d2 ,seq_d3 ,seq_d4 ,seq_d5 ,seq_d6 ,seq_d7 ; 

always @(posedge clk)
begin
seq_d0 <= output_10_0;
   seq_d1 <= output_10_1;
   seq_d2 <= output_10_2;
   seq_d3 <= output_10_3;
   seq_d4 <= output_10_4;
   seq_d5 <= output_10_5;
   seq_d6 <= output_10_6;
   seq_d7 <= output_10_7;
   end
Comb_F_Stage  f_stage_0 (
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
         assign out0 = seq_d0;
   assign out1 = seq_d1;
   assign out2 = seq_d2;
   assign out3 = seq_d3;
   assign out4 = seq_d4;
   assign out5 = seq_d5;
   assign out6 = seq_d6;
   assign out7 = seq_d7;
   endmodule
