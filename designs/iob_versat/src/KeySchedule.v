`timescale 1ns / 1ps
`include "global_defines.vh"
`include "system.vh"
`include "axi.vh"
`include "xversat.vh"
`include "xdefs.vh"

module KeySchedule #(
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
   input [5:0]     KeySchedule_buffer0_amount,
   input [5:0]     KeySchedule_buffer1_amount,
   input [5:0]     KeySchedule_buffer2_amount,
   input [5:0]     KeySchedule_buffer3_amount,
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
wire[0:0] unitReady;
reg [0:0] memoryMappedEnable;
wire [31:0] unitRData[0:0];

assign rdata = unitRdataFinal;
assign ready = wor_ready;
assign wor_ready = (|unitReady);

wire [31:0] rdata_0 ;

assign unitRdataFinal = (unitRData[0] );
wire [31:0] output_0_0 , output_1_0 , output_2_0 , output_3_0 , output_4_0 , output_5_0 , output_6_0 , output_7_0 , output_8_0 , output_9_0 , output_10_0 , output_11_0 , output_12_0 , output_13_0 , output_14_0 , output_15_0 , output_16_0 , output_17_0 , output_17_1 , output_17_2 , output_17_3 , output_18_0 , output_19_0 , output_20_0 , output_21_0 , output_22_0 , output_23_0 , output_24_0 , output_25_0 , output_26_0 , output_27_0 , output_28_0 , output_29_0 , output_31_0 , output_32_0 , output_33_0 , output_34_0 ;

// Memory mapped
always @*
begin
   memoryMappedEnable = {1{1'b0}};
   if(valid)
   begin
   memoryMappedEnable[0] = 1'b1;
      end
end
reg [31:0] comb_a0 ,comb_a1 ,comb_a2 ,comb_a3 ,comb_b0 ,comb_b1 ,comb_b2 ,comb_b3 ,comb_c0 ,comb_c1 ,comb_c2 ,comb_c3 ; 

always @*
begin
comb_a0 = output_17_0 ^ in1;
      comb_a1 = output_17_1 ^ in5;
      comb_a2 = output_17_2 ^ in9;
      comb_a3 = output_17_3 ^ in13;
      comb_b0 = comb_a0 ^ in2;
      comb_b1 = comb_a1 ^ in6;
      comb_b2 = comb_a2 ^ in10;
      comb_b3 = comb_a3 ^ in14;
      comb_c0 = comb_b0 ^ output_34_0;
      comb_c1 = comb_b1 ^ output_33_0;
      comb_c2 = comb_b2 ^ output_32_0;
      comb_c3 = comb_b3 ^ output_31_0;
      end
FirstLineKey  s_0 (
         .out0(output_17_0),
         .out1(output_17_1),
         .out2(output_17_2),
         .out3(output_17_3),
         .in0(in3), // x3
         .in1(in7), // x7
         .in2(in11), // xb
         .in3(in15), // xf
         .in4(in0), // x0
         .in5(in4), // x4
         .in6(in8), // x8
         .in7(in12), // xc
         .in8(in16), // rcon
         .valid(memoryMappedEnable[0]),
         .wstrb(wstrb),
         .addr(addr[8:0]),
         .rdata(unitRData[0]),
         .ready(unitReady[0]),
         .wdata(wdata),
         .run(run),

         .clk(clk),
         .rst(rst)
      );
         Buffer  buffer0_1 (
         .out0(output_31_0),
         .in0(in15), // xf
         .amount(KeySchedule_buffer0_amount),
         .run(run),

         .clk(clk),
         .rst(rst)
      );
         Buffer  buffer1_2 (
         .out0(output_32_0),
         .in0(in11), // xb
         .amount(KeySchedule_buffer1_amount),
         .run(run),

         .clk(clk),
         .rst(rst)
      );
         Buffer  buffer2_3 (
         .out0(output_33_0),
         .in0(in7), // x7
         .amount(KeySchedule_buffer2_amount),
         .run(run),

         .clk(clk),
         .rst(rst)
      );
         Buffer  buffer3_4 (
         .out0(output_34_0),
         .in0(in3), // x3
         .amount(KeySchedule_buffer3_amount),
         .run(run),

         .clk(clk),
         .rst(rst)
      );
         assign out0 = output_17_0;
   assign out4 = output_17_1;
   assign out8 = output_17_2;
   assign out12 = output_17_3;
   assign out1 = comb_a0;
   assign out5 = comb_a1;
   assign out9 = comb_a2;
   assign out13 = comb_a3;
   assign out2 = comb_b0;
   assign out6 = comb_b1;
   assign out10 = comb_b2;
   assign out14 = comb_b3;
   assign out3 = comb_c0;
   assign out7 = comb_c1;
   assign out11 = comb_c2;
   assign out15 = comb_c3;
   endmodule
