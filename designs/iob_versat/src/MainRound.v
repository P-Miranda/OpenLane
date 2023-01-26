`timescale 1ns / 1ps
`include "global_defines.vh"
`include "system.vh"
`include "axi.vh"
`include "xversat.vh"
`include "xdefs.vh"

module MainRound #(
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
   input [DATA_W-1:0]              in16,
   input [DATA_W-1:0]              in17,
   input [DATA_W-1:0]              in18,
   input [DATA_W-1:0]              in19,
   input [DATA_W-1:0]              in20,
   input [DATA_W-1:0]              in21,
   input [DATA_W-1:0]              in22,
   input [DATA_W-1:0]              in23,
   input [DATA_W-1:0]              in24,
   input [DATA_W-1:0]              in25,
   input [DATA_W-1:0]              in26,
   input [DATA_W-1:0]              in27,
   input [DATA_W-1:0]              in28,
   input [DATA_W-1:0]              in29,
   input [DATA_W-1:0]              in30,
   input [DATA_W-1:0]              in31,
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
   input [12:0] addr,
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
wire [31:0] output_0_0 , output_1_0 , output_2_0 , output_3_0 , output_4_0 , output_5_0 , output_6_0 , output_7_0 , output_8_0 , output_9_0 , output_10_0 , output_11_0 , output_12_0 , output_13_0 , output_14_0 , output_15_0 , output_16_0 , output_17_0 , output_18_0 , output_19_0 , output_20_0 , output_21_0 , output_22_0 , output_23_0 , output_24_0 , output_25_0 , output_26_0 , output_27_0 , output_28_0 , output_29_0 , output_30_0 , output_31_0 , output_32_0 , output_32_1 , output_32_2 , output_32_3 , output_32_4 , output_32_5 , output_32_6 , output_32_7 , output_32_8 , output_32_9 , output_32_10 , output_32_11 , output_32_12 , output_32_13 , output_32_14 , output_32_15 , output_33_0 , output_33_1 , output_33_2 , output_33_3 , output_33_4 , output_33_5 , output_33_6 , output_33_7 , output_33_8 , output_33_9 , output_33_10 , output_33_11 , output_33_12 , output_33_13 , output_33_14 , output_33_15 , output_34_0 , output_34_1 , output_34_2 , output_34_3 , output_34_4 , output_34_5 , output_34_6 , output_34_7 , output_34_8 , output_34_9 , output_34_10 , output_34_11 , output_34_12 , output_34_13 , output_34_14 , output_34_15 , output_35_0 , output_35_1 , output_35_2 , output_35_3 , output_35_4 , output_35_5 , output_35_6 , output_35_7 , output_35_8 , output_35_9 , output_35_10 , output_35_11 , output_35_12 , output_35_13 , output_35_14 , output_35_15 ;

// Memory mapped
always @*
begin
   memoryMappedEnable = {2{1'b0}};
   if(valid)
   begin
   if(addr[12:12] == 1'b1)
            memoryMappedEnable[0] = 1'b1;
      if(addr[12:12] == 1'b0)
            memoryMappedEnable[1] = 1'b1;
      end
end
SBox  subBytes_0 (
         .out0(output_32_0),
         .out1(output_32_1),
         .out2(output_32_2),
         .out3(output_32_3),
         .out4(output_32_4),
         .out5(output_32_5),
         .out6(output_32_6),
         .out7(output_32_7),
         .out8(output_32_8),
         .out9(output_32_9),
         .out10(output_32_10),
         .out11(output_32_11),
         .out12(output_32_12),
         .out13(output_32_13),
         .out14(output_32_14),
         .out15(output_32_15),
         .in0(in0), // x0
         .in1(in1), // x1
         .in2(in2), // x2
         .in3(in3), // x3
         .in4(in4), // x4
         .in5(in5), // x5
         .in6(in6), // x6
         .in7(in7), // x7
         .in8(in8), // x8
         .in9(in9), // x9
         .in10(in10), // xa
         .in11(in11), // xb
         .in12(in12), // xc
         .in13(in13), // xd
         .in14(in14), // xe
         .in15(in15), // xf
         .valid(memoryMappedEnable[0]),
         .wstrb(wstrb),
         .addr(addr[10:0]),
         .rdata(unitRData[0]),
         .ready(unitReady[0]),
         .wdata(wdata),
         .run(run),

         .clk(clk),
         .rst(rst)
      );
         ShiftRows  shiftRows_1 (
         .out0(output_33_0),
         .out1(output_33_1),
         .out2(output_33_2),
         .out3(output_33_3),
         .out4(output_33_4),
         .out5(output_33_5),
         .out6(output_33_6),
         .out7(output_33_7),
         .out8(output_33_8),
         .out9(output_33_9),
         .out10(output_33_10),
         .out11(output_33_11),
         .out12(output_33_12),
         .out13(output_33_13),
         .out14(output_33_14),
         .out15(output_33_15),
         .in0(output_32_0),
         .in1(output_32_1),
         .in2(output_32_2),
         .in3(output_32_3),
         .in4(output_32_4),
         .in5(output_32_5),
         .in6(output_32_6),
         .in7(output_32_7),
         .in8(output_32_8),
         .in9(output_32_9),
         .in10(output_32_10),
         .in11(output_32_11),
         .in12(output_32_12),
         .in13(output_32_13),
         .in14(output_32_14),
         .in15(output_32_15),
         .run(run),

         .clk(clk),
         .rst(rst)
      );
         MixColumns  mixColumns_2 (
         .out0(output_34_0),
         .out1(output_34_1),
         .out2(output_34_2),
         .out3(output_34_3),
         .out4(output_34_4),
         .out5(output_34_5),
         .out6(output_34_6),
         .out7(output_34_7),
         .out8(output_34_8),
         .out9(output_34_9),
         .out10(output_34_10),
         .out11(output_34_11),
         .out12(output_34_12),
         .out13(output_34_13),
         .out14(output_34_14),
         .out15(output_34_15),
         .in0(output_33_0),
         .in1(output_33_1),
         .in2(output_33_2),
         .in3(output_33_3),
         .in4(output_33_4),
         .in5(output_33_5),
         .in6(output_33_6),
         .in7(output_33_7),
         .in8(output_33_8),
         .in9(output_33_9),
         .in10(output_33_10),
         .in11(output_33_11),
         .in12(output_33_12),
         .in13(output_33_13),
         .in14(output_33_14),
         .in15(output_33_15),
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
         .addr(addr[11:0]),
         .rdata(unitRData[1]),
         .ready(unitReady[1]),
         .wdata(wdata),
         .run(run),

         .clk(clk),
         .rst(rst)
      );
         AddRoundKey  addRoundKey_3 (
         .out0(output_35_0),
         .out1(output_35_1),
         .out2(output_35_2),
         .out3(output_35_3),
         .out4(output_35_4),
         .out5(output_35_5),
         .out6(output_35_6),
         .out7(output_35_7),
         .out8(output_35_8),
         .out9(output_35_9),
         .out10(output_35_10),
         .out11(output_35_11),
         .out12(output_35_12),
         .out13(output_35_13),
         .out14(output_35_14),
         .out15(output_35_15),
         .in0(output_34_0),
         .in1(output_34_1),
         .in2(output_34_2),
         .in3(output_34_3),
         .in4(output_34_4),
         .in5(output_34_5),
         .in6(output_34_6),
         .in7(output_34_7),
         .in8(output_34_8),
         .in9(output_34_9),
         .in10(output_34_10),
         .in11(output_34_11),
         .in12(output_34_12),
         .in13(output_34_13),
         .in14(output_34_14),
         .in15(output_34_15),
         .in16(in16), // k0
         .in17(in17), // k1
         .in18(in18), // k2
         .in19(in19), // k3
         .in20(in20), // k4
         .in21(in21), // k5
         .in22(in22), // k6
         .in23(in23), // k7
         .in24(in24), // k8
         .in25(in25), // k9
         .in26(in26), // ka
         .in27(in27), // kb
         .in28(in28), // kc
         .in29(in29), // kd
         .in30(in30), // ke
         .in31(in31), // kf
         .run(run),

         .clk(clk),
         .rst(rst)
      );
         assign out0 = output_35_0;
   assign out1 = output_35_1;
   assign out2 = output_35_2;
   assign out3 = output_35_3;
   assign out4 = output_35_4;
   assign out5 = output_35_5;
   assign out6 = output_35_6;
   assign out7 = output_35_7;
   assign out8 = output_35_8;
   assign out9 = output_35_9;
   assign out10 = output_35_10;
   assign out11 = output_35_11;
   assign out12 = output_35_12;
   assign out13 = output_35_13;
   assign out14 = output_35_14;
   assign out15 = output_35_15;
   endmodule
