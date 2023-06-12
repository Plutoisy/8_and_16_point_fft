`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/05/17 23:59:24
// Design Name: 
// Module Name: buffer_2_tb
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


module buffer_2_tb(

    );
    reg [31:0]data1;
    reg [31:0]data2;
    reg [31:0]w;
    reg clk;
    reg enable_1;
    reg enable_2;
    wire [31:0]out1;
    wire rdy;
    wire [31:0]out2;
    wire [15:0]out1_real=out1[15:0];
    wire [15:0]out1_imag=out1[31:16];
    wire [15:0]out2_real=out2[15:0];
    wire [15:0]out2_imag=out2[31:16];
    buffer_2 test(
        .enable_1(enable_1),
        .enable_2(enable_2),
        .clk(clk),
        .data1(data1),
        .data2(data2),
        .w(w),  //±ä»»Òò×Ó
        .out1(out1),
        .out2(out2),
         .rdy(rdy)
    );
    initial clk=0;
    always #20 clk=!clk;
    initial begin
    #100
     enable_1=1;
     enable_2=1;
     data1=32'b00000000_00000000_00110000_00000000;
     data2=32'b00000000_00000000_00100000_00000000;
     w=32'b00000000_00000000_00000000_00000000;
     #100
//     100
//    @(posedge rdy);
//     data1=32'b11100100_01010111_00111000_10101110;//-2.1111i+3.2222           //out1=-7.0263i-0.1116  out2=2.8041i+6.5560
 //    data2=32'b00011010_01100001_11100101_01001000;//1.2657i-2.1352
  //   w=32'b00101111_00101011_00000101_10110000;//2.3883i+0.1456
     #500
     data1=32'b00000000_00000000_00000011_00000000;//3
     data2=32'b00000001_10000000_00000000_10000000;//1.5i+0.5
     w=32'b00000010_00000000_00000001_00000000;//2i+1
//     #200
 
     $stop;
     end
    
    
endmodule
