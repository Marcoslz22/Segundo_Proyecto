`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:06:13 04/11/2016 
// Design Name: 
// Module Name:    Buffer_Triestado_Entrada 
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
module Buffer_Triestado_Entrada(
    input en,
    input [7:0] Chip_out,
    output [7:0] RTC_in
    );
    
	 assign RTC_in = en ? Chip_out : 8'bz; 

endmodule
