`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:04:01 04/26/2016 
// Design Name: 
// Module Name:    Deco_Inicializacion 
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
module Deco_Inicializacion(
	  input clk,
     input en,
	  input c_s,
	  input [2:0] cuenta,
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
				 begin
				    case (cuenta)
			          3'd0: salida = 8'b00000010;
			          3'd1: salida = 8'd210;
			          3'd2: salida = 8'b00010100;
			          3'd3: salida = 8'b00000100;
				       3'd4: salida = 8'd00000000;
			          default: salida = 8'd255;
                endcase	
				 end
				 else
				 begin
				    case (cuenta)
			          3'd0: salida = 8'd0;
			          3'd1: salida = 8'd16;
			          3'd2: salida = 8'd2;
			          3'd3: salida = 8'd2;
				       3'd4: salida = 8'd1;
			         default: salida = 8'd255;
				    endcase
				 end
			 end
		 end
		 else salida = 8'd255;
	    

endmodule
