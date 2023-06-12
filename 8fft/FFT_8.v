`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/05/17 17:04:04
// Design Name: 
// Module Name: FFT_8
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


module FFT_8(
    input clk,
    input input_pulse,
    input reset_n,
//    output wire [31:0]X7,
//    output wire [31:0]X0,
//    output wire [31:0]X1,
//    output wire [31:0]X2,
//    output wire [31:0]X3,
//    output wire [31:0]X4,
//    output wire [31:0]X5,
//    output wire [31:0]X6,
    output reg success
    );
    wire rdy_load;
    wire [31:0]x0;
    wire [31:0]x1;
    wire [31:0]x2;
    wire [31:0]x3;
    wire [31:0]x4;
    wire [31:0]x5;
    wire [31:0]x6;
    wire [31:0]x7;
    reg [2:0]state;
    wire [31:0]X0;
    wire [31:0]X1;
    wire [31:0]X2;
    wire [31:0]X3;
    wire [31:0]X4;
    wire [31:0]X5;
    wire [31:0]X6;
    wire [31:0]X7;

    wire [31:0]x0_temp1;
    wire[31:0]x1_temp1;
    wire [31:0]x2_temp1;
    wire [31:0]x3_temp1;
    wire [31:0]x4_temp1;
    wire [31:0]x5_temp1;
    wire [31:0]x6_temp1;
    wire [31:0]x7_temp1;

    wire [31:0]x0_temp2;
    wire [31:0]x1_temp2;
    wire [31:0]x2_temp2;
    wire [31:0]x3_temp2;
    wire [31:0]x4_temp2;
    wire [31:0]x5_temp2;
    wire [31:0]x6_temp2;
    wire [31:0]x7_temp2;
    reg enable;
    wire rdy11,rdy12,rdy13,rdy14;
    wire rdy21,rdy22,rdy23,rdy24;
    wire rdy31,rdy32,rdy33,rdy34;
    wire [31:0]w0;
    wire [31:0]w1;
    wire [31:0]w2;
    wire [31:0]w3;
    assign w0=32'b00000000_00000000_00000001_00000000;
    assign w1=32'b11111111_01001011_00000000_10110101;
    assign w2=32'b11111111_00000000_00000000_00000000;
    assign w3=32'b11111111_01001011_11111111_01001011;
    reg start;
    reg start2;
    reg start3;
    loads_data load(
        .enable(enable),
        .clk(clk),
        .reset_n(reset_n),
        .x0(x0),
        .x1(x1),
        .x2(x2),
        .x3(x3),
        .x4(x4),
        .x5(x5),
        .x6(x6),
        .x7(x7),
        .rdy_load(rdy_load)
   );
   


   always@(posedge clk)begin 
    if(!reset_n)begin
        state<=0;
        enable<=0;
        success<=0;
        end
    else begin
        if(input_pulse)
            state<=1;
         case(state)
            0:begin start<=0;start2<=0;start3<=0; end
            1:begin enable<=1; 
                if(rdy_load) state<=2; 
              end
            2:begin 
                start<=1;
                if(rdy11==1&&rdy12==1&&rdy13==1&&rdy14==1)begin
                    start2<=1;
                    state<=3;
                    end
               end
             3:begin
                if(rdy21==1&&rdy22==1&&rdy23==1&&rdy24==1)begin
                    start3<=1;
                    state<=4;
                   end
                end
             4:begin
                if(rdy31==1&&rdy32==1&&rdy33==1&&rdy34==1)begin
                    success<=1;
                   end
                end
            endcase
        end
     end

    ila_0  ila(
	.clk(clk), // input wire clk

	.probe0(X0), // input wire [31:0]  probe0  
	.probe1(X1), // input wire [31:0]  probe1 
	.probe2(X2), // input wire [31:0]  probe2 
	.probe3(X3), // input wire [31:0]  probe3 
	.probe4(X4), // input wire [31:0]  probe4 
	.probe5(X5), // input wire [31:0]  probe5 
	.probe6(X6), // input wire [31:0]  probe6 
	.probe7(X7), // input wire [31:0]  probe7 
	.probe8(reset_n), // input wire [31:0]  probe8 
	.probe9(success), // input wire [0:0]  probe9 
	.probe10(input_pulse), // input wire [0:0]  probe10 
	.probe11(x0), // input wire [31:0]  probe11 
    .probe12(x1), // input wire [31:0]  probe12 
    .probe13(x2), // input wire [31:0]  probe13 
    .probe14(x3), // input wire [31:0]  probe14 
    .probe15(x4), // input wire [31:0]  probe15 
    .probe16(x5), // input wire [31:0]  probe16 
    .probe17(x6), // input wire [31:0]  probe17 
    .probe18(x7) // input wire [31:0]  probe18
);
    
buffer_2 buffer_2_11(
        .enable_1(start),
        .enable_2(start),
        .clk(clk),
        .data1(x0),
        .data2(x4),
        .w(w0),  //变换因子
        .out1(x0_temp1),
        .out2(x1_temp1),
        .rdy(rdy11)
    );
    buffer_2 buffer_2_12(
        .enable_1(start),
        .enable_2(start),
        .clk(clk),
        .data1(x2),
        .data2(x6),
        .w(w0),  //变换因子
        .out1(x2_temp1),
        .out2(x3_temp1),
        .rdy(rdy12)
    );
    buffer_2 buffer_2_13(
        .enable_1(start),
        .enable_2(start),
        .clk(clk),
        .data1(x1),
        .data2(x5),
        .w(w0),  //变换因子
        .out1(x4_temp1),
        .out2(x5_temp1),
        .rdy(rdy13)
    ); 
    buffer_2 buffer_2_14(
        .enable_1(start),
        .enable_2(start),
        .clk(clk),
        .data1(x3),
        .data2(x7),
        .w(w0),  //变换因子
        .out1(x6_temp1),
        .out2(x7_temp1),
        .rdy(rdy14)
    );
    //////////////////////////////////////
    buffer_2 buffer_2_21(
        .enable_1(start2),
        .enable_2(start2),
        .clk(clk),
        .data1(x0_temp1),
        .data2(x2_temp1),
        .w(w0),  //变换因子
        .out1(x0_temp2),
        .out2(x2_temp2),
        .rdy(rdy21)
    );
    buffer_2 buffer_2_22(
        .enable_1(start2),
        .enable_2(start2),
        .clk(clk),
        .data1(x1_temp1),
        .data2(x3_temp1),
        .w(w2),  //变换因子
        .out1(x1_temp2),
        .out2(x3_temp2),
        .rdy(rdy22)
    );
    buffer_2 buffer_2_23(
        .enable_1(start2),
        .enable_2(start2),
        .clk(clk),
        .data1(x4_temp1),
        .data2(x6_temp1),
        .w(w0),  //变换因子
        .out1(x4_temp2),
        .out2(x6_temp2),
        .rdy(rdy23)
    );
    buffer_2 buffer_2_24(
        .enable_1(start2),
        .enable_2(start2),
        .clk(clk),
        .data1(x5_temp1),
        .data2(x7_temp1),
        .w(w2),  //变换因子
        .out1(x5_temp2),
        .out2(x7_temp2),
        .rdy(rdy24)
    );
    ///////////////////////////////
    buffer_2 buffer_2_31(
        .enable_1(start3),
        .enable_2(start3),
        .clk(clk),
        .data1(x0_temp2),
        .data2(x4_temp2),
        .w(w0),  //变换因子
        .out1(X0),
        .out2(X4),
        .rdy(rdy31)
    );
    buffer_2 buffer_2_32(
        .enable_1(start3),
        .enable_2(start3),
        .clk(clk),
        .data1(x1_temp2),
        .data2(x5_temp2),
        .w(w1),  //变换因子
        .out1(X1),
        .out2(X5),
        .rdy(rdy32)
    );
    buffer_2 buffer_2_33(
        .enable_1(start3),
        .enable_2(start3),
        .clk(clk),
        .data1(x2_temp2),
        .data2(x6_temp2),
        .w(w2),  //变换因子
        .out1(X2),
        .out2(X6),
        .rdy(rdy33)
    );
    buffer_2 buffer_2_34(
        .enable_1(start3),
        .enable_2(start3),
        .clk(clk),
        .data1(x3_temp2),
        .data2(x7_temp2),
        .w(w3),  //变换因子
        .out1(X3),
        .out2(X7),
        .rdy(rdy34)
    );

endmodule
