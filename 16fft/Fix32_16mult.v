`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/05/23 10:13:16
// Design Name: 
// Module Name: Fix32_16mult
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


module Fix32_16mult(
    input    clk,
    input    rst_n,
    input    [32-1:0]  a,
    input    [32-1:0]  b,
    output   [64-1:0]  ret
    );
    
    //-----------------------------------------------
    //  扩展a，b
    reg   [64-1:0]  a_r, b_r;
    always @ (posedge clk or negedge rst_n) begin
        if(rst_n == 1'b0) begin 
            a_r <= 64'h0000_0000_0000_0000;
            b_r <= 64'h0000_0000_0000_0000;
        end
        else begin 
            a_r <= {{32{a[31]}}, a[31:0]};
            b_r <= {{32{b[31]}}, b[31:0]};
        end
    end
    
    //--------------------------------------------------
    //  依位移位
    reg [64-1:0] ret_r [64-1:0];
    integer i, j, k;
    always @ (posedge clk or negedge rst_n) 
        if(rst_n == 1'b0)
            for(i = 0; i < 64; i = i+1)
                ret_r[i] <= 64'h0000_0000_0000_0000;
        else 
            for(k = 0; k<64; k = k + 1)
                if(b_r[k] == 1)
                    ret_r[k] <= (a_r << k);
                else
                    ret_r[k] <=  64'h0000_0000_0000_0000;
                    
    
    //---------------------------------------------------
    // 对结果求和 截位
    reg [64-1:0] sum;
    always @ (posedge clk or negedge rst_n) 
        if(rst_n == 1'b0)
            sum <= 64'h0000_0000_0000_0000;
        else begin 
                sum <= ret_r[0]+ret_r[1]+ret_r[2]+ret_r[3]+ret_r[4]+ret_r[5]+ret_r[6]+ret_r[7]+ret_r[8]+ret_r[9]+ret_r[10]+ret_r[11]+ret_r[12]+ret_r[13]+ret_r[14]+ret_r[15]+ret_r[16]+ret_r[17]+ret_r[18]+ret_r[19]+ret_r[20]+ret_r[21]+ret_r[22]+ret_r[23]+ret_r[24]+ret_r[25]+ret_r[26]+ret_r[27]+ret_r[28]+ret_r[29]+ret_r[30]+ret_r[31]
                +ret_r[32]+ret_r[33]+ret_r[34]+ret_r[35]+ret_r[36]+ret_r[37]+ret_r[38]+ret_r[39]+ret_r[40]+ret_r[41]+ret_r[42]+ret_r[43]+ret_r[44]+ret_r[45]+ret_r[46]+ret_r[47]+ret_r[48]+ret_r[49]+ret_r[50]+ret_r[51]+ret_r[52]+ret_r[53]+ret_r[54]+ret_r[55]+ret_r[56]+ret_r[57]+ret_r[58]+ret_r[59]+ret_r[60]+ret_r[61]+ret_r[62]+ret_r[63];    
        end 
        
    assign  ret = sum;
    endmodule
