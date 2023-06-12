`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/05/23 11:19:48
// Design Name: 
// Module Name: load
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


module loads_data(
    input enable,
    input clk,
    input reset_n,
    output [31:0]x0,
    output [31:0]x1,
    output [31:0]x2,
    output [31:0]x3,
    output [31:0]x4,
    output [31:0]x5,
    output [31:0]x6,
    output [31:0]x7,
    output [31:0]x8,
    output [31:0]x9,
    output [31:0]x10,
    output [31:0]x11,
    output [31:0]x12,
    output [31:0]x13,
    output [31:0]x14,
    output [31:0]x15,
    output [31:0]x0_i,
    output [31:0]x1_i,
    output [31:0]x2_i,
    output [31:0]x3_i,
    output [31:0]x4_i,
    output [31:0]x5_i,
    output [31:0]x6_i,
    output [31:0]x7_i,
    output [31:0]x8_i,
    output [31:0]x9_i,
    output [31:0]x10_i,
    output [31:0]x11_i,
    output [31:0]x12_i,
    output [31:0]x13_i,
    output [31:0]x14_i,
    output [31:0]x15_i,
    output reg rdy_load
);
    wire [31:0]x_0;
    wire [31:0]x_1;
    wire [31:0]x_2;
    wire [31:0]x_3;
    wire [31:0]x_4;
    wire [31:0]x_5;
    wire [31:0]x_6;
    wire [31:0]x_7;
    wire [31:0]x_8;
    wire [31:0]x_9;
    wire [31:0]x_10;
    wire [31:0]x_11;
    wire [31:0]x_12;
    wire [31:0]x_13;
    wire [31:0]x_14;
    wire [31:0]x_15;


   reg [511:0] x_all = 0;
   integer i=0;
   integer j;
   integer k;
   reg [4:0]rom_addr=0;
   wire [31:0]rom_data;
   reg [1:0]state = 0;

   //下边的IP输入地址与输出数据有一个时钟的延迟
   blk_mem_gen_0 rom_in (
   .clka(clk),// input wire elka 
   .ena(enable), // input vire ena
   .addra(rom_addr), // input wire [2: 0] addra 
   .douta(rom_data) //output wire [15:0] douta 
   );
   //采用两个状态来判断使能信号,采用两个循环采集储存器中数据
    always@(posedge clk or negedge reset_n)
    begin
        if(!reset_n)
            rom_addr<=5'd0;
        else begin

                 rdy_load=0;
                 for(j=0;j<32;j=j+1) begin
                     k = i+j-64;
                     if(k<0)
                         k = k + 512;
                     x_all[k]=rom_data[j];
                 end
                 i=i+32;
                 rom_addr= rom_addr+5'b00001;
                 if(i==512)begin
                     i=0;
                     k=0;
                     state=0;
                     rdy_load=1;
                 end
            
        end
     end
   assign x_0[31:0]=x_all[31:0];
   assign x_1[31:0]=x_all[63:32];
   assign x_2[31:0]=x_all[95:64];
   assign x_3[31:0]=x_all[127:96];
   assign x_4[31:0]=x_all[159:128];
   assign x_5[31:0]=x_all[191:160];
   assign x_6[31:0]=x_all[223:192];
   assign x_7[31:0]=x_all[255:224];
   assign x_8[31:0]=x_all[287:256];
   assign x_9[31:0]=x_all[319:288];
   assign x_10[31:0]=x_all[351:320];
   assign x_11[31:0]=x_all[383:352];
   assign x_12[31:0]=x_all[415:384];
   assign x_13[31:0]=x_all[447:416];
   assign x_14[31:0]=x_all[479:448];
   assign x_15[31:0]=x_all[511:480];
   

 assign x0  = x_0[15] ? {12'b111111111111, x_0[15:0], 4'b0} : {12'b0, x_0[15:0], 4'b0};
 assign x1  = x_1[15] ? {12'b111111111111, x_1[15:0], 4'b0} : {12'b0, x_1[15:0], 4'b0};
 assign x2  = x_2[15] ? {12'b111111111111, x_2[15:0], 4'b0} : {12'b0, x_2[15:0], 4'b0};
 assign x3  = x_3[15] ? {12'b111111111111, x_3[15:0], 4'b0} : {12'b0, x_3[15:0], 4'b0};
 assign x4  = x_4[15] ? {12'b111111111111, x_4[15:0], 4'b0} : {12'b0, x_4[15:0], 4'b0};
 assign x5  = x_5[15] ? {12'b111111111111, x_5[15:0], 4'b0} : {12'b0, x_5[15:0], 4'b0};
 assign x6  = x_6[14] ? {12'b111111111111, x_6[15:0], 4'b0} : {12'b0, x_6[15:0], 4'b0};
 assign x7  = x_7[15] ? {12'b111111111111, x_7[15:0], 4'b0} : {12'b0, x_7[15:0], 4'b0};
 assign x8  = x_8[15] ? {12'b111111111111, x_8[15:0], 4'b0} : {12'b0, x_8[15:0], 4'b0};
 assign x9  = x_9[15] ? {12'b111111111111, x_9[15:0], 4'b0} : {12'b0, x_9[15:0], 4'b0};
 assign x10 = x_10[15] ? {12'b111111111111, x_10[15:0], 4'b0} : {12'b0, x_10[15:0], 4'b0};
 assign x11 = x_11[15] ? {12'b111111111111, x_11[15:0], 4'b0} : {12'b0, x_11[15:0], 4'b0};
 assign x12 = x_12[15] ? {12'b111111111111, x_12[15:0], 4'b0} : {12'b0, x_12[15:0], 4'b0};
 assign x13 = x_13[15] ? {12'b111111111111, x_13[15:0], 4'b0} : {12'b0, x_13[15:0], 4'b0};
 assign x14 = x_14[15] ? {12'b111111111111, x_14[15:0], 4'b0} : {12'b0, x_14[15:0], 4'b0};
 assign x15 = x_15[15] ? {12'b111111111111, x_15[15:0], 4'b0} : {12'b0, x_15[15:0], 4'b0};
 assign x0_i  = x_0[31] ? {12'b111111111111, x_0[31:16], 4'b0} : {12'b0, x_0[31:16], 4'b0};
 assign x1_i  = x_1[31] ? {12'b111111111111, x_1[31:16], 4'b0} : {12'b0, x_1[31:16], 4'b0};
 assign x2_i  = x_2[31] ? {12'b111111111111, x_2[31:16], 4'b0} : {12'b0, x_2[31:16], 4'b0};
 assign x3_i  = x_3[31] ? {12'b111111111111, x_3[31:16], 4'b0} : {12'b0, x_3[31:16], 4'b0};
 assign x4_i  = x_4[31] ? {12'b111111111111, x_4[31:16], 4'b0} : {12'b0, x_4[31:16], 4'b0};
 assign x5_i  = x_5[31] ? {12'b111111111111, x_5[31:16], 4'b0} : {12'b0, x_5[31:16], 4'b0};
 assign x6_i  = x_6[31] ? {12'b111111111111, x_6[31:16], 4'b0} : {12'b0, x_6[31:16], 4'b0};
 assign x7_i  = x_7[31] ? {12'b111111111111, x_7[31:16], 4'b0} : {12'b0, x_7[31:16], 4'b0};
 assign x8_i  = x_8[31] ? {12'b111111111111, x_8[31:16], 4'b0} : {12'b0, x_8[31:16], 4'b0};
 assign x9_i  = x_9[31] ? {12'b111111111111, x_9[31:16], 4'b0} : {12'b0, x_9[31:16], 4'b0};
 assign x10_i = x_10[31] ? {12'b111111111111, x_10[31:16], 4'b0} : {12'b0, x_10[31:16], 4'b0};
 assign x11_i = x_11[31] ? {12'b111111111111, x_11[31:16], 4'b0} : {12'b0, x_11[31:16], 4'b0};
 assign x12_i = x_12[31] ? {12'b111111111111, x_12[31:16], 4'b0} : {12'b0, x_12[31:16], 4'b0};
 assign x13_i = x_13[31] ? {12'b111111111111, x_13[31:16], 4'b0} : {12'b0, x_13[31:16], 4'b0};
 assign x14_i = x_14[31] ? {12'b111111111111, x_14[31:16], 4'b0} : {12'b0, x_14[31:16], 4'b0};
 assign x15_i = x_15[31] ? {12'b111111111111, x_15[31:16], 4'b0} : {12'b0, x_15[31:16], 4'b0};
endmodule
