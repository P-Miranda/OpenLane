`timescale 1ns / 1ps
`include "global_defines.vh"
`include "system.vh"
`include "axi.vh"
`include "xversat.vh"
`include "xdefs.vh"

module MixColumns #(
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
   input [11:0] addr,
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
wire [31:0] output_0_0 , output_1_0 , output_2_0 , output_3_0 , output_4_0 , output_5_0 , output_6_0 , output_7_0 , output_8_0 , output_9_0 , output_10_0 , output_11_0 , output_12_0 , output_13_0 , output_14_0 , output_15_0 , output_16_0 , output_16_1 , output_16_2 , output_16_3 , output_17_0 , output_17_1 , output_17_2 , output_17_3 , output_18_0 , output_18_1 , output_18_2 , output_18_3 , output_19_0 , output_19_1 , output_19_2 , output_19_3 ;

// Memory mapped
always @*
begin
   memoryMappedEnable = {4{1'b0}};
   if(valid)
   begin
   if(addr[11:10] == 2'b11)
            memoryMappedEnable[0] = 1'b1;
      if(addr[11:10] == 2'b01)
            memoryMappedEnable[1] = 1'b1;
      if(addr[11:10] == 2'b10)
            memoryMappedEnable[2] = 1'b1;
      if(addr[11:10] == 2'b00)
            memoryMappedEnable[3] = 1'b1;
      end
end
DoRow  d0_0 (
         .out0(output_16_0),
         .out1(output_16_1),
         .out2(output_16_2),
         .out3(output_16_3),
         .in0(in0), // x0
         .in1(in4), // x4
         .in2(in8), // x8
         .in3(in12), // xc
         .DoRow_buffer0_amount(DoRow_buffer0_amount),
         .DoRow_buffer1_amount(DoRow_buffer1_amount),
         .DoRow_buffer2_amount(DoRow_buffer2_amount),
         .DoRow_buffer3_amount(DoRow_buffer3_amount),
         .DoRow_buffer4_amount(DoRow_buffer4_amount),
         .DoRow_buffer5_amount(DoRow_buffer5_amount),
         .DoRow_buffer6_amount(DoRow_buffer6_amount),
         .DoRow_buffer7_amount(DoRow_buffer7_amount),
         .valid(memoryMappedEnable[0]),
         .wstrb(wstrb),
         .addr(addr[9:0]),
         .rdata(unitRData[0]),
         .ready(unitReady[0]),
         .wdata(wdata),
         .run(run),

         .clk(clk),
         .rst(rst)
      );
         DoRow  d1_1 (
         .out0(output_17_0),
         .out1(output_17_1),
         .out2(output_17_2),
         .out3(output_17_3),
         .in0(in1), // x1
         .in1(in5), // x5
         .in2(in9), // x9
         .in3(in13), // xd
         .DoRow_buffer0_amount(DoRow_buffer0_amount),
         .DoRow_buffer1_amount(DoRow_buffer1_amount),
         .DoRow_buffer2_amount(DoRow_buffer2_amount),
         .DoRow_buffer3_amount(DoRow_buffer3_amount),
         .DoRow_buffer4_amount(DoRow_buffer4_amount),
         .DoRow_buffer5_amount(DoRow_buffer5_amount),
         .DoRow_buffer6_amount(DoRow_buffer6_amount),
         .DoRow_buffer7_amount(DoRow_buffer7_amount),
         .valid(memoryMappedEnable[1]),
         .wstrb(wstrb),
         .addr(addr[9:0]),
         .rdata(unitRData[1]),
         .ready(unitReady[1]),
         .wdata(wdata),
         .run(run),

         .clk(clk),
         .rst(rst)
      );
         DoRow  d2_2 (
         .out0(output_18_0),
         .out1(output_18_1),
         .out2(output_18_2),
         .out3(output_18_3),
         .in0(in2), // x2
         .in1(in6), // x6
         .in2(in10), // xa
         .in3(in14), // xe
         .DoRow_buffer0_amount(DoRow_buffer0_amount),
         .DoRow_buffer1_amount(DoRow_buffer1_amount),
         .DoRow_buffer2_amount(DoRow_buffer2_amount),
         .DoRow_buffer3_amount(DoRow_buffer3_amount),
         .DoRow_buffer4_amount(DoRow_buffer4_amount),
         .DoRow_buffer5_amount(DoRow_buffer5_amount),
         .DoRow_buffer6_amount(DoRow_buffer6_amount),
         .DoRow_buffer7_amount(DoRow_buffer7_amount),
         .valid(memoryMappedEnable[2]),
         .wstrb(wstrb),
         .addr(addr[9:0]),
         .rdata(unitRData[2]),
         .ready(unitReady[2]),
         .wdata(wdata),
         .run(run),

         .clk(clk),
         .rst(rst)
      );
         DoRow  d3_3 (
         .out0(output_19_0),
         .out1(output_19_1),
         .out2(output_19_2),
         .out3(output_19_3),
         .in0(in3), // x3
         .in1(in7), // x7
         .in2(in11), // xb
         .in3(in15), // xf
         .DoRow_buffer0_amount(DoRow_buffer0_amount),
         .DoRow_buffer1_amount(DoRow_buffer1_amount),
         .DoRow_buffer2_amount(DoRow_buffer2_amount),
         .DoRow_buffer3_amount(DoRow_buffer3_amount),
         .DoRow_buffer4_amount(DoRow_buffer4_amount),
         .DoRow_buffer5_amount(DoRow_buffer5_amount),
         .DoRow_buffer6_amount(DoRow_buffer6_amount),
         .DoRow_buffer7_amount(DoRow_buffer7_amount),
         .valid(memoryMappedEnable[3]),
         .wstrb(wstrb),
         .addr(addr[9:0]),
         .rdata(unitRData[3]),
         .ready(unitReady[3]),
         .wdata(wdata),
         .run(run),

         .clk(clk),
         .rst(rst)
      );
         assign out0 = output_16_0;
   assign out4 = output_16_1;
   assign out8 = output_16_2;
   assign out12 = output_16_3;
   assign out1 = output_17_0;
   assign out5 = output_17_1;
   assign out9 = output_17_2;
   assign out13 = output_17_3;
   assign out2 = output_18_0;
   assign out6 = output_18_1;
   assign out10 = output_18_2;
   assign out14 = output_18_3;
   assign out3 = output_19_0;
   assign out7 = output_19_1;
   assign out11 = output_19_2;
   assign out15 = output_19_3;
   endmodule
