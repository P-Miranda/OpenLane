`timescale 1ns / 1ps
`include "global_defines.vh"
`include "system.vh"
`include "axi.vh"
`include "xversat.vh"
`include "xdefs.vh"

module SimpleAdder #(
      parameter ADDR_W = `ADDR_W,
      parameter DATA_W = `DATA_W,
      parameter AXI_ADDR_W = 32
   )
   (

   input run,
   
   output done,
   input [31:0]     constant_00,
   input [31:0]     constant_01,
   output [31:0]    currentValue_00,
   input  [31:0]                   delay0,
   // data/control interface
   input                           valid,
   input [DATA_W/8-1:0]            wstrb,
   input [DATA_W-1:0]              wdata,
   output                          ready,
   output [DATA_W-1:0]             rdata,
   input                           clk,
   input                           rst
   );

wire wor_ready;

wire [31:0] unitRdataFinal;
reg [31:0] stateRead;

// Memory access
wire we = (|wstrb);
wire[0:0] unitReady;
reg [0:0] memoryMappedEnable;
wire [31:0] unitRData[0:0];

assign rdata = unitRdataFinal;
assign ready = wor_ready;
assign wor_ready = (|unitReady);

wire [31:0] rdata_0 ;

assign unitRdataFinal = (unitRData[0] );
wire [0:0] unitDone;
assign done = &unitDone;
wire [31:0] output_0_0 , output_1_0 , output_3_0 ;

// Memory mapped
always @*
begin
   memoryMappedEnable = {1{1'b0}};
   if(valid)
   begin
   memoryMappedEnable[0] = 1'b1;
      end
end
reg [31:0] comb_a ; 

always @*
begin
comb_a = output_0_0 + output_1_0;
      end
Const  a1_0 (
         .out0(output_0_0),
         .constant(constant_00),
         .run(run),

         .clk(clk),
         .rst(rst)
      );
         Const  a2_1 (
         .out0(output_1_0),
         .constant(constant_01),
         .run(run),

         .clk(clk),
         .rst(rst)
      );
         Reg  res_2 (
         .in0(comb_a),
         .delay0(delay0),
         .currentValue(currentValue_00),
         .valid(memoryMappedEnable[0]),
         .wstrb(wstrb),
         .rdata(unitRData[0]),
         .ready(unitReady[0]),
         .wdata(wdata),
         .run(run),

         .done(unitDone[0]),
         .clk(clk),
         .rst(rst)
      );
         endmodule
