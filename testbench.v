// Code your testbench here
// or browse Examples
`timescale 1ms / 1ms
module tic_tac_toe_tb  ; 

  parameter A  = 2'b01 ;
  parameter B  = 2'b10 ;
  
  parameter   INIT = 3'b000, // 0
  PLAY = 3'b001, // 1
  Awin = 3'b010, // 2
  Bwin = 3'b011, // 3
  DRAW = 3'b100; // 4
  
  reg  [8:0]  A_move   ; 
  reg  [8:0]  B_move   ;  
  reg    OK_btn   ;
  reg clk;
  reg    reset   ; 
  wire  [8:0]  A_state   ;
  wire  [8:0]  B_state   ; 
  wire  [160:0]  result   ; 
  
  tic_tac_toe    #(A , B , INIT, PLAY , Awin , Bwin , DRAW )
   DUT  ( 
       .B_move (B_move ) ,
      .A_state (A_state ) ,
      .OK_btn (OK_btn ) ,
      .B_state (B_state ) ,
      .result (result ) ,
      .reset (reset ) ,
      .A_move (A_move ),
      .clk(clk)
   ); 





// "Constant Pattern"
// Start Time = 870 ns, End Time = 1 us, Period = 0 ns
  // time out
  initial
  begin
	 
    
    // case1 : time out at turn B
    
      B_move  = 9'b000000000  ;
      A_move  = 9'b000000000  ;
    
      #1000 OK_btn = 1'b1;
      #10 OK_btn = 1'b0;
    
      #3000 A_move  = 9'b000000001  ;
            OK_btn = 1'b1;
      #10 OK_btn = 1'b0;
      #2000 B_move  = 9'b000000010  ;
            OK_btn = 1'b1;
      #10 OK_btn = 1'b0;
      #1000 A_move  = 9'b000010001  ;
        OK_btn = 1'b1;             
      #10 OK_btn = 1'b0;
    
      #11000   OK_btn = 1'b1;             
      #10 OK_btn = 1'b0;
    
   //case2: Player win because moved cells: 0,4,8
    
      B_move  = 9'b000000000  ;
      A_move  = 9'b000000000  ;
         
      #1000 A_move  = 9'b000000001  ;
       OK_btn = 1'b1;             
      #10 OK_btn = 1'b0;
    
      #2000 B_move  = 9'b000000010  ;
       OK_btn = 1'b1;             
      #10 OK_btn = 1'b0; 
    
      #3000 A_move  = 9'b000010001  ;
       OK_btn = 1'b1;             
      #10 OK_btn = 1'b0;
    
      #1000 B_move  = 9'b000000110  ;
       OK_btn = 1'b1;             
      #10 OK_btn = 1'b0;
    
      #3000 A_move  = 9'b100010001  ;
       OK_btn = 1'b1;             
      #10 OK_btn = 1'b0;
    
       //case3: press RESET button
    
      B_move  = 9'b000000000  ;
      A_move  = 9'b000000000  ;
    
      #3000 OK_btn = 1'b1;             
      #10 OK_btn = 1'b0;
         
      #1000 A_move  = 9'b000000001  ;
       OK_btn = 1'b1;             
      #10 OK_btn = 1'b0;
    
      #2000 B_move  = 9'b000000010  ;
       OK_btn = 1'b1;             
      #10 OK_btn = 1'b0; 
    
      #3000 reset = 1'b1;             
      #10 reset = 1'b0;
    
    //case4: moved to not Empty Cell and Player A moving while Turn of B
    
      B_move  = 9'b000000000  ;
      A_move  = 9'b000000000  ;
    
      #3000 OK_btn = 1'b1;             
      #10 OK_btn = 1'b0;
         
      #1000 A_move  = 9'b000000001  ;
       OK_btn = 1'b1;             
      #10 OK_btn = 1'b0;
    
      #2000 B_move  = 9'b000000001  ;
       OK_btn = 1'b1;             
      #10 OK_btn = 1'b0; 
    
      #3000 A_move  = 9'b000000010  ;
       OK_btn = 1'b1;          
      #10 OK_btn = 1'b0; 
    
    
    
    
     

// dumped values till 1 us
  end

// "Clock Pattern" : dutyCycle = 20

  
  initial
  begin
	  clk  = 1'b0  ;
      #1000 clk  = 1'b1  ;//1's
      #10 clk = 1'b0;
    
      #990 clk  = 1'b1  ;//2's
      #10 clk = 1'b0;

      #990 clk  = 1'b1  ;
      #10 clk = 1'b0;

      #990 clk  = 1'b1  ;
      #10 clk = 1'b0;

      #990 clk  = 1'b1  ;
      #10 clk = 1'b0;	
    
      #990 clk  = 1'b1  ;
      #10 clk = 1'b0;
    
      #990 clk  = 1'b1  ;
      #10 clk = 1'b0;

      #990 clk  = 1'b1  ;
      #10 clk = 1'b0;

      #990 clk  = 1'b1  ;
      #10 clk = 1'b0;

      #990 clk  = 1'b1  ;
      #10 clk = 1'b0;

      #990 clk  = 1'b1  ;
      #10 clk = 1'b0;

      #990 clk  = 1'b1  ;
      #10 clk = 1'b0;

      #990 clk  = 1'b1  ;
      #10 clk = 1'b0;

      #990 clk  = 1'b1  ;
      #10 clk = 1'b0;

      #990 clk  = 1'b1  ;
      #10 clk = 1'b0;

      #990 clk  = 1'b1  ;
      #10 clk = 1'b0;

      #990 clk  = 1'b1  ;
      #10 clk = 1'b0;
    
      #990 clk  = 1'b1  ;
      #10 clk = 1'b0;
    
      #990 clk  = 1'b1  ;
      #10 clk = 1'b0;
    
      #990 clk  = 1'b1  ;
      #10 clk = 1'b0;
    
      #990 clk  = 1'b1  ;
      #10 clk = 1'b0;
    
      #990 clk  = 1'b1  ;
      #10 clk = 1'b0;
    
      #990 clk  = 1'b1  ;
      #10 clk = 1'b0;
    
      #990 clk  = 1'b1  ;
      #10 clk = 1'b0;
    
      #990 clk  = 1'b1  ;
      #10 clk = 1'b0;
    
      #990 clk  = 1'b1  ;
      #10 clk = 1'b0;
    
      #990 clk  = 1'b1  ;
      #10 clk = 1'b0;
    
      #990 clk  = 1'b1  ;
      #10 clk = 1'b0;
    
      #990 clk  = 1'b1  ;
      #10 clk = 1'b0;
    
      #990 clk  = 1'b1  ;
      #10 clk = 1'b0;
    
      #990 clk  = 1'b1  ;
      #10 clk = 1'b0;
    
      #990 clk  = 1'b1  ;
      #10 clk = 1'b0;
    
      #990 clk  = 1'b1  ;
      #10 clk = 1'b0;
    
      #990 clk  = 1'b1  ;
      #10 clk = 1'b0;
    
      #990 clk  = 1'b1  ;
      #10 clk = 1'b0;
    
      #990 clk  = 1'b1  ;
      #10 clk = 1'b0;
    
      #990 clk  = 1'b1  ;
      #10 clk = 1'b0;
    
      #990 clk  = 1'b1  ;
      #10 clk = 1'b0;
    
      #990 clk  = 1'b1  ;
      #10 clk = 1'b0;
    
      #990 clk  = 1'b1  ;
      #10 clk = 1'b0;
    
      #990 clk  = 1'b1  ;
      #10 clk = 1'b0;
    
      #990 clk  = 1'b1  ;
      #10 clk = 1'b0;
    
      #990 clk  = 1'b1  ;
      #10 clk = 1'b0;
    
      #990 clk  = 1'b1  ;
      #10 clk = 1'b0;
    
      #990 clk  = 1'b1  ;
      #10 clk = 1'b0;
    
      #990 clk  = 1'b1  ;
      #10 clk = 1'b0;
    
      #990 clk  = 1'b1  ;
      #10 clk = 1'b0;
    
      #990 clk  = 1'b1  ;
      #10 clk = 1'b0;
    
      #990 clk  = 1'b1  ;
      #10 clk = 1'b0;
    
    
      #990 clk  = 1'b1  ;//50's
      #10 clk = 1'b0;
    
      #990 clk  = 1'b1  ;
      #10 clk = 1'b0;
    
      #990 clk  = 1'b1  ;
      #10 clk = 1'b0;
    
      #990 clk  = 1'b1  ;
      #10 clk = 1'b0;
    
      #990 clk  = 1'b1  ;
      #10 clk = 1'b0;
    
      #990 clk  = 1'b1  ;
      #10 clk = 1'b0;
    
      #990 clk  = 1'b1  ;
      #10 clk = 1'b0;
    
      #990 clk  = 1'b1  ;
      #10 clk = 1'b0;
    
      #990 clk  = 1'b1  ;
      #10 clk = 1'b0;
    
      #990 clk  = 1'b1  ;
      #10 clk = 1'b0;
    
      #990 clk  = 1'b1  ;
      #10 clk = 1'b0;
// dumped values till 1 us
  end
  
  initial
	#60000 $stop;
  
endmodule