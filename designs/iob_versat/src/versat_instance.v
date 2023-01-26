`timescale 1ns / 1ps
`include "global_defines.vh"
`include "axi.vh"
`include "versat_defs.vh"

module versat_instance #(
      parameter ADDR_W = `ADDR_W,
      parameter DATA_W = `DATA_W,
      parameter AXI_ADDR_W = 32
   )
   (
   // Databus master interface
`ifdef VERSAT_IO
   input [`nIO-1:0]                m_databus_ready,
   output [`nIO-1:0]               m_databus_valid,
   output [`nIO*AXI_ADDR_W-1:0]    m_databus_addr,
   input [`DATAPATH_W-1:0]         m_databus_rdata,
   output [`nIO*`DATAPATH_W-1:0]   m_databus_wdata,
   output [`nIO*`DATAPATH_W/8-1:0] m_databus_wstrb,
   output [`nIO*8-1:0]             m_databus_len,
   input [`nIO-1:0]                m_databus_last,
`endif
   // data/control interface
   input                           valid,
   input [ADDR_W-1:0]              addr,
   input [DATA_W/8-1:0]            wstrb,
   input [DATA_W-1:0]              wdata,
   output                          ready,
   output [DATA_W-1:0]             rdata,

   input                           clk,
   input                           rst
   );

wire wor_ready;

wire done;
reg run;
reg [31:0] stateRead;
wire [31:0] unitRdataFinal;
wire we = (|wstrb);
wire memoryMappedAddr = addr[13];

// Versat registers and memory access
reg versat_ready;
reg [31:0] versat_rdata;

reg soft_reset;

wire rst_int = (rst | soft_reset);

// Interface does not use soft_rest
always @(posedge clk,posedge rst) // Care, rst because writing to soft reset register
   if(rst) begin
      versat_rdata <= 32'h0;
      versat_ready <= 1'b0;
      soft_reset <= 0;
   end else begin
      versat_ready <= 1'b0;

      if(valid) begin 
         // Config/State register access
         if(!memoryMappedAddr) begin
            versat_ready <= 1'b1;
            versat_rdata <= stateRead;
         end

         // Versat specific registers
         if(addr == 0) begin
            versat_ready <= 1'b1;
            if(we)
               soft_reset <= wdata[1];
            else
               versat_rdata <= {31'h0,done}; 
         end
      end
   end

always @(posedge clk,posedge rst_int)
begin
   if(rst_int) begin
      run <= 1'b0;
   end else begin
      run <= 1'b0;

      if(valid && we && addr == 0)
         run <= wdata[0];
   end
end

reg [31:0] read_test_counter;
reg enableReadCounter;
always @(posedge clk,posedge rst)
begin
   if(rst) begin
      read_test_counter <= 0;
      enableReadCounter <= 0;
   end else if(valid) begin
      read_test_counter <= 0;
      enableReadCounter <= 1;
   end else if(enableReadCounter) begin
      read_test_counter <= read_test_counter + 1;
   end   
end


reg [31:0] test_counter;
reg enableCounter;
always @(posedge clk,posedge rst)
begin
   if(rst) begin
      test_counter <= 0;
      enableCounter <= 0;
   end else if(run) begin
      test_counter <= 0;
      enableCounter <= 1;
   end else if(done) begin
      enableCounter <= 0;
   end else if(enableCounter) begin
      test_counter <= test_counter + 1;
   end
end

assign rdata = (versat_ready ? versat_rdata : unitRdataFinal);
assign ready = versat_ready | wor_ready;
reg [1206:0] configdata; wire [255:0] statedata; wire [0:0] unitDone;

reg [0:0] memoryMappedEnable;
wire[0:0] unitReady;
assign wor_ready = (|unitReady);
assign done = (&unitDone && !run);

wire [31:0] unitRData[0:0];
assign unitRdataFinal = (unitRData[0] );
// Memory mapped
always @*
begin
   memoryMappedEnable = {1{1'b0}};
if(valid & memoryMappedAddr)
   begin
   memoryMappedEnable[0] = 1'b1;
      end
end
// Config writing
always @(posedge clk,posedge rst_int)
begin
   if(rst_int) begin
      configdata <= {1207{1'b0}};
   end else if(valid & we & !memoryMappedAddr) begin
      // Config
      if(addr[6:0] == 1) // 0x60000004
         configdata[0+:32] <= wdata[31:0]; // ext_addr_00 - SHA
      if(addr[6:0] == 2) // 0x60000008
         configdata[32+:10] <= wdata[9:0]; // int_addr_01 - SHA
      if(addr[6:0] == 3) // 0x6000000c
         configdata[42+:11] <= wdata[10:0]; // size_02 - SHA
      if(addr[6:0] == 4) // 0x60000010
         configdata[53+:10] <= wdata[9:0]; // iterA_03 - SHA
      if(addr[6:0] == 5) // 0x60000014
         configdata[63+:10] <= wdata[9:0]; // perA_04 - SHA
      if(addr[6:0] == 6) // 0x60000018
         configdata[73+:10] <= wdata[9:0]; // dutyA_05 - SHA
      if(addr[6:0] == 7) // 0x6000001c
         configdata[83+:10] <= wdata[9:0]; // shiftA_06 - SHA
      if(addr[6:0] == 8) // 0x60000020
         configdata[93+:10] <= wdata[9:0]; // incrA_07 - SHA
      if(addr[6:0] == 9) // 0x60000024
         configdata[103+:8] <= wdata[7:0]; // length_08 - SHA
      if(addr[6:0] == 10) // 0x60000028
         configdata[111+:1] <= wdata[0:0]; // pingPong_09 - SHA
      if(addr[6:0] == 11) // 0x6000002c
         configdata[112+:10] <= wdata[9:0]; // iterB_10 - SHA
      if(addr[6:0] == 12) // 0x60000030
         configdata[122+:10] <= wdata[9:0]; // perB_11 - SHA
      if(addr[6:0] == 13) // 0x60000034
         configdata[132+:10] <= wdata[9:0]; // dutyB_12 - SHA
      if(addr[6:0] == 14) // 0x60000038
         configdata[142+:10] <= wdata[9:0]; // startB_13 - SHA
      if(addr[6:0] == 15) // 0x6000003c
         configdata[152+:10] <= wdata[9:0]; // shiftB_14 - SHA
      if(addr[6:0] == 16) // 0x60000040
         configdata[162+:10] <= wdata[9:0]; // incrB_15 - SHA
      if(addr[6:0] == 17) // 0x60000044
         configdata[172+:1] <= wdata[0:0]; // reverseB_16 - SHA
      if(addr[6:0] == 18) // 0x60000048
         configdata[173+:1] <= wdata[0:0]; // extB_17 - SHA
      if(addr[6:0] == 19) // 0x6000004c
         configdata[174+:10] <= wdata[9:0]; // iter2B_18 - SHA
      if(addr[6:0] == 20) // 0x60000050
         configdata[184+:10] <= wdata[9:0]; // per2B_19 - SHA
      if(addr[6:0] == 21) // 0x60000054
         configdata[194+:10] <= wdata[9:0]; // shift2B_20 - SHA
      if(addr[6:0] == 22) // 0x60000058
         configdata[204+:10] <= wdata[9:0]; // incr2B_21 - SHA
      if(addr[6:0] == 23) // 0x6000005c
         configdata[214+:1] <= wdata[0:0]; // enabled_22 - SHA
      // Static
      if(addr[6:0] == 24) // 0x60000060
         configdata[215+:10] <= wdata[9:0]; //  Constants_mem_iterA
      if(addr[6:0] == 25) // 0x60000064
         configdata[225+:10] <= wdata[9:0]; //  Constants_mem_perA
      if(addr[6:0] == 26) // 0x60000068
         configdata[235+:10] <= wdata[9:0]; //  Constants_mem_dutyA
      if(addr[6:0] == 27) // 0x6000006c
         configdata[245+:10] <= wdata[9:0]; //  Constants_mem_startA
      if(addr[6:0] == 28) // 0x60000070
         configdata[255+:10] <= wdata[9:0]; //  Constants_mem_shiftA
      if(addr[6:0] == 29) // 0x60000074
         configdata[265+:10] <= wdata[9:0]; //  Constants_mem_incrA
      if(addr[6:0] == 30) // 0x60000078
         configdata[275+:1] <= wdata[0:0]; //  Constants_mem_reverseA
      if(addr[6:0] == 31) // 0x6000007c
         configdata[276+:1] <= wdata[0:0]; //  Constants_mem_extA
      if(addr[6:0] == 32) // 0x60000080
         configdata[277+:1] <= wdata[0:0]; //  Constants_mem_in0_wr
      if(addr[6:0] == 33) // 0x60000084
         configdata[278+:10] <= wdata[9:0]; //  Constants_mem_iter2A
      if(addr[6:0] == 34) // 0x60000088
         configdata[288+:10] <= wdata[9:0]; //  Constants_mem_per2A
      if(addr[6:0] == 35) // 0x6000008c
         configdata[298+:10] <= wdata[9:0]; //  Constants_mem_shift2A
      if(addr[6:0] == 36) // 0x60000090
         configdata[308+:10] <= wdata[9:0]; //  Constants_mem_incr2A
      if(addr[6:0] == 37) // 0x60000094
         configdata[318+:10] <= wdata[9:0]; //  Constants_mem_iterB
      if(addr[6:0] == 38) // 0x60000098
         configdata[328+:10] <= wdata[9:0]; //  Constants_mem_perB
      if(addr[6:0] == 39) // 0x6000009c
         configdata[338+:10] <= wdata[9:0]; //  Constants_mem_dutyB
      if(addr[6:0] == 40) // 0x600000a0
         configdata[348+:10] <= wdata[9:0]; //  Constants_mem_startB
      if(addr[6:0] == 41) // 0x600000a4
         configdata[358+:10] <= wdata[9:0]; //  Constants_mem_shiftB
      if(addr[6:0] == 42) // 0x600000a8
         configdata[368+:10] <= wdata[9:0]; //  Constants_mem_incrB
      if(addr[6:0] == 43) // 0x600000ac
         configdata[378+:1] <= wdata[0:0]; //  Constants_mem_reverseB
      if(addr[6:0] == 44) // 0x600000b0
         configdata[379+:1] <= wdata[0:0]; //  Constants_mem_extB
      if(addr[6:0] == 45) // 0x600000b4
         configdata[380+:1] <= wdata[0:0]; //  Constants_mem_in1_wr
      if(addr[6:0] == 46) // 0x600000b8
         configdata[381+:10] <= wdata[9:0]; //  Constants_mem_iter2B
      if(addr[6:0] == 47) // 0x600000bc
         configdata[391+:10] <= wdata[9:0]; //  Constants_mem_per2B
      if(addr[6:0] == 48) // 0x600000c0
         configdata[401+:10] <= wdata[9:0]; //  Constants_mem_shift2B
      if(addr[6:0] == 49) // 0x600000c4
         configdata[411+:10] <= wdata[9:0]; //  Constants_mem_incr2B
      if(addr[6:0] == 50) // 0x600000c8
         configdata[421+:6] <= wdata[5:0]; //  SHA_buffer0_amount
      if(addr[6:0] == 51) // 0x600000cc
         configdata[427+:6] <= wdata[5:0]; //  SHA_buffer1_amount
      if(addr[6:0] == 52) // 0x600000d0
         configdata[433+:6] <= wdata[5:0]; //  SHA_buffer2_amount
      // Delays
      if(addr[6:0] == 53) // 0x600000d4
         configdata[439+:32] <= wdata[31:0]; // Delay
      if(addr[6:0] == 54) // 0x600000d8
         configdata[471+:32] <= wdata[31:0]; // Delay
      if(addr[6:0] == 55) // 0x600000dc
         configdata[503+:32] <= wdata[31:0]; // Delay
      if(addr[6:0] == 56) // 0x600000e0
         configdata[535+:32] <= wdata[31:0]; // Delay
      if(addr[6:0] == 57) // 0x600000e4
         configdata[567+:32] <= wdata[31:0]; // Delay
      if(addr[6:0] == 58) // 0x600000e8
         configdata[599+:32] <= wdata[31:0]; // Delay
      if(addr[6:0] == 59) // 0x600000ec
         configdata[631+:32] <= wdata[31:0]; // Delay
      if(addr[6:0] == 60) // 0x600000f0
         configdata[663+:32] <= wdata[31:0]; // Delay
      if(addr[6:0] == 61) // 0x600000f4
         configdata[695+:32] <= wdata[31:0]; // Delay
      if(addr[6:0] == 62) // 0x600000f8
         configdata[727+:32] <= wdata[31:0]; // Delay
      if(addr[6:0] == 63) // 0x600000fc
         configdata[759+:32] <= wdata[31:0]; // Delay
      if(addr[6:0] == 64) // 0x60000100
         configdata[791+:32] <= wdata[31:0]; // Delay
      if(addr[6:0] == 65) // 0x60000104
         configdata[823+:32] <= wdata[31:0]; // Delay
      if(addr[6:0] == 66) // 0x60000108
         configdata[855+:32] <= wdata[31:0]; // Delay
      if(addr[6:0] == 67) // 0x6000010c
         configdata[887+:32] <= wdata[31:0]; // Delay
      if(addr[6:0] == 68) // 0x60000110
         configdata[919+:32] <= wdata[31:0]; // Delay
      if(addr[6:0] == 69) // 0x60000114
         configdata[951+:32] <= wdata[31:0]; // Delay
      if(addr[6:0] == 70) // 0x60000118
         configdata[983+:32] <= wdata[31:0]; // Delay
      if(addr[6:0] == 71) // 0x6000011c
         configdata[1015+:32] <= wdata[31:0]; // Delay
      if(addr[6:0] == 72) // 0x60000120
         configdata[1047+:32] <= wdata[31:0]; // Delay
      if(addr[6:0] == 73) // 0x60000124
         configdata[1079+:32] <= wdata[31:0]; // Delay
      if(addr[6:0] == 74) // 0x60000128
         configdata[1111+:32] <= wdata[31:0]; // Delay
      if(addr[6:0] == 75) // 0x6000012c
         configdata[1143+:32] <= wdata[31:0]; // Delay
      if(addr[6:0] == 76) // 0x60000130
         configdata[1175+:32] <= wdata[31:0]; // Delay
      end
end

// State reading
always @*
begin
   stateRead = 32'h0;
   if(valid & !memoryMappedAddr) begin
      if(addr[3:0] == 1) // 0x60000000
         stateRead = statedata[0+:32];
      if(addr[3:0] == 2) // 0x60000004
         stateRead = statedata[32+:32];
      if(addr[3:0] == 3) // 0x60000008
         stateRead = statedata[64+:32];
      if(addr[3:0] == 4) // 0x6000000c
         stateRead = statedata[96+:32];
      if(addr[3:0] == 5) // 0x60000010
         stateRead = statedata[128+:32];
      if(addr[3:0] == 6) // 0x60000014
         stateRead = statedata[160+:32];
      if(addr[3:0] == 7) // 0x60000018
         stateRead = statedata[192+:32];
      if(addr[3:0] == 8) // 0x6000001c
         stateRead = statedata[224+:32];
      end
end

SHA  Test_0 (
      .ext_addr_00(configdata[0+:32]),
      .int_addr_01(configdata[32+:10]),
      .size_02(configdata[42+:11]),
      .iterA_03(configdata[53+:10]),
      .perA_04(configdata[63+:10]),
      .dutyA_05(configdata[73+:10]),
      .shiftA_06(configdata[83+:10]),
      .incrA_07(configdata[93+:10]),
      .length_08(configdata[103+:8]),
      .pingPong_09(configdata[111+:1]),
      .iterB_10(configdata[112+:10]),
      .perB_11(configdata[122+:10]),
      .dutyB_12(configdata[132+:10]),
      .startB_13(configdata[142+:10]),
      .shiftB_14(configdata[152+:10]),
      .incrB_15(configdata[162+:10]),
      .reverseB_16(configdata[172+:1]),
      .extB_17(configdata[173+:1]),
      .iter2B_18(configdata[174+:10]),
      .per2B_19(configdata[184+:10]),
      .shift2B_20(configdata[194+:10]),
      .incr2B_21(configdata[204+:10]),
      .enabled_22(configdata[214+:1]),
      .Constants_mem_iterA(configdata[215+:10]),
      .Constants_mem_perA(configdata[225+:10]),
      .Constants_mem_dutyA(configdata[235+:10]),
      .Constants_mem_startA(configdata[245+:10]),
      .Constants_mem_shiftA(configdata[255+:10]),
      .Constants_mem_incrA(configdata[265+:10]),
      .Constants_mem_reverseA(configdata[275+:1]),
      .Constants_mem_extA(configdata[276+:1]),
      .Constants_mem_in0_wr(configdata[277+:1]),
      .Constants_mem_iter2A(configdata[278+:10]),
      .Constants_mem_per2A(configdata[288+:10]),
      .Constants_mem_shift2A(configdata[298+:10]),
      .Constants_mem_incr2A(configdata[308+:10]),
      .Constants_mem_iterB(configdata[318+:10]),
      .Constants_mem_perB(configdata[328+:10]),
      .Constants_mem_dutyB(configdata[338+:10]),
      .Constants_mem_startB(configdata[348+:10]),
      .Constants_mem_shiftB(configdata[358+:10]),
      .Constants_mem_incrB(configdata[368+:10]),
      .Constants_mem_reverseB(configdata[378+:1]),
      .Constants_mem_extB(configdata[379+:1]),
      .Constants_mem_in1_wr(configdata[380+:1]),
      .Constants_mem_iter2B(configdata[381+:10]),
      .Constants_mem_per2B(configdata[391+:10]),
      .Constants_mem_shift2B(configdata[401+:10]),
      .Constants_mem_incr2B(configdata[411+:10]),
      .SHA_buffer0_amount(configdata[421+:6]),
      .SHA_buffer1_amount(configdata[427+:6]),
      .SHA_buffer2_amount(configdata[433+:6]),
      .delay0(configdata[439+:32]),
      .delay1(configdata[471+:32]),
      .delay2(configdata[503+:32]),
      .delay3(configdata[535+:32]),
      .delay4(configdata[567+:32]),
      .delay5(configdata[599+:32]),
      .delay6(configdata[631+:32]),
      .delay7(configdata[663+:32]),
      .delay8(configdata[695+:32]),
      .delay9(configdata[727+:32]),
      .delay10(configdata[759+:32]),
      .delay11(configdata[791+:32]),
      .delay12(configdata[823+:32]),
      .delay13(configdata[855+:32]),
      .delay14(configdata[887+:32]),
      .delay15(configdata[919+:32]),
      .delay16(configdata[951+:32]),
      .delay17(configdata[983+:32]),
      .delay18(configdata[1015+:32]),
      .delay19(configdata[1047+:32]),
      .delay20(configdata[1079+:32]),
      .delay21(configdata[1111+:32]),
      .delay22(configdata[1143+:32]),
      .delay23(configdata[1175+:32]),
      .currentValue_00_00_00(statedata[0+:32]),
      .currentValue_00_01_01(statedata[32+:32]),
      .currentValue_00_02_02(statedata[64+:32]),
      .currentValue_00_03_03(statedata[96+:32]),
      .currentValue_00_04_04(statedata[128+:32]),
      .currentValue_00_05_05(statedata[160+:32]),
      .currentValue_00_06_06(statedata[192+:32]),
      .currentValue_00_07_07(statedata[224+:32]),
      .valid(memoryMappedEnable[0]),
      .wstrb(wstrb),
      .addr(addr[12:0]),
      .rdata(unitRData[0]),
      .ready(unitReady[0]),
      .wdata(wdata),
      .databus_ready(m_databus_ready[0 +: 1]),
      .databus_valid(m_databus_valid[0 +: 1]),
      .databus_addr(m_databus_addr[0 +: 32]),
      .databus_rdata(m_databus_rdata),
      .databus_wdata(m_databus_wdata[0 +: 32]),
      .databus_wstrb(m_databus_wstrb[0 +: 4]),
      .databus_len(m_databus_len[0 +: 8]),
      .databus_last(m_databus_last[0 +: 1]),
      .run(run),
      .done(unitDone[0]),
      .clk(clk),
      .rst(rst_int)
   );
endmodule
