`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/22/2024 02:41:13 PM
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


module display(
    input sclk,
    input [3:0] thousands,
    input [3:0] hundreds,
    input [3:0] tens,
    input [3:0] ones,
    
    output reg [6:0] seg,
    output reg [3:0] an
);

reg [3:0] digit;


always @(posedge sclk) begin
    // Shift the values (left shift)

    if (an == 4'b0111) begin
        an <= 4'b1110; // Use non-blocking assignment to avoid combinatorial loop
    end else begin
        an <= {an[2:0], 1'b1}; // Shift an one position to the left
    end
end

always @ (posedge sclk) begin
    if (!an[3]) begin // should be an[0], don't know why it doesn't work
//        digit = seconds % 10;
        case (ones)
            4'b0000: seg = 7'b1000000; //0
            4'b0001: seg = 7'b1111001;
            4'b0010: seg = 7'b0100100;
            4'b0011: seg = 7'b0110000;
            4'b0100: seg = 7'b0011001;
            4'b0101: seg = 7'b0010010;
            4'b0110: seg = 7'b0000010;
            4'b0111: seg = 7'b1111000;
            4'b1000: seg = 7'b0000000;
            4'b1001: seg = 7'b0010000;
            default: seg = 7'b1111111;
        endcase
    end
    if (!an[0]) begin
//        digit = seconds / 10;
        case (tens)
            4'b0000: seg = 7'b1000000; //0
            4'b0001: seg = 7'b1111001;
            4'b0010: seg = 7'b0100100;
            4'b0011: seg = 7'b0110000;
            4'b0100: seg = 7'b0011001;
            4'b0101: seg = 7'b0010010;
            4'b0110: seg = 7'b0000010;
            4'b0111: seg = 7'b1111000;
            4'b1000: seg = 7'b0000000;
            4'b1001: seg = 7'b0010000;
            default: seg = 7'b1111111;
        endcase
    end
    if (!an[1]) begin
//        digit = minutes % 10;
        case (hundreds)
            4'b0000: seg = 7'b1000000; //0
            4'b0001: seg = 7'b1111001;
            4'b0010: seg = 7'b0100100;
            4'b0011: seg = 7'b0110000;
            4'b0100: seg = 7'b0011001;
            4'b0101: seg = 7'b0010010;
            4'b0110: seg = 7'b0000010;
            4'b0111: seg = 7'b1111000;
            4'b1000: seg = 7'b0000000;
            4'b1001: seg = 7'b0010000;
            default: seg = 7'b1111111;
        endcase
    end
    if (!an[2]) begin
//        digit = minutes / 10;
        case (thousands)
            4'b0000: seg = 7'b1000000; //0
            4'b0001: seg = 7'b1111001;
            4'b0010: seg = 7'b0100100;
            4'b0011: seg = 7'b0110000;
            4'b0100: seg = 7'b0011001;
            4'b0101: seg = 7'b0010010;
            4'b0110: seg = 7'b0000010;
            4'b0111: seg = 7'b1111000;
            4'b1000: seg = 7'b0000000;
            4'b1001: seg = 7'b0010000;
            default: seg = 7'b1111111;
        endcase
    end
    
//    case (digit)
//        4'b0000: seg = 7'b1000000; //0
//        4'b0001: seg = 7'b1111001;
//        4'b0010: seg = 7'b0100100;
//        4'b0011: seg = 7'b0110000;
//        4'b0100: seg = 7'b0011001;
//        4'b0101: seg = 7'b0010010;
//        4'b0110: seg = 7'b0000010;
//        4'b0111: seg = 7'b1111000;
//        4'b1000: seg = 7'b0000000;
//        4'b1001: seg = 7'b0010000;
//        default: seg = 7'b1111111;
//    endcase
end


endmodule
