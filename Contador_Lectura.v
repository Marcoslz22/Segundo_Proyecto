`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:26:36 04/05/2016 
// Design Name: 
// Module Name:    Contador_Lectura 
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
module Contador_Lectura(
    input rst,
    input en,
    input W_R,
    input clk,
	 input [3:0] c_5,
    output reg [4:0] c_3
    );
	 
	 
    always @(posedge clk)
         if (!en || !W_R || rst)
            c_3 <= 5'd0;
         else if (en && W_R)
		           begin
				           if (c_3 == 5'd17)
							     if (c_5 == 4'd4)
					           c_3 <= 5'd0;
								  else c_3 <= c_3;
						     else 
							     if (c_5 == 4'd4)
						        c_3 <= c_3 + 5'd1; 
								  else c_3 <= c_3;
				     end
				   else c_3 <= c_3;
						

endmodule
