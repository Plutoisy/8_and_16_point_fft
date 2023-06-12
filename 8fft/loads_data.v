`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/05/18 06:37:11
// Design Name: 
// Module Name: loads_data
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
//给一个脉冲触发enable信号，即可将rom存储器内数据传输到八个输出口，同时rdy_load端口产生一个脉冲
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
    output reg rdy_load
);
   wire [15:0]input_1;
   wire [15:0]input_2;
   wire [15:0]input_3;
   wire [15:0]input_4;
   wire [15:0]input_5;
   wire [15:0]input_6;
   wire [15:0]input_7;
   wire [15:0]input_8;

   reg [127:0]input_all;
   integer i=0;
   integer j;
   integer k;
   reg [2:0]addra=3'b0;
   wire [15:0]douta;
   //下边的IP输入地址与输出数据有一个时钟的延迟
   blk_mem_gen_2 rom_in (
   .clka(clk),// input wire elka 
   .ena(enable), // input vire ena
   .addra(addra), // input wire [2: 0] addra 
   .douta(douta) //output wire [15:0] douta 
   );
   //采用两个状态来判断使能信号,采用两个循环采集储存器中数据
   always@(posedge clk)begin 
             if(!reset_n)
                addra<=3'b000;
             else begin
                      rdy_load=0;
                      for(j=0;j<16;j=j+1) begin
                          k = i+j-32;
                          if(k<0)
                              k = k + 128;
                          input_all[k]=douta[j];
                      end
                      i=i+16;
                          addra= addra+3'b001;
                      if(i==128)begin
                          i=0;
                          k=0;
                          rdy_load=1;
//         if(enable)
//           state<=1;
//                case(state)
//                   0:begin
//                       addra<=3'b000;
//                       i<=0;
//                       rdy_load<=0;
//                   end
//                   1:begin
//                        for(j=0;j<16;j=j+1)
//                           input_all[i+j-32]=douta[j];//因为IP有延迟，选择延迟两个周期赋值
//                        i=i+16;
//                        addra=addra+3'b001;
//                        if(i==160)begin
//                            state<=0;
//                            rdy_load<=1;
//                        end
                   end
             end
   end
   assign input_1[15:0]=input_all[15:0];
   assign input_2[15:0]=input_all[31:16];
   assign input_3[15:0]=input_all[47:32];
   assign input_4[15:0]=input_all[63:48];
   assign input_5[15:0]=input_all[79:64];
   assign input_6[15:0]=input_all[95:80];
   assign input_7[15:0]=input_all[111:96];
   assign input_8[15:0]=input_all[127:112];

   assign x0={16'b0,input_1[7:0],8'b0};
   assign x1={16'b0,input_2[7:0],8'b0};
   assign x2={16'b0,input_3[7:0],8'b0};
   assign x3={16'b0,input_4[7:0],8'b0};
   assign x4={16'b0,input_5[7:0],8'b0};
   assign x5={16'b0,input_6[7:0],8'b0};
   assign x6={16'b0,input_7[7:0],8'b0};
   assign x7={16'b0,input_8[7:0],8'b0};

endmodule

///*//module loads_data(
////     input enable,
////     input clk,
////     input reset_n,
////     output [15:0]input_1,
////     output [15:0]input_2,
////     output [15:0]input_3,
////     output [15:0]input_4,
////     output [15:0]input_5,
////     output [15:0]input_6,
////     output [15:0]input_7,
////     output [15:0]input_8,
////     output rdy_load
////);

////    reg [127:0]input_all;
////    integer i;
////    integer j;
////    reg [2:0]addra;
////    wire [15:0]douta;
////    reg [1:0]state;
////    blk_mem_gen_0 rom_in (
////    .clka(clk),// input wire elka 
////    .ena(enable), // input vire ena
////    .addra(addra), // input wire [2: 0] addra 
////    .douta(douta) //output wire [15:0] douta 
////    );
////    //采用两个状态来判断使能信号,采用两个循环采集储存器中数据
////    always@(posedge clk or negedge reset_n or posedge enable)begin 
////    if(!reset_n)begin
////        input_all<=0;
////        state<=0;
////    end
////    else if(enable)
////        state<=1;

////    case(state)
////        0:begin
////            addra<=3'b000;
////        end
////        1:begin
////            for(i=0;i<128;i=i+16)begin
////                addra<=addra+1'b0;
////                for(j=0;j<16;j=j+1)
////                input_all[i+j]=douta[j];
////            end
////            if(i==128&&addra==3'b111)
////                state<=0;
////        end
////    endcase
////    end
////    assign input_1[15:0]=input_all[15:0];
////    assign input_2[15:0]=input_all[31:16];
////    assign input_3[15:0]=input_all[47:32];
////    assign input_4[15:0]=input_all[63:48];
////    assign input_5[15:0]=input_all[79:64];
////    assign input_6[15:0]=input_all[95:80];
////    assign input_7[15:0]=input_all[111:96];
////    assign input_8[15:0]=input_all[127:112];
//// endmodule*/