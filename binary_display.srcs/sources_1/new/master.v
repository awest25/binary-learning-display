`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/29/2024 02:26:34 PM
// Design Name: 
// Module Name: master
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


module master(
    input clk,
    input btnC,
    input btnU, // add one
    input btnD, // minus one
    input btnL, // left shift one
    input btnR, // right shift one
    input [13:0] sw,
    output [6:0] seg,
    output [3:0] an
    );
        
    wire [13:0] decimal_value;
    
    wire clk_1hz;
    wire clk_1_5hz;
    wire clk_2hz;
    wire clk_100hz;
    wire clk_1000hz;
    
    clock mod5(
        // input
        .clk_100mhz(clk),
        // outputs
//        .clk_1hz(clk_1hz),
//        .clk_1_5hz(clk_1_5hz),
//        .clk_2hz(clk_2hz),
        .clk_100hz(clk_100hz),
        .clk_1000hz(clk_1000hz)
    );
    
    wire debounced_btnC;
    wire debounced_btnU;
    wire debounced_btnD;
    wire debounced_btnL;
    wire debounced_btnR;
    
   debouncer mod2 (
       .clk(clk_100hz),
       .btn(btnC),
        
        // output
        .db_btn(debounced_btnC)
    );
    
    debouncer mod10 (
        .clk(clk_100hz),
        .btn(btnU),
         
         // output
         .db_btn(debounced_btnU)
     );
     
    debouncer mod11 (
         .clk(clk_100hz),
         .btn(btnD),
          
          // output
          .db_btn(debounced_btnD)
      );
      
    debouncer mod12 (
          .clk(clk_100hz),
          .btn(btnL),
           
           // output
           .db_btn(debounced_btnL)
       );
       
    debouncer mod14 (
             .clk(clk_100hz),
             .btn(btnR),
              
              // output
              .db_btn(debounced_btnR)
          );
    
    wire [3:0] thousands;
    wire [3:0] hundreds;
    wire [3:0] tens;
    wire [3:0] ones;
    
    switch_input mod1 (
        // input
        .switches(sw),
        .btnC(debounced_btnC),
        .btnU(debounced_btnU),
        .btnD(debounced_btnD),
        .btnL(debounced_btnL),
        .btnR(debounced_btnR),        
        .sclk(clk_100hz),
        
        // output
        .decimal_value(decimal_value),
        .thousands(thousands),
        .hundreds(hundreds),
        .tens(tens),
        .ones(ones)
    );
    
    
    initial begin
        //$display("Decimal value is %b", decimal_value);
    end
    
    display mod3 (
        //input
        .sclk(clk_100hz),
        .thousands(thousands),
        .hundreds(hundreds),
        .tens(tens),
        .ones(ones),

        //outpit
        .seg(seg),
        .an(an)
    );
    
endmodule
