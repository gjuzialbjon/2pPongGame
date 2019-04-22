`timescale 1ns / 1ps

module timeProvider( input clk,
                     input reset,
                     input logic speed2, speed1, speed0,
                     output logic timer
    );
    
    int speeder = 1000000;
    int count = 0;
    
    always @(posedge clk)
    begin
       if( count == speeder )
           begin
               count = 0;
               timer = 1'b1;
           end
           
       else if (speed2 == 1 & speed1 == 1 & speed0 == 1)
           begin
               if( speeder > 50000000 )
                   count = 0;
               speeder = 50000000;
               count = count + 1;
               timer = 1'b0;
           end
       
       else if (speed2 == 1 & speed1 == 1 & speed0 == 0)
          begin
              if( speeder > 100000000 )
                  count = 0;
              speeder = 100000000;
              count = count + 1;
              timer = 1'b0;
          end
          
          
       else if (speed2 == 1 & speed1 == 0 & speed0 == 1)
            begin
                if( speeder > 150000000 )
                    count = 0;
                speeder = 150000000;
                count = count + 1;
                timer = 1'b0;
            end
            
       else if (speed2 == 1 & speed1 == 0 & speed0 == 0)
          begin
              if( speeder > 200000000 )
                  count = 0;
              speeder = 200000000;
              count = count + 1;
              timer = 1'b0;
          end
          
      else if (speed2 == 0 & speed1 == 1 & speed0 == 1)
            begin
                if( speeder > 240000000 )
                    count = 0;
                speeder = 240000000;
                count = count + 1;
                timer = 1'b0;
            end
            
     else if (speed2 == 0 & speed1 == 1 & speed0 == 0)
          begin
              if( speeder > 300000000 )
                  count = 0;
              speeder = 300000000;
              count = count + 1;
              timer = 1'b0;
          end
          
     else if (speed2 == 0 & speed1 == 0 & speed0 == 1)
                    begin
                        if( speeder > 340000000 )
                            count = 0;
                        speeder = 340000000;
                        count = count + 1;
                        timer = 1'b0;
                    end
       
      else
        begin
           count = count + 1;
           timer = 1'b0;
         end
      end
   
endmodule