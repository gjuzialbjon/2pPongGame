# Clock signal 
set_property PACKAGE_PIN W5 [get_ports CLK]  	 	 	 	  
 	set_property IOSTANDARD LVCMOS33 [get_ports CLK] 
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports CLK] 
    
# Switches 
set_property PACKAGE_PIN V17 [get_ports {Stop}] 	 	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports {Stop}] 
set_property PACKAGE_PIN W19 [get_ports {P1L}] 	 	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports {P1L}] 
set_property PACKAGE_PIN T18 [get_ports {P1R}] 	 	 	 	 	 
 	set_property IOSTANDARD LVCMOS33 [get_ports {P1R}] 
set_property PACKAGE_PIN U17 [get_ports {P2L}] 	 	 	 	 	 
    set_property IOSTANDARD LVCMOS33 [get_ports {P2L}] 
set_property PACKAGE_PIN T17 [get_ports {P2R}]                          
    set_property IOSTANDARD LVCMOS33 [get_ports {P2R}] 
 set_property PACKAGE_PIN U18 [get_ports {reset}] 	 	 	 	 	 
    set_property IOSTANDARD LVCMOS33 [get_ports {reset}] 
set_property PACKAGE_PIN R2 [get_ports {speed2}] 	 	 	 	 	 
    set_property IOSTANDARD LVCMOS33 [get_ports {speed2}] 
set_property PACKAGE_PIN T1 [get_ports {speed1}]                          
    set_property IOSTANDARD LVCMOS33 [get_ports {speed1}] 
set_property PACKAGE_PIN U1 [get_ports {speed0}]                          
    set_property IOSTANDARD LVCMOS33 [get_ports {speed0}] 
 	
 	
set_property PACKAGE_PIN L1 [get_ports {set1[4]}]                          
    set_property IOSTANDARD LVCMOS33 [get_ports {set1[4]}]
set_property PACKAGE_PIN P1 [get_ports {set1[3]}]                          
    set_property IOSTANDARD LVCMOS33 [get_ports {set1[3]}] 
set_property PACKAGE_PIN N3 [get_ports {set1[2]}]                          
    set_property IOSTANDARD LVCMOS33 [get_ports {set1[2]}] 
set_property PACKAGE_PIN P3 [get_ports {set1[1]}]                          
    set_property IOSTANDARD LVCMOS33 [get_ports {set1[1]}] 
set_property PACKAGE_PIN U3 [get_ports {set1[0]}]                          
    set_property IOSTANDARD LVCMOS33 [get_ports {set1[0]}] 
set_property PACKAGE_PIN W18 [get_ports {set2[4]}]                          
    set_property IOSTANDARD LVCMOS33 [get_ports {set2[4]}] 
set_property PACKAGE_PIN V19 [get_ports {set2[3]}]                          
    set_property IOSTANDARD LVCMOS33 [get_ports {set2[3]}] 
set_property PACKAGE_PIN U19 [get_ports {set2[2]}]                          
    set_property IOSTANDARD LVCMOS33 [get_ports {set2[2]}] 
set_property PACKAGE_PIN E19 [get_ports {set2[1]}]                          
    set_property IOSTANDARD LVCMOS33 [get_ports {set2[1]}] 
set_property PACKAGE_PIN U16 [get_ports {set2[0]}]                          
    set_property IOSTANDARD LVCMOS33 [get_ports {set2[0]}]   	
 	
 	
##Pmod Header JB 
#Sch name = row1 
set_property PACKAGE_PIN A14 [get_ports {row[0]}]                      
     set_property IOSTANDARD LVCMOS33 [get_ports {row[0]}] 
##Sch name = row2 
set_property PACKAGE_PIN A16 [get_ports {row[1]}]                      
     set_property IOSTANDARD LVCMOS33 [get_ports {row[1]}] 
##Sch name = row3 
set_property PACKAGE_PIN B15 [get_ports {row[2]}]                      
     set_property IOSTANDARD LVCMOS33 [get_ports {row[2]}] 
     
set_property PACKAGE_PIN B16 [get_ports {row[3]}]                      
     set_property IOSTANDARD LVCMOS33 [get_ports {row[3]}] 
##Sch name = row7 
set_property PACKAGE_PIN A15 [get_ports {row[4]}]                      
     set_property IOSTANDARD LVCMOS33 [get_ports {row[4]}] 
##Sch name = row8 
set_property PACKAGE_PIN A17 [get_ports {row[5]}]                      
     set_property IOSTANDARD LVCMOS33 [get_ports {row[5]}] 
##Sch name = row9 
set_property PACKAGE_PIN C15 [get_ports {row[6]}]                      
     set_property IOSTANDARD LVCMOS33 [get_ports {row[6]}] 
##Sch name = row10  
set_property PACKAGE_PIN C16 [get_ports {row[7]}]                      
     set_property IOSTANDARD LVCMOS33 [get_ports {row[7]}] 
  
##Pmod Header JC 
##Sch name = JC1 
set_property PACKAGE_PIN K17 [get_ports DS]                      
     set_property IOSTANDARD LVCMOS33 [get_ports DS] 
##Sch name = JC2 
set_property PACKAGE_PIN M18 [get_ports OE]                      
     set_property IOSTANDARD LVCMOS33 [get_ports OE] 
##Sch name = JC3 
set_property PACKAGE_PIN N17 [get_ports ST_CP]                      
     set_property IOSTANDARD LVCMOS33 [get_ports ST_CP] 
##Sch name = JC4 
set_property PACKAGE_PIN P18 [get_ports SH_CP]                      
     set_property IOSTANDARD LVCMOS33 [get_ports SH_CP] 
##Sch name = JC7 
set_property PACKAGE_PIN L17 [get_ports MR]                      
     set_property IOSTANDARD LVCMOS33 [get_ports MR]
     
     
#7 segment display 
     set_property PACKAGE_PIN W7 [get_ports {a}]                          
          set_property IOSTANDARD LVCMOS33 [get_ports {a}] 
     set_property PACKAGE_PIN W6 [get_ports {b}]                          
          set_property IOSTANDARD LVCMOS33 [get_ports {b}] 
     set_property PACKAGE_PIN U8 [get_ports {c}]                          
          set_property IOSTANDARD LVCMOS33 [get_ports {c}] 
     set_property PACKAGE_PIN V8 [get_ports {d}]                          
          set_property IOSTANDARD LVCMOS33 [get_ports {d}] 
     set_property PACKAGE_PIN U5 [get_ports {e}]                          
          set_property IOSTANDARD LVCMOS33 [get_ports {e}] 
     set_property PACKAGE_PIN V5 [get_ports {f}]                          
          set_property IOSTANDARD LVCMOS33 [get_ports {f}] 
     set_property PACKAGE_PIN U7 [get_ports {g}]                          
          set_property IOSTANDARD LVCMOS33 [get_ports {g}] 
     set_property PACKAGE_PIN V7 [get_ports dp]                       
          set_property IOSTANDARD LVCMOS33 [get_ports dp] 
     set_property PACKAGE_PIN U2 [get_ports {an[0]}]                          
          set_property IOSTANDARD LVCMOS33 [get_ports {an[0]}] 
     set_property PACKAGE_PIN U4 [get_ports {an[1]}]                          
          set_property IOSTANDARD LVCMOS33 [get_ports {an[1]}] 
     set_property PACKAGE_PIN V4 [get_ports {an[2]}]                          
          set_property IOSTANDARD LVCMOS33 [get_ports {an[2]}] 
     set_property PACKAGE_PIN W4 [get_ports {an[3]}]                          
          set_property IOSTANDARD LVCMOS33 [get_ports {an[3]}]