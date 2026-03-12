`default_nettype none

module depth_estimator(

    input wire clk,
    input wire rst_n,
    input wire detect,
    output reg [7:0] depth

);

reg [7:0] counter;

always @(posedge clk or negedge rst_n) begin

    if(!rst_n) begin
        counter <= 8'd0;
        depth <= 8'd0;
    end
    else begin

        counter <= counter + 1;

        if(detect) begin
            depth <= counter;
            counter <= 8'd0;
        end

    end

end

endmodule

`default_nettype wire
