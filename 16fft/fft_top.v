module fft_top(

	input 						clk,
	input 						rst,
	output [3:0]led

	

	
);
/*
（由于设计的是流水线的，不存在编程思路中的原码运算）
*/
//第一级蝶形运算结果
	wire			[31:0]		x0_real;
	wire			[31:0]		x0_imag;
	wire			[31:0]		x1_real;
	wire			[31:0]		x1_imag;
	wire			[31:0]		x2_real;
	wire			[31:0]		x2_imag;
	wire			[31:0]		x3_real;
	wire			[31:0]		x3_imag;
	wire			[31:0]		x4_real;
	wire			[31:0]		x4_imag;
	wire			[31:0]		x5_real;
	wire			[31:0]		x5_imag;
	wire			[31:0]		x6_real;
	wire			[31:0]		x6_imag;
	wire			[31:0]		x7_real;
	wire			[31:0]		x7_imag;
	
	wire			[31:0]		x8_real;
	wire			[31:0]		x8_imag;
	wire			[31:0]		x9_real;
	wire			[31:0]		x9_imag;
	wire			[31:0]		x10_real;
	wire			[31:0]		x10_imag;
	wire			[31:0]		x11_real;
	wire			[31:0]		x11_imag;
	wire			[31:0]		x12_real;
	wire			[31:0]		x12_imag;
	wire			[31:0]		x13_real;
	wire			[31:0]		x13_imag;
	wire			[31:0]		x14_real;
	wire			[31:0]		x14_imag;
	wire			[31:0]		x15_real;
	wire			[31:0]		x15_imag;
	
	wire 			[31:0]		fft_out0_real;
wire 			[31:0]		fft_out0_imag;
wire 			[31:0]		fft_out1_real;
wire 			[31:0]		fft_out1_imag;
wire 			[31:0]		fft_out2_real;
wire 			[31:0]		fft_out2_imag;
wire 			[31:0]		fft_out3_real;
wire 			[31:0]		fft_out3_imag;
wire 			[31:0]		fft_out4_real;
wire 			[31:0]		fft_out4_imag;
wire 			[31:0]		fft_out5_real;
wire 			[31:0]		fft_out5_imag;
wire 			[31:0]		fft_out6_real;
wire 			[31:0]		fft_out6_imag;
wire 			[31:0]		fft_out7_real;
wire 			[31:0]		fft_out7_imag;
wire 			[31:0]		fft_out8_real;
wire 			[31:0]		fft_out8_imag;
wire 			[31:0]		fft_out9_real;
wire 			[31:0]		fft_out9_imag;
wire 			[31:0]		fft_out10_real;
wire 			[31:0]		fft_out10_imag;
wire 			[31:0]		fft_out11_real;
wire 			[31:0]		fft_out11_imag;
wire 			[31:0]		fft_out12_real;
wire 			[31:0]		fft_out12_imag;
wire 			[31:0]		fft_out13_real;
wire 			[31:0]		fft_out13_imag;
wire 			[31:0]		fft_out14_real;
wire 			[31:0]		fft_out14_imag;
wire 			[31:0]		fft_out15_real;
wire 			[31:0]		fft_out15_imag;

reg  [3:0]led_temp;
wire rdy_load;
wire rdy_load1;
wire rdy_load2;
wire rdy_load3;
wire rdy_load4;
reg rdy_load5;
wire [31:0]out1_real_d0;
wire [31:0]out1_imag_d0;
wire [31:0]out1_real_d1;
wire [31:0]out1_imag_d1;

wire [31:0]out1_real_d2;
wire [31:0]out1_imag_d2;
wire [31:0]out1_real_d3;
wire [31:0]out1_imag_d3;

wire [31:0]out1_real_d4;
wire [31:0]out1_imag_d4;
wire [31:0]out1_real_d5;
wire [31:0]out1_imag_d5;

wire [31:0]out1_real_d6;
wire [31:0]out1_imag_d6;
wire [31:0]out1_real_d7;
wire [31:0]out1_imag_d7;

wire [31:0]out1_real_d8;
wire [31:0]out1_imag_d8;
wire [31:0]out1_real_d9;
wire [31:0]out1_imag_d9;

wire [31:0]out1_real_d10;
wire [31:0]out1_imag_d10;
wire [31:0]out1_real_d11;
wire [31:0]out1_imag_d11;

wire [31:0]out1_real_d12;
wire [31:0]out1_imag_d12;
wire [31:0]out1_real_d13;
wire [31:0]out1_imag_d13;

wire [31:0]out1_real_d14;
wire [31:0]out1_imag_d14;
wire [31:0]out1_real_d15;
wire [31:0]out1_imag_d15;

//第二级蝶形运算结果
wire [31:0]out2_real_d0;
wire [31:0]out2_imag_d0;
wire [31:0]out2_real_d1;
wire [31:0]out2_imag_d1;

wire [31:0]out2_real_d2;
wire [31:0]out2_imag_d2;
wire [31:0]out2_real_d3;
wire [31:0]out2_imag_d3;

wire [31:0]out2_real_d4;
wire [31:0]out2_imag_d4;
wire [31:0]out2_real_d5;
wire [31:0]out2_imag_d5;

wire [31:0]out2_real_d6;
wire [31:0]out2_imag_d6;
wire [31:0]out2_real_d7;
wire [31:0]out2_imag_d7;

wire [31:0]out2_real_d8;
wire [31:0]out2_imag_d8;
wire [31:0]out2_real_d9;
wire [31:0]out2_imag_d9;

wire [31:0]out2_real_d10;
wire [31:0]out2_imag_d10;
wire [31:0]out2_real_d11;
wire [31:0]out2_imag_d11;

wire [31:0]out2_real_d12;
wire [31:0]out2_imag_d12;
wire [31:0]out2_real_d13;
wire [31:0]out2_imag_d13;

wire [31:0]out2_real_d14;
wire [31:0]out2_imag_d14;
wire [31:0]out2_real_d15;
wire [31:0]out2_imag_d15;

//第三级输出
wire [31:0]out3_real_d0;
wire [31:0]out3_imag_d0;
wire [31:0]out3_real_d1;
wire [31:0]out3_imag_d1;

wire [31:0]out3_real_d2;
wire [31:0]out3_imag_d2;
wire [31:0]out3_real_d3;
wire [31:0]out3_imag_d3;

wire [31:0]out3_real_d4;
wire [31:0]out3_imag_d4;
wire [31:0]out3_real_d5;
wire [31:0]out3_imag_d5;

wire [31:0]out3_real_d6;
wire [31:0]out3_imag_d6;
wire [31:0]out3_real_d7;
wire [31:0]out3_imag_d7;

wire [31:0]out3_real_d8;
wire [31:0]out3_imag_d8;
wire [31:0]out3_real_d9;
wire [31:0]out3_imag_d9;

wire [31:0]out3_real_d10;
wire [31:0]out3_imag_d10;
wire [31:0]out3_real_d11;
wire [31:0]out3_imag_d11;

wire [31:0]out3_real_d12;
wire [31:0]out3_imag_d12;
wire [31:0]out3_real_d13;
wire [31:0]out3_imag_d13;

wire [31:0]out3_real_d14;
wire [31:0]out3_imag_d14;
wire [31:0]out3_real_d15;
wire [31:0]out3_imag_d15;


wire 			[31:0]		fft_out0;
wire 			[31:0]		xin0;
wire 			[31:0]		fft_out1;
wire 			[31:0]		xin1;
wire 			[31:0]		fft_out2;
wire 			[31:0]		xin2;
wire 			[31:0]		fft_out3;
wire 			[31:0]		xin3;
wire 			[31:0]		fft_out4;
wire 			[31:0]		xin4;
wire 			[31:0]		fft_out5;
wire 			[31:0]		xin5;
wire 			[31:0]		fft_out6;
wire 			[31:0]		xin6;
wire 			[31:0]		fft_out7;
wire 			[31:0]		xin7;
wire 			[31:0]		fft_out8;
wire 			[31:0]		xin8;
wire 			[31:0]		fft_out9;
wire 			[31:0]		xin9;
wire 			[31:0]		fft_out10;
wire 			[31:0]		xin10;
wire 			[31:0]		fft_out11;
wire 			[31:0]		xin11;
wire 			[31:0]		fft_out12;
wire 			[31:0]		xin12;
wire 			[31:0]		fft_out13;
wire 			[31:0]		xin13;
wire 			[31:0]		fft_out14;
wire 			[31:0]		xin14;
wire 			[31:0]		fft_out15;
wire 			[31:0]		xin15;

//8点fft旋转因子
wire [31:0]rotation_factor_real[7:0];
wire [31:0]rotation_factor_imag[7:0];

//assign x0_imag = 32'b0;
//assign x1_imag = 32'b0;
//assign x2_imag = 32'b0;
//assign x3_imag = 32'b0;
//assign x4_imag = 32'b0;
//assign x5_imag = 32'b0;
//assign x6_imag = 32'b0;
//assign x7_imag = 32'b0;
//assign x8_imag = 32'b0;
//assign x9_imag = 32'b0;
//assign x10_imag = 32'b0;
//assign x11_imag = 32'b0;
//assign x12_imag = 32'b0;
//assign x13_imag = 32'b0;
//assign x14_imag = 32'b0;
//assign x15_imag = 32'b0;
assign led=led_temp;
//旋转因子

assign rotation_factor_imag[0]=32'b0000_0000_0000_0000_0000_0000_0000_0000;
assign rotation_factor_real[0]=32'b0000_0000_0000_0001_0000_0000_0000_0000;		

assign rotation_factor_imag[1]=32'b1111_1111_1111_1111_1001_1110_0000_0000;
assign rotation_factor_real[1]=32'b0000_0000_0000_0000_1110_1100_1000_0000;

assign rotation_factor_imag[2]=32'b1111_1111_1111_1111_0100_1010_1111_0000;
assign rotation_factor_real[2]=32'b0000_0000_0000_0000_1011_0101_0000_0000;

assign rotation_factor_imag[3]=32'b1111_1111_1111_1111_0001_0011_0111_0000;
assign rotation_factor_real[3]=32'b0000_0000_0000_0000_0110_0001_1111_0000;

assign rotation_factor_imag[4]=32'b1111_1111_1111_1111_0000_0000_0000_0000;
assign rotation_factor_real[4]=32'b0000_0000_0000_0000_0000_0000_0000_0000;		

assign rotation_factor_imag[5]=32'b1111_1111_1111_1111_0001_0011_0111_0000;
assign rotation_factor_real[5]=32'b1111_1111_1111_1111_1001_1110_0000_0000;

assign rotation_factor_imag[6]=32'b1111_1111_1111_1111_0100_1010_1111_0000;
assign rotation_factor_real[6]=32'b1111_1111_1111_1111_0100_1010_1111_0000;

assign rotation_factor_imag[7]=32'b1111_1111_1111_1111_1001_1110_0000_0000;
assign rotation_factor_real[7]=32'b1111_1111_1111_1111_0001_0011_0111_0000;


loads_data loads_data1(
.enable(1'b1),
.clk(clk), 
.reset_n(rst),
.x0(x0_real),
.x1(x1_real),
.x2(x2_real),
.x3(x3_real),
.x4(x4_real),
.x5(x5_real),
.x6(x6_real),
.x7(x7_real),
.x8(x8_real),
.x9(x9_real),
.x10(x10_real),
.x11(x11_real),
.x12(x12_real),
.x13(x13_real),
.x14(x14_real),
.x15(x15_real),
.x0_i(x0_imag),
.x1_i(x1_imag),
.x2_i(x2_imag),
.x3_i(x3_imag),
.x4_i(x4_imag),
.x5_i(x5_imag),
.x6_i(x6_imag),
.x7_i(x7_imag),
.x8_i(x8_imag),
.x9_i(x9_imag),
.x10_i(x10_imag),
.x11_i(x11_imag),
.x12_i(x12_imag),
.x13_i(x13_imag),
.x14_i(x14_imag),
.x15_i(x15_imag),
.rdy_load(rdy_load)
);

/*
16点一共三级流水，每一级输出是寄存器输出，因此第一个结果要在时钟有效后三个时钟周期后才出结果，
但是随后每一个周期计算一个结果，这也就是流水线的好处吧！
*/
//16点蝶形运算第一级(0,8,4,12,2,10,6,14,1,9,5,13,3,11,7,15)
//刚刚写到这了！！！！！！！
butterfly_16point butterfly_16point_d0(

    .clk(clk),
    .rst(rst),
//    .rdy_load_in(rdy_load),
    .x0_real(x0_real),
    .x0_imag(x0_imag),
    .x1_real(x8_real),
    .x1_imag(x8_imag),
    .x2_real(x4_real),
    .x2_imag(x4_imag),
    .x3_real(x12_real),
    .x3_imag(x12_imag),
    .x4_real(x2_real),
    .x4_imag(x2_imag),
    .x5_real(x10_real),
    .x5_imag(x10_imag),
    .x6_real(x6_real),
    .x6_imag(x6_imag),
    .x7_real(x14_real),
    .x7_imag(x14_imag),
    .x8_real(x1_real),
    .x8_imag(x1_imag),
    .x9_real(x9_real),
    .x9_imag(x9_imag),
    .x10_real(x5_real),
    .x10_imag(x5_imag),
    .x11_real(x13_real),
    .x11_imag(x13_imag),
    .x12_real(x3_real),
    .x12_imag(x3_imag),
    .x13_real(x11_real),
    .x13_imag(x11_imag),
    .x14_real(x7_real),
    .x14_imag(x7_imag),
    .x15_real(x15_real),
    .x15_imag(x15_imag),
    
    .rot_factor_real_d0(rotation_factor_real[0]),
    .rot_factor_imag_d0(rotation_factor_imag[0]),	
    .rot_factor_real_d1(rotation_factor_real[0]),
    .rot_factor_imag_d1(rotation_factor_imag[0]),	
    .rot_factor_real_d2(rotation_factor_real[0]),
    .rot_factor_imag_d2(rotation_factor_imag[0]),	
    .rot_factor_real_d3(rotation_factor_real[0]),
    .rot_factor_imag_d3(rotation_factor_imag[0]),	
    .rot_factor_real_d4(rotation_factor_real[0]),
    .rot_factor_imag_d4(rotation_factor_imag[0]),	
    .rot_factor_real_d5(rotation_factor_real[0]),
    .rot_factor_imag_d5(rotation_factor_imag[0]),	
    .rot_factor_real_d6(rotation_factor_real[0]),
    .rot_factor_imag_d6(rotation_factor_imag[0]),	
    .rot_factor_real_d7(rotation_factor_real[0]),
    .rot_factor_imag_d7(rotation_factor_imag[0]),	
    
    .butterfly_out0_real(out1_real_d0),
    .butterfly_out0_imag(out1_imag_d0),
    .butterfly_out1_real(out1_real_d1),
    .butterfly_out1_imag(out1_imag_d1),
    .butterfly_out2_real(out1_real_d2),
    .butterfly_out2_imag(out1_imag_d2),
    .butterfly_out3_real(out1_real_d3),
    .butterfly_out3_imag(out1_imag_d3),
    .butterfly_out4_real(out1_real_d4),
    .butterfly_out4_imag(out1_imag_d4),
    .butterfly_out5_real(out1_real_d5),
    .butterfly_out5_imag(out1_imag_d5),
    .butterfly_out6_real(out1_real_d6),
    .butterfly_out6_imag(out1_imag_d6),
    .butterfly_out7_real(out1_real_d7),
    .butterfly_out7_imag(out1_imag_d7),
    .butterfly_out8_real(out1_real_d8),
    .butterfly_out8_imag(out1_imag_d8),
    .butterfly_out9_real(out1_real_d9),
    .butterfly_out9_imag(out1_imag_d9),
    .butterfly_out10_real(out1_real_d10),
    .butterfly_out10_imag(out1_imag_d10),
    .butterfly_out11_real(out1_real_d11),
    .butterfly_out11_imag(out1_imag_d11),
    .butterfly_out12_real(out1_real_d12),
    .butterfly_out12_imag(out1_imag_d12),
    .butterfly_out13_real(out1_real_d13),
    .butterfly_out13_imag(out1_imag_d13),
    .butterfly_out14_real(out1_real_d14),
    .butterfly_out14_imag(out1_imag_d14),
    .butterfly_out15_real(out1_real_d15),
    .butterfly_out15_imag(out1_imag_d15),
    .rdy_load_out(rdy_load1)

);

//蝶形运算第二级（由于设计的是流水线的，不存在编程思路中的原码运算）
butterfly_16point butterfly_16point_d1(

    .clk(clk),
    .rst(rst),
//    .rdy_load_in(rdy_load1),
    .x0_real(out1_real_d0),
    .x0_imag(out1_imag_d0),
    .x1_real(out1_real_d2),
    .x1_imag(out1_imag_d2),
    .x2_real(out1_real_d1),
    .x2_imag(out1_imag_d1),
    .x3_real(out1_real_d3),
    .x3_imag(out1_imag_d3),
    .x4_real(out1_real_d4),
    .x4_imag(out1_imag_d4),
    .x5_real(out1_real_d6),
    .x5_imag(out1_imag_d6),
    .x6_real(out1_real_d5),
    .x6_imag(out1_imag_d5),
    .x7_real(out1_real_d7),
    .x7_imag(out1_imag_d7),
    .x8_real(out1_real_d8),
    .x8_imag(out1_imag_d8),
    .x9_real(out1_real_d10),
    .x9_imag(out1_imag_d10),
    .x10_real(out1_real_d9),
    .x10_imag(out1_imag_d9),
    .x11_real(out1_real_d11),
    .x11_imag(out1_imag_d11),
    .x12_real(out1_real_d12),
    .x12_imag(out1_imag_d12),
    .x13_real(out1_real_d14),
    .x13_imag(out1_imag_d14),
    .x14_real(out1_real_d13),
    .x14_imag(out1_imag_d13),
    .x15_real(out1_real_d15),
    .x15_imag(out1_imag_d15),
    
    .rot_factor_real_d0(rotation_factor_real[0]),
    .rot_factor_imag_d0(rotation_factor_imag[0]),	
    .rot_factor_real_d1(rotation_factor_real[4]),
    .rot_factor_imag_d1(rotation_factor_imag[4]),	
    .rot_factor_real_d2(rotation_factor_real[0]),
    .rot_factor_imag_d2(rotation_factor_imag[0]),	
    .rot_factor_real_d3(rotation_factor_real[4]),
    .rot_factor_imag_d3(rotation_factor_imag[4]),	
    .rot_factor_real_d4(rotation_factor_real[0]),
    .rot_factor_imag_d4(rotation_factor_imag[0]),	
    .rot_factor_real_d5(rotation_factor_real[4]),
    .rot_factor_imag_d5(rotation_factor_imag[4]),	
    .rot_factor_real_d6(rotation_factor_real[0]),
    .rot_factor_imag_d6(rotation_factor_imag[0]),	
    .rot_factor_real_d7(rotation_factor_real[4]),
    .rot_factor_imag_d7(rotation_factor_imag[4]),	
    
    .butterfly_out0_real(out2_real_d0),
    .butterfly_out0_imag(out2_imag_d0),
    .butterfly_out1_real(out2_real_d2),
    .butterfly_out1_imag(out2_imag_d2),
    .butterfly_out2_real(out2_real_d1),
    .butterfly_out2_imag(out2_imag_d1),
    .butterfly_out3_real(out2_real_d3),
    .butterfly_out3_imag(out2_imag_d3),
    .butterfly_out4_real(out2_real_d4),
    .butterfly_out4_imag(out2_imag_d4),
    .butterfly_out5_real(out2_real_d6),
    .butterfly_out5_imag(out2_imag_d6),
    .butterfly_out6_real(out2_real_d5),
    .butterfly_out6_imag(out2_imag_d5),
    .butterfly_out7_real(out2_real_d7),
    .butterfly_out7_imag(out2_imag_d7),
    .butterfly_out8_real(out2_real_d8),
    .butterfly_out8_imag(out2_imag_d8),
    .butterfly_out9_real(out2_real_d10),
    .butterfly_out9_imag(out2_imag_d10),
    .butterfly_out10_real(out2_real_d9),
    .butterfly_out10_imag(out2_imag_d9),
    .butterfly_out11_real(out2_real_d11),
    .butterfly_out11_imag(out2_imag_d11),
    .butterfly_out12_real(out2_real_d12),
    .butterfly_out12_imag(out2_imag_d12),
    .butterfly_out13_real(out2_real_d14),
    .butterfly_out13_imag(out2_imag_d14),
    .butterfly_out14_real(out2_real_d13),
    .butterfly_out14_imag(out2_imag_d13),
    .butterfly_out15_real(out2_real_d15),
    .butterfly_out15_imag(out2_imag_d15),
    .rdy_load_out(rdy_load2)
);

//蝶形运算第三级
butterfly_16point butterfly_16point_d2(

    .clk(clk),
    .rst(rst),
//    .rdy_load_in(rdy_load2),
    .x0_real(out2_real_d0),
    .x0_imag(out2_imag_d0),
    .x1_real(out2_real_d4),
    .x1_imag(out2_imag_d4),
    .x2_real(out2_real_d1),
    .x2_imag(out2_imag_d1),
    .x3_real(out2_real_d5),
    .x3_imag(out2_imag_d5),
    .x4_real(out2_real_d2),
    .x4_imag(out2_imag_d2),
    .x5_real(out2_real_d6),
    .x5_imag(out2_imag_d6),
    .x6_real(out2_real_d3),
    .x6_imag(out2_imag_d3),
    .x7_real(out2_real_d7),
    .x7_imag(out2_imag_d7),
    .x8_real(out2_real_d8),
    .x8_imag(out2_imag_d8),
    .x9_real(out2_real_d12),
    .x9_imag(out2_imag_d12),
    .x10_real(out2_real_d9),
    .x10_imag(out2_imag_d9),
    .x11_real(out2_real_d13),
    .x11_imag(out2_imag_d13),
    .x12_real(out2_real_d10),
    .x12_imag(out2_imag_d10),
    .x13_real(out2_real_d14),
    .x13_imag(out2_imag_d14),
    .x14_real(out2_real_d11),
    .x14_imag(out2_imag_d11),
    .x15_real(out2_real_d15),
    .x15_imag(out2_imag_d15),
    
    .rot_factor_real_d0(rotation_factor_real[0]),
    .rot_factor_imag_d0(rotation_factor_imag[0]),	
    .rot_factor_real_d1(rotation_factor_real[2]),
    .rot_factor_imag_d1(rotation_factor_imag[2]),	
    .rot_factor_real_d2(rotation_factor_real[4]),
    .rot_factor_imag_d2(rotation_factor_imag[4]),	
    .rot_factor_real_d3(rotation_factor_real[6]),
    .rot_factor_imag_d3(rotation_factor_imag[6]),	
    .rot_factor_real_d4(rotation_factor_real[0]),
    .rot_factor_imag_d4(rotation_factor_imag[0]),	
    .rot_factor_real_d5(rotation_factor_real[2]),
    .rot_factor_imag_d5(rotation_factor_imag[2]),	
    .rot_factor_real_d6(rotation_factor_real[4]),
    .rot_factor_imag_d6(rotation_factor_imag[4]),	
    .rot_factor_real_d7(rotation_factor_real[6]),
    .rot_factor_imag_d7(rotation_factor_imag[6]),	
    
    .butterfly_out0_real(out3_real_d0),
    .butterfly_out0_imag(out3_imag_d0),
    .butterfly_out1_real(out3_real_d4),
    .butterfly_out1_imag(out3_imag_d4),
    .butterfly_out2_real(out3_real_d1),
    .butterfly_out2_imag(out3_imag_d1),
    .butterfly_out3_real(out3_real_d5),
    .butterfly_out3_imag(out3_imag_d5),
    .butterfly_out4_real(out3_real_d2),
    .butterfly_out4_imag(out3_imag_d2),
    .butterfly_out5_real(out3_real_d6),
    .butterfly_out5_imag(out3_imag_d6),
    .butterfly_out6_real(out3_real_d3),
    .butterfly_out6_imag(out3_imag_d3),
    .butterfly_out7_real(out3_real_d7),
    .butterfly_out7_imag(out3_imag_d7),
    .butterfly_out8_real(out3_real_d8),
    .butterfly_out8_imag(out3_imag_d8),
    .butterfly_out9_real(out3_real_d12),
    .butterfly_out9_imag(out3_imag_d12),
    .butterfly_out10_real(out3_real_d9),
    .butterfly_out10_imag(out3_imag_d9),
    .butterfly_out11_real(out3_real_d13),
    .butterfly_out11_imag(out3_imag_d13),
    .butterfly_out12_real(out3_real_d10),
    .butterfly_out12_imag(out3_imag_d10),
    .butterfly_out13_real(out3_real_d14),
    .butterfly_out13_imag(out3_imag_d14),
    .butterfly_out14_real(out3_real_d11),
    .butterfly_out14_imag(out3_imag_d11),
    .butterfly_out15_real(out3_real_d15),
    .butterfly_out15_imag(out3_imag_d15),
    .rdy_load_out(rdy_load3)

);



//蝶形运算第四级
butterfly_16point butterfly_16point_d3(

    .clk(clk),
    .rst(rst),
//    .rdy_load_in(rdy_load3),
    .x0_real(out3_real_d0),
    .x0_imag(out3_imag_d0),
    .x1_real(out3_real_d8),
    .x1_imag(out3_imag_d8),
    .x2_real(out3_real_d1),
    .x2_imag(out3_imag_d1),
    .x3_real(out3_real_d9),
    .x3_imag(out3_imag_d9),
    .x4_real(out3_real_d2),
    .x4_imag(out3_imag_d2),
    .x5_real(out3_real_d10),
    .x5_imag(out3_imag_d10),
    .x6_real(out3_real_d3),
    .x6_imag(out3_imag_d3),
    .x7_real(out3_real_d11),
    .x7_imag(out3_imag_d11),
    .x8_real(out3_real_d4),
    .x8_imag(out3_imag_d4),
    .x9_real(out3_real_d12),
    .x9_imag(out3_imag_d12),
    .x10_real(out3_real_d5),
    .x10_imag(out3_imag_d5),
    .x11_real(out3_real_d13),
    .x11_imag(out3_imag_d13),
    .x12_real(out3_real_d6),
    .x12_imag(out3_imag_d6),
    .x13_real(out3_real_d14),
    .x13_imag(out3_imag_d14),
    .x14_real(out3_real_d7),
    .x14_imag(out3_imag_d7),
    .x15_real(out3_real_d15),
    .x15_imag(out3_imag_d15),
    
    .rot_factor_real_d0(rotation_factor_real[0]),
    .rot_factor_imag_d0(rotation_factor_imag[0]),	
    .rot_factor_real_d1(rotation_factor_real[1]),
    .rot_factor_imag_d1(rotation_factor_imag[1]),	
    .rot_factor_real_d2(rotation_factor_real[2]),
    .rot_factor_imag_d2(rotation_factor_imag[2]),	
    .rot_factor_real_d3(rotation_factor_real[3]),
    .rot_factor_imag_d3(rotation_factor_imag[3]),	
    .rot_factor_real_d4(rotation_factor_real[4]),
    .rot_factor_imag_d4(rotation_factor_imag[4]),	
    .rot_factor_real_d5(rotation_factor_real[5]),
    .rot_factor_imag_d5(rotation_factor_imag[5]),	
    .rot_factor_real_d6(rotation_factor_real[6]),
    .rot_factor_imag_d6(rotation_factor_imag[6]),	
    .rot_factor_real_d7(rotation_factor_real[7]),
    .rot_factor_imag_d7(rotation_factor_imag[7]),	
    
    .butterfly_out0_real(fft_out0_real),
    .butterfly_out0_imag(fft_out0_imag),
    .butterfly_out1_real(fft_out8_real),
    .butterfly_out1_imag(fft_out8_imag),
    .butterfly_out2_real(fft_out1_real),
    .butterfly_out2_imag(fft_out1_imag),
    .butterfly_out3_real(fft_out9_real),
    .butterfly_out3_imag(fft_out9_imag),
    .butterfly_out4_real(fft_out2_real),
    .butterfly_out4_imag(fft_out2_imag),
    .butterfly_out5_real(fft_out10_real),
    .butterfly_out5_imag(fft_out10_imag),
    .butterfly_out6_real(fft_out3_real),
    .butterfly_out6_imag(fft_out3_imag),
    .butterfly_out7_real(fft_out11_real),
    .butterfly_out7_imag(fft_out11_imag),
    .butterfly_out8_real(fft_out4_real),
    .butterfly_out8_imag(fft_out4_imag),
    .butterfly_out9_real(fft_out12_real),
    .butterfly_out9_imag(fft_out12_imag),
    .butterfly_out10_real(fft_out5_real),
    .butterfly_out10_imag(fft_out5_imag),
    .butterfly_out11_real(fft_out13_real),
    .butterfly_out11_imag(fft_out13_imag),
    .butterfly_out12_real(fft_out6_real),
    .butterfly_out12_imag(fft_out6_imag),
    .butterfly_out13_real(fft_out14_real),
    .butterfly_out13_imag(fft_out14_imag),
    .butterfly_out14_real(fft_out7_real),
    .butterfly_out14_imag(fft_out7_imag),
    .butterfly_out15_real(fft_out15_real),
    .butterfly_out15_imag(fft_out15_imag),
    .rdy_load_out(rdy_load4)
);


assign fft_out0 = {fft_out0_real[19:4],fft_out0_imag[19:4]};
assign fft_out1 = {fft_out1_real[19:4],fft_out1_imag[19:4]};
assign fft_out2 = {fft_out2_real[19:4],fft_out2_imag[19:4]};
assign fft_out3 = {fft_out3_real[19:4],fft_out3_imag[19:4]};
assign fft_out4 = {fft_out4_real[19:4],fft_out4_imag[19:4]};
assign fft_out5 = {fft_out5_real[19:4],fft_out5_imag[19:4]};
assign fft_out6 = {fft_out6_real[19:4],fft_out6_imag[19:4]};
assign fft_out7 = {fft_out7_real[19:4],fft_out7_imag[19:4]};
assign fft_out8 = {fft_out8_real[19:4],fft_out8_imag[19:4]};
assign fft_out9 = {fft_out9_real[19:4],fft_out9_imag[19:4]};
assign fft_out10= {fft_out10_real[19:4],fft_out10_imag[19:4]};
assign fft_out11= {fft_out11_real[19:4],fft_out11_imag[19:4]};
assign fft_out12= {fft_out12_real[19:4],fft_out12_imag[19:4]};
assign fft_out13= {fft_out13_real[19:4],fft_out13_imag[19:4]};
assign fft_out14= {fft_out14_real[19:4],fft_out14_imag[19:4]};
assign fft_out15= {fft_out15_real[19:4],fft_out15_imag[19:4]};
assign xin0 = {x0_real[19:4],x0_imag[19:4]};
assign xin1 = {x1_real[19:4],x1_imag[19:4]};
assign xin2 = {x2_real[19:4],x2_imag[19:4]};
assign xin3 = {x3_real[19:4],x3_imag[19:4]};
assign xin4 = {x4_real[19:4],x4_imag[19:4]};
assign xin5 = {x5_real[19:4],x5_imag[19:4]};
assign xin6 = {x6_real[19:4],x6_imag[19:4]};
assign xin7 = {x7_real[19:4],x7_imag[19:4]};
assign xin8 = {x8_real[19:4],x8_imag[19:4]};
assign xin9 = {x9_real[19:4],x9_imag[19:4]};
assign xin10= {x10_real[19:4],x10_imag[19:4]};
assign xin11= {x11_real[19:4],x11_imag[19:4]};
assign xin12= {x12_real[19:4],x12_imag[19:4]};
assign xin13= {x13_real[19:4],x13_imag[19:4]};
assign xin14= {x14_real[19:4],x14_imag[19:4]};
assign xin15= {x15_real[19:4],x15_imag[19:4]};


ila_0 your_instance_name (
	.clk(clk), // input wire clk
    .probe0 (fft_out0 ), // input wire [31:0]  probe0  
	.probe1 (fft_out1 ), // input wire [31:0]  probe1 
	.probe2 (fft_out2 ), // input wire [31:0]  probe2 
	.probe3 (fft_out3 ), // input wire [31:0]  probe3 
	.probe4 (fft_out4 ), // input wire [31:0]  probe4 
	.probe5 (fft_out5 ), // input wire [31:0]  probe5 
	.probe6 (fft_out6 ), // input wire [31:0]  probe6 
	.probe7 (fft_out7 ), // input wire [31:0]  probe7 
	.probe8 (fft_out8 ), // input wire [31:0]  probe8 
	.probe9 (fft_out9 ), // input wire [31:0]  probe9 
	.probe10(fft_out10), // input wire [31:0]  probe10 
	.probe11(fft_out11), // input wire [31:0]  probe11 
	.probe12(fft_out12), // input wire [31:0]  probe12 
	.probe13(fft_out13), // input wire [31:0]  probe13 
	.probe14(fft_out14), // input wire [31:0]  probe14 
	.probe15(fft_out15), // input wire [31:0]  probe15 
	.probe16(xin0 ), // input wire [31:0]  probe16 
	.probe17(xin1 ), // input wire [31:0]  probe17 
	.probe18(xin2 ), // input wire [31:0]  probe18 
	.probe19(xin3 ), // input wire [31:0]  probe19 
	.probe20(xin4 ), // input wire [31:0]  probe20 
	.probe21(xin5 ), // input wire [31:0]  probe21 
	.probe22(xin6 ), // input wire [31:0]  probe22 
	.probe23(xin7 ), // input wire [31:0]  probe23 
	.probe24(xin8 ), // input wire [31:0]  probe24 
	.probe25(xin9 ), // input wire [31:0]  probe25 
	.probe26(xin10), // input wire [31:0]  probe26 
	.probe27(xin11), // input wire [31:0]  probe27 
	.probe28(xin12), // input wire [31:0]  probe28 
	.probe29(xin13), // input wire [31:0]  probe29 
	.probe30(xin14), // input wire [31:0]  probe30 
	.probe31(xin15), // input wire [31:0]  probe31 
	.probe32(rdy_load),
	.probe33(rdy_load5)
//	.probe0(fft_out0_real[31:0]), // input wire [31:0]  probe0  
//	.probe1(fft_out0_imag[31:0]), // input wire [31:0]  probe1 
//	.probe2(fft_out1_real[31:0]), // input wire [31:0]  probe2 
//	.probe3(fft_out1_imag[31:0]), // input wire [31:0]  probe3 
//	.probe4(fft_out2_real[31:0]), // input wire [31:0]  probe4 
//	.probe5(fft_out2_imag[31:0]), // input wire [31:0]  probe5 
//	.probe6(fft_out3_real[31:0]), // input wire [31:0]  probe6 
//	.probe7(fft_out3_imag[31:0]), // input wire [31:0]  probe7 
//	.probe8(fft_out4_real[31:0]), // input wire [31:0]  probe8 
//	.probe9(fft_out4_imag[31:0]), // input wire [31:0]  probe9 
//	.probe10(fft_out5_real[31:0]), // input wire [31:0]  probe10 
//	.probe11(fft_out5_imag[31:0]), // input wire [31:0]  probe11 
//	.probe12(fft_out6_real[31:0]), // input wire [31:0]  probe12 
//	.probe13(fft_out6_imag[31:0]), // input wire [31:0]  probe13 
//	.probe14(fft_out7_real[31:0]), // input wire [31:0]  probe14 
//	.probe15(fft_out7_imag[31:0]), // input wire [31:0]  probe15 
//	.probe16(fft_out8_real[31:0]), // input wire [31:0]  probe16 
//	.probe17(fft_out8_imag[31:0]), // input wire [31:0]  probe17 
//	.probe18(fft_out9_real[31:0]), // input wire [31:0]  probe18 
//	.probe19(fft_out9_imag[31:0]), // input wire [31:0]  probe19 
//	.probe20(fft_out10_real[31:0]), // input wire [31:0]  probe20 
//	.probe21(fft_out10_imag[31:0]), // input wire [31:0]  probe21 
//	.probe22(fft_out11_real[31:0]), // input wire [31:0]  probe22 
//	.probe23(fft_out11_imag[31:0]), // input wire [31:0]  probe23 
//	.probe24(fft_out12_real[31:0]), // input wire [31:0]  probe24 
//	.probe25(fft_out12_imag[31:0]), // input wire [31:0]  probe25 
//	.probe26(fft_out13_real[31:0]), // input wire [31:0]  probe26 
//	.probe27(fft_out13_imag[31:0]), // input wire [31:0]  probe27 
//	.probe28(fft_out14_real[31:0]), // input wire [31:0]  probe28 
//	.probe29(fft_out14_imag[31:0]), // input wire [31:0]  probe29 
//	.probe30(fft_out15_real[31:0]), // input wire [31:0]  probe30 
//	.probe31(fft_out15_imag[31:0]) // input wire [31:0]  probe31 
//	.probe32(x0_real[31:0]), // input wire [31:0]  probe0  
//	.probe33(x0_imag[31:0]), // input wire [31:0]  probe1 
//	.probe34(x1_real[31:0]), // input wire [31:0]  probe2 
//	.probe35(x1_imag[31:0]), // input wire [31:0]  probe3 
//	.probe36(x2_real[31:0]), // input wire [31:0]  probe4 
//	.probe37(x2_imag[31:0]), // input wire [31:0]  probe5 
//	.probe38(x3_real[31:0]), // input wire [31:0]  probe6 
//	.probe39(x3_imag[31:0]), // input wire [31:0]  probe7 
//	.probe40(x4_real[31:0]), // input wire [31:0]  probe8 
//	.probe41(x4_imag[31:0]), // input wire [31:0]  probe9 
//	.probe42(x5_real[31:0]), // input wire [31:0]  probe10 
//	.probe43(x5_imag[31:0]), // input wire [31:0]  probe11 
//	.probe44(x6_real[31:0]), // input wire [31:0]  probe12 
//	.probe45(x6_imag[31:0]), // input wire [31:0]  probe13 
//	.probe46(x7_real[31:0]), // input wire [31:0]  probe14 
//	.probe47(x7_imag[31:0]), // input wire [31:0]  probe15 
//	.probe48(x8_real[31:0]), // input wire [31:0]  probe16 
//	.probe49(x8_imag[31:0]), // input wire [31:0]  probe17 
//	.probe50(x9_real[31:0]), // input wire [31:0]  probe18 
//	.probe51(x9_imag[31:0]), // input wire [31:0]  probe19 
//	.probe52(x10_real[31:0]), // input wire [31:0]  probe20 
//	.probe53(x10_imag[31:0]), // input wire [31:0]  probe21 
//	.probe54(x11_real[31:0]), // input wire [31:0]  probe22 
//	.probe55(x11_imag[31:0]), // input wire [31:0]  probe23 
//	.probe56(x12_real[31:0]), // input wire [31:0]  probe24 
//	.probe57(x12_imag[31:0]), // input wire [31:0]  probe25 
//	.probe58(x13_real[31:0]), // input wire [31:0]  probe26 
//	.probe59(x13_imag[31:0]), // input wire [31:0]  probe27 
//	.probe60(x14_real[31:0]), // input wire [31:0]  probe28 
//	.probe61(x14_imag[31:0]), // input wire [31:0]  probe29 
//	.probe62(x15_real[31:0]), // input wire [31:0]  probe30 
//	.probe63(x15_imag[31:0]) // input wire [31:0]  probe31 
//	.probe32(clk) // input wire [0:0]  probe32
);

 always @(posedge clk) begin

            if(~rst) 
                led_temp[0]<=0;
            else begin
                rdy_load5 = rdy_load4;
              if(rdy_load == 1)begin
                rdy_load5 <=0;
                end
                if(fft_out0_real==32'h00031dc0) led_temp[0]<=1;
                else led_temp[0]<=0;
                if(rdy_load5==1) led_temp[1]<=1;
                else led_temp[1]<=0;
                if(rdy_load==1) led_temp[2]<=1;
                else led_temp[2]<=0;
            end
        end

endmodule
