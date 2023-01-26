`timescale 1ns / 1ps
`include "global_defines.vh"
`include "system.vh"
`include "axi.vh"
`include "xversat.vh"
`include "xdefs.vh"

module StaticConst #(
      parameter ADDR_W = `ADDR_W,
      parameter DATA_W = `DATA_W,
      parameter AXI_ADDR_W = 32
   )
   (

   input run,
   
   output [DATA_W-1:0]             out0,
   input [31:0]     StaticConst_var_constant,
   input                           clk,
   input                           rst
   );

wire wor_ready;

wire [31:0] unitRdataFinal;
reg [31:0] stateRead;

wire [31:0] output_0_0 ;

Const  var_0 (
         .out0(output_0_0),
         .constant(StaticConst_var_constant),
         .run(run),

         .clk(clk),
         .rst(rst)
      );
         assign out0 = output_0_0;
   endmodule
