`timescale 1ns / 1ps
`include "global_defines.vh"
`include "system.vh"
`include "axi.vh"
`include "xversat.vh"
`include "xdefs.vh"

module DoRow #(
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
   output [DATA_W-1:0]             out1,
   output [DATA_W-1:0]             out2,
   output [DATA_W-1:0]             out3,
   input [5:0]     DoRow_buffer0_amount,
   input [5:0]     DoRow_buffer1_amount,
   input [5:0]     DoRow_buffer2_amount,
   input [5:0]     DoRow_buffer3_amount,
   input [5:0]     DoRow_buffer4_amount,
   input [5:0]     DoRow_buffer5_amount,
   input [5:0]     DoRow_buffer6_amount,
   input [5:0]     DoRow_buffer7_amount,
   // data/control interface
   input                           valid,
   input [9:0] addr,
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
wire[3:0] unitReady;
reg [3:0] memoryMappedEnable;
wire [31:0] unitRData[3:0];

assign rdata = unitRdataFinal;
assign ready = wor_ready;
assign wor_ready = (|unitReady);

wire [31:0] rdata_0 , rdata_1 , rdata_2 , rdata_3 ;

assign unitRdataFinal = (unitRData[0] |unitRData[1] |unitRData[2] |unitRData[3] );
wire [31:0] output_0_0 , output_1_0 , output_2_0 , output_3_0 , output_4_0 , output_4_1 , output_5_0 , output_5_1 , output_6_0 , output_6_1 , output_7_0 , output_7_1 , output_8_0 , output_9_0 , output_10_0 , output_11_0 , output_13_0 , output_14_0 , output_15_0 , output_16_0 , output_17_0 , output_18_0 , output_19_0 , output_20_0 ;

// Memory mapped
always @*
begin
   memoryMappedEnable = {4{1'b0}};
   if(valid)
   begin
   if(addr[9:8] == 2'b11)
            memoryMappedEnable[0] = 1'b1;
      if(addr[9:8] == 2'b01)
            memoryMappedEnable[1] = 1'b1;
      if(addr[9:8] == 2'b10)
            memoryMappedEnable[2] = 1'b1;
      if(addr[9:8] == 2'b00)
            memoryMappedEnable[3] = 1'b1;
      end
end
LookupTable  mul2_0_0 (
         .out0(output_4_0),
         .out1(output_4_1),
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
         LookupTable  mul2_1_1 (
         .out0(output_5_0),
         .out1(output_5_1),
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
         LookupTable  mul3_0_2 (
         .out0(output_6_0),
         .out1(output_6_1),
         .in0(in0), // x0
         .in1(in1), // x1
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
         LookupTable  mul3_1_3 (
         .out0(output_7_0),
         .out1(output_7_1),
         .in0(in2), // x2
         .in1(in3), // x3
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
         MixProduct  m0_4 (
         .out0(output_8_0),
         .in0(output_4_0),
         .in1(output_6_1),
         .in3(output_13_0),
         .in2(output_15_0),
         .run(run),

         .clk(clk),
         .rst(rst)
      );
         MixProduct  m1_5 (
         .out0(output_9_0),
         .in1(output_4_1),
         .in2(output_7_0),
         .in3(output_14_0),
         .in0(output_19_0),
         .run(run),

         .clk(clk),
         .rst(rst)
      );
         MixProduct  m2_6 (
         .out0(output_10_0),
         .in2(output_5_0),
         .in3(output_7_1),
         .in1(output_17_0),
         .in0(output_20_0),
         .run(run),

         .clk(clk),
         .rst(rst)
      );
         MixProduct  m3_7 (
         .out0(output_11_0),
         .in0(output_6_0),
         .in3(output_5_1),
         .in2(output_16_0),
         .in1(output_18_0),
         .run(run),

         .clk(clk),
         .rst(rst)
      );
         Buffer  buffer0_8 (
         .out0(output_13_0),
         .in0(in3), // x3
         .amount(DoRow_buffer0_amount),
         .run(run),

         .clk(clk),
         .rst(rst)
      );
         Buffer  buffer1_9 (
         .out0(output_14_0),
         .in0(in3), // x3
         .amount(DoRow_buffer1_amount),
         .run(run),

         .clk(clk),
         .rst(rst)
      );
         Buffer  buffer2_10 (
         .out0(output_15_0),
         .in0(in2), // x2
         .amount(DoRow_buffer2_amount),
         .run(run),

         .clk(clk),
         .rst(rst)
      );
         Buffer  buffer3_11 (
         .out0(output_16_0),
         .in0(in2), // x2
         .amount(DoRow_buffer3_amount),
         .run(run),

         .clk(clk),
         .rst(rst)
      );
         Buffer  buffer4_12 (
         .out0(output_17_0),
         .in0(in1), // x1
         .amount(DoRow_buffer4_amount),
         .run(run),

         .clk(clk),
         .rst(rst)
      );
         Buffer  buffer5_13 (
         .out0(output_18_0),
         .in0(in1), // x1
         .amount(DoRow_buffer5_amount),
         .run(run),

         .clk(clk),
         .rst(rst)
      );
         Buffer  buffer6_14 (
         .out0(output_19_0),
         .in0(in0), // x0
         .amount(DoRow_buffer6_amount),
         .run(run),

         .clk(clk),
         .rst(rst)
      );
         Buffer  buffer7_15 (
         .out0(output_20_0),
         .in0(in0), // x0
         .amount(DoRow_buffer7_amount),
         .run(run),

         .clk(clk),
         .rst(rst)
      );
         assign out0 = output_8_0;
   assign out1 = output_9_0;
   assign out2 = output_10_0;
   assign out3 = output_11_0;
   endmodule
