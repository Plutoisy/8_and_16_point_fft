`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/05/23 15:25:05
// Design Name: 
// Module Name: butterfly_16point
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


module butterfly_16point(

	input 						clk,
	input 						rst,
//    input                       rdy_load_in,
	//某一级输入信号 (前后两组做两点蝶形运算)
	input			[31:0]		x0_real,
	input			[31:0]		x0_imag,
	input			[31:0]		x1_real,
	input			[31:0]		x1_imag,
	
	input			[31:0]		x2_real,
	input			[31:0]		x2_imag,
	input			[31:0]		x3_real,
	input			[31:0]		x3_imag,
	
	input			[31:0]		x4_real,
	input			[31:0]		x4_imag,
	input			[31:0]		x5_real,
	input			[31:0]		x5_imag,
	
	input			[31:0]		x6_real,
	input			[31:0]		x6_imag,
	input			[31:0]		x7_real,
	input			[31:0]		x7_imag,
	
    input			[31:0]		x8_real,
	input			[31:0]		x8_imag,
	input			[31:0]		x9_real,
	input			[31:0]		x9_imag,
	
	input			[31:0]		x10_real,
	input			[31:0]		x10_imag,
	input			[31:0]		x11_real,
	input			[31:0]		x11_imag,
	
	input			[31:0]		x12_real,
	input			[31:0]		x12_imag,
	input			[31:0]		x13_real,
	input			[31:0]		x13_imag,
	
	input			[31:0]		x14_real,
	input			[31:0]		x14_imag,
	input			[31:0]		x15_real,
	input			[31:0]		x15_imag,
	
	
	//旋转因子
	input			[31:0]		rot_factor_real_d0,
	input			[31:0]		rot_factor_imag_d0,	
	input			[31:0]		rot_factor_real_d1,
	input			[31:0]		rot_factor_imag_d1,	
	input			[31:0]		rot_factor_real_d2,
	input			[31:0]		rot_factor_imag_d2,	
	input			[31:0]		rot_factor_real_d3,
	input			[31:0]		rot_factor_imag_d3,	
    input			[31:0]		rot_factor_real_d4,
	input			[31:0]		rot_factor_imag_d4,	
	input			[31:0]		rot_factor_real_d5,
	input			[31:0]		rot_factor_imag_d5,	
	input			[31:0]		rot_factor_real_d6,
	input			[31:0]		rot_factor_imag_d6,	
	input			[31:0]		rot_factor_real_d7,
	input			[31:0]		rot_factor_imag_d7,	
	
	//某一级输出信号
	output reg                  rdy_load_out,
	output reg		[31:0]		butterfly_out0_real,
	output reg		[31:0]		butterfly_out0_imag,
	output reg		[31:0]		butterfly_out1_real,
	output reg		[31:0]		butterfly_out1_imag,
	output reg		[31:0]		butterfly_out2_real,
	output reg		[31:0]		butterfly_out2_imag,
	output reg		[31:0]		butterfly_out3_real,
	output reg		[31:0]		butterfly_out3_imag,
	output reg		[31:0]		butterfly_out4_real,
	output reg		[31:0]		butterfly_out4_imag,
	output reg		[31:0]		butterfly_out5_real,
	output reg		[31:0]		butterfly_out5_imag,
	output reg		[31:0]		butterfly_out6_real,
	output reg		[31:0]		butterfly_out6_imag,
	output reg		[31:0]		butterfly_out7_real,
	output reg		[31:0]		butterfly_out7_imag,
	output reg		[31:0]		butterfly_out8_real,
	output reg		[31:0]		butterfly_out8_imag,
	output reg		[31:0]		butterfly_out9_real,
	output reg		[31:0]		butterfly_out9_imag,
	output reg		[31:0]		butterfly_out10_real,
	output reg		[31:0]		butterfly_out10_imag,
	output reg		[31:0]		butterfly_out11_real,
	output reg		[31:0]		butterfly_out11_imag,
	output reg		[31:0]		butterfly_out12_real,
	output reg		[31:0]		butterfly_out12_imag,
	output reg		[31:0]		butterfly_out13_real,
	output reg		[31:0]		butterfly_out13_imag,
	output reg		[31:0]		butterfly_out14_real,
	output reg		[31:0]		butterfly_out14_imag,
	output reg		[31:0]		butterfly_out15_real,
	output reg		[31:0]		butterfly_out15_imag

);

	//每一组蝶形运算结果
	wire [31:0]out_real_d0;
	wire [31:0]out_imag_d0;
	wire [31:0]out_real_d1;
	wire [31:0]out_imag_d1;

	wire [31:0]out_real_d2;
	wire [31:0]out_imag_d2;
	wire [31:0]out_real_d3;
	wire [31:0]out_imag_d3;

	wire [31:0]out_real_d4;
	wire [31:0]out_imag_d4;
	wire [31:0]out_real_d5;
	wire [31:0]out_imag_d5;

	wire [31:0]out_real_d6;
	wire [31:0]out_imag_d6;
	wire [31:0]out_real_d7;
	wire [31:0]out_imag_d7;
	
	wire [31:0]out_real_d8;
	wire [31:0]out_imag_d8;
	wire [31:0]out_real_d9;
	wire [31:0]out_imag_d9;

	wire [31:0]out_real_d10;
	wire [31:0]out_imag_d10;
	wire [31:0]out_real_d11;
	wire [31:0]out_imag_d11;

	wire [31:0]out_real_d12;
	wire [31:0]out_imag_d12;
	wire [31:0]out_real_d13;
	wire [31:0]out_imag_d13;

	wire [31:0]out_real_d14;
	wire [31:0]out_imag_d14;
	wire [31:0]out_real_d15;
	wire [31:0]out_imag_d15;

/*
	16点的蝶形运算每一级实质上是2个八点蝶形运算
	下面实例化的2个模块就是对应2个八点蝶形运算，
	为了流水线设计，采用寄存器输出，always块就是流水线寄存器
*/
	
  butterfly_8point butterfly_8point_d0(
    .clk(clk),
    .rst(rst),
    
    .x0_real(x0_real),
    .x0_imag(x0_imag),
    .x1_real(x1_real),
    .x1_imag(x1_imag),
    
    .x2_real(x2_real),
    .x2_imag(x2_imag),
    .x3_real(x3_real),
    .x3_imag(x3_imag),
    
    .x4_real(x4_real),
    .x4_imag(x4_imag),
    .x5_real(x5_real),
    .x5_imag(x5_imag),
    
    .x6_real(x6_real),
    .x6_imag(x6_imag),
    .x7_real(x7_real),
    .x7_imag(x7_imag),
    
    
    .rot_factor_real_d0(rot_factor_real_d0),
    .rot_factor_imag_d0(rot_factor_imag_d0),
    .rot_factor_real_d1(rot_factor_real_d1),
    .rot_factor_imag_d1(rot_factor_imag_d1),
    .rot_factor_real_d2(rot_factor_real_d2),
    .rot_factor_imag_d2(rot_factor_imag_d2),
    .rot_factor_real_d3(rot_factor_real_d3),
    .rot_factor_imag_d3(rot_factor_imag_d3),
    
    
    .butterfly_out0_real(out_real_d0),
    .butterfly_out0_imag(out_imag_d0),
    .butterfly_out1_real(out_real_d1),
    .butterfly_out1_imag(out_imag_d1),
    .butterfly_out2_real(out_real_d2),
    .butterfly_out2_imag(out_imag_d2),
    .butterfly_out3_real(out_real_d3),
    .butterfly_out3_imag(out_imag_d3),
    .butterfly_out4_real(out_real_d4),
    .butterfly_out4_imag(out_imag_d4),
    .butterfly_out5_real(out_real_d5),
    .butterfly_out5_imag(out_imag_d5),
    .butterfly_out6_real(out_real_d6),
    .butterfly_out6_imag(out_imag_d6),
    .butterfly_out7_real(out_real_d7),
    .butterfly_out7_imag(out_imag_d7)
	);
	
  butterfly_8point butterfly_8point_d1(
    .clk(clk),
    .rst(rst),
    
    .x0_real(x8_real),
    .x0_imag(x8_imag),
    .x1_real(x9_real),
    .x1_imag(x9_imag),
    
    .x2_real(x10_real),
    .x2_imag(x10_imag),
    .x3_real(x11_real),
    .x3_imag(x11_imag),
    
    .x4_real(x12_real),
    .x4_imag(x12_imag),
    .x5_real(x13_real),
    .x5_imag(x13_imag),
    
    .x6_real(x14_real),
    .x6_imag(x14_imag),
    .x7_real(x15_real),
    .x7_imag(x15_imag),
    
    
    .rot_factor_real_d0(rot_factor_real_d4),
    .rot_factor_imag_d0(rot_factor_imag_d4),
    .rot_factor_real_d1(rot_factor_real_d5),
    .rot_factor_imag_d1(rot_factor_imag_d5),
    .rot_factor_real_d2(rot_factor_real_d6),
    .rot_factor_imag_d2(rot_factor_imag_d6),
    .rot_factor_real_d3(rot_factor_real_d7),
    .rot_factor_imag_d3(rot_factor_imag_d7),
    
    
    .butterfly_out0_real(out_real_d8),
    .butterfly_out0_imag(out_imag_d8),
    .butterfly_out1_real(out_real_d9),
    .butterfly_out1_imag(out_imag_d9),
    .butterfly_out2_real(out_real_d10),
    .butterfly_out2_imag(out_imag_d10),
    .butterfly_out3_real(out_real_d11),
    .butterfly_out3_imag(out_imag_d11),
    .butterfly_out4_real(out_real_d12),
    .butterfly_out4_imag(out_imag_d12),
    .butterfly_out5_real(out_real_d13),
    .butterfly_out5_imag(out_imag_d13),
    .butterfly_out6_real(out_real_d14),
    .butterfly_out6_imag(out_imag_d14),
    .butterfly_out7_real(out_real_d15),
    .butterfly_out7_imag(out_imag_d15)
	);


	
	
	
	//寄存器存储，做成流水线
	always@(posedge clk or negedge rst)begin
		if(!rst)begin
			butterfly_out0_real <= 32'd0;
			butterfly_out0_imag <= 32'd0;
			butterfly_out1_real <= 32'd0;
			butterfly_out1_imag <= 32'd0;
			butterfly_out2_real <= 32'd0;
			butterfly_out2_imag <= 32'd0;
			butterfly_out3_real <= 32'd0;
			butterfly_out3_imag <= 32'd0;
			butterfly_out4_real <= 32'd0;
			butterfly_out4_imag <= 32'd0;
			butterfly_out5_real <= 32'd0;
			butterfly_out5_imag <= 32'd0;
			butterfly_out6_real <= 32'd0;
			butterfly_out6_imag <= 32'd0;
			butterfly_out7_real <= 32'd0;
			butterfly_out7_imag <= 32'd0;
			butterfly_out8_real <= 32'd0;
			butterfly_out8_imag <= 32'd0;
			butterfly_out9_real <= 32'd0;
			butterfly_out9_imag <= 32'd0;
			butterfly_out10_real <= 32'd0;
			butterfly_out10_imag <= 32'd0;
			butterfly_out11_real <= 32'd0;
			butterfly_out11_imag <= 32'd0;
			butterfly_out12_real <= 32'd0;
			butterfly_out12_imag <= 32'd0;
			butterfly_out13_real <= 32'd0;
			butterfly_out13_imag <= 32'd0;
			butterfly_out14_real <= 32'd0;
			butterfly_out14_imag <= 32'd0;
			butterfly_out15_real <= 32'd0;
			butterfly_out15_imag <= 32'd0;
		end
		else begin
			butterfly_out0_real <= out_real_d0;
			butterfly_out0_imag <= out_imag_d0;
			butterfly_out1_real <= out_real_d1;
			butterfly_out1_imag <= out_imag_d1;
			
			butterfly_out2_real <= out_real_d2;
			butterfly_out2_imag <= out_imag_d2;
			butterfly_out3_real <= out_real_d3;
			butterfly_out3_imag <= out_imag_d3;
			
			butterfly_out4_real <= out_real_d4;
			butterfly_out4_imag <= out_imag_d4;
			butterfly_out5_real <= out_real_d5;
			butterfly_out5_imag <= out_imag_d5;
			
			butterfly_out6_real <= out_real_d6;
			butterfly_out6_imag <= out_imag_d6;
			butterfly_out7_real <= out_real_d7;
			butterfly_out7_imag <= out_imag_d7;
			
			butterfly_out8_real <= out_real_d8;
			butterfly_out8_imag <= out_imag_d8;
			butterfly_out9_real <= out_real_d9;
			butterfly_out9_imag <= out_imag_d9;
			
			butterfly_out10_real <= out_real_d10;
			butterfly_out10_imag <= out_imag_d10;
			butterfly_out11_real <= out_real_d11;
			butterfly_out11_imag <= out_imag_d11;
			
			butterfly_out12_real <= out_real_d12;
			butterfly_out12_imag <= out_imag_d12;
			butterfly_out13_real <= out_real_d13;
			butterfly_out13_imag <= out_imag_d13;
			
			butterfly_out14_real <= out_real_d14;
			butterfly_out14_imag <= out_imag_d14;
			butterfly_out15_real <= out_real_d15;
			butterfly_out15_imag <= out_imag_d15;
			rdy_load_out <= 1;
		end
	end
	
	
	
endmodule
