`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:19:53 04/11/2016 
// Design Name: 
// Module Name:    Contador_Control_de_Tiempos 
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
module Contador_Control_de_Tiempos(
    input clk,
	 input W_R,
	 input en,
    output [3:0] c_5
    );
	 
	 reg [3:0] Cuenta_Interna = 0;
	 reg [3:0] Estado = 0;
	 reg posicion = 0;
	 
	 assign c_5 = Estado;

	 
	 
	 always @(posedge clk)
	 
	    if (!W_R || !en)
		 begin
			 if (posicion == 1)
			 begin
			  posicion <= 0;
			  Estado = 0;
			  Cuenta_Interna <= 0;
			 end
          else 	
          begin			 
		    case (Estado)
			 4'd0: if (Cuenta_Interna == 4'd3 )
                begin
					    Estado = 4'd1;
						 Cuenta_Interna <= 4'd0;
                end		
                else 
                begin
					    Estado = Estado;
						 Cuenta_Interna <= Cuenta_Interna + 4'd1;
                end		
			 4'd1: if (Cuenta_Interna == 4'd10 )
                begin
					    Estado = 4'd2;
						 Cuenta_Interna <= 4'd0;
                end		
                else 
                begin
					    Estado = Estado;
						 Cuenta_Interna <= Cuenta_Interna + 4'd1;
                end		
			 4'd2: if (Cuenta_Interna == 4'd5 )
                begin
					    Estado = 4'd3;
						 Cuenta_Interna <= 4'd0;
                end		
                else 
                begin
					    Estado = Estado;
						 Cuenta_Interna <= Cuenta_Interna + 4'd1;
                end		
			 4'd3: if (Cuenta_Interna == 4'd5)
                begin
					    Estado = 4'd4;
						 Cuenta_Interna <= 4'd0;
                end		
                else 
                begin
					    Estado = Estado;
						 Cuenta_Interna <= Cuenta_Interna + 4'd1;
                end	
			 4'd4: if (Cuenta_Interna == 4'd0 )
                begin
					    Estado = 4'd5;
						 Cuenta_Interna <= 4'd0;
                end		
                else 
                begin
					    Estado = Estado;
						 Cuenta_Interna <= Cuenta_Interna + 4'd1;
                end					 
			 4'd5: if (Cuenta_Interna == 4'd5 )
                begin
					    Estado = 4'd6;
						 Cuenta_Interna <= 4'd0;
                end		
                else 
                begin
					    Estado = Estado;
						 Cuenta_Interna <= Cuenta_Interna + 4'd1;
                end		
			 4'd6: if (Cuenta_Interna == 4'd5 )
                begin
					    Estado = 4'd7;
						 Cuenta_Interna <= 4'd0;
                end		
                else 
                begin
					    Estado = Estado;
						 Cuenta_Interna <= Cuenta_Interna + 4'd1;
                end		
			 4'd7: if (Cuenta_Interna == 4'd5 )
                begin
					    Estado = 4'd8;
						 Cuenta_Interna <= 4'd0;
                end		
                else 
                begin
					    Estado = Estado;
						 Cuenta_Interna <= Cuenta_Interna + 4'd1;
                end		
			 4'd8: if (Cuenta_Interna == 4'd5 )
                begin
					    Estado = 4'd9;
						 Cuenta_Interna <= 4'd0;
                end		
                else 
                begin
					    Estado = Estado;
						 Cuenta_Interna <= Cuenta_Interna + 4'd1;
                end		
			 4'd9: if (Cuenta_Interna == 4'd3 )
                begin
					    Estado = 4'd10;
						 Cuenta_Interna <= 4'd0;
                end		
                else 
                begin
					    Estado = Estado;
						 Cuenta_Interna <= Cuenta_Interna + 4'd1;
                end		
			 4'd10: if (Cuenta_Interna == 4'd10 )
                begin
					    Estado = 4'd11;
						 Cuenta_Interna <= 4'd0;
                end		
                else 
                begin
					    Estado = Estado;
						 Cuenta_Interna <= Cuenta_Interna + 4'd1;
                end
			 4'd11: if (Cuenta_Interna == 4'd5 )
                begin
					    Estado = 4'd12;
						 Cuenta_Interna <= 4'd0;
                end		
                else 
                begin
					    Estado = Estado;
						 Cuenta_Interna <= Cuenta_Interna + 4'd1;
                end	
			 4'd12: if (Cuenta_Interna == 4'd5 )
                begin
					    Estado = 4'd13;
						 Cuenta_Interna <= 4'd0;
                end		
                else 
                begin
					    Estado = Estado;
						 Cuenta_Interna <= Cuenta_Interna + 4'd1;
                end	
			 4'd13: if (Cuenta_Interna == 4'd5 )
                begin
					    Estado = 4'd14;
						 Cuenta_Interna <= 4'd0;
                end		
                else 
                begin
					    Estado = Estado;
						 Cuenta_Interna <= Cuenta_Interna + 4'd1;
                end	
			 4'd14: if (Cuenta_Interna == 4'd5 )
                begin
					    Estado = 4'd0;
						 Cuenta_Interna <= 4'd0;
                end		
                else 
                begin
					    Estado = Estado;
						 Cuenta_Interna <= Cuenta_Interna + 4'd1;
                end	
         default: begin
					      Estado = Estado;
						   Cuenta_Interna <= Cuenta_Interna;
                  end 	
         endcase	
       end			
		 end
		 else
		 begin
		    if (posicion == 0)
			 begin
			  posicion <= 1;
			  Estado = 0;
			  Cuenta_Interna <= 0;
			 end
			 else
			 begin
		    case (Estado)
			 4'd0: if (Cuenta_Interna == 4'd3 )
                begin
					    Estado = 4'd1;
						 Cuenta_Interna <= 4'd0;
                end		
                else 
                begin
					    Estado = Estado;
						 Cuenta_Interna <= Cuenta_Interna + 4'd1;
                end		
			 4'd1: if (Cuenta_Interna == 4'd10 )
                begin
					    Estado = 4'd2;
						 Cuenta_Interna <= 4'd0;
                end		
                else 
                begin
					    Estado = Estado;
						 Cuenta_Interna <= Cuenta_Interna + 4'd1;
                end		
			 4'd2: if (Cuenta_Interna == 4'd5 )
                begin
					    Estado = 4'd3;
						 Cuenta_Interna <= 4'd0;
                end		
                else 
                begin
					    Estado = Estado;
						 Cuenta_Interna <= Cuenta_Interna + 4'd1;
                end		
			 4'd3: if (Cuenta_Interna == 4'd5)
                begin
					    Estado = 4'd4;
						 Cuenta_Interna <= 4'd0;
                end		
                else 
                begin
					    Estado = Estado;
						 Cuenta_Interna <= Cuenta_Interna + 4'd1;
                end	
			 4'd4: if (Cuenta_Interna == 4'd0 )
                begin
					    Estado = 4'd5;
						 Cuenta_Interna <= 4'd0;
                end		
                else 
                begin
					    Estado = Estado;
						 Cuenta_Interna <= Cuenta_Interna + 4'd1;
                end					 
			 4'd5: if (Cuenta_Interna == 4'd5 )
                begin
					    Estado = 4'd6;
						 Cuenta_Interna <= 4'd0;
                end		
                else 
                begin
					    Estado = Estado;
						 Cuenta_Interna <= Cuenta_Interna + 4'd1;
                end		
			 4'd6: if (Cuenta_Interna == 4'd5 )
                begin
					    Estado = 4'd7;
						 Cuenta_Interna <= 4'd0;
                end		
                else 
                begin
					    Estado = Estado;
						 Cuenta_Interna <= Cuenta_Interna + 4'd1;
                end		
			 4'd7: if (Cuenta_Interna == 4'd5 )
                begin
					    Estado = 4'd8;
						 Cuenta_Interna <= 4'd0;
                end		
                else 
                begin
					    Estado = Estado;
						 Cuenta_Interna <= Cuenta_Interna + 4'd1;
                end		
			 4'd8: if (Cuenta_Interna == 4'd5 )
                begin
					    Estado = 4'd9;
						 Cuenta_Interna <= 4'd0;
                end		
                else 
                begin
					    Estado = Estado;
						 Cuenta_Interna <= Cuenta_Interna + 4'd1;
                end		
			 4'd9: if (Cuenta_Interna == 4'd3 )
                begin
					    Estado = 4'd10;
						 Cuenta_Interna <= 4'd0;
                end		
                else 
                begin
					    Estado = Estado;
						 Cuenta_Interna <= Cuenta_Interna + 4'd1;
                end		
			 4'd10: if (Cuenta_Interna == 4'd10 )
                begin
					    Estado = 4'd11;
						 Cuenta_Interna <= 4'd0;
                end		
                else 
                begin
					    Estado = Estado;
						 Cuenta_Interna <= Cuenta_Interna + 4'd1;
                end	
			 4'd11: if (Cuenta_Interna == 4'd5 )
                begin
					    Estado = 4'd12;
						 Cuenta_Interna <= 4'd0;
                end		
                else 
                begin
					    Estado = Estado;
						 Cuenta_Interna <= Cuenta_Interna + 4'd1;
                end	
			 4'd12: if (Cuenta_Interna == 4'd5 )
                begin
					    Estado = 4'd13;
						 Cuenta_Interna <= 4'd0;
                end		
                else 
                begin
					    Estado = Estado;
						 Cuenta_Interna <= Cuenta_Interna + 4'd1;
                end	
			 4'd13: if (Cuenta_Interna == 4'd5 )
                begin
					    Estado = 4'd14;
						 Cuenta_Interna <= 4'd0;
                end		
                else 
                begin
					    Estado = Estado;
						 Cuenta_Interna <= Cuenta_Interna + 4'd1;
                end	
			 4'd14: if (Cuenta_Interna == 4'd5 )
                begin
					    Estado = 4'd0;
						 Cuenta_Interna <= 4'd0;
                end		
                else 
                begin
					    Estado = Estado;
						 Cuenta_Interna <= Cuenta_Interna + 4'd1;
                end	
         default: begin
					      Estado = Estado;
						   Cuenta_Interna <= Cuenta_Interna;
                  end 	
         endcase
         end			
		 end 
		
	 

endmodule
