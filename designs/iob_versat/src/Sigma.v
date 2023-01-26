`timescale 1ns / 1ps
`include "global_defines.vh"
`include "system.vh"
`include "axi.vh"
`include "xversat.vh"
`include "xdefs.vh"

module Sigma #(
      parameter ADDR_W = `ADDR_W,
      parameter DATA_W = `DATA_W,
      parameter AXI_ADDR_W = 32
   )
   (

   input run,
   
   input [DATA_W-1:0]              in0,
   output [DATA_W-1:0]             out0,
   input [31:0]     constant_00,
   input [31:0]     constant_01,
   input [31:0]     constant_02,
   input                           clk,
   input                           rst
   );

wire wor_ready;

wire [31:0] unitRdataFinal;
reg [31:0] stateRead;

wire [31:0] output_0_0 , output_1_0 , output_2_0 , output_3_0 , output_4_0 , output_5_0 , output_6_0 , output_7_0 , output_8_0 ;

reg [31:0] comb_a1 ,comb_a2 ,comb_a3 ,comb_b1 ,comb_c1 ; 

always @*
begin
comb_a1 = (in0 >> output_1_0) | (in0 << (32 - output_1_0));
      comb_a2 = (in0 >> output_2_0) | (in0 << (32 - output_2_0));
      comb_a3 = (in0 >> output_3_0) | (in0 << (32 - output_3_0));
      comb_b1 = comb_a1 ^ comb_a2;
      comb_c1 = comb_b1 ^ comb_a3;
      end
Const  const1_0 (
         .out0(output_1_0),
         .constant(constant_00),
         .run(run),

         .clk(clk),
         .rst(rst)
      );
         Const  const2_1 (
         .out0(output_2_0),
         .constant(constant_01),
         .run(run),

         .clk(clk),
         .rst(rst)
      );
         Const  const3_2 (
         .out0(output_3_0),
         .constant(constant_02),
         .run(run),

         .clk(clk),
         .rst(rst)
      );
         assign out0 = comb_c1;
   endmodule
