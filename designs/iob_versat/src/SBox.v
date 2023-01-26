`timescale 1ns / 1ps
`include "global_defines.vh"
`include "system.vh"
`include "axi.vh"
`include "xversat.vh"
`include "xdefs.vh"

module SBox #(
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
   input [DATA_W-1:0]              in10,
   input [DATA_W-1:0]              in11,
   input [DATA_W-1:0]              in12,
   input [DATA_W-1:0]              in13,
   input [DATA_W-1:0]              in14,
   input [DATA_W-1:0]              in15,
   output [DATA_W-1:0]             out0,
   output [DATA_W-1:0]             out1,
   output [DATA_W-1:0]             out2,
   output [DATA_W-1:0]             out3,
   output [DATA_W-1:0]             out4,
   output [DATA_W-1:0]             out5,
   output [DATA_W-1:0]             out6,
   output [DATA_W-1:0]             out7,
   output [DATA_W-1:0]             out8,
   output [DATA_W-1:0]             out9,
   output [DATA_W-1:0]             out10,
   output [DATA_W-1:0]             out11,
   output [DATA_W-1:0]             out12,
   output [DATA_W-1:0]             out13,
   output [DATA_W-1:0]             out14,
   output [DATA_W-1:0]             out15,
   // data/control interface
   input                           valid,
   input [10:0] addr,
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
wire[7:0] unitReady;
reg [7:0] memoryMappedEnable;
wire [31:0] unitRData[7:0];

assign rdata = unitRdataFinal;
assign ready = wor_ready;
assign wor_ready = (|unitReady);

wire [31:0] rdata_0 , rdata_1 , rdata_2 , rdata_3 , rdata_4 , rdata_5 , rdata_6 , rdata_7 ;

assign unitRdataFinal = (unitRData[0] |unitRData[1] |unitRData[2] |unitRData[3] |unitRData[4] |unitRData[5] |unitRData[6] |unitRData[7] );
wire [31:0] output_0_0 , output_1_0 , output_2_0 , output_3_0 , output_4_0 , output_5_0 , output_6_0 , output_7_0 , output_8_0 , output_9_0 , output_10_0 , output_11_0 , output_12_0 , output_13_0 , output_14_0 , output_15_0 , output_16_0 , output_16_1 , output_17_0 , output_17_1 , output_18_0 , output_18_1 , output_19_0 , output_19_1 , output_20_0 , output_20_1 , output_21_0 , output_21_1 , output_22_0 , output_22_1 , output_23_0 , output_23_1 ;

// Memory mapped
always @*
begin
   memoryMappedEnable = {8{1'b0}};
   if(valid)
   begin
   if(addr[10:8] == 3'b111)
            memoryMappedEnable[0] = 1'b1;
      if(addr[10:8] == 3'b100)
            memoryMappedEnable[1] = 1'b1;
      if(addr[10:8] == 3'b110)
            memoryMappedEnable[2] = 1'b1;
      if(addr[10:8] == 3'b000)
            memoryMappedEnable[3] = 1'b1;
      if(addr[10:8] == 3'b001)
            memoryMappedEnable[4] = 1'b1;
      if(addr[10:8] == 3'b010)
            memoryMappedEnable[5] = 1'b1;
      if(addr[10:8] == 3'b011)
            memoryMappedEnable[6] = 1'b1;
      if(addr[10:8] == 3'b101)
            memoryMappedEnable[7] = 1'b1;
      end
end
LookupTable  s0_0 (
         .out0(output_16_0),
         .out1(output_16_1),
         .in0(in0), // x0
         .in1(in1), // x1
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
         LookupTable  s1_1 (
         .out0(output_17_0),
         .out1(output_17_1),
         .in0(in2), // x2
         .in1(in3), // x3
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
         LookupTable  s2_2 (
         .out0(output_18_0),
         .out1(output_18_1),
         .in0(in4), // x4
         .in1(in5), // x5
         .valid(memoryMappedEnable[2]),
         .wstrb(wstrb),
         .addr(addr[7:0]),
         .rdata(unitRData[2]),
         .ready(unitReady[2]),
         .wdata(wdata),
         .run(run),

         .clk(clk),
         .rst(rst)
      );
         LookupTable  s3_3 (
         .out0(output_19_0),
         .out1(output_19_1),
         .in0(in6), // x6
         .in1(in7), // x7
         .valid(memoryMappedEnable[3]),
         .wstrb(wstrb),
         .addr(addr[7:0]),
         .rdata(unitRData[3]),
         .ready(unitReady[3]),
         .wdata(wdata),
         .run(run),

         .clk(clk),
         .rst(rst)
      );
         LookupTable  s4_4 (
         .out0(output_20_0),
         .out1(output_20_1),
         .in0(in8), // x8
         .in1(in9), // x9
         .valid(memoryMappedEnable[4]),
         .wstrb(wstrb),
         .addr(addr[7:0]),
         .rdata(unitRData[4]),
         .ready(unitReady[4]),
         .wdata(wdata),
         .run(run),

         .clk(clk),
         .rst(rst)
      );
         LookupTable  s5_5 (
         .out0(output_21_0),
         .out1(output_21_1),
         .in0(in10), // xa
         .in1(in11), // xb
         .valid(memoryMappedEnable[5]),
         .wstrb(wstrb),
         .addr(addr[7:0]),
         .rdata(unitRData[5]),
         .ready(unitReady[5]),
         .wdata(wdata),
         .run(run),

         .clk(clk),
         .rst(rst)
      );
         LookupTable  s6_6 (
         .out0(output_22_0),
         .out1(output_22_1),
         .in0(in12), // xc
         .in1(in13), // xd
         .valid(memoryMappedEnable[6]),
         .wstrb(wstrb),
         .addr(addr[7:0]),
         .rdata(unitRData[6]),
         .ready(unitReady[6]),
         .wdata(wdata),
         .run(run),

         .clk(clk),
         .rst(rst)
      );
         LookupTable  s7_7 (
         .out0(output_23_0),
         .out1(output_23_1),
         .in0(in14), // xe
         .in1(in15), // xf
         .valid(memoryMappedEnable[7]),
         .wstrb(wstrb),
         .addr(addr[7:0]),
         .rdata(unitRData[7]),
         .ready(unitReady[7]),
         .wdata(wdata),
         .run(run),

         .clk(clk),
         .rst(rst)
      );
         assign out0 = output_16_0;
   assign out1 = output_16_1;
   assign out2 = output_17_0;
   assign out3 = output_17_1;
   assign out4 = output_18_0;
   assign out5 = output_18_1;
   assign out6 = output_19_0;
   assign out7 = output_19_1;
   assign out8 = output_20_0;
   assign out9 = output_20_1;
   assign out10 = output_21_0;
   assign out11 = output_21_1;
   assign out12 = output_22_0;
   assign out13 = output_22_1;
   assign out14 = output_23_0;
   assign out15 = output_23_1;
   endmodule
