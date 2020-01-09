 
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Design Name: 
// Module Name:    GrayCounter_System 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: Instantiation of the GrayCounter_Nbits and GrayCounter_Pulse models
//
//////////////////////////////////////////////////////////////////////////////////

module seven_seg_decoder(input four_bit_gray, output num);
    wire[3:0] four_bit_gray;
    reg[6:0] num;
    
    always @(four_bit_gray)begin
        
        case(four_bit_gray)
        
            4'b0000:begin
                num[0] = 1;
                num[1] = 1;
                num[2] = 1;
                num[3] = 1;
                num[4] = 1;
                num[5] = 1;
                num[6] = 0;
            end
            
            4'b0001:begin
                num[0] = 0;
                num[1] = 1;
                num[2] = 1;
                num[3] = 0;
                num[4] = 0;
                num[5] = 0;
                num[6] = 0;
            end
            
            4'b0010:begin
                num[0] = 1;
                num[1] = 1;
                num[2] = 0;
                num[3] = 1;
                num[4] = 1;
                num[5] = 0;
                num[6] = 1;
            end
            
            4'b0011:begin
                num[0] = 1;
                num[1] = 1;
                num[2] = 1;
                num[3] = 1;
                num[4] = 0;
                num[5] = 0;
                num[6] = 1;
            end
            
            4'b0100:begin
                num[0] = 0;
                num[1] = 1;
                num[2] = 1;
                num[3] = 0;
                num[4] = 0;
                num[5] = 1;
                num[6] = 1;
            end
            
            4'b0101:begin
                num[0] = 1;
                num[1] = 0;
                num[2] = 1;
                num[3] = 1;
                num[4] = 0;
                num[5] = 1;
                num[6] = 1;
            end
            
            4'b0110:begin
                num[0] = 1;
                num[1] = 0;
                num[2] = 1;
                num[3] = 1;
                num[4] = 1;
                num[5] = 1;
                num[6] = 1;
            end
            
            4'b0111:begin
                num[0] = 1;
                num[1] = 1;
                num[2] = 1;
                num[3] = 0;
                num[4] = 0;
                num[5] = 0;
                num[6] = 0;
            end
            
            4'b1000:begin
                num[0] = 1;
                num[1] = 1;
                num[2] = 1;
                num[3] = 1;
                num[4] = 1;
                num[5] = 1;
                num[6] = 1;
            end
            
            4'b1001:begin
                num[0] = 1;
                num[1] = 1;
                num[2] = 1;
                num[3] = 0;
                num[4] = 0;
                num[5] = 1;
                num[6] = 1;
            end
            
            4'b1010:begin
                num[0] = 1;
                num[1] = 1;
                num[2] = 1;
                num[3] = 0;
                num[4] = 1;
                num[5] = 1;
                num[6] = 1;
            end
            
            4'b1011:begin
                num[0] = 0;
                num[1] = 0;
                num[2] = 1;
                num[3] = 1;
                num[4] = 1;
                num[5] = 1;
                num[6] = 1;
            end
            
            4'b1100:begin
                num[0] = 1;
                num[1] = 0;
                num[2] = 0;
                num[3] = 1;
                num[4] = 1;
                num[5] = 1;
                num[6] = 0;
            end
            
            4'b1101:begin
                num[0] = 0;
                num[1] = 1;
                num[2] = 1;
                num[3] = 1;
                num[4] = 1;
                num[5] = 0;
                num[6] = 1;
            end
            
            4'b1110:begin
                num[0] = 1;
                num[1] = 0;
                num[2] = 0;
                num[3] = 1;
                num[4] = 1;
                num[5] = 1;
                num[6] = 1;
            end
            
            4'b1111:begin
                num[0] = 1;
                num[1] = 0;
                num[2] = 0;
                num[3] = 0;
                num[4] = 1;
                num[5] = 1;
                num[6] = 1;
            end
            
        endcase
    end
endmodule
