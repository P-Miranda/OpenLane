`timescale 1ns/1ps

module cdc_2ff_sync
    #(
        parameter DATA_W = 1
    )
    (
        input clk_in,
        input rst,
        input [DATA_W-1:0] data_in,

        input clk_out,
        output [DATA_W-1:0] data_out
    );

    reg [DATA_W-1:0] data_in_reg;
    reg [DATA_W-1:0] data_out_sync0;
    reg [DATA_W-1:0] data_out_sync1;

    // register input data
    always @(posedge clk_in, posedge rst) begin
        if (rst) begin
            data_in_reg <= DATA_W'b0;
        end else begin
            data_in_reg <= data_in;
        end
    end

    // 2 Flip-flop synchronizer
    always @(posedge clk_out, posedge rst) begin
        if (rst) begin
            data_out_sync0 <= DATA_W'b0;
            data_out_sync1 <= DATA_W'b0;
        end else begin
            data_out_sync0 <= data_in_reg;
            data_out_sync1 <= data_out_sync0;
        end
    end

    assign data_out = data_out_sync1;
endmodule
