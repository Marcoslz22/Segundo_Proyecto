`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:28:03 04/26/2016 
// Design Name: 
// Module Name:    TOP_RTC 
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
module TOP_RTC(
    input clk,
	 input W_R,
	 input rst,
	 input Subir,
	 input Bajar,
	 input Izquierda,
	 input Derecha,
	 input prog,
	 input [7:0] Chip_out,
	 output [7:0] VGA,
	 output [7:0] Chip_in,
	 output [3:0] direccion,
	 output [4:0] Cuenta_Lectura,
	 output [3:0] Control_Chip,
	 output en
    );
	 
	 wire [3:0] c_5,c_1;
	 wire [6:0]c_2,condicion;
	 wire hab,en_salida,en_entrada;
	 wire [2:0] c_4;
	 wire [4:0] c_3,Senales;
	 wire [7:0] Salida_VGA,Salida_Escritura,Salida_Inicializacion,Salida_Lectura,chip_vga,RTC_in,RTC_out;
	 
	 assign direccion= c_1;
	 assign A_D = Senales [0];
	 assign c_s = Senales [4];
	 assign RD = Senales [2];
	 assign WR = Senales [3];
	 assign CS = Senales [1];
	 
	 assign Control_Chip [0]=Senales [0];
	 assign Control_Chip [2]=Senales [2];
	 assign Control_Chip [3]=Senales [3];
	 assign Control_Chip [1]=Senales [1];
    assign Cuenta_Lectura = c_3; 
	 assign en = hab;
	 
	 Contador_Control_de_Tiempos F1 
	 (
	 .clk(clk),
	 .W_R(W_R),
	 .en(hab),
	 .c_5(c_5)
	 );
	 
	 Contador_Datos F2 
	 (
	 .rst(rst),
	 .S(Subir),
	 .B(Bajar),
	 .clk(clk),
	 .W_R(W_R),
	 .en(hab),
	 .condicion_c2(condicion),
	 .c_2(c_2)
	 );
	 
	 Contador_Direccion F3 
	 (
	 .I(Izquierda),
	 .rst (rst),
	 .D (Derecha),
	 .clk(clk),
	 .W_R(W_R),
	 .en (hab),
	 .c_1 (c_1)
	 );
	 
	 Contador_Inicializacion F4 
	 (
	 .rst (rst),
	 .clk (clk),
	 .c_5 (c_5),
	 .en (hab),
	 .c_4 (c_4)
	 );
	 
	 Contador_Lectura F5 
	 (
	 .rst(rst),
	 .en(hab),
	 .W_R(W_R),
	 .clk(clk),
	 .c_5 (c_5),
	 .c_3 (c_3)
	 );
	 
	 Control_de_Tiempos F6 
	 (
	 .W_R(W_R),
	 .en (hab),
	 .estado (c_5),
	 .Senales_de_Control (Senales)
	 );
	 
	 Deco_Contador_Datos F7 
	 (
	 .c_1(c_1),
	 .en (hab),
	 .condicion_c_2(condicion)
	 );
	 
	 Deco_Dato_VGA F8 
	 (
	 .clk(clk),
	 .cuenta(c_1),
	 .cuenta2(c_2),
	 .salida_e(Salida_VGA)
	 );
	 
	 Deco_Escritura F9 
	 (
	 .clk(clk),
	 .en(hab),
	 .c_s(c_s),
	 .prog (prog),
	 .cuenta(c_1),
	 .cuenta2(c_2),
	 .A_D(A_D),
	 .salida_e (Salida_Escritura)
	 );
	 
	 Deco_Inicializacion F10 
	 (
	 .clk(clk),
	 .en(hab),
	 .c_s(c_s),
	 .cuenta(c_4),
	 .A_D(A_D),
	 .salida(Salida_Inicializacion)
	 );
	 
	 Deco_Lectura F11 
	 (
	 .clk(clk),
	 .en(hab),
	 .c_s(c_s),
	 .cuenta(c_3),
	 .A_D (A_D),
	 .salida(Salida_Lectura)
	 );
	 
	 MUX F12 
	 (
	 .DECO_VGA(Salida_VGA),
	 .chip_vga(chip_vga),//chip_vga
	 .c_s(c_s),
	 .A_D(A_D),
	 .WR(WR),
	 .RD(RD),
	 .W_R(W_R),
	 .CS(CS),
	 .en(hab),
	 .Deco_Inicializacion(Salida_Inicializacion),
	 .Deco_Escritura(Salida_Escritura),
	 .Deco_Lectura(Salida_Lectura),
	 .en_salida(en_salida),
	 .en_entrada(en_entrada),
	 .RTC_out(RTC_out),
	 .VGA(VGA)
	 );
	 
	 MUX_CHIP F13 
	 (
	 .clk(clk),
	 .chip(RTC_in),
	 .A_D(A_D),
	 .chip_vga(chip_vga)
	 );
	 
	 Buffer_Triestado_Salida F14 
	 (
	 .RTC_out(RTC_out),
	 .en(en_salida),
	 .Chip_in(Chip_in)
	 );
	 
	 Buffer_Triestado_Entrada F15 (
	 .en(en_entrada),
	 .Chip_out(Chip_out),
	 .RTC_in (RTC_in)
	 );
	 


endmodule
