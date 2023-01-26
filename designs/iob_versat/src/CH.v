`timescale 1ns / 1ps
`include "global_defines.vh"
`include "system.vh"
`include "axi.vh"
`include "xversat.vh"
`include "xdefs.vh"

module CH #(
      parameter ADDR_W = `ADDR_W,
      parameter DATA_W = `DATA_W,
      parameter AXI_ADDR_W = 32
   )
   (

   input run,
   
   input [DATA_W-1:0]              in0,
   input [DATA_W-1:0]              in1,
   input [DATA_W-1:0]              in2,
   output [DATA_W-1:0]             out0,
   input                           clk,
   input                           rst
   );

wire wor_ready;

wire [31:0] unitRdataFinal;
reg [31:0] stateRead;

wire [31:0] output_0_0 , output_1_0 , output_2_0 , output_3_0 , output_4_0 , output_5_0 , output_6_0 ;

reg [31:0] comb_a1 ,comb_not ,comb_a2 ,comb_b1 ; 

always @*
begin
comb_a1 = in0 & in1;
      comb_not = ~in0;
      comb_a2 = comb_not & in2;
      comb_b1 = comb_a1 ^ comb_a2;
      end
assign out0 = comb_b1;
   endmodule
