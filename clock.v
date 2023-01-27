`timescale 1ns / 1ps

module clock(input clk,reset,set_time,secondSet,minuteSet,hourSet,output [4:0] Hour,output [5:0] Minute,Second);
    reg [5:0] second,minute;
    reg [4:0] hour;
    reg [1:0] count;
    reg MinuteCheck,HourCheck;
    wire clk_new;
    assign Hour=hour;
    assign Minute=minute;
    assign Second=second;

    always @(posedge reset,posedge set_time)
    begin
        if(reset)
            count=2'b0;
        else
            count=count+2'b1;
    end

    assign clk_new=clk & (~count[0]) & (~count[1]);

    always @(posedge clk_new,posedge reset,posedge secondSet)
    begin
        if (reset)
        begin
            second<=6'b0;
            MinuteCheck=0;
        end
        else if (count==2'b01)
        begin
            if(secondSet==1'b1)
            begin
                if (second<6'd59)
                    second=second+6'd1;
                else
                    second=6'd0;
            end
            else
                second=second;
        end
        else
        begin
            if (second<6'd59)
            begin
                second=second+6'd1;
                MinuteCheck=0;
            end
            else
            begin
                second=6'd0;
                MinuteCheck=1;
            end
        end
    end


    always @(posedge MinuteCheck,posedge reset,posedge minuteSet)
        begin
        if (reset)
        begin
            minute<=6'b0;
            MinuteCheck=0;
        end
        else if (count==2'b10)
        begin
            if(minuteSet==1'b1)
            begin
                if (minute<6'd59)
                    minute=minute+6'd1;
                else
                    minute=6'd0;
            end
            else
                minute=minute;
        end
        else
        begin
            if (minute<6'd59)
            begin
                minute=minute+6'd1;
                HourCheck=0;
            end
            else
            begin
                minute=6'd0;
                HourCheck=1;
            end
        end
    end


    always @(posedge HourCheck,posedge reset,posedge hourSet)
    begin
        if (reset)
        begin
            hour<=5'b0;
        end
        else if (count==2'b11)
        begin
            if(hourSet==1'b1)
            begin
                if (hour<5'd24)
                    hour=hour+5'd1;
                else
                    hour=5'd0;
            end
        else
            hour=hour;
        end
        else
        begin
            if (hour<5'd24)
            begin
                hour=hour+5'd1;
            end
            else
            begin
                hour=5'd0;
            end
        end
    end

endmodule
