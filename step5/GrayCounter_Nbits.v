 /*
-----------------------------------------------------------------------------
-- File           : Gray_Nbits_RTL.v
-----------------------------------------------------------------------------
*/ 

module gray_Nbits (clk, clk_en, rst, gray_out);
 parameter N = 4;
 parameter SIZE =(N+1);
 parameter Zeros = {SIZE{1'b0}};
 integer i,j,k;
 // Place the definition of wires and regs here
 
 input clk, clk_en, rst;
 output wire[N - 1:0] gray_out;
 
 reg [N:0] state;
 reg [N:0] toggle;
 reg h_or;
 
 // The state of the Gray counter
 always @(posedge clk or posedge rst)
   begin
        if (rst == 1'b1)begin
           state[0] = 1'b1;
           for ( i = 1; i<SIZE; i=i+1)begin
               state[i] <= 1'b0;
           end
       end
           // Initialize state with 1000..00
       else begin
           // Main part of code
           if(clk_en)begin
               state[0] <= !state[0];
               for(j = 1; j<SIZE; j = j + 1) begin
                   if(toggle[j]==1)begin
                       state[j] <= ~state[j];
                   end
               end

               
           end
       end
   end
   
 
 
 // The combinational logic produces the toggle[N:0] signals
   always @(state) 
       begin
           if(rst) begin
               for(i = 0; i<SIZE; i = i + 1) begin
                   toggle[i] = 0;
                   h_or = 0;
               end
           end
           else begin
               toggle[0] =  1'b1;
               toggle[1] = state[0];
                
               for (i=2; i<N; i=i+1)begin
                   h_or = state[0];
                   for (k = 1; k<i-1; k=k+1)begin
                       h_or = h_or | state[k];
                   end
                   toggle[i] = state[i-1]&(~h_or);
               end
               toggle[N] = ~(|state[N-2:0]);

           end
       end

   assign gray_out=state[N:1];
    
endmodule
