`timescale 1ns / 1ps
module Matrix(input logic clk, input logic [7:0][23:0] inp, 
                  output logic [7:0] rowsOut, output logic SH_CP, ST_CP, MR, OE, DS);
        
        logic f;
        logic [23:0] dstotal; 
        logic greenDivider = 0;
        int i; 
        logic [2:0] a = 0;
                
        assign dstotal = greenDivider ? 
        {inp[a][23:16],8'b0,inp[a][7:0]} : {8'b0,inp[a][15:8],8'b0};
        
        Divider theSignals(clk, SH_CP, ST_CP , OE, i, f);
        
        logic[2:0] countcountbaby;
        
        always_ff@( posedge f)
        
        if(i == 410)
             countcountbaby++;
    
        always_ff@(negedge f)
        begin
        if( i < 3 )
             MR <= 0;
        else
             MR<=1;
             
        if( i > 2 && i < 27 )
             DS <= dstotal[i-3];
        else
             DS <= 0;
        end
        
        always_ff@(negedge f)
        if(i == 410) begin 
        if(greenDivider)
             a <= a + 1;
        else 
            a <= a;
            
             greenDivider++;
        end
        else begin
             a <= a;
             greenDivider<=greenDivider;
        end
        
        always_comb
        case(a)
        0: rowsOut = 1;
        1: rowsOut = 2;
        2: rowsOut = 4;
        3: rowsOut = 8;
        4: rowsOut = 16;
        5: rowsOut = 32;
        6: rowsOut = 64;
        7: rowsOut = 128;
        default: rowsOut = 0;
        endcase
        
    endmodule