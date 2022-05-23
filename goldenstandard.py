import numpy as np;
from numpy import random;
import time

#GOLDEN STANDARD FOR SECTION 1 OF PROJECT 
def section1():
    audio_sample = [];

    #Create random data sequence equivalent to 10 seconds of 44.1kHz Audio
    for i in range(441000):
        audio_sample.append(random.rand()*255); #255 is max possible amplitude (decimal)

    #Initialize max and min values
    maximum = audio_sample[0];
    minimum = audio_sample[0];
    
    #Start timer, isolating the processing section as required
    tic = time.perf_counter()
    
    #Find min and max values
    for i in range(len(audio_sample)):
        if audio_sample[i] > maximum:
            maximum = audio_sample[i];
        if audio_sample[i] < minimum:
            minimum = audio_sample[i];
            
    #End timer and output results 
    toc = time.perf_counter()
    print("Section 1")
    print(f"Maximum: {maximum:0.4f}" )
    print(f"Minimum: {minimum:0.4f}" )
    print(f"time taken by section 1 was: {toc-tic:0.4f} seconds" )
    print("\n")


#GOLDEN STANDARD FOR SECTION 2 OF PROJECT 
def section2():
    print("Section 2")
    #Set interval = 1 second (at 44.1kHz)
    interval_length = 44100
    audio_sample2 = []
    
    #Create random data sequence equivalent to 10 seconds of 44.1kHz Audio
    for i in range(441000):
        audio_sample2.append(random.rand()*255) #255 is max possible amplitude (decimal)

    #Start timer
    tic = time.perf_counter()
    d = 0;
    for j in range(len(audio_sample2)//interval_length): #For each interval
        focus_array = []
        
        #Add interval values to interval array (focus array)
        for p in range(44100):
            focus_array.append(audio_sample2[d+p])
        tot = 0;
        maximum = focus_array[0]
        minimum = focus_array[0]

        #Processing 
        for i in range(len(focus_array)):
            tot += focus_array[i]
            if focus_array[i] > maximum:
                maximum = focus_array[i]
            if focus_array[i] < minimum:
                minimum = focus_array[i]
        average = tot // interval_length
        stdeviation = np.std(focus_array)
        
        #Print out min and max values for this interval
        print(f"Maximum for interval " + str(j+1) + ": " + str(maximum) )
        print(f"Minimum for interval " + str(j+1) + ": " + str(minimum) )
        print("\n")
        
        #Increment d by interval to later add interval values to focus array
        d = d + interval_length
        
        #Remove values one standard deviation from the mean
        b = 0;
        while b < len(focus_array):

            if (focus_array[b] > (average+stdeviation)) or (focus_array[b] < (average-stdeviation)):
                focus_array.pop()
            b = b +1;
            #NEED TO OUTPUT FILTERED ARRAY
          
    #End timer and output results 
    toc = time.perf_counter()
    print(f"time taken by section 2 was: {toc - tic:0.4f} seconds")

if __name__ == '__main__':
    section1()
    section2()
