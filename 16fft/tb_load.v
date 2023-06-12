`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/05/23 11:28:42
// Design Name: 
// Module Name: tb_load
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


module tb_load(

    );
reg clk;
reg enable;
reg rst_n;
wire rdy_load;
wire [31:0]  x0; 
wire [31:0]  x1; 
wire [31:0]  x2; 
wire [31:0]  x3; 
wire [31:0]  x4; 
wire [31:0]  x5; 
wire [31:0]  x6; 
wire [31:0]  x7; 
wire [31:0]  x8; 
wire [31:0]  x9; 
wire [31:0]  x10; 
wire [31:0]  x11; 
wire [31:0]  x12; 
wire [31:0]  x13; 
wire [31:0]  x14; 
wire [31:0]  x15; 

loads_data loads_data1(
.enable(enable),
.clk(clk), 
.reset_n(rst_n),
.x0(x0),
.x1(x1),
.x2(x2),
.x3(x3),
.x4(x4),
.x5(x5),
.x6(x6),
.x7(x7),
.x8(x8),
.x9(x9),
.x10(x10),
.x11(x11),
.x12(x12),
.x13(x13),
.x14(x14),
.x15(x15),
.rdy_load(rdy_load)
);
    initial clk=1;
    always#10 clk=~clk;
    initial begin
    rst_n = 1'b0;
    enable = 1'b1;
    #200;
    rst_n = 1'b1;
    end

endmodule
