`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/05/17 23:56:31
// Design Name: 
// Module Name: buffer_2
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


//两个数的蝴蝶算法
module buffer_2(
    input clk,
    input [31:0]data1,
    input [31:0]data2,
    input enable_1,
    input enable_2,
    input [31:0]w,  
    output [31:0]out1,
    output[31:0]out2,
    output rdy
);
wire [32:0]real_result;
wire [32:0]imag_result;
wire [31:0]middle_result;
wire [79:0]result;

 
cmpy_0 cmpy(
        .aclk(clk),                              // input wire aclk
        .s_axis_a_tvalid(enable_1),        // input wire s_axis_a_tvalid
        .s_axis_a_tdata(data2),        // input wire [31 : 0] s_axis_a_tdata
        .s_axis_b_tvalid(enable_2),        // input wire s_axis_b_tvalid
        .s_axis_b_tdata(w),          // input wire [31 : 0] s_axis_b_tdata
        .m_axis_dout_tvalid(rdy),  // output wire m_axis_dout_tvalid
        .m_axis_dout_tdata(result)    // output wire [79 : 0] m_axis_dout_tdata
      );
assign real_result=result[32:0];
assign imag_result=result[72:40];//取出实部虚部有效信息
//截断12位
assign middle_result[31:16]={imag_result[32],imag_result[15+7:8]};//截断10位并取出16位有效数据
assign middle_result[15:0]={real_result[32],real_result[15+7:8]};
assign out1[31:16]=$signed(data1[31:16])+$signed(middle_result[31:16]);//计算输出
assign out1[15:0]=$signed(data1[15:0])+$signed(middle_result[15:0]);
assign out2[31:16]=$signed(data1[31:16])-$signed(middle_result[31:16]);
assign out2[15:0]=$signed(data1[15:0])-$signed(middle_result[15:0]);


endmodule

