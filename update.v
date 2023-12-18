`timescale 1ns/1ps
module update (
	input OK_button, reset,
	input valid_move,
    input [3:0] count,
	input [17:0] next_move,
	output reg [17:0] curr_move,

    input [2:0] temp_state,
    input [2:0] next_state,
    output reg [2:0] curr_state,

	input [1:0] next_turn,
	output reg [1:0] curr_turn
);

  parameter 	A = 2'b01,		// 1
              B = 2'b10;		// 2

  parameter   INIT = 3'b000, // 0
              PLAY = 3'b001, // 1
              Awin = 3'b010, // 2
              Bwin = 3'b011, // 3
              DRAW = 3'b100; // 4
  always @(count)//only for time out case
  begin
    if(temp_state==PLAY)
      begin
        if(count == 4'b000 && curr_turn == B )
         curr_state <= Awin;
        else
          if(count == 4'b000 && curr_turn == A )
         curr_state <= Bwin;
      end 
  end 
  always @(posedge OK_button or posedge reset)
  begin
      if (reset)
        begin
          if(temp_state!=INIT)
          begin
              curr_move <= 18'd0;
              curr_state <= DRAW;
              curr_turn <= A;
            $write("button reset is pressed\n");
          end
        end
      else
        if (temp_state != PLAY)
        begin
            curr_move = 18'd0;
            curr_state = PLAY;
            curr_turn = A;
          $write("Game Start\n");
        end
      else
        if (valid_move)//press OK_button to confirm which cell to move
          begin
            if (curr_turn == A) 
              $write("Player A moved to cell %b\n",next_move[8:0]);                
            else             
              $write("Player B moved to cell %b\n",next_move[17:9]);
            curr_move = next_move;
            curr_state = next_state;
            curr_turn = (2'b11)^next_turn;
          end
  end

endmodule



