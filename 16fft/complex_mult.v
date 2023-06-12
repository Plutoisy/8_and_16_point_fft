module complex_mult(
	input 						clk,
	input 						rst,
	input 	[31:0]		a_real,
	input 	[31:0]		a_imag,
	input 	[31:0]		b_real,
	input 	[31:0]		b_imag,
	
	output 	[63:0]		out_real,
	output 	[63:0]		out_imag

);

/*
��������˷���Ҫע�⣬������32λ�������64λ�������ǵ�λ������չ���⣬
�����Ҫ�Ѽ�����ת����64λ���Σ�������c����ǿ������ת��
*/

	wire [63:0] out_r1,out_r2,out_i1,out_i2;
Fix32_16mult Fix32_16mult1(
.clk(clk), 
.rst_n(rst),
.a(a_real),
.b(b_real),
.ret(out_r1)

    );
    
Fix32_16mult Fix32_16mult2(
.clk(clk), 
.rst_n(rst),
.a(a_imag),
.b(b_imag),
.ret(out_r2)

    );	
    
Fix32_16mult Fix32_16mult3(
.clk(clk), 
.rst_n(rst),
.a(a_real),
.b(b_imag),
.ret(out_i1)

    );
    
Fix32_16mult Fix32_16mult4(
.clk(clk), 
.rst_n(rst),
.a(a_imag),
.b(b_real),
.ret(out_i2)

    );
//	assign out_r1=a_real*b_real;
//	assign out_r2=a_imag*b_imag;
	
//	assign out_i1=a_real*b_imag;
//	assign out_i2=a_imag*b_real;
	
	assign out_real=out_r1-out_r2;
	assign out_imag=out_i1+out_i2;

endmodule
