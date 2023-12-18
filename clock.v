`timescale 1ns/1ps
module Counter (
  input clk,        // Xung clock input  
  input [3:0] initialTime,
  input [2:0] state,
  input [1:0] turn,
  output reg [3:0] count // counet input
);

  parameter   INIT = 3'b000, // 0
              PLAY = 3'b001, // 1
              Awin = 3'b010, // 2
              Bwin = 3'b011, // 3
              DRAW = 3'b100; // 4

  // quy dinh trang thai bo dem
  always @(posedge clk or state) begin
    if (state != PLAY)      // start
      begin
      count = initialTime; // Reset counter
        $write("INACTIVE clock\n");
      end
    else// clck 0->1
      if(clk)//playMode
      begin
        count = count - 1; // giam gia tri bo dem
        $write("time left: %d\n", count);
        if(count<0) count = initialTime;
      end
  end
  always @(turn) begin
      if (state == PLAY)      // change turn
      begin
      count = initialTime; // Reset counter
      end
  end

endmodule