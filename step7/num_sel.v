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

module num_selector(input clk, input rst, output reg select);
    
    parameter DELAY = 1000000; //10ms
    reg [19:0]counter;
    
    always @(posedge clk or posedge rst)begin
        
        if(rst)begin
            select = 0;
            counter = 20'b0;
        end
        else begin
            counter = counter + 20'b1;
            if(counter == DELAY) begin
                select = !select;
                counter = 20'b0;
            end
        end
    end
endmodule
        
