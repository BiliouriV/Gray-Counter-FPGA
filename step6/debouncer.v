// Switch Debounce Module
// use your system clock for the clock input
// to produce a synchronous, debounced output
module debounce #(parameter DELAY=5000000)   // .01 sec with a 100 Mhz clock
	             (input reset, clk, noisy, output wire clean);
	             
   parameter LIMIT = 10000000;              
   reg [26:0]count_max;
   reg [26:0] count;
   reg new;

   always @ (posedge clk or posedge reset)
     if(reset == 1)
       begin
            count = 20'd0;
            new = 0;
            count_max = 27'b101111101011110000100000000;
	   end
	 else 
	   begin
            if (!noisy)begin
                count = 20'd0;
                new = 0;
                count_max = 27'b101111101011110000100000000;
            end
            else begin
               
                if (count == 1)begin
                    new = 0;
                end
                else if(count == count_max) begin
                    new = 1;
                    count = 27'b0;
                    if (count_max > LIMIT)begin
                        count_max = count_max - DELAY;
                    end
                end
                count = count + 20'd1;
            end
	   end
      
       assign clean = new;
       
endmodule
