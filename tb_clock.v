`timescale 1ns / 1ps

module tb_clock;
    reg clk,reset,set_time,secondSet,minuteSet,hourSet;
    wire [4:0] Hour;
    wire [5:0] Minute,Second;
    clock uut(clk,reset,set_time,secondSet,minuteSet,hourSet,Hour,Minute,Second);
    initial
    begin
        clk=0; reset=0; set_time=0; secondSet=0; minuteSet=0; hourSet=0;
        #10 reset=1;
        #10 reset=0;
        #250 set_time=1;
        #10 set_time=0;
        #50 secondSet=1;
        #20 secondSet=0;
        #10 secondSet=1;
        #10 secondSet=0;
        #10 secondSet=1;
        #10 secondSet=0;
        #10 secondSet=1;
        #10 secondSet=0;
        #10 secondSet=1;
        #10 secondSet=0;
        #10 secondSet=1;
        #10 secondSet=0;
        #10 secondSet=1;
        #10 secondSet=0;
        #10 secondSet=1;
        #10 secondSet=0;
        #30 set_time=1;
        #10 set_time=0;
        #10 set_time=1;
        #10 set_time=0;
        #10 set_time=1;
        #10 set_time=0;
        #300 set_time=1;
        #10 set_time=0;
        #10 set_time=1;
        #10 set_time=0;
        #50 minuteSet=1;
        #10 minuteSet=0;
        #10 minuteSet=1;
        #10 minuteSet=0;
        #10 minuteSet=1;
        #10 minuteSet=0;
        #10 minuteSet=1;
        #10 minuteSet=0;
        #10 minuteSet=1;
        #10 minuteSet=0;
        #10 minuteSet=1;
        #10 minuteSet=0;
        #50 set_time=1;
        #10 set_time=0;
        #10 set_time=1;
        #10 set_time=0;
        #500 set_time=1;
        #10 set_time=0;
        #10 set_time=1;
        #10 set_time=0;
        #10 set_time=1;
        #10 set_time=0;
        #50 hourSet=1;
        #10 hourSet=0;
        #10 hourSet=1;
        #10 hourSet=0;
        #10 hourSet=1;
        #10 hourSet=0;
        #10 hourSet=1;
        #10 hourSet=0;
        #10 hourSet=1;
        #10 hourSet=0;
        #10 hourSet=1;
        #10 hourSet=0;
        #10 hourSet=1;
        #10 hourSet=0;
        #10 hourSet=1;
        #10 hourSet=0;
        #10 set_time=1;
        #10 set_time=0;
        // #200 $stop;
    end
    always
        #5 clk=~clk;
endmodule
