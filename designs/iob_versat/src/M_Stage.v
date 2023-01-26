`timescale 1ns / 1ps
`include "global_defines.vh"
`include "system.vh"
`include "axi.vh"
`include "xversat.vh"
`include "xdefs.vh"

module M_Stage #(
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
   output [DATA_W-1:0]             out0,
   input [31:0]     M_Stage_sigma_constant_00_00,
   input [31:0]     M_Stage_sigma_constant_01_01,
   input [31:0]     M_Stage_sigma_constant_02_02,
   input [31:0]     M_Stage_sigma_constant_00_03,
   input [31:0]     M_Stage_sigma_constant_01_04,
   input [31:0]     M_Stage_sigma_constant_02_05,
   input                           clk,
   input                           rst
   );

wire wor_ready;

wire [31:0] unitRdataFinal;
reg [31:0] stateRead;

wire [31:0] output_0_0 , output_1_0 , output_2_0 , output_3_0 , output_4_0 , output_4_1 , output_5_0 , output_6_0 , output_7_0 , output_8_0 ;

reg [31:0] comb_a1 ,comb_a2 ,comb_b ; 

always @*
begin
comb_a1 = output_4_1 + in2;
      comb_a2 = output_4_0 + in0;
      comb_b = comb_a1 + comb_a2;
      end
reg [31:0] seq_r ; 

always @(posedge clk)
begin
seq_r <= comb_b;
   end
sigma_stage  sigma_0 (
         .out0(output_4_0),
         .out1(output_4_1),
         .in0(in3), // w1
         .in1(in1), // w14
         .constant_00_00(M_Stage_sigma_constant_00_00),
         .constant_01_01(M_Stage_sigma_constant_01_01),
         .constant_02_02(M_Stage_sigma_constant_02_02),
         .constant_00_03(M_Stage_sigma_constant_00_03),
         .constant_01_04(M_Stage_sigma_constant_01_04),
         .constant_02_05(M_Stage_sigma_constant_02_05),
         .run(run),

         .clk(clk),
         .rst(rst)
      );
         assign out0 = seq_r;
   endmodule
