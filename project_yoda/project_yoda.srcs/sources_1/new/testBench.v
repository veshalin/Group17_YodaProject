`timescale 1ns / 1ps

module testBench;
    reg clk;
    wire [15:0] sine;
    
    //initates and connects the sine generator to the testBench
    sine_gen baseSineGen(
        .clk (clk),
        .sineOutput (sine)
    ); 
    
    MinMax baseMinMax(
        .clk (clk) ,
        .Max(max),
        .Min(min)
    );
    
    MinMaxIntervals baseMinMaxIntervals(
        .clk (clk) ,
        .Max(max),
        .Min(min)
    );
    
    //frequency control
    parameter freq = 44100000; //100 MHz
    parameter SIZE = 441000000; 
    parameter clockRate = 0.000113; //clock time (make this an output from the sine modules)
    
    //Generate a clock with the above frequency control
    initial
    begin 
    clk = 1'b0;
    end
    always #clockRate clk = ~clk; //#1 is one nano second delay (#x controlls the speed)
    
endmodule
