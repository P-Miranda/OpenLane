`timescale 1ns/1ps

`include "iob_eth.vh"

module iob_eth_rx #(
                    parameter ETH_MAC_ADDR = `ETH_MAC_ADDR
                    )
   (
    // async reset
    input             rst,

    // system clock domain
    output reg        data_rcvd,

    // RX_CLK domain
    input             rcv_ack,
    output reg [10:0] addr,
    output reg [7:0]  data,
    output reg        wr,
    output [31:0]     crc_value,

    input             RX_CLK,
    input             RX_DV,
    input [3:0]       RX_DATA
    );

   // rx reset
   reg [1:0]          rx_rst;

   // state
   reg [2:0]          pc;
   reg [47:0]         dest_mac_addr;
   
   // data
   wire [7:0]         data_int;
   
   
   // SYNCHRONIZERS

   // reset sync
   always @(posedge RX_CLK, posedge rst)
     if (rst)
       rx_rst <= 2'b11;
     else
       rx_rst <= {rx_rst[0], 1'b0};

   //
   // RECEIVER PROGRAM
   //
   always @(posedge RX_CLK, posedge rx_rst[1])

     if(rx_rst[1]) begin
        pc <= 0;
        addr <= 0;
        dest_mac_addr <= 0;
        wr <= 0;
        data_rcvd <= 0;
     end else begin

        pc <= pc + 1'b1;
        addr <= addr + pc[0];
        wr <= 0;

        case(pc)

          0 : if (data_int != `ETH_SFD || !RX_DV)
            pc <= pc;

          1: addr <= `ETH_RX_BUFFER_START;

          2: begin
             dest_mac_addr <= {dest_mac_addr[39:0], data_int};
             wr <= 1;
          end

          3: if (addr != (`MAC_ADDR_LEN-1 + `ETH_RX_BUFFER_START)) begin
             pc <= pc - 1'b1;
          end else if (dest_mac_addr != ETH_MAC_ADDR) begin
             pc <= 7;
          end

          4: wr <= 1;

          5: if (RX_DV) begin
             pc <= pc - 1'b1;
          end

          6: begin
             pc <= pc;
             data_rcvd <= 1;
             if (rcv_ack) begin
                pc <= 0;
                addr <= 0;
                data_rcvd <= 0;
             end
          end

          // Wait for DV to deassert
          7: if(RX_DV)
            pc <= pc;
          else
            pc <= 0;

        endcase
     end

   // capture RX_DATA
   assign data_int = {RX_DATA, data[7:4]};
   always @(posedge RX_CLK, posedge rx_rst[1])
     if (rx_rst[1])
       data <= 0;
     else if (RX_DV)
       data <= data_int;

   //
   // CRC MODULE
   //
   iob_eth_crc
     crc_rx (
             .clk(RX_CLK),
             .rst(rx_rst[1]),

             .start(pc == 0),

             .data_in(data),
             .data_en(wr),
             .crc_out(crc_value)
             );

endmodule
