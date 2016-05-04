`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:10:13 04/26/2016 
// Design Name: 
// Module Name:    Deco_Letur 
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
module Deco_Lectura(
     input clk,
     input en,
	  input c_s,
	  input [4:0] cuenta,
	  input A_D,
	  output reg [7:0] salida
    );
	 
	 always @(posedge clk or negedge clk)
	    if (!en)
		 begin
		    if (c_s)
			    salida = salida;
			 else
			 begin
			    if (A_D)
			       salida = 8'd255;
				 else
				 begin
		          case (cuenta)
			         5'd0: salida = 8'd67;
			         5'd1: salida = 8'd240;
			         5'd2: salida = 8'd33;
			         5'd3: salida = 8'd240;
			         5'd4: salida = 8'd34;
			         5'd5: salida = 8'd240;
			         5'd6: salida = 8'd35;
			         5'd7: salida = 8'd240;
			         5'd8: salida = 8'd36;
			         5'd9: salida = 8'd240;
			         5'd10: salida = 8'd37;
			         5'd11: salida = 8'd240;
			         5'd12: salida = 8'd38;
			         5'd13: salida = 8'd240;
			         5'd14: salida = 8'd65;
			         5'd15: salida = 8'd240;
			         5'd16: salida = 8'd66;
				      5'd17: salida = 8'd240;
			         default: salida = 8'd255;
                 endcase
			 end
		 end
	  end
		 else salida = 8'd255;
endmodule
