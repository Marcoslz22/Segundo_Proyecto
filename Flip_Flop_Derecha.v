`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:02:56 04/27/2016 
// Design Name: 
// Module Name:    Flip_Flop_Derecha 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Flip_Flop_Derecha(
    input clk,
    input d,
    input rst,
    output qq
    );
	 wire q1,q2,q3,q4,q5,q6,q7,q8,q9,q10,q11;
	 
	 Flip_Flop F1 (.clk(clk),.d(d),.rst(rst),.q(q1));
	 Flip_Flop_D1 F2 (.clk(clk),.d(q1),.rst(rst),.q(q2));
	 Flip_Flop_D2 F3 (.clk(clk),.d(q2),.rst(rst),.q(q3));
	 Flip_Flop_D3 F4 (.clk(clk),.d(q3),.rst(rst),.q(q4));
	 Flip_Flop_D4 F5 (.clk(clk),.d(q4),.rst(rst),.q(q5));
	 Flip_Flop_D5 F6 (.clk(clk),.d(q5),.rst(rst),.q(q6));
	 Flip_Flop_D6 F7 (.clk(clk),.d(q5),.rst(rst),.q(q7));
	 Flip_Flop_D7 F8 (.clk(clk),.d(q5),.rst(rst),.q(q8));
	 Flip_Flop_D8 F9 (.clk(clk),.d(q5),.rst(rst),.q(q9));
	 Flip_Flop_D9 F10 (.clk(clk),.d(q5),.rst(rst),.q(q10));
	 Flip_Flop_D10 F11 (.clk(clk),.d(q5),.rst(rst),.q(q11));
	 
	 assign qq = q1 & q2 & q3 & q4 & q5 & q6 & q7 & q8 & q9 &q10 &q11;


endmodule
