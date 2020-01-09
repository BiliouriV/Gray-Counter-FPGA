// Switch Debounce Module
// use your system clock for the clock input
// to produce a synchronous, debounced output
module debounce #(parameter DELAY=1000000)   // .01 sec with a 100 Mhz clock
	             (input reset, clk, noisy, output wire clean);
	              
   parameter count_max = 20'b11111111111111111111;
   reg [19:0] count;
   reg new;

   always @ (posedge clk or posedge reset)
     if(reset == 1)
       begin
            count = 20'd0;
            new = 0;
	   end
	 else 
	   begin
            if (!noisy)begin
                count = 20'd0;
                new = 0;
            end
            else begin
               
                if (count == count_max)begin
                    new = 0;
                end
                else begin
                    if (count == DELAY)begin
                        new = 1;
                        count = count_max;
                    end
                    else count = count + 20'd1;

                end
            end
	   end
      
       assign clean = new;
       
endmodule
