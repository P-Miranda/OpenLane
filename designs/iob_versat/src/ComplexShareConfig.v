`timescale 1ns / 1ps
`include "global_defines.vh"
`include "system.vh"
`include "axi.vh"
`include "xversat.vh"
`include "xdefs.vh"

module ComplexShareConfig #(
      parameter ADDR_W = `ADDR_W,
      parameter DATA_W = `DATA_W,
      parameter AXI_ADDR_W = 32
   )
   (

   input run,
   
   output done,
   input [31:0]     constant_00_00,
   input [31:0]     constant_01_01,
   input [31:0]     constant_02_02,
   input [31:0]     constant_00_03,
   input [31:0]     constant_01_04,
   input [31:0]     constant_02_05,
   input [31:0]     StaticConst_var_constant,
   output [31:0]    constant_00_06,
   output [31:0]    constant_01_07,
   output [31:0]    constant_02_08,
   output [31:0]    constant_00_09,
   output [31:0]    constant_01_10,
   output [31:0]    constant_02_11,
   output [31:0]    currentValue_02_06,
   output [31:0]    currentValue_03_07,
   output [31:0]    currentValue_00_08,
   output [31:0]    constant_04_09,
   output [31:0]    currentValue_02_10,
   output [31:0]    currentValue_03_11,
   output [31:0]    currentValue_00_12,
   output [31:0]    constant_04_13,
   output [31:0]    currentValue_02_14,
   output [31:0]    currentValue_03_15,
   output [31:0]    currentValue_16,
   output [31:0]    currentValue_17,
   input  [31:0]                   delay0,
   input  [31:0]                   delay1,
   input  [31:0]                   delay2,
   input  [31:0]                   delay3,
   input  [31:0]                   delay4,
   input  [31:0]                   delay5,
   input  [31:0]                   delay6,
   input  [31:0]                   delay7,
   input  [31:0]                   delay8,
   input  [31:0]                   delay9,
   input  [31:0]                   delay10,
   input  [31:0]                   delay11,
   input  [31:0]                   delay12,
   input  [31:0]                   delay13,
   input  [31:0]                   delay14,
   input  [31:0]                   delay15,
   input  [31:0]                   delay16,
   input  [31:0]                   delay17,
   // data/control interface
   input                           valid,
   input [4:0] addr,
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
wire[5:0] unitReady;
reg [5:0] memoryMappedEnable;
wire [31:0] unitRData[5:0];

assign rdata = unitRdataFinal;
assign ready = wor_ready;
assign wor_ready = (|unitReady);

wire [31:0] rdata_0 , rdata_1 , rdata_2 , rdata_3 , rdata_4 , rdata_5 ;

assign unitRdataFinal = (unitRData[0] |unitRData[1] |unitRData[2] |unitRData[3] |unitRData[4] |unitRData[5] );
wire [5:0] unitDone;
assign done = &unitDone;
wire [31:0] output_2_0 , output_3_0 ;

// Memory mapped
always @*
begin
   memoryMappedEnable = {6{1'b0}};
   if(valid)
   begin
   if(addr[4:3] == 2'b11)
            memoryMappedEnable[0] = 1'b1;
      if(addr[4:2] == 3'b000)
            memoryMappedEnable[1] = 1'b1;
      if(addr[4:3] == 2'b01)
            memoryMappedEnable[2] = 1'b1;
      if(addr[4:3] == 2'b10)
            memoryMappedEnable[3] = 1'b1;
      if(addr[4:1] == 4'b0011)
            memoryMappedEnable[4] = 1'b1;
      if(addr[4:1] == 4'b0010)
            memoryMappedEnable[5] = 1'b1;
      end
end
SimpleShareConfig  a1_0 (
         .constant_00(constant_00_00),
         .constant_01(constant_01_01),
         .constant_02(constant_02_02),
         .delay0(delay0),
         .delay1(delay1),
         .delay2(delay2),
         .delay3(delay3),
         .currentValue_00(constant_00_06),
         .constant_04(constant_01_07),
         .currentValue_02(constant_02_08),
         .currentValue_03(constant_00_09),
         .valid(memoryMappedEnable[0]),
         .wstrb(wstrb),
         .addr(addr[1:0]),
         .rdata(unitRData[0]),
         .ready(unitReady[0]),
         .wdata(wdata),
         .run(run),

         .done(unitDone[0]),
         .clk(clk),
         .rst(rst)
      );
         SimpleShareConfig  a2_1 (
         .constant_00(constant_00_03),
         .constant_01(constant_01_04),
         .constant_02(constant_02_05),
         .delay0(delay4),
         .delay1(delay5),
         .delay2(delay6),
         .delay3(delay7),
         .currentValue_00(constant_01_10),
         .constant_04(constant_02_11),
         .currentValue_02(currentValue_02_06),
         .currentValue_03(currentValue_03_07),
         .valid(memoryMappedEnable[1]),
         .wstrb(wstrb),
         .addr(addr[1:0]),
         .rdata(unitRData[1]),
         .ready(unitReady[1]),
         .wdata(wdata),
         .run(run),

         .done(unitDone[1]),
         .clk(clk),
         .rst(rst)
      );
         StaticConst  var1_2 (
         .out0(output_2_0),
         .StaticConst_var_constant(StaticConst_var_constant),
         .run(run),

         .clk(clk),
         .rst(rst)
      );
         StaticConst  var2_3 (
         .out0(output_3_0),
         .StaticConst_var_constant(StaticConst_var_constant),
         .run(run),

         .clk(clk),
         .rst(rst)
      );
         SimpleShareConfig  shared1_4 (
         .constant_00(constant_00_06),
         .constant_01(constant_01_07),
         .constant_02(constant_02_08),
         .delay0(delay8),
         .delay1(delay9),
         .delay2(delay10),
         .delay3(delay11),
         .currentValue_00(currentValue_00_08),
         .constant_04(constant_04_09),
         .currentValue_02(currentValue_02_10),
         .currentValue_03(currentValue_03_11),
         .valid(memoryMappedEnable[2]),
         .wstrb(wstrb),
         .addr(addr[1:0]),
         .rdata(unitRData[2]),
         .ready(unitReady[2]),
         .wdata(wdata),
         .run(run),

         .done(unitDone[2]),
         .clk(clk),
         .rst(rst)
      );
         SimpleShareConfig  shared2_5 (
         .constant_00(constant_00_09),
         .constant_01(constant_01_10),
         .constant_02(constant_02_11),
         .delay0(delay12),
         .delay1(delay13),
         .delay2(delay14),
         .delay3(delay15),
         .currentValue_00(currentValue_00_12),
         .constant_04(constant_04_13),
         .currentValue_02(currentValue_02_14),
         .currentValue_03(currentValue_03_15),
         .valid(memoryMappedEnable[3]),
         .wstrb(wstrb),
         .addr(addr[1:0]),
         .rdata(unitRData[3]),
         .ready(unitReady[3]),
         .wdata(wdata),
         .run(run),

         .done(unitDone[3]),
         .clk(clk),
         .rst(rst)
      );
         Reg  out0_6 (
         .in0(output_2_0),
         .delay0(delay16),
         .currentValue(currentValue_16),
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
         Reg  out1_7 (
         .in0(output_3_0),
         .delay0(delay17),
         .currentValue(currentValue_17),
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
         endmodule
