`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/05/19 21:59:07
// Design Name: 
// Module Name: FFT_8_tb
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


module FFT_8_tb(
   );
    reg input_pulse;
    reg reset_n;
    reg clk;
    wire [31:0]X0;
    wire [31:0]X1;
    wire [31:0]X2;
    wire [31:0]X3;
    wire [31:0]X4;
    wire [31:0]X5;
    wire [31:0]X6;
    wire [31:0]X7;
    wire success;
    
    FFT_8 FFT(
        .clk(clk),
        .input_pulse(input_pulse),
        .reset_n(reset_n),
//        .X0(X0),
//        .X1(X1),
//        .X2(X2),
//        .X3(X3),
//        .X4(X4),
//        .X5(X5),
//        .X6(X6),
//        .X7(X7),
        .success(success)
        );
        
 initial clk=0;
 always #10 clk=~clk;
 initial begin
  #30
  reset_n=1;
  input_pulse=0;
  #200
  reset_n=1;
  #50
   input_pulse=1;
  #100
   input_pulse=0;
  #20
  $stop;
  end 
endmodule
