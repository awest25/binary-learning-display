`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/15/2024 03:03:13 PM
// Design Name: 
// Module Name: clock
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module clock (
    // input
    input  wire clk_100mhz,
    // outputs
//    output reg  clk_1hz,
//    output reg  clk_1_5hz,
//    output reg  clk_2hz,
    output reg  clk_100hz,
    output reg clk_1000hz
);
initial begin
//    clk_1hz = 0;
//    clk_1_5hz = 0;
//    clk_2hz = 0;
    clk_100hz = 0;
    clk_1000hz = 0;
end

    parameter DIV_FACTOR_1hz = 50000000; // 50,000,000
    parameter DIV_FACTOR_1_5hz = 33333337; // 33,333,337
    parameter DIV_FACTOR_2hz = 25000000; // 25,000,000
    parameter DIV_FACTOR_100hz = 500000; // 1,000,000
    parameter DIV_FACTOR_1000hz = 50000; // 100,000

    reg [26:0] counter_1hz = 0;
    reg [26:0] counter_1_5hz = 0;
    reg [25:0] counter_2hz = 0;
    reg [19:0] counter_100hz = 0;
    reg [19:0] counter_1000hz = 0;

//    always @(posedge clk_100mhz) begin
//        if (counter_1hz == (DIV_FACTOR_1hz - 1)) begin
//            counter_1hz <= 0;
//            clk_1hz <= 1;
            
//        end else begin
//            clk_1hz <= 0;
//            counter_1hz <= counter_1hz + 1;
//        end
//    end
    
//    always @(posedge clk_100mhz) begin
//        if (counter_1_5hz == (DIV_FACTOR_1_5hz - 1)) begin
//            counter_1_5hz <= 0;
//            clk_1_5hz <= 1;
            
//        end else begin
//            clk_1_5hz <= 0;
//            counter_1_5hz <= counter_1_5hz + 1;
//        end
//    end
    
//    always @(posedge clk_100mhz) begin
//        if (counter_2hz == (DIV_FACTOR_2hz - 1)) begin
//            counter_2hz <= 0;
//            clk_2hz <= 1;
            
//        end else begin
//            clk_2hz <= 0;
//            counter_2hz <= counter_2hz + 1;
//        end
//    end
    
    always @(posedge clk_100mhz) begin
        if (counter_100hz == (DIV_FACTOR_100hz - 1)) begin
            counter_100hz <= 0;
            clk_100hz <= 1;
            
        end else begin
            clk_100hz <= 0;
            counter_100hz <= counter_100hz + 1;
        end
    end
    
    always @(posedge clk_100mhz) begin
        if (counter_1000hz == (DIV_FACTOR_1000hz - 1)) begin
            counter_1000hz <= 0;
            clk_1000hz <= 1;
            
        end else begin
            clk_1000hz <= 0;
            counter_1000hz <= counter_1000hz + 1;
        end
    end

endmodule