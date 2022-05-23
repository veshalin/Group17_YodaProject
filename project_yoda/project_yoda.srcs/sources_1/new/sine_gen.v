
module sine_gen(
    input clk ,
    output reg [15:0] sineOutput
    );
parameter SIZE = 1024;    
reg [15:0] rom_memory [SIZE-1:0];
reg [15:0]max;
reg [15:0]min;
integer i;

initial begin
    $readmemh("sine_LUT_values.mem", rom_memory); //Use IP of BRAM instead of this command
    i = 0;
    max=rom_memory[i];
    min=rom_memory[i];
end
    
//At every positive edge of the clock, output a sine wave sample.
always@(posedge clk) begin
    sineOutput = rom_memory[i];
    i = i+ 1;
    if(sineOutput<min)
        min=sineOutput;
    if(sineOutput>max)
        max=sineOutput;
    if(i == SIZE)
        i = 0;
end
endmodule

