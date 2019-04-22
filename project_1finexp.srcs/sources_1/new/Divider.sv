`timescale 1ns / 1ps
module Divider(input logic clk, output logic shcp, stcp,oe, int i, 
                output logic f );
   
    logic [7:0] counter = 0;
    
    always_ff@( posedge clk)
        counter <= counter+1;
    
    assign f = counter[7];
    
    always_ff@( negedge f)
    if(i==410)
        i<=1;
    else
        i <= i+1;
    
    always_ff@( negedge clk)
    if( i < 28)
    begin
        shcp <= f;
        stcp <= ~f;
    end
    else
    begin
        shcp<=0;
        stcp<=1;
    end
    
    always_ff@( posedge f)
        if(i>28 && i<409)
        oe <= 0;
        else
        oe<= 1;
endmodule