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
module GrayCounter_System(clk, rst, button_in, leds, active_num, select);
  parameter N = 5;
  parameter distance = 100000000;// How much for 1 Hz when clk period is 10 ns?
  input clk, rst, button_in;
  output [7:0] leds;
  output [6:0] active_num;
  output select;
  wire pulse;
  wire clean_button;
  wire select;
  wire[6:0] right_num, left_num, active_num;
    
    
    debounce button_debouncer(.reset(rst), .clk(clk), .noisy(button_in), .clean(clean_button));
    
  // Instantiation of the GrayCounter_Pulse 
  // Here
    GrayCounter_Pulse my_pulse_gen(.clk(clk), .rst(rst), .level(clean_button), .pulse(pulse));
  // Instantiation of the gray_Nbits 
  // Here
    gray_Nbits nbits_counter(.clk(clk), .clk_en(pulse), .rst(rst), .gray_out(leds));
    
    //screen selector
    
    num_selector my_num_selector(.clk(clk), .rst(rst), .select(select));
    
    //lower bits decoder
    
    seven_seg_decoder lower_decoder(.four_bit_gray(leds[3:0]), .num(right_num));
    
    //higher bits decoder
    
    seven_seg_decoder higher_decoder(.four_bit_gray(leds[7:4]), .num(left_num));
    
    
    assign active_num = (select)? left_num : right_num;


endmodule
