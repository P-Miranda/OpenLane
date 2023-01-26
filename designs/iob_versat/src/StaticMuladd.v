`timescale 1ns / 1ps
`include "global_defines.vh"
`include "system.vh"
`include "axi.vh"
`include "xversat.vh"
`include "xdefs.vh"

module StaticMuladd #(
      parameter ADDR_W = `ADDR_W,
      parameter DATA_W = `DATA_W,
      parameter AXI_ADDR_W = 32
   )
   (

   input run,
   
   output done,
   input [DATA_W-1:0]              in0,
   input [DATA_W-1:0]              in1,
   output [DATA_W-1:0]             out0,
   input [0:0]     StaticMuladd_mul_opcode,
   input [9:0]     StaticMuladd_mul_iterations,
   input [9:0]     StaticMuladd_mul_period,
   input [5:0]     StaticMuladd_mul_shift,
   input  [31:0]                   delay0,
   input                           clk,
   input                           rst
   );

wire wor_ready;

wire [31:0] unitRdataFinal;
reg [31:0] stateRead;

wire [0:0] unitDone;
assign done = &unitDone;
wire [31:0] output_0_0 , output_1_0 , output_2_0 , output_3_0 ;

reg [31:0] comb_z ; 

always @*
begin
comb_z = in0 + in1;
      end
Muladd  mul_0 (
         .out0(output_2_0),
         .in0(in0), // x
         .in1(comb_z),
         .opcode(StaticMuladd_mul_opcode),
         .iterations(StaticMuladd_mul_iterations),
         .period(StaticMuladd_mul_period),
         .shift(StaticMuladd_mul_shift),
         .delay0(delay0),
         .run(run),

         .done(unitDone[0]),
         .clk(clk),
         .rst(rst)
      );
         assign out0 = output_2_0;
   endmodule
