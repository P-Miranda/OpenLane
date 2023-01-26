`timescale 1ns / 1ps
`include "global_defines.vh"
`include "system.vh"
`include "axi.vh"
`include "xversat.vh"
`include "xdefs.vh"

module StaticMux #(
      parameter ADDR_W = `ADDR_W,
      parameter DATA_W = `DATA_W,
      parameter AXI_ADDR_W = 32
   )
   (

   input run,
   
   input [DATA_W-1:0]              in0,
   input [DATA_W-1:0]              in1,
   output [DATA_W-1:0]             out0,
   input [0:0]     sel_00,
   input                           clk,
   input                           rst
   );

wire wor_ready;

wire [31:0] unitRdataFinal;
reg [31:0] stateRead;

wire [31:0] output_0_0 , output_1_0 , output_2_0 ;

Mux2  mux_0 (
         .out0(output_2_0),
         .in0(in0), // x
         .in1(in1), // y
         .sel(sel_00),
         .run(run),

         .clk(clk),
         .rst(rst)
      );
         assign out0 = output_2_0;
   endmodule
