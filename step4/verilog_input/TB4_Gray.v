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
//`define cycle 10   // this is equivalent to defines in C

module TB3;
  parameter N = 4;
  parameter cycle = 10;
  parameter distance = 100000000;  //
  reg clk, rst, clk_en;
  wire [N-1:0] leds;
  integer EndOfSimulation;  


  // Drive the reset and the EndOfSimulation signal
   initial 
     begin
	 // Your code goes here
	 clk = 0;
	 rst = 1;
	 #20 rst = 0;
	 #distance $finish;
     end
	 
  // Drive the clock 
  always 
    begin
         // Your code goes here
         #(cycle/2) clk = !clk;
    end
	
 
  // Instantiate the System in the testbench
  // Your code goes here
  GrayCounter_System my_system(.clk(clk), .rst(rst), .leds(leds));

  
endmodule
