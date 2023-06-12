module complex_add(
	input 	[63:0]		a_real,
	input 	[63:0]		a_imag,
	input 	[63:0]		b_real,
	input 	[63:0]		b_imag,
	
	output	[63:0]		out_real,
	output	[63:0]		out_imag
);

	assign out_real=a_real+b_real;
	assign out_imag=a_imag+b_imag;


endmodule
