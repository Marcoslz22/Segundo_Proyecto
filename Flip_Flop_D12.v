`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:29:16 03/11/2016 
// Design Name: 
// Module Name:    Flip_Flop_D7 
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
module Flip_Flop_D12(
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
