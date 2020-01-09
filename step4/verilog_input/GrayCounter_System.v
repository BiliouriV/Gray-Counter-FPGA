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
module GrayCounter_System(clk, rst, leds);
  parameter N = 8;
  parameter distance = 100000000;// How much for 1 Hz when clk period is 10 ns?
  input clk, rst;
  output [N-1:0] leds;
  wire pulse;
    
  // Instantiation of the GrayCounter_Pulse 
  // Here
    GrayCounter_Pulse my_pulse_gen(.clk(clk), .rst(rst), .pulse(pulse));
  // Instantiation of the gray_Nbits 
  // Here
   gray_Nbits nbits_counter(.clk(clk), .clk_en(pulse), .rst(rst), .gray_out(leds));


endmodule
