`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/05/22 22:43:42
// Design Name: 
// Module Name: mul_tb
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


module mul_tb(

    );
    
    reg [31:0]a;
    reg [31:0]b;
    wire [31:0]out;
    complex_32_mul mul(
        .a(a),
        .b(b),
        .out(out)
    );
initial begin
#50
a=32'b00010000_00000000_00010000_00000000;
b=32'b00010000_00000000_00010000_00000000;
#50
a=32'b11110000_00000000_00010000_00000000;
b=32'b11100000_00000000_11110000_00000000;
#50
a=32'b00011000_00000000_11111000_00000000;
b=32'b00010000_00000000_00010000_00000000;
#50
$stop;
end


    
endmodule
