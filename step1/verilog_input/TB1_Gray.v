 /*                                -
 -----------------------------------------------------------------------------
 -----------------------------------------------------------------------------
 -- File           : TB1_Gray.v
 -----------------------------------------------------------------------------
 -- Description    : Verilog testbench for Gray_4bits
 -- --------------------------------------------------------------------------
 -- --------------------------------------------------------------------------
 */
 
`timescale 1ns/1ps
`define cycle 10

module TB1;
  
  reg clk;
  reg rst, clk_en;
  wire [3:0] leds;
  integer EndOfSimulation;  
  integer i;

  parameter ONE = 1'b1; 
							 
  // Initial statement for signal initialization (reset, clk, EndOfSimulation)
   initial 
     begin
      clk = 0;
      rst = 0;
      #(10)rst = 1;
	  #2000$finish;
     end
	 
  // Always statement to drive the clock goes here
  always 
    begin
	#(5) clk = !clk;
    end
	
   // Instantiation of the gray_4bits 
  gray_4bits DUT(.clk(clk), .clk_en(ONE), .rst(rst), .gray_out(leds));   
  
endmodule
