module display_param(leds_count, leds);

    input leds_count;
    output reg [7:0]leds;
    parameter N = 5;

    always @(leds_count) begin
    
        case(N)
            4'd1:begin
                leds = {7'b0000000,leds_count};
            end

            4'd2:begin
                leds = {6'b000000,leds_count};
            end

            4'd3:begin
                leds = {5'b00000,leds_count};
            end

            4'd4:begin
                leds = {4'b0000,leds_count};
            end

            4'd5:begin
                leds = {3'b000,leds_count};
            end

            4'd6:begin
                leds = {2'b00,leds_count};
            end

            4'd7:begin
                leds = {1'b0,leds_count};
            end

            4'd8:begin
                leds = leds_count;
            end
        endcase
    end
endmodule
