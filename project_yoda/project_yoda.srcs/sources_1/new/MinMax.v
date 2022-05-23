module MinMax (
    input clk ,
    wire [15:0] sineOut,
    output reg [15:0] Max,
    output reg [15:0] Min
);

    //initates and connects the sine generator to the testBench
    sine_gen baseSineGen(
        .clk (clk),
        .sineOutput (sineOut)
    );
always@(posedge clk) begin
    if(sineOut<Min)
        Min=sineOut;
    if(sineOutput>Max)
        Max=sineOut;
 end
    
endmodule