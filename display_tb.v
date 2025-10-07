`timescale 1ns / 1ps


//Test bench file for Car_Safety module
module testbench(); 
    
    parameter DELAY = 2 * 4095; //Positive and negative cycles 
    
    reg clk; //Clock
    reg [15:0] sw; //Switch inputs
    wire [3:0] an; //Annode output
    wire [7:0] seg; // 7-segment output
    
    initial begin
        clk = 0;
        sw = 0; 
    end
    
    //Run clock at 0.5 GHz
    always begin
        #1 clk = ~clk; 
    end
    
    Multi_Driver DUT(.sw(sw), .clk(clk), .an(an), .seg(seg)); 
    
    initial begin
        
        sw = 16'h5555; //First test case is all fives 
        #DELAY; //Allow all four displays to strobe
        sw = 16'h9999; //Second test case is all nines
        #DELAY; 
        sw = 16'h1234; 
        #DELAY; //Testing no change for multiple cycles
        #DELAY; 
        #DELAY;
        $finish; 
    end
    
    
    
      
    
endmodule