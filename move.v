`timescale 1ns/1ps
module check_move(
	input [1:0] turn,
    input [2:0] state,
	input [17:0] curr_move,
	input [17:0] next_move,
	output reg valid_move,
    output reg[8*20:0] report
);

parameter 	A = 2'b01,		// 1
			B = 2'b10;		// 2

  parameter   INIT = 3'b000, // 0
              PLAY = 3'b001, // 1
              Awin = 3'b010, // 2
              Bwin = 3'b011, // 3
              DRAW = 3'b100; // 4

integer tempA, tempB, i, j;
reg check_st, check_mr, check_rm, check_wm, check_wt;

always @(next_move)
begin
  if(curr_move!=next_move)//avoid before first Move
     begin
        tempA = 0;
        tempB = 0;
        for (i = 0; i < 9; i = i + 1)
          begin
            tempA = tempA + (next_move[i] ^ curr_move[i]);
          end

        for (j = 9; j < 18; j = j + 1)
          begin
            tempB = tempB + (next_move[j] ^ curr_move[j]);
          end

        if (state != PLAY)
          begin
            valid_move = 1'b0;
            //report = "Not in Play Mode";
            $write("Not in Play Mode\n");
          end
        else if ((tempA + tempB) != 1)
          begin
            valid_move = 1'b0;
            //report = "have one and only one player can move in a turn\n ";
            $write("have one and only one player can move in a turn\n");  
          end
        else if (curr_move > next_move)
          begin
            valid_move = 1'b0;
            //report = "canot delete moved cell";
            $write("canot delete moved cell\n");
          end 
        else if ((next_move[17:9] & next_move[8:0]) != 0)
          // true: bit trong next_move[17:9] bang 1 thi bit tuong ung trong next_move[8:0] bang 0 (1 cell thi chi co A hoac B chiem dc)
          // =>> "and" phai ra 0
          begin
            //report = "this cell not empty";
            $write("this cell not empty\n"); 
            valid_move = 1'b0;
          end
        else if (((tempA == 1) && (turn != A)) || ((tempB == 1) && (turn != B)))
          // TH: di khong dung luot
          begin
            valid_move = 1'b0;
            //report = "not your turn";
            $write("not your turnn\n"); 
          end
        else
          valid_move = 1'b1;
    end
end

endmodule