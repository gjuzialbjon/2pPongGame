`timescale 1ns / 1ps


module disp(input logic P1L, P1R, P2L, P2R, speed2, speed1, speed0, Stop, CLK, reset, 
            output logic [7:0] row, output logic SH_CP, ST_CP, MR, OE, DS, output logic a, b, c, d, e, f, g, dp,
            output logic [3:0] an, output logic [4:0] set1, output logic [4:0] set2);
      
       logic[7:0][23:0] board;                      
       logic[7:0][7:0] redLeds , greenLeds ,blueLeds; 
       int pad1x = 4,pad1y = 5,pad1z = 6;
       int pad2x  = 2,pad2y = 3,pad2z = 4;
       int ipad1x = 4,ipad1y = 5,ipad1z = 6;
       int ipad2x = 2,ipad2y = 3,ipad2z = 4;
       int iball1 = 3;
       int iball2 = 1;             
       int oldx = 2;
       int oldy = 1;
       int currx = 3;
       int curry = 1;
       logic timer;
       int right = 1;
       int up = 1;
       int p1score = 0, p2score = 0;
       int total1, total2;
       
       
always@( posedge timer)
begin
   if( ~Stop )
       begin
            if(P1L)
              begin
               if( pad1x != 0 )
                  begin  
                    updateColor( 1 , -1 );
                    pad1x = pad1x - 1;
                    pad1y = pad1y - 1;
                    pad1z = pad1z - 1;
                  end
              end
             if(P2L)
              begin
               if( pad2x != 0 )
                 begin    
                   updateColor( 2 , -1);
                   pad2x = pad2x  - 1;
                   pad2y = pad2y - 1;
                   pad2z = pad2z - 1;
                 end
             end
      
            if( P1R)
            begin
                  if( pad1z != 7)
                  begin
                    updateColor( 1 , 1 );
                    pad1x = pad1x  + 1;
                    pad1y = pad1y + 1;
                    pad1z = pad1z + 1;
                   end
            end
                
           if( P2R)
           begin
               begin
                    if(pad2z != 7)
                    begin    
                      updateColor( 2 , 1);
                      pad2x = pad2x  + 1;
                      pad2y = pad2y + 1;
                      pad2z = pad2z + 1;
                    end
                end
            end
          if( reset)
          begin
              updateColor(-1,-1);
              pad1x = ipad1x;
              pad1y = ipad1y;
              pad1z = ipad1z;
              pad2x = ipad2x;
              pad2y = ipad2y;
              pad2z = ipad2z;
              currx = iball1;
              curry = iball2;
              oldx = 3;
              oldy = 1;
              up = 1;
              right = 1;
              p1score = 0;
              p2score = 0;
              total1 = 0;
              total2 = 0;
          end 
           updateBallMovement( oldx, oldy);
           oldx = currx;
           oldy = curry;
           updateColor(0,0);
      end
      else 
      begin
         updateColor(3,3);
      end
     //updateColor(0,0);
     updateBoard();   
end
  
task updateColor( int player, int direction );
begin 
    for( int i = 0 ; i < 8 ; i++)
    begin 
        for(int j = 0 ; j < 8 ; j++)
        begin
            greenLeds[i][j] = 0;
            blueLeds[i][j] = 0;
            redLeds[i][j] = 0;       
        end       
    end
    
    if( player == 1 && direction == -1 )
        begin
            redLeds[0][pad1z] = 0;
            redLeds[0][pad1x - 1] = 1;
            redLeds[0][pad1y - 1] = 1;
            redLeds[0][pad1z - 1] = 1;
            redLeds[7][pad2x] = 1;
            redLeds[7][pad2y] = 1;
            redLeds[7][pad2z] = 1;
        end
        
    else if( player == 1 && direction == 1 )
        begin
            redLeds[0][pad1x ] = 0;
            redLeds[0][pad1x + 1] = 1;
            redLeds[0][pad1y + 1] = 1;
            redLeds[0][pad1z + 1] = 1;
            redLeds[7][pad2x] = 1;
            redLeds[7][pad2y] = 1;
            redLeds[7][pad2z] = 1;  
        end
    else if( player == 2 && direction == -1 )
        begin
            redLeds[0][pad1x ] = 1;
            redLeds[0][pad1y ] = 1;
            redLeds[0][pad1z ] = 1;
            redLeds[7][pad2x - 1] = 1;
            redLeds[7][pad2y - 1] = 1;
            redLeds[7][pad2z - 1] = 1;  
            redLeds[7][pad2z ] = 0; 
        end
    else if( player == 2 && direction == 1 )
        begin
            redLeds[0][pad1x ] = 1;
            redLeds[0][pad1y ] = 1;
            redLeds[0][pad1z ] = 1;
            redLeds[7][pad2x + 1] = 1;
            redLeds[7][pad2y + 1] = 1;
            redLeds[7][pad2z + 1] = 1; 
            redLeds[7][pad2x ] = 0; 
        end
        
else if( player == -1 && direction == -1 )
        begin
            redLeds[0][pad1x] = 0;
            redLeds[0][pad1y] = 0;
            redLeds[0][pad1z] = 0;
            redLeds[7][pad2x] = 0;
            redLeds[7][pad2y] = 0;
            redLeds[7][pad2z] = 0;
            redLeds[0][ipad1x ] = 1;
            redLeds[0][ipad1y ] = 1;
            redLeds[0][ipad1z ] = 1;
            redLeds[7][ipad2x ] = 1;
            redLeds[7][ipad2y ] = 1;
            redLeds[7][ipad2z ] = 1;  
        end
 else if( player == 3 && direction == 3 )
                begin
                    redLeds[0][pad1x] = 0;
                    redLeds[0][pad1y] = 0;
                    redLeds[0][pad1z] = 0;
                    redLeds[7][pad2x] = 0;
                    redLeds[7][pad2y] = 0;
                    redLeds[7][pad2z] = 0;
                    showScores();                    
                end
  else
      begin
           redLeds[0][pad1x] = 1;
           redLeds[0][pad1y] = 1;
           redLeds[0][pad1z] = 1;
           redLeds[7][pad2x] = 1;
           redLeds[7][pad2y] = 1;
           redLeds[7][pad2z] = 1;
       end
       
       if(player == 3)
            blueLeds[currx][curry] = 0;
       else
            blueLeds[currx][curry] = 1;
end 
endtask 
  
  
  
task showScores();
begin
    if(p1score == 0)
    begin
       for(int i = 0; i < 3; i++)
       begin
         redLeds[1][i] = 1;
         redLeds[5][i] = 1;
         redLeds[i+2][0] = 1;
         redLeds[i+2][2] = 1;
       end
    end
    
    else if(p1score == 1)
    begin
       for(int i = 0; i < 5; i++)
       begin
         redLeds[i+1][1] = 1;
       end
    end
    
    else if(p1score == 2)
    begin
       for(int i = 0; i < 3; i++)
       begin
         redLeds[1][i] = 1;
         redLeds[3][i] = 1;
         redLeds[5][i] = 1;
       end
         redLeds[2][2] = 1;
         redLeds[4][0] = 1;
    end
    
    else if(p1score == 3)
    begin
       for(int i = 0; i < 5; i++)
       begin
           redLeds[i+1][2] = 1;
       end
       for(int j = 0; j < 2; j++)
       begin
           redLeds[1][j] = 1;
           redLeds[3][j] = 1;
           redLeds[5][j] = 1;
       end
    end
    
    else if(p1score == 4)
    begin
       for(int i = 0; i < 5; i++)
       begin
           redLeds[i+1][2] = 1;
       end
       for(int j = 0; j < 3; j++)
       begin
           redLeds[j+1][0]=1;
       end
       redLeds[3][1]=1;
    end
    
    else
    begin
       for(int i = 1; i < 6; i++)
       begin
          for(int j = 0; j < 3; j++)
          begin
             greenLeds[i][j]=1;
          end
       end
    end
       
    blueLeds[3][3] = 1;   
    blueLeds[3][4] = 1;
    
    if(p2score == 0)
    begin
       for(int i = 5; i < 8; i++)
       begin
         redLeds[1][i] = 1;
         redLeds[5][i] = 1;
         redLeds[i-3][5] = 1;
         redLeds[i-3][7] = 1;
       end
    end
    
    else if(p2score == 1)
        begin
           for(int i = 0; i < 5; i++)
           begin
             redLeds[i+1][6] = 1;
           end
        end
    
    else if(p2score == 2)
    begin
       for(int i = 5; i < 8; i++)
       begin
         redLeds[1][i] = 1;
         redLeds[3][i] = 1;
         redLeds[5][i] = 1;
       end
         redLeds[2][7] = 1;
         redLeds[4][5] = 1;
    end
    
    else if(p2score == 3)
    begin
       for(int i = 0; i < 5; i++)
       begin
           redLeds[i+1][7] = 1;
       end
       for(int j = 5; j < 7; j++)
       begin
           redLeds[1][j] = 1;
           redLeds[3][j] = 1;
           redLeds[5][j] = 1;
       end
    end
    
    else if(p2score == 4)
    begin
       for(int i = 0; i < 5; i++)
       begin
           redLeds[i+1][7] = 1;
       end
       for(int j = 0; j < 3; j++)
       begin
           redLeds[j+1][5]=1;
       end
       redLeds[3][6]=1;
    end
    
    else
    begin
       for(int i = 1; i < 6; i++)
       begin
          for(int j = 5; j < 8; j++)
          begin
             greenLeds[i][j]=1;
          end
       end
    end
    
end
endtask
  
  
task updateSets();
begin
    
    if(total1 == 0)
        set1 = 5'b00000;
    else if(total1 == 5)
        set1 = 5'b10000;
    else if(total1 == 10)
        set1 = 5'b11000;
    else if(total1 == 15)
        set1 = 5'b11100;
    else if(total1 == 20)
        set1 = 5'b11110;
       
    if(total2 == 0)
        set2 = 5'b00000;
    else if(total2 == 5)
        set2 = 5'b00001;
    else if(total2 == 10)
        set2 = 5'b00011;
    else if(total2 == 15)
        set2 = 5'b00111;
    else if(total2 == 20)
        set2 = 5'b01111;
end
endtask  
  
task updateBallMovement( int x, int y);
begin                  
          if(x == 0)
          begin
              if( pad1x != curry & pad1y != curry & pad1z != curry )
              begin
                currx = 2;
                curry = 1;
                up = 1;
                right = 0;
                if(p1score == 4)
                  begin
                      p1score = 0;
                      p2score = 0;
                      if(total1 == 25)
                          total1 = 0;
                      else
                      begin
                          total1 = total1 + 5;
                      end
                  end
                  else
                      p1score = p1score + 1;
              end
              else  
              begin
                 if(curry==pad1x)
                 begin
                    right = -1;
                    up = 1;
                 end
                 else if(curry == pad1y)
                 begin
                   right = 0;
                   up = 1;
                 end
                 else
                 begin
                   right = 1;
                   up = 1;
                 end
             end
          end
          if(x == 7)
          begin
              if( pad2x != curry & pad2y != curry & pad2z != curry )
              begin
                    currx = 5;
                    curry = 5;
                    up = -1;
                    right = 0;
                    if(p2score == 4)
                    begin
                        p1score = 0;
                        p2score = 0;
                        if(total2 == 25)
                            total2 = 0;
                        else
                        begin
                            total2 = total2 + 5;
                        end
                    end
                    else
                        p2score = p2score + 1;
              end
              else
              begin
                 if(curry==pad2x)
                 begin
                    right = -1;
                    up = -1;
                 end
                 else if(curry == pad2y)
                 begin
                   right = 0;
                   up = -1;
                 end
                 else
                 begin
                   right = 1;
                   up = -1;
                 end
             end
          end
          
          if(y == 0)
              right = 1;
          if(y == 7)
              right = -1;
            
           currx = currx + up;
           curry = curry + right; 
           updateSets(); 
   end                          
endtask     
   
   
task updateBoard();
      for(int i = 0; i < 8; i++)
      begin
         int k = 0;
         for(int j = 7; j >= 0; j--)
         begin
              board[i][k] = blueLeds[j][7 - i];
              k++;
         end
         for(int j = 7; j >= 0; j--)
         begin
              board[i][k] = greenLeds[j][7 - i];
              k++;
         end
         for(int j = 7; j >= 0; j--)
         begin
              board[i][k] = redLeds[j][7 - i];
              k++;
         end
         k = 0;
      end
endtask 
  
timeProvider timer1( CLK, reset, speed2, speed1, speed0, timer );
Matrix ma(CLK, board, row, SH_CP, ST_CP, MR, OE, DS);
SevSeg_4digit seven( CLK,
  p1score, 10, 10, p2score,// 4 values for 4 digits (decimal value)
  a, b, c, d, e, f, g, dp, //individual LED output for the 7-segment along with the digital point
  an );   
endmodule