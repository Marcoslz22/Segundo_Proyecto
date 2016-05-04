`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:47:06 04/11/2016 
// Design Name: 
// Module Name:    Control_de_Tiempos 
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
module Control_de_Tiempos(
    input W_R,
	 input en,
	 input [3:0] estado,
    output [4:0] Senales_de_Control
    );
    
	 
	 reg CS2 = 1;
	 reg RD2 = 1;
	 reg WR2 = 1;
	 reg A_D2 = 1;
	 reg c_s2 = 0;

	 assign Senales_de_Control [0] = A_D2; //jc7
	 assign Senales_de_Control [1] = CS2; //jb1
	 assign Senales_de_Control [2] = RD2; //jb3
	 assign Senales_de_Control [3] = WR2; //jb2
	 assign Senales_de_Control [4] = c_s2;
	 
	 always @(*)
	   begin
	    if (!W_R || !en)
		 begin
		    case (estado)
          4'd0: begin
					    CS2 <= 1; 
						 RD2 <= 1;
						 A_D2 <= 1;
						 WR2 <= 1;
						 c_s2 <= 1;
					 end 
          4'd1: begin 
			          CS2 <= 1; 
						 RD2 <= 1;
						 A_D2 <= 1;
						 WR2 <= 1;
						 c_s2 <= 0;
					 end 
          4'd2: begin
			          CS2 <= 1; 
						 RD2 <= 1;
						 A_D2 <= 0;
						 WR2 <= 1;
						 c_s2 <= 0;
			       end
          4'd3: begin
			          CS2 <= 0; 
						 RD2 <= 1;
						 A_D2 <= 0;
						 WR2 <= 1;
						 c_s2 <= 0;  
			       end
          4'd4: begin 
			          CS2 <= 0; 
						 RD2 <= 1;
						 A_D2 <= 0;
						 WR2 <= 0;
						 c_s2 <= 0;  
					 end
          4'd5: begin 
			          CS2 <= 0; 
						 RD2 <= 1;
						 A_D2 <= 0;
						 WR2 <= 0;
						 c_s2 <= 0; 
                end						 
          4'd6: begin 
			          CS2 <= 0; 
						 RD2 <= 1;
						 A_D2 <= 0;
						 WR2 <= 0;
						 c_s2 <= 1; 
                end						 
          4'd7: begin 
			          CS2 <= 0; 
						 RD2 <= 1;
						 A_D2 <= 0;
						 WR2 <= 1;
						 c_s2 <= 1; 
                end						 
          4'd8: begin 
			          CS2 <= 1; 
						 RD2 <= 1;
						 A_D2 <= 0;
						 WR2 <= 1;
						 c_s2 <= 1; 
					 end 
          4'd9: begin 
			          CS2 <= 1; 
						 RD2 <= 1;
						 A_D2 <= 1;
						 WR2 <= 1;
						 c_s2 <= 1; 
					 end 
          4'd10: begin 
			          CS2 <= 1; 
						 RD2 <= 1;
						 A_D2 <= 1;
						 WR2 <= 1;
						 c_s2 <= 0; 
					  end
          4'd11: begin 
			          CS2 <= 0; 
						 RD2 <= 1;
						 A_D2 <= 1;
						 WR2 <= 1;
						 c_s2 <= 0; 
					  end 
          4'd12: begin 
			          CS2 <= 0; 
						 RD2 <= 1;
						 A_D2 <= 1;
						 WR2 <= 0;
						 c_s2 <= 0; 
                 end						 
          4'd13: begin 
			          CS2 <= 0; 
						 RD2 <= 1;
						 A_D2 <= 1;
						 WR2 <= 0;
						 c_s2 <= 1; 
					  end 
          4'd14: begin 
			          CS2 <= 0; 
						 RD2 <= 1;
						 A_D2 <= 1;
						 WR2 <= 1;
						 c_s2 <= 1; 	
                 end 						 
          default: begin
							 CS2 <= 1; 
						    RD2 <= 1;
						    A_D2 <= 1;
						    WR2 <= 1;
							 c_s2 <= 0;
			          end 
          endcase			 
		 end
		 else
		 begin
		    case (estado)
          4'd0: begin
			          CS2 <= 1;
					    RD2 <= 1;
						 A_D2 <= 1;
						 WR2 <= 1;
						 c_s2 <= 1;
                end 				 
          4'd1: begin 
			          CS2 <= 1;
					    RD2 <= 1;
						 A_D2 <= 1;
						 WR2 <= 1;
						 c_s2 <= 0;
                end
          4'd2: begin 
			          CS2 <= 1;
					    RD2 <= 1;
						 A_D2 <= 0;
						 WR2 <= 1;
						 c_s2 <= 0;
					 end
          4'd3: begin 
			          CS2 <= 0;
					    RD2 <= 1;
						 A_D2 <= 0;
						 WR2 <= 1;
						 c_s2 <= 0; 
					 end
          4'd4: begin 
			          CS2 <= 0;
					    RD2 <= 1;
						 A_D2 <= 0;
						 WR2 <= 0;
						 c_s2 <= 0; 
					 end
			 4'd5: begin 
			          CS2 <= 0;
					    RD2 <= 1;
						 A_D2 <= 0;
						 WR2 <= 0;
						 c_s2 <= 0;
					 end
          4'd6: begin 
			          CS2 <= 0;
					    RD2 <= 1;
						 A_D2 <= 0;
						 WR2 <= 0;
						 c_s2 <= 1;
                end						 
          4'd7: begin 
			          CS2 <= 0;
					    RD2 <= 1;
						 A_D2 <= 0;
						 WR2 <= 1;
						 c_s2 <= 1; 
					 end
          4'd8: begin 
			          CS2 <= 1;
					    RD2 <= 1;
						 A_D2 <= 0;
						 WR2 <= 1;
						 c_s2 <= 1; 
					 end
          4'd9: begin 
			          CS2 <= 1;
					    RD2 <= 1;
						 A_D2 <= 1;
						 WR2 <= 1;
						 c_s2 <= 1; 
					 end
          4'd10: begin 
			          CS2 <= 1;
					    RD2 <= 1;
						 A_D2 <= 1;
						 WR2 <= 1;
						 c_s2 <= 0; 
                 end						 
          4'd11: begin 
			          CS2 <= 0;
					    RD2 <= 1;
						 A_D2 <= 1;
						 WR2 <= 1;
						 c_s2 <= 0; 
					  end
          4'd12: begin 
			          CS2 <= 0;
					    RD2 <= 0;
						 A_D2 <= 1;
						 WR2 <= 1;
						 c_s2 <= 0; 
					  end
          4'd13: begin 
			          CS2 <= 0;
					    RD2 <= 0;
						 A_D2 <= 1;
						 WR2 <= 1;
						 c_s2 <= 1; 
					  end
          4'd14: begin 
			          CS2 <= 0;
					    RD2 <= 1;
						 A_D2 <= 1;
						 WR2 <= 1;
						 c_s2 <= 1; 
					  end
          default: begin
							 CS2 <= 1; 
						    RD2 <= 1;
						    A_D2 <= 1;
						    WR2 <= 1;
							 c_s2 <= 0;
			          end
          endcase		
		 end
	  end 
endmodule
