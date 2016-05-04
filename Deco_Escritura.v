`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:22:08 04/26/2016 
// Design Name: 
// Module Name:    Deco_Escritura 
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
module Deco_Escritura(
     input clk,
     input en,
	  input c_s,
	  input prog,
	  input [3:0] cuenta,
	  input [6:0] cuenta2,
	  input A_D,
	  output reg [7:0] salida_e
    );
	 
	 always @(posedge clk or negedge clk)
	    if (!en)
		 begin
		    if (prog)
			 begin
			    if (A_D) salida_e = 8'd255;
				 else salida_e = 8'd240;
			 end
			 else
			 begin
			    if (c_s)
			    salida_e = salida_e;
			 else
			 begin
			    if (A_D)
				 begin
				    if((cuenta == 5'd3) || (cuenta == 5'd4))
					 begin
					    case (cuenta2)
			             7'd0: salida_e = 8'b00000001;
			             7'd01: salida_e = 8'b00000010;
			             7'd02: salida_e = 8'b00000011;
			             7'd03: salida_e = 8'b00000100;
			             7'd04: salida_e = 8'b00000101;
			             7'd05: salida_e = 8'b00000110;
			             7'd06: salida_e = 8'b00000111;
			             7'd07: salida_e = 8'b00001000;
			             7'd08: salida_e = 8'b00001001;
			             7'd09: salida_e = 8'b00010000;
			             7'd010: salida_e = 8'b00010001; 
			             7'd011: salida_e = 8'b00010010; 
			             7'd012: salida_e = 8'b00010011; 
			             7'd013: salida_e = 8'b00010100; 
			             7'd014: salida_e = 8'b00010101; 
			             7'd015: salida_e = 8'b00010110; 
			             7'd016: salida_e = 8'b00010111; 
			             7'd017: salida_e = 8'b00011000; 
			             7'd018: salida_e = 8'b00011001; 
			             7'd019: salida_e = 8'b00100000;
			             7'd020: salida_e = 8'b00100001;
			             7'd021: salida_e = 8'b00100010;
			             7'd022: salida_e = 8'b00100011;
			             7'd023: salida_e = 8'b00100100;
			             7'd024: salida_e = 8'b00100101;
			             7'd025: salida_e = 8'b00100110;
			             7'd026: salida_e = 8'b00100111;
			             7'd027: salida_e = 8'b00101000;
			             7'd028: salida_e = 8'b00101001;
			             7'd029: salida_e = 8'b00110000;
			             7'd030: salida_e = 8'b00110001;
				          default: salida_e = 8'd255;
                   endcase
					 end 
					 else
					 begin
					    case (cuenta2)
			             7'd00: salida_e = 8'b00000000;
			             7'd01: salida_e = 8'b00000001;
			             7'd02: salida_e = 8'b00000010;
			             7'd03: salida_e = 8'b00000011;
			             7'd04: salida_e = 8'b00000100;
			             7'd05: salida_e = 8'b00000101;
			             7'd06: salida_e = 8'b00000110;
			             7'd07: salida_e = 8'b00000111;
			             7'd08: salida_e = 8'b00001000;
			             7'd09: salida_e = 8'b00001001;
			             7'd010: salida_e = 8'b00010000;
			             7'd011: salida_e = 8'b00010001; 
			             7'd012: salida_e = 8'b00010010; 
			             7'd013: salida_e = 8'b00010011; 
			             7'd014: salida_e = 8'b00010100; 
			             7'd015: salida_e = 8'b00010101; 
			             7'd016: salida_e = 8'b00010110; 
			             7'd017: salida_e = 8'b00010111; 
			             7'd018: salida_e = 8'b00011000; 
			             7'd019: salida_e = 8'b00011001; 
			             7'd020: salida_e = 8'b00100000;
			             7'd021: salida_e = 8'b00100001;
			             7'd022: salida_e = 8'b00100010;
			             7'd023: salida_e = 8'b00100011;
			             7'd024: salida_e = 8'b00100100;
			             7'd025: salida_e = 8'b00100101;
			             7'd026: salida_e = 8'b00100110;
			             7'd027: salida_e = 8'b00100111;
			             7'd028: salida_e = 8'b00101000;
			             7'd029: salida_e = 8'b00101001;
			             7'd030: salida_e = 8'b00110000;
			             7'd031: salida_e = 8'b00110001;
			             7'd032: salida_e = 8'b00110010;
			             7'd033: salida_e = 8'b00110011;
			             7'd034: salida_e = 8'b00110100;
			             7'd035: salida_e = 8'b00110101;
			             7'd036: salida_e = 8'b00110110;
			             7'd037: salida_e = 8'b00110111;
			             7'd038: salida_e = 8'b00111000;
			             7'd039: salida_e = 8'b00111001;
			             7'd040: salida_e = 8'b01000000;
			             7'd041: salida_e = 8'b01000001;
			             7'd042: salida_e = 8'b01000010;
			             7'd043: salida_e = 8'b01000011;
			             7'd044: salida_e = 8'b01000100;
			             7'd045: salida_e = 8'b01000101;
			             7'd046: salida_e = 8'b01000110;
			             7'd047: salida_e = 8'b01000111;
			             7'd048: salida_e = 8'b01001000;
			             7'd049: salida_e = 8'b01001001;
			             7'd050: salida_e = 8'b01010000;
			             7'd051: salida_e = 8'b01010001;
			             7'd052: salida_e = 8'b01010010;
			             7'd053: salida_e = 8'b01010011;
			             7'd054: salida_e = 8'b01010100; 
			             7'd055: salida_e = 8'b01010101;
			             7'd056: salida_e = 8'b01010110;
			             7'd057: salida_e = 8'b01010111;
			             7'd058: salida_e = 8'b01011000;
			             7'd059: salida_e = 8'b01011001;
			             7'd060: salida_e = 8'b01100000;
			             7'd061: salida_e = 8'b01100001;
			             7'd062: salida_e = 8'b01100010;
			             7'd063: salida_e = 8'b01100011; 
			             7'd064: salida_e = 8'b01100100;
			             7'd065: salida_e = 8'b01100101;
			             7'd066: salida_e = 8'b01100110;
			             7'd067: salida_e = 8'b01100111;
			             7'd068: salida_e = 8'b01101000;
			             7'd069: salida_e = 8'b01101001;
			             7'd070: salida_e = 8'b01110000;
			             7'd071: salida_e = 8'b01110001;
			             7'd072: salida_e = 8'b01110010; 
			             7'd073: salida_e = 8'b01110011;
			             7'd074: salida_e = 8'b01110100;
			             7'd075: salida_e = 8'b01110101;
			             7'd076: salida_e = 8'b01110110;
			             7'd077: salida_e = 8'b01110111;
			             7'd078: salida_e = 8'b01111000;
			             7'd079: salida_e = 8'b01111001;
			             7'd080: salida_e = 8'b10000000;
			             7'd081: salida_e = 8'b10000001;
			             7'd082: salida_e = 8'b10000010;
			             7'd083: salida_e = 8'b10000011;
			             7'd084: salida_e = 8'b10000100;
			             7'd085: salida_e = 8'b10000101;
			             7'd086: salida_e = 8'b10000110;
			             7'd087: salida_e = 8'b10000111;
			             7'd088: salida_e = 8'b10001000;
			             7'd089: salida_e = 8'b10001001;
			             7'd090: salida_e = 8'b10010000;
			             7'd091: salida_e = 8'b10010001;
			             7'd092: salida_e = 8'b10010010;
			             7'd093: salida_e = 8'b10010011;
			             7'd094: salida_e = 8'b10010100;
			             7'd095: salida_e = 8'b10010101;
			             7'd096: salida_e = 8'b10010110;
			             7'd097: salida_e = 8'b10010111;
			             7'd098: salida_e = 8'b10011000;
			             7'd099: salida_e = 8'b10011001;
				          default: salida_e = 8'd255;
                   endcase	
					 end 
				 end 
				 else
				 begin
		          case (cuenta)
			          4'd0: salida_e = 8'd35;
			          4'd1: salida_e = 8'd34;
			          4'd2: salida_e = 8'd33;
			          4'd3: salida_e = 8'd36;
			          4'd4: salida_e = 8'd37;
			          4'd5: salida_e = 8'd38;
			          4'd6: salida_e = 8'd67;
			          4'd7: salida_e = 8'd66;
			          4'd8: salida_e = 8'd65;
			             default: salida_e = 8'd255;
                      endcase
			 end
		 end
			 end
		    
	    end
		 else salida_e = 8'd255;

endmodule
