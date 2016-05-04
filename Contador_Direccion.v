`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:14:42 04/03/2016 
// Design Name: 
// Module Name:    Contador_Direccion 
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
module Contador_Direccion(
    input I,
	 input rst,
    input D,
    input clk,
    input W_R,
    input en,
    output reg [3:0] c_1
    );
	 
	  reg estado = 1'd0;
	 reg estado2 = 1'd0;
	 wire en_2;
	 
	 assign en_2 = ~W_R; 
	 
    always @(posedge clk)
      if (W_R || rst)
         c_1 <= 4'd0;
      else if (en && en_2)
		        begin
				  if (D)
				  begin
						
						  if (!estado)
						
						  begin
						   estado <= 1'd1;
				         if (c_1 == 4'd8)
						   c_1 <= 4'd0;
						   else 
						   c_1 <= c_1 + 1'd1;
				        end
						
						else  c_1 <= c_1;
						
				  end
				  else 
				  begin
				  estado <= 1'd0;
				  if (I)
		                begin
							 
							 if (!estado2)
							 
							   begin
							   estado2 <= 1'd1;
							   if (!c_1)
							   c_1 <= 4'd8;
							   else
                        c_1 <= c_1 - 1'd1;	
							   end
							 
							 else
							 
							   begin
						      c_1 <= c_1;						 
							   end
							 
							 end
					else estado2 <= 1'd0;
        	end
			end

endmodule

