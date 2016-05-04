`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:59:36 04/27/2016 
// Design Name: 
// Module Name:    Flip_Flop 
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
module Flip_Flop(
    input clk,
    input d,
    input rst,
    output reg q
    );

	 always @(posedge clk)
	 if (rst) 
	 q <= 0;
	 else
	 q <= d;
    
endmodule
