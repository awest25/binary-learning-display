`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/29/2024 02:26:34 PM
// Design Name: 
// Module Name: display
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


module switch_input(
    // inputs
    input wire [13:0] switches,
    input wire btnC,
    input wire btnU,
    input wire btnD,
    input wire btnL,
    input wire btnR,
    input wire sclk,
    
    // output
    output reg [13:0] decimal_value,
    output reg [3:0] thousands,
    output reg [3:0] hundreds,
    output reg [3:0] tens,
    output reg [3:0] ones
    );
    
    initial begin 
        decimal_value = 0;  
    end
    
    always @(posedge sclk) begin
        if (btnC) begin
            decimal_value <= {switches};
        end
        
        if (btnU) begin
            decimal_value <= decimal_value + 1;
        end
        
        if (btnD) begin
             decimal_value <= decimal_value - 1;
        end
         
        if (btnL) begin
              decimal_value <= {decimal_value[12:0], 1'b0};
        end
        
        if (btnR) begin
              decimal_value <= {1'b0, decimal_value[13:1]};
        end
        
        ones <= decimal_value % 10;
        tens <= (decimal_value / 10) % 10;
        hundreds <= (decimal_value / 100) % 10;
        thousands <= (decimal_value / 1000) % 10;
    end
endmodule
