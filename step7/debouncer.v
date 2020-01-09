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
            count <= 27'd0;
            new <= 0;
            count_max <= 27'd100000000;
	   end
	 else 
	   begin
            if (!noisy)begin
                count = 27'd0;
                new = 0;
                count_max = 27'd100000000;
            end
            else begin
                new = 0;
                if (count == 27'd1000000)begin
                    new = 1;
                    count = count + 27'd1;
                end
                else if(count == count_max) begin
                    new = 1;
                    count = 27'd1000001;
                    if (count_max > LIMIT)begin
                        count_max = count_max - DELAY;
                    end
                end
                else begin
                    count = count + 27'd1;
                    new = 0;
                end
            end
	   end
      
       assign clean = new;
       
endmodule
