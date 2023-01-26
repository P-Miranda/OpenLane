`timescale 1ns / 1ps
`include "global_defines.vh"
`include "system.vh"
`include "axi.vh"
`include "xversat.vh"
`include "xdefs.vh"

module ShaState #(
      parameter ADDR_W = `ADDR_W,
      parameter DATA_W = `DATA_W,
      parameter AXI_ADDR_W = 32
   )
   (

   input run,
   
   output done,
   input [DATA_W-1:0]              in0,
   input [DATA_W-1:0]              in1,
   input [DATA_W-1:0]              in2,
   input [DATA_W-1:0]              in3,
   input [DATA_W-1:0]              in4,
   input [DATA_W-1:0]              in5,
   input [DATA_W-1:0]              in6,
   input [DATA_W-1:0]              in7,
   output [DATA_W-1:0]             out0,
   output [DATA_W-1:0]             out1,
   output [DATA_W-1:0]             out2,
   output [DATA_W-1:0]             out3,
   output [DATA_W-1:0]             out4,
   output [DATA_W-1:0]             out5,
   output [DATA_W-1:0]             out6,
   output [DATA_W-1:0]             out7,
   output [31:0]    currentValue_00_00,
   output [31:0]    currentValue_00_01,
   output [31:0]    currentValue_00_02,
   output [31:0]    currentValue_00_03,
   output [31:0]    currentValue_00_04,
   output [31:0]    currentValue_00_05,
   output [31:0]    currentValue_00_06,
   output [31:0]    currentValue_00_07,
   input  [31:0]                   delay0,
   input  [31:0]                   delay1,
   input  [31:0]                   delay2,
   input  [31:0]                   delay3,
   input  [31:0]                   delay4,
   input  [31:0]                   delay5,
   input  [31:0]                   delay6,
   input  [31:0]                   delay7,
   // data/control interface
   input                           valid,
   input [2:0] addr,
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
wire [7:0] unitDone;
assign done = &unitDone;
wire [31:0] output_0_0 , output_1_0 , output_2_0 , output_3_0 , output_4_0 , output_5_0 , output_6_0 , output_7_0 , output_8_0 , output_9_0 , output_10_0 , output_11_0 , output_12_0 , output_13_0 , output_14_0 , output_15_0 ;

// Memory mapped
always @*
begin
   memoryMappedEnable = {8{1'b0}};
   if(valid)
   begin
   if(addr[2:0] == 3'b111)
            memoryMappedEnable[0] = 1'b1;
      if(addr[2:0] == 3'b100)
            memoryMappedEnable[1] = 1'b1;
      if(addr[2:0] == 3'b110)
            memoryMappedEnable[2] = 1'b1;
      if(addr[2:0] == 3'b000)
            memoryMappedEnable[3] = 1'b1;
      if(addr[2:0] == 3'b001)
            memoryMappedEnable[4] = 1'b1;
      if(addr[2:0] == 3'b010)
            memoryMappedEnable[5] = 1'b1;
      if(addr[2:0] == 3'b011)
            memoryMappedEnable[6] = 1'b1;
      if(addr[2:0] == 3'b101)
            memoryMappedEnable[7] = 1'b1;
      end
end
ShaSingleState  s0_0 (
         .out0(output_8_0),
         .in0(in0), // x0
         .delay0(delay0),
         .currentValue_00(currentValue_00_00),
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
         ShaSingleState  s1_1 (
         .out0(output_9_0),
         .in0(in1), // x1
         .delay0(delay1),
         .currentValue_00(currentValue_00_01),
         .valid(memoryMappedEnable[1]),
         .wstrb(wstrb),
         .rdata(unitRData[1]),
         .ready(unitReady[1]),
         .wdata(wdata),
         .run(run),

         .done(unitDone[1]),
         .clk(clk),
         .rst(rst)
      );
         ShaSingleState  s2_2 (
         .out0(output_10_0),
         .in0(in2), // x2
         .delay0(delay2),
         .currentValue_00(currentValue_00_02),
         .valid(memoryMappedEnable[2]),
         .wstrb(wstrb),
         .rdata(unitRData[2]),
         .ready(unitReady[2]),
         .wdata(wdata),
         .run(run),

         .done(unitDone[2]),
         .clk(clk),
         .rst(rst)
      );
         ShaSingleState  s3_3 (
         .out0(output_11_0),
         .in0(in3), // x3
         .delay0(delay3),
         .currentValue_00(currentValue_00_03),
         .valid(memoryMappedEnable[3]),
         .wstrb(wstrb),
         .rdata(unitRData[3]),
         .ready(unitReady[3]),
         .wdata(wdata),
         .run(run),

         .done(unitDone[3]),
         .clk(clk),
         .rst(rst)
      );
         ShaSingleState  s4_4 (
         .out0(output_12_0),
         .in0(in4), // x4
         .delay0(delay4),
         .currentValue_00(currentValue_00_04),
         .valid(memoryMappedEnable[4]),
         .wstrb(wstrb),
         .rdata(unitRData[4]),
         .ready(unitReady[4]),
         .wdata(wdata),
         .run(run),

         .done(unitDone[4]),
         .clk(clk),
         .rst(rst)
      );
         ShaSingleState  s5_5 (
         .out0(output_13_0),
         .in0(in5), // x5
         .delay0(delay5),
         .currentValue_00(currentValue_00_05),
         .valid(memoryMappedEnable[5]),
         .wstrb(wstrb),
         .rdata(unitRData[5]),
         .ready(unitReady[5]),
         .wdata(wdata),
         .run(run),

         .done(unitDone[5]),
         .clk(clk),
         .rst(rst)
      );
         ShaSingleState  s6_6 (
         .out0(output_14_0),
         .in0(in6), // x6
         .delay0(delay6),
         .currentValue_00(currentValue_00_06),
         .valid(memoryMappedEnable[6]),
         .wstrb(wstrb),
         .rdata(unitRData[6]),
         .ready(unitReady[6]),
         .wdata(wdata),
         .run(run),

         .done(unitDone[6]),
         .clk(clk),
         .rst(rst)
      );
         ShaSingleState  s7_7 (
         .out0(output_15_0),
         .in0(in7), // x7
         .delay0(delay7),
         .currentValue_00(currentValue_00_07),
         .valid(memoryMappedEnable[7]),
         .wstrb(wstrb),
         .rdata(unitRData[7]),
         .ready(unitReady[7]),
         .wdata(wdata),
         .run(run),

         .done(unitDone[7]),
         .clk(clk),
         .rst(rst)
      );
         assign out0 = output_8_0;
   assign out1 = output_9_0;
   assign out2 = output_10_0;
   assign out3 = output_11_0;
   assign out4 = output_12_0;
   assign out5 = output_13_0;
   assign out6 = output_14_0;
   assign out7 = output_15_0;
   endmodule
