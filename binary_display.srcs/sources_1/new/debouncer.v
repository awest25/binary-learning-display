`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/24/2024 03:39:53 PM
// Design Name: 
// Module Name: debouncer
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


module debouncer (
    input wire clk,
    input wire btn,
    output reg db_btn
    );

    reg [1:0] shift_reg;

    always @(posedge clk) begin
        shift_reg <= {shift_reg[0], btn};
        if (shift_reg == 4'b10) db_btn <= 1;
        else if (shift_reg == 4'b00) db_btn <= 0;
    end

//    reg [2:0]   step_d;
    
////    reg paused = 1'b0; // Initial state is running
    
//    always @ (posedge clk) begin
////         if (clk_en) begin
//             step_d[2:0]  <= {btn, step_d[2:1]};
////          end
//            if ( ~step_d[0] && step_d[1] )
//                db_btn = !db_btn;
//    end
endmodule