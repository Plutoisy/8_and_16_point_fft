module butterfly_2point(
	input 						clk,
	input 						rst,
	input 	[31:0]		a_real,
	input 	[31:0]		a_imag,
	input 	[31:0]		b_real,
	input 	[31:0]		b_imag,
	input	[31:0]		rotation_factor_real,
	input	[31:0]		rotation_factor_imag,
	
	output	[31:0]		out_real_add,
	output	[31:0]		out_imag_add,
	output	[31:0]		out_real_sub,
	output	[31:0]		out_imag_sub


);

	//��������м�ֵ
	wire [63:0]out_real_r1;
	wire [63:0]out_imag_r1;
	
	wire [63:0]out_real_r2;
	wire [63:0]out_imag_r2;
	wire [63:0]out_real_r3;
	wire [63:0]out_imag_r3;
	
	wire [63:0]a_real_r1;
	wire [63:0]a_imag_r1;
	

    //���������������ǰ��1��0������ǰ�󶼲���
	assign a_real_r1 = a_real[31] ? {16'b1, a_real[31:0], 16'b0} : {16'b0, a_real[31:0], 16'b0};
	
	assign a_imag_r1 = a_imag[31] ? {16'b1, a_imag[31:0], 16'b0} : {16'b0, a_imag[31:0], 16'b0};
	
	//������ת�������
	complex_mult complex_mult_d0(
        .clk						(clk),
	    .rst						(rst),	
		.a_real			(b_real),
		.a_imag			(b_imag),
		.b_real			(rotation_factor_real),
		.b_imag			(rotation_factor_imag),

		.out_real		(out_real_r1),
		.out_imag      	(out_imag_r1)

	);
	
	//�ӵõ���һ��ֵ
	complex_add complex_add_d0(
		.a_real			(a_real_r1  ),
		.a_imag			(a_imag_r1  ),
		.b_real			(out_real_r1),
		.b_imag			(out_imag_r1),

		.out_real		(out_real_r2),
		.out_imag       (out_imag_r2)
	);
	
	//���õ�һ�°�ֵ
	complex_sub complex_sub_d0(
		.a_real			(a_real_r1	),
		.a_imag			(a_imag_r1	),
		.b_real			(out_real_r1),
		.b_imag			(out_imag_r1),

		.out_real		(out_real_r3),
		.out_imag       (out_imag_r3)
	);
	
	
	//ȡ�м�ض����ݣ�������һ��Ҫ��
	assign out_real_add=out_real_r2[47:16];
	assign out_imag_add=out_imag_r2[47:16];
	assign out_real_sub=out_real_r3[47:16];
	assign out_imag_sub=out_imag_r3[47:16];
	

endmodule