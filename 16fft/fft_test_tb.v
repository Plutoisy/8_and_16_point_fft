`timescale 1 ns/ 1 ps
module fft_test_tb;

reg [31:0]i;

reg clk,rst;

reg			[31:0]		x0_real;
reg			[31:0]		x0_imag;
reg			[31:0]		x1_real;
reg			[31:0]		x1_imag;
reg			[31:0]		x2_real;
reg			[31:0]		x2_imag;
reg			[31:0]		x3_real;
reg			[31:0]		x3_imag;
reg			[31:0]		x4_real;
reg			[31:0]		x4_imag;
reg			[31:0]		x5_real;
reg			[31:0]		x5_imag;
reg			[31:0]		x6_real;
reg			[31:0]		x6_imag;
reg			[31:0]		x7_real;
reg			[31:0]		x7_imag;

wire 		[31:0]		fft_out0_real;
wire 		[31:0]		fft_out0_imag;
wire 		[31:0]		fft_out1_real;
wire 		[31:0]		fft_out1_imag;
wire 		[31:0]		fft_out2_real;
wire 		[31:0]		fft_out2_imag;
wire 		[31:0]		fft_out3_real;
wire 		[31:0]		fft_out3_imag;
wire 		[31:0]		fft_out4_real;
wire 		[31:0]		fft_out4_imag;
wire 		[31:0]		fft_out5_real;
wire 		[31:0]		fft_out5_imag;
wire 		[31:0]		fft_out6_real;
wire 		[31:0]		fft_out6_imag;
wire 		[31:0]		fft_out7_real;
wire 		[31:0]		fft_out7_imag;
wire 		[31:0]		fft_out8_real;
wire 		[31:0]		fft_out8_imag;
wire 		[31:0]		fft_out9_real;
wire 		[31:0]		fft_out9_imag;
wire 		[31:0]		fft_out10_real;
wire 		[31:0]		fft_out10_imag;
wire 		[31:0]		fft_out11_real;
wire 		[31:0]		fft_out11_imag;
wire 		[31:0]		fft_out12_real;
wire 		[31:0]		fft_out12_imag;
wire 		[31:0]		fft_out13_real;
wire 		[31:0]		fft_out13_imag;
wire 		[31:0]		fft_out14_real;
wire 		[31:0]		fft_out14_imag;
wire 		[31:0]		fft_out15_real;
wire 		[31:0]		fft_out15_imag;



fft_top fft_top_test(

	.clk				(clk),
	.rst				(rst),

//	.x0_real			(x0_real),
//	.x0_imag			(x0_imag),
//	.x1_real			(x1_real),
//	.x1_imag			(x1_imag),
//	.x2_real			(x2_real),
//	.x2_imag			(x2_imag),
//	.x3_real			(x3_real),
//	.x3_imag			(x3_imag),
//	.x4_real			(x4_real),
//	.x4_imag			(x4_imag),
//	.x5_real			(x5_real),
//	.x5_imag			(x5_imag),
//	.x6_real			(x6_real),
//	.x6_imag			(x6_imag),
//	.x7_real			(x7_real),
//	.x7_imag			(x7_imag),

	.fft_out0_real		(fft_out0_real),
	.fft_out0_imag		(fft_out0_imag),
	.fft_out1_real		(fft_out1_real),
	.fft_out1_imag		(fft_out1_imag),
	.fft_out2_real		(fft_out2_real),
	.fft_out2_imag		(fft_out2_imag),
	.fft_out3_real		(fft_out3_real),
	.fft_out3_imag		(fft_out3_imag),
	.fft_out4_real		(fft_out4_real),
	.fft_out4_imag		(fft_out4_imag),
	.fft_out5_real		(fft_out5_real),
	.fft_out5_imag		(fft_out5_imag),
	.fft_out6_real		(fft_out6_real),
	.fft_out6_imag		(fft_out6_imag),
	.fft_out7_real		(fft_out7_real),
	.fft_out7_imag		(fft_out7_imag),
	.fft_out8_real      (fft_out8_real),
	.fft_out8_imag      (fft_out8_imag),
	.fft_out9_real(fft_out9_real),
	.fft_out9_imag(fft_out9_imag),
	.fft_out10_real(fft_out10_real),
	.fft_out10_imag(fft_out10_imag),
	.fft_out11_real(fft_out11_real),
	.fft_out11_imag(fft_out11_imag),
	.fft_out12_real(fft_out12_real),
	.fft_out12_imag(fft_out12_imag),
	.fft_out13_real(fft_out13_real),
	.fft_out13_imag(fft_out13_imag),
	.fft_out14_real(fft_out14_real),
	.fft_out14_imag(fft_out14_imag),
	.fft_out15_real(fft_out15_real),
	.fft_out15_imag(fft_out15_imag)

);
	
initial clk=1;
always#10 clk=~clk;
	
initial begin
    rst=0;
    x0_real =  {16'd1,16'b0};
	x0_imag =  32'd0;
	x1_real =  {16'd2,16'b0};
	x1_imag =  32'd0;
	x2_real =  {16'd3,16'b0};
	x2_imag =  32'd0;
	x3_real =  {16'd4,16'b0};
	x3_imag =  32'd0;
	x4_real =  {16'd5,16'b0};
	x4_imag =  32'd0;
	x5_real =  {16'd6,16'b0};
	x5_imag =  32'd0;
	x6_real =  {16'd7,16'b0};
	x6_imag =  32'd0;
	x7_real =  {16'd8,16'b0};
	x7_imag =  32'd0;
    #201;
    rst=1;
    #100001;


//	for(i=0;i<32'd400;i=i+1) begin
//		@(posedge clk);
//		x0_real =  x0_real +32'd0    ;
//		x0_imag =  x0_imag +32'd0    ;
//		x1_real =  x1_real +32'd0    ;
//		x1_imag =  x1_imag +32'd0    ;
//		x2_real =  x2_real +32'd0   ;
//		x2_imag =  x2_imag +32'd0    ;
//		x3_real =  x3_real +32'd0    ;
//		x3_imag =  x3_imag +32'd0    ;
//		x4_real =  x4_real +32'd0   ;
//		x4_imag =  x4_imag +32'd0   ;
//		x5_real =  x5_real +32'd0   ;
//		x5_imag =  x5_imag +32'd0    ;
//		x6_real =  x6_real +32'd0   ;
//		x6_imag =  x6_imag +32'd0    ;
//		x7_real =  x7_real +32'd0    ;
//		x7_imag =  x7_imag +32'd0    ;


//	end
	
	$stop;
end


endmodule
