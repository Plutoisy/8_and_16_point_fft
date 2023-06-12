module butterfly_8point(

	input 						clk,
	input 						rst,

	//ĳһ�������ź� (ǰ�������������������)
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
	
	//��ת����
	input			[31:0]		rot_factor_real_d0,
	input			[31:0]		rot_factor_imag_d0,	
	input			[31:0]		rot_factor_real_d1,
	input			[31:0]		rot_factor_imag_d1,	
	input			[31:0]		rot_factor_real_d2,
	input			[31:0]		rot_factor_imag_d2,	
	input			[31:0]		rot_factor_real_d3,
	input			[31:0]		rot_factor_imag_d3,	
	
	//ĳһ������ź�
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
	output reg		[31:0]		butterfly_out7_imag

);

	//ÿһ�����������
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

/*
	8��ĵ�������ÿһ��ʵ������4�������������
	����ʵ������4��ģ����Ƕ�Ӧ4������������㣬
	Ϊ����ˮ����ƣ����üĴ��������always�������ˮ�߼Ĵ���
*/
	
	butterfly_2point butterfly_2point_d0(
        .clk						(clk),
	    .rst						(rst),		
		.a_real							(x0_real),
		.a_imag							(x0_imag),
		.b_real							(x1_real),
		.b_imag							(x1_imag),
		.rotation_factor_real			(rot_factor_real_d0),
		.rotation_factor_imag			(rot_factor_imag_d0),
		
		.out_real_add					(out_real_d0),
		.out_imag_add					(out_imag_d0),
		.out_real_sub					(out_real_d1),
		.out_imag_sub					(out_imag_d1)
	
	);
	
	butterfly_2point butterfly_2point_d1(
        .clk						(clk),
	    .rst						(rst),			
		.a_real							(x2_real),
		.a_imag							(x2_imag),
		.b_real							(x3_real),
		.b_imag							(x3_imag),
		.rotation_factor_real			(rot_factor_real_d1),
		.rotation_factor_imag			(rot_factor_imag_d1),
		
		.out_real_add					(out_real_d2),
		.out_imag_add					(out_imag_d2),
		.out_real_sub					(out_real_d3),
		.out_imag_sub					(out_imag_d3)
	
	);

	butterfly_2point butterfly_2point_d2(
        .clk						(clk),
	    .rst						(rst),			
		.a_real							(x4_real),
		.a_imag							(x4_imag),
		.b_real							(x5_real),
		.b_imag							(x5_imag),
		.rotation_factor_real			(rot_factor_real_d2),
		.rotation_factor_imag			(rot_factor_imag_d2),
		
		.out_real_add					(out_real_d4),
		.out_imag_add					(out_imag_d4),
		.out_real_sub					(out_real_d5),
		.out_imag_sub					(out_imag_d5)
	
	);
	
	butterfly_2point butterfly_2point_d3(
        .clk						(clk),
	    .rst						(rst),			
		.a_real							(x6_real),
		.a_imag							(x6_imag),
		.b_real							(x7_real),
		.b_imag							(x7_imag),
		.rotation_factor_real			(rot_factor_real_d3),
		.rotation_factor_imag			(rot_factor_imag_d3),
		
		.out_real_add					(out_real_d6),
		.out_imag_add					(out_imag_d6),
		.out_real_sub					(out_real_d7),
		.out_imag_sub					(out_imag_d7)
	
	);
	
	
	
	//�Ĵ����洢��������ˮ��
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
		end
	end
	
	
	
endmodule
