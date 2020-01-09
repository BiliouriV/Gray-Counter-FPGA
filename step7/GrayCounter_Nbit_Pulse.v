`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:17:55 02/04/2010 
// Design Name: 
// Module Name:    GrayCounter_Nbit_Pulse 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: This FSM converts an input level signal to a single-cycle pulse. 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module GrayCounter_Pulse(input clk, input rst, input level, output reg pulse);

   reg [1:0] state;
   reg [1:0] nextstate;
   parameter S0 = 2'b00;
   parameter S1 = 2'b01;
   parameter S2 = 2'b10;
   
   // Compute next state of the FSM 
  always @(state, level)
      begin
			case(state)
				S0:
						begin
                            if (!level)begin
                                pulse = 0;
                                nextstate = S0;
                            end
                            else begin
                                pulse = 0;
                                nextstate = S1;
                            end
						end
				S1:
						begin
							pulse = 1;
							nextstate = S2;
						end
				S2:
						begin
							pulse = 0;
							nextstate = S0;
						end
				default:
				        begin
				            pulse = 0;
				            nextstate = S0;
				        end
			endcase
      end
	  
	  // Set the new state 
	always @(posedge clk, posedge rst)
			begin
				if(rst == 1'b1)
					state <= 2'b0;
				else
					state <= nextstate;
            end
endmodule
