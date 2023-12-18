// Code your design here
`include "clock.sv"
`include "update.sv"
`include "move.sv"
`include "state.sv"
`timescale 1ns/1ps
module tic_tac_toe (
	input [8:0] A_move, B_move,
    input clk,
	input OK_btn, reset,
	output [8:0] A_state, B_state,
    output reg[8*20:0] result
);

  parameter 	A = 2'b01,		// 1
              B = 2'b10;		// 2

  parameter   INIT = 3'b000, // 0
              PLAY = 3'b001, // 1
              Awin = 3'b010, // 2
              Bwin = 3'b011, // 3
              DRAW = 3'b100; // 4

  wire 	[17:0] curr_move;
  reg 	[17:0] temp_move;
  wire 	[17:0] next_move = {B_move, A_move};

  wire 	[2:0] curr_state;
  reg 	[2:0] temp_state;
  wire 	[2:0] next_state;

  wire 	[1:0] curr_turn;
  reg 	[1:0] temp_turn;

  wire 	[3:0] count;
  wire valid_move;
 // wire [8*20:0] report;

  initial
  begin
    $display("Initial Game");
      temp_move = 18'd0;
      temp_state = INIT;
      temp_turn = A;
  end
  
  Counter SM4 (
    .clk(clk), 
    .state(temp_state),
    .initialTime(4'b1010),
    .count(count),
    .turn(temp_turn)
  );
  

  check_move SM1 (
      .turn(temp_turn),
      .state(temp_state),
      .curr_move(temp_move),
      .next_move(next_move),
      .valid_move(valid_move)
  );
    //.report(report)
  check_state SM2 (
      .turn(temp_turn),
      .move(next_move),
      .temp_state(temp_state),
      .next_state(next_state)
  );

  update SM3 (
      .OK_button(OK_btn),
      .reset(reset),
      .valid_move(valid_move),
      .next_move(next_move),
      .curr_move(curr_move),
      .count(count),
    
      .temp_state(temp_state),
      .next_state(next_state),
      .curr_state(curr_state),

      .next_turn(temp_turn),
      .curr_turn(curr_turn)
  );
  
  always @(curr_move)		temp_move <= curr_move;
  always @(curr_state or curr_turn)
    begin
      //if(temp_state==PLAY)
          temp_turn = curr_turn;
      temp_state = curr_state;
      assign  result =   
        (temp_state == Awin) ? "A win" :
        (temp_state == Bwin) ? "B win" :
        (temp_state == DRAW) ? "draw" :
        (temp_turn == A) ? "A turn " : "B turn ";
      $write("%s\n", result);
    end

  assign A_state = temp_move[8:0];
  assign B_state = temp_move[17:9];

endmodule







