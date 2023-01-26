`timescale 1ns / 1ps
`include "global_defines.vh"
`include "system.vh"
`include "axi.vh"
`include "xversat.vh"
`include "xdefs.vh"

module FirstLineKey #(
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
   output [DATA_W-1:0]             out0,
   output [DATA_W-1:0]             out1,
   output [DATA_W-1:0]             out2,
   output [DATA_W-1:0]             out3,
   // data/control interface
   input                           valid,
   input [8:0] addr,
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
wire[1:0] unitReady;
reg [1:0] memoryMappedEnable;
wire [31:0] unitRData[1:0];

assign rdata = unitRdataFinal;
assign ready = wor_ready;
assign wor_ready = (|unitReady);

wire [31:0] rdata_0 , rdata_1 ;

assign unitRdataFinal = (unitRData[0] |unitRData[1] );
wire [31:0] output_0_0 , output_1_0 , output_2_0 , output_3_0 , output_4_0 , output_5_0 , output_6_0 , output_7_0 , output_8_0 , output_9_0 , output_9_1 , output_10_0 , output_10_1 , output_11_0 , output_12_0 , output_13_0 , output_14_0 , output_15_0 ;

// Memory mapped
always @*
begin
   memoryMappedEnable = {2{1'b0}};
   if(valid)
   begin
   if(addr[8:8] == 1'b1)
            memoryMappedEnable[0] = 1'b1;
      if(addr[8:8] == 1'b0)
            memoryMappedEnable[1] = 1'b1;
      end
end
reg [31:0] comb_a1 ,comb_d0 ,comb_d1 ,comb_d2 ,comb_d3 ; 

always @*
begin
comb_a1 = output_9_0 ^ in4;
      comb_d0 = comb_a1 ^ in8;
      comb_d1 = output_9_1 ^ in5;
      comb_d2 = output_10_0 ^ in6;
      comb_d3 = output_10_1 ^ in7;
      end
LookupTable  b0_0 (
         .out0(output_9_0),
         .out1(output_9_1),
         .in0(in1), // x1
         .in1(in2), // x2
         .valid(memoryMappedEnable[0]),
         .wstrb(wstrb),
         .addr(addr[7:0]),
         .rdata(unitRData[0]),
         .ready(unitReady[0]),
         .wdata(wdata),
         .run(run),

         .clk(clk),
         .rst(rst)
      );
         LookupTable  b1_1 (
         .out0(output_10_0),
         .out1(output_10_1),
         .in0(in3), // x3
         .in1(in0), // x0
         .valid(memoryMappedEnable[1]),
         .wstrb(wstrb),
         .addr(addr[7:0]),
         .rdata(unitRData[1]),
         .ready(unitReady[1]),
         .wdata(wdata),
         .run(run),

         .clk(clk),
         .rst(rst)
      );
         assign out0 = comb_d0;
   assign out1 = comb_d1;
   assign out2 = comb_d2;
   assign out3 = comb_d3;
   endmodule
