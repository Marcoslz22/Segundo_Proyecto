`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:44:18 04/26/2016 
// Design Name: 
// Module Name:    MUX_CHIP 
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
module MUX_CHIP(
	 input clk,
    input [7:0] chip,
	 input A_D,
	 output reg[7:0]chip_vga
	 );
	 
	 always @(posedge clk or negedge clk)
	 if (A_D)
	 chip_vga <= chip;
	 else 
	 chip_vga <= chip_vga;
endmodule
