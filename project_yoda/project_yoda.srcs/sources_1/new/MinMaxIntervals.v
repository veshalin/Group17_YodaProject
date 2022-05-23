module MinMaxIntervals (
    input clk ,
    wire [15:0] sineOut,
    output reg [15:0] Max,
    output reg [15:0] Min,
    output reg [15:0] minA [0:9],
    output reg [15:0] maxA [0:9],
    output reg [15:0] MeanValue,
    output reg [15:0] StdDevMin,
    output reg [15:0] StdDevMax
);
parameter interval = 1;
integer i=0;
integer intSample=0;
integer MinSD=0;
integer MaxSD=0;
integer temp1=0;
integer temp2=0;
reg[15:0] MinTotal;
reg[15:0] MinMean;
reg[15:0] MaxTotal;
reg[15:0] MaxMean;
reg [15:0] stdDevMins;
reg [15:0] stdDevMaxs;
    //initates and connects the sine generator to the testBench
    sine_gen baseSineGen(
        .clk (clk),
        .sineOutput (sineOut)
    );
    
always@(posedge clk) begin
   if (i<10)
   begin
   if(sinOut<minA[intSample])
        minA[intSample]=sineOut;
   if(sinOut>maxA[intSample])
        maxA[intSample]=sineOut;
   if(intSample>44099999)
        intSample=0;
        i=i+1;
   intSample=intSample+1;
   if(i>8)
        begin
        for (j=0;j<9;j=j+1)
        begin
        MinTotal=MinTotal+minA[j];
        MaxTotal=MaxTotal+maxA[j];
        end 
        MinMean=MinTotal/10;
        MaxMean=MaxTotal/10;
        for (h=0;h<9;h=h+1)
        begin
        temp1=minA[h]-MinMean;
        temp1=$pow(temp1,2);
        stdDevMins=stdDevMins+temp1;
        temp2=maxA[h]-MaxMean;
        temp2=$pow(temp2,2);
        stdDevMaxs=stdDevMaxs+temp2;
        end 
        stdDevMins=stdDevMins/10;
        stdDevMaxs=stdDevMaxs/10;
        stdDevMins= sqrt(stdDevMins);
        stdDevMaxs= sqrt(stdDevMaxs);
        StdDevMin=stdDevMins;
        StdDevMax=stdDevMaxs;
        end
        for (k=0;k<9;k=k+1)
        begin
        temp1= minA[k]-MinMean;
        if(temp1<stdDevMins)
        $display(minA[k]);
        temp2= maxAA[k]-MaxMeanMean;
        if(temp2<stdDevMins)
        $display(minA[k]);
        end
    end
end
endmodule