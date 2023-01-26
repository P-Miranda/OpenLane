`timescale 1ns / 1ps
`include "global_defines.vh"
`include "system.vh"
`include "axi.vh"
`include "xversat.vh"
`include "xdefs.vh"

module SimpleShareConfig #(
      parameter ADDR_W = `ADDR_W,
      parameter DATA_W = `DATA_W,
      parameter AXI_ADDR_W = 32
   )
   (

   input run,
   
   output done,
   input [31:0]     constant_00,
   input [31:0]     constant_01,
   input [31:0]     constant_02,
   output [31:0]    currentValue_00,
   output [31:0]    constant_04,
   output [31:0]    currentValue_02,
   output [31:0]    currentValue_03,
   input  [31:0]                   delay0,
   input  [31:0]                   delay1,
   input  [31:0]                   delay2,
   input  [31:0]                   delay3,
   // data/control interface
   input                           valid,
   input [1:0] addr,
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
wire [3:0] unitDone;
assign done = &unitDone;
wire [31:0] output_0_0 , output_1_0 , output_2_0 , output_3_0 , output_8_0 , output_9_0 , output_10_0 , output_11_0 ;

// Memory mapped
always @*
begin
   memoryMappedEnable = {4{1'b0}};
   if(valid)
   begin
   if(addr[1:0] == 2'b11)
            memoryMappedEnable[0] = 1'b1;
      if(addr[1:0] == 2'b01)
            memoryMappedEnable[1] = 1'b1;
      if(addr[1:0] == 2'b10)
            memoryMappedEnable[2] = 1'b1;
      if(addr[1:0] == 2'b00)
            memoryMappedEnable[3] = 1'b1;
      end
end
reg [31:0] comb_a ,comb_b ,comb_c ; 

always @*
begin
comb_a = output_0_0 + output_1_0;
      comb_b = output_2_0 + output_3_0;
      comb_c = output_0_0 + output_2_0;
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
         Const  b1_2 (
         .out0(output_2_0),
         .constant(constant_02),
         .run(run),

         .clk(clk),
         .rst(rst)
      );
         Const  b2_3 (
         .out0(output_3_0),
         .constant(currentValue_00),
         .run(run),

         .clk(clk),
         .rst(rst)
      );
         Reg  out0_4 (
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
         Reg  out1_5 (
         .in0(comb_b),
         .delay0(delay1),
         .currentValue(constant_04),
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
         Reg  out2_6 (
         .in0(comb_c),
         .delay0(delay2),
         .currentValue(currentValue_02),
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
         Reg  out3_7 (
         .in0(output_8_0),
         .delay0(delay3),
         .currentValue(currentValue_03),
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
         Const  extra_8 (
         .out0(output_8_0),
         .constant(constant_04),
         .run(run),

         .clk(clk),
         .rst(rst)
      );
         endmodule
