`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:51:46 04/07/2016 
// Design Name: 
// Module Name:    Contador_Inicializacion 
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
module Contador_Inicializacion(
    input rst,
    input clk,
    input [3:0] c_5,
    output reg en,
    output reg [2:0] c_4
    );
	 
	 reg doble = 1'd0;
	 
    always @(posedge clk)
	    
	    if (!rst)
		 begin
		  c_4 <= 3'd0;
		  en <= 1'd1;
		  doble <= 1'd0;
		 end
	    else 
		 begin
		 en <= 0;
		 if (c_4 == 3'd4)
		      begin
				 if (doble) en <= 1;
				 else 
				 begin
				   if (c_5 == 4'd4)
					begin
					   if (!doble)
						begin
		               c_4 <= 3'd0;
						   doble <= 1'd1;
						   en <= 0;
					   end 
						else 
						   begin
						   c_4 <= c_4;
							en <= 1;
							end
					end 
					else c_4 <= c_4;
					end
				end
				else if (c_5 == 4'd4)
				     begin
					     c_4 <= c_4 + 3'd1;
					     en <= 1'd0;
					  end
					  else c_4 <= c_4;
		  end 
endmodule   
