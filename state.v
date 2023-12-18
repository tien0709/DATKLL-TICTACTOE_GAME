`timescale 1ns/1ps
module check_state (//state when moving, case timeout be processed in update.sv
	input [17:0] move,//8 bit dau cho B, 8 bit sau cho A
    input [1:0] turn,
    input [2:0] temp_state,
    output reg [2:0] next_state
);

parameter 	A = 2'b01,		// 1
			B = 2'b10;		// 2

  parameter   INIT = 3'b000, // 0
              PLAY = 3'b001, // 1
              Awin = 3'b010, // 2
              Bwin = 3'b011, // 3
              DRAW = 3'b100; // 4

always @(*)
begin // array 3x3
	if (
			(move[0] && move[1] && move[2]) ||//row1
			(move[3] && move[4] && move[5]) ||//row2
			(move[6] && move[7] && move[8]) ||//row3
			(move[0] && move[3] && move[6]) ||//col1
			(move[1] && move[4] && move[7]) ||//col2
			(move[2] && move[5] && move[8]) ||//col3
			(move[0] && move[4] && move[8]) ||//duong cheo 1
			(move[2] && move[4] && move[6])   //duong chel 2
		)
			next_state = Awin;
	else
	if (
			(move[09] && move[10] && move[11]) ||
			(move[12] && move[13] && move[14]) ||
			(move[15] && move[16] && move[17]) ||
			(move[09] && move[12] && move[15]) ||
			(move[10] && move[13] && move[16]) ||
			(move[11] && move[14] && move[17]) ||
			(move[09] && move[13] && move[17]) ||
			(move[11] && move[13] && move[15])
		)
			next_state = Bwin;
	else
	  if (move == (-18'd1))
			next_state = DRAW;
    else 
      begin 
        next_state = temp_state;
      end
end

endmodule