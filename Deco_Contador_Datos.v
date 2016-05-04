`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:14:56 04/03/2016 
// Design Name: 
// Module Name:    Deco_Contador_Datos 
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
module Deco_Contador_Datos(
    input [3:0] c_1,
    input en,
    output reg [6:0] condicion_c_2
    );
	 
	 always @(*)
	    begin
		  if (en)
		  begin
	      case (c_1)
			  4'd0: condicion_c_2 = 7'd23;
			  4'd1: condicion_c_2 = 7'd59;
			  4'd2: condicion_c_2 = 7'd59;
			  4'd3: condicion_c_2 = 7'd30;
			  4'd4: condicion_c_2 = 7'd11;
			  4'd5: condicion_c_2 = 7'd99;
			  4'd6: condicion_c_2 = 7'd23;
			  4'd7: condicion_c_2 = 7'd59;
			  4'd8: condicion_c_2 = 7'd59;
			  default: condicion_c_2 = 7'd127;
        endcase		 
		  end
		  else condicion_c_2 = 7'd0;
		end
		 
endmodule
