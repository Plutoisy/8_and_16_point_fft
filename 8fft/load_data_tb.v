`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/05/18 06:23:26
// Design Name: 
// Module Name: load_data_tb
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

module load_data_tb(
    );
    reg clk;
    reg reset_n;
    reg enable;
    wire [31:0]x0;
    wire [31:0]x1;
    wire [31:0]x2;
    wire [31:0]x3;
    wire [31:0]x4;
    wire [31:0]x5;
    wire [31:0]x6;
    wire [31:0]x7;
    wire rdy_load;

    loads_data load(
        .enable(enable),
        .clk(clk),
        .reset_n(reset_n),
        .x0(x0),
        .x1(x1),
        .x2(x2),
        .x3(x3),
        .x4(x4),
        .x5(x5),
        .x6(x6),
        .x7(x7),
        .rdy_load(rdy_load)
   );
   initial clk=0;
   always #10 clk=~clk;
   initial begin
   #100
   reset_n=1;
   #100
   reset_n=1;
   enable=0;
   #100
   enable=1;
   $stop;
   end

endmodule
