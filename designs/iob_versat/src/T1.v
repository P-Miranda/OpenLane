`timescale 1ns / 1ps
`include "global_defines.vh"
`include "system.vh"
`include "axi.vh"
`include "xversat.vh"
`include "xdefs.vh"

module T1 #(
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
   output [DATA_W-1:0]             out0,
   input [31:0]     constant_00_00,
   input [31:0]     constant_01_01,
   input [31:0]     constant_02_02,
   input                           clk,
   input                           rst
   );

wire wor_ready;

wire [31:0] unitRdataFinal;
reg [31:0] stateRead;

wire [31:0] output_0_0 , output_1_0 , output_2_0 , output_3_0 , output_4_0 , output_5_0 , output_6_0 , output_7_0 , output_8_0 , output_9_0 , output_10_0 , output_11_0 ;

reg [31:0] comb_a1 ,comb_a2 ,comb_a3 ,comb_b1 ; 

always @*
begin
comb_a1 = in3 + output_7_0;
      comb_a2 = output_6_0 + in4;
      comb_a3 = comb_a1 + comb_a2;
      comb_b1 = comb_a3 + in5;
      end
CH  ch_0 (
         .out0(output_6_0),
         .in0(in0), // e
         .in1(in1), // f
         .in2(in2), // g
         .run(run),

         .clk(clk),
         .rst(rst)
      );
         Sigma  s_1 (
         .out0(output_7_0),
         .in0(in0), // e
         .constant_00(constant_00_00),
         .constant_01(constant_01_01),
         .constant_02(constant_02_02),
         .run(run),

         .clk(clk),
         .rst(rst)
      );
         assign out0 = comb_b1;
   endmodule
