`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:01:00 04/26/2016 
// Design Name: 
// Module Name:    MUX 
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
module MUX(
	 input [7:0] DECO_VGA,
	 input [7:0] chip_vga,
    input c_s,
    input A_D,
    input WR,
    input RD,
    input W_R,
    input CS,
	 input en,
    input [7:0] Deco_Inicializacion,
    input [7:0] Deco_Escritura,
    input [7:0] Deco_Lectura,
	 output reg en_salida,
    output reg en_entrada,
    output reg [7:0] RTC_out,
    output reg [7:0] VGA
    );

	 
	 wire [6:0] Bus_de_Control;
	 reg rep = 1'd0;
	 
	 assign Bus_de_Control [0] = W_R;
	 assign Bus_de_Control [1] = CS;
	 assign Bus_de_Control [2] = RD;
	 assign Bus_de_Control [3] = WR;
	 assign Bus_de_Control [4] = A_D;
	 assign Bus_de_Control [5] = c_s;
	 assign Bus_de_Control [6] = !en;
	 
	 always @(*)
	    case (Bus_de_Control)
		 7'b1100100: begin
		                en_salida = 1;
							 en_entrada = 0;
							 rep <= 0;
		                RTC_out <= Deco_Inicializacion;
							 VGA <= DECO_VGA;
		             end
		 7'b1101100: begin
		                en_salida = 1;
							 en_entrada = 0;
							 rep <= 0;
		                RTC_out <= Deco_Inicializacion;
							 VGA <= DECO_VGA;
		             end
		 7'b1101110: begin
		                en_salida = 1;
							 en_entrada = 0;
							 rep <= 0;
		                RTC_out <= Deco_Inicializacion;
							 VGA <= DECO_VGA;
		             end
		 7'b1111110: begin
		                en_salida = 1;
							 en_entrada = 0;
							 rep <= 0;
		                RTC_out <= Deco_Inicializacion;
							 VGA <= DECO_VGA;
		             end
		 7'b1110100: begin
		                en_salida = 1;
							 en_entrada = 0;
							 rep <= 0;
		                RTC_out <= Deco_Inicializacion;
							 VGA <= DECO_VGA;
		             end
		 7'b1111100: begin
		                en_salida = 1;
							 en_entrada = 0;
							 rep <= 0;
		                RTC_out <= Deco_Inicializacion;
							 VGA <= DECO_VGA;
		             end
       7'b0100100: begin
		                en_salida = 1;
							 en_entrada = 0;
							 rep <= 0;
		                RTC_out <= Deco_Escritura;
							 VGA <=DECO_VGA;
		             end
		 7'b0101100: begin
		                en_salida = 1;
							 en_entrada = 0;
							 rep <= 0;
		                RTC_out <= Deco_Escritura;
							 VGA <= DECO_VGA;
		             end
		 7'b0101110: begin
		                en_salida = 1;
							 en_entrada = 0;
							 rep <= 0;
		                RTC_out <= Deco_Escritura;
							 VGA <= DECO_VGA;
		             end
		 7'b0111110: begin
		                en_salida = 1;
							 en_entrada = 0;
							 rep <= 0;
		                RTC_out <= Deco_Escritura;
							 VGA <= DECO_VGA;
		             end
		 7'b0110100: begin
		                en_salida = 1;
							 en_entrada = 0;
							 rep <= 0;
		                RTC_out <= Deco_Escritura;
							 VGA <= DECO_VGA;
		             end
		 7'b0111100: begin
		                en_salida = 1;
							 en_entrada = 0;
							 rep <= 0;
		                RTC_out <= Deco_Escritura;
							 VGA <= DECO_VGA;
		             end
       7'b0100101: begin
		                en_salida = 1;
							 en_entrada = 0;
							 rep <= 0;
		                RTC_out <= Deco_Lectura;
							 VGA <= chip_vga;
		             end
		 7'b0101101: begin
		                en_salida = 1;
							 en_entrada = 0;
							 rep <= 0;
		                RTC_out <= Deco_Lectura;
							 VGA <= chip_vga;
		             end
		 7'b0101111: begin
		                en_salida = 1;
							 en_entrada = 0;
							 rep <= 0;
		                RTC_out <= Deco_Lectura;
							 VGA <= chip_vga;
		             end
		 7'b0111111: begin
		                if (!rep)
							 begin
		                   en_salida = 1;
							    en_entrada = 0;
								 rep <= 0;
		                   RTC_out <= Deco_Lectura;
							    VGA <= chip_vga;
							 end
							 else
							 begin
		                   en_salida = 0;
							    en_entrada = 1;
								 rep <= 0;
		                   RTC_out <= Deco_Lectura;
							    VGA <= chip_vga;
							 end
		             end
		 7'b0111001: begin
		                en_salida = 0;
							 en_entrada = 1;
							 rep <= 1;
		                RTC_out <= Deco_Lectura;
							 VGA <= chip_vga;
		             end
		 7'b0111101: begin
		                en_salida = 0;
							 en_entrada = 1;
							 rep <= 1;
		                RTC_out <= Deco_Lectura;
							 VGA <=chip_vga;
		             end
       default:    begin
		                en_salida = 0;
							 en_entrada = 0;
							 rep <= 0;
		                RTC_out <= 8'd255;
							 VGA <= chip_vga;
                   end 
       endcase						 
	 	 
endmodule
