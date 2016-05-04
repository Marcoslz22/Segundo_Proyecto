`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:18:06 04/02/2016 
// Design Name:    Alejandro Morales; AMP
// Module Name:    VGA_text 
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
module VGA_text
   (
    input wire CLK, off_alarma, on_alarma, rst,W_R,//preguntar al profe cual es clk ???
    input wire [3:0] dig0_Dec, dig1_Unit, direccion,
	 input [4:0]cuenta_lectura,
    input wire [9:0] pix_x, pix_y,
    output wire [8:0] text_on,
    output reg [2:0] text_rgb
   );
   wire [10:0] rom_addr;
   reg [6:0] char_addr, char_addr_H, char_addr_F,
             char_addr_C, char_addr_EN1, char_addr_EN2, char_addr_EN3, char_addr_EN4, char_addr_TF, char_addr_sep;
   reg [3:0] row_addr;
   wire [3:0] row_addr_H, row_addr_F, row_addr_C, row_addr_EN1, row_addr_EN2, row_addr_EN3, row_addr_EN4, row_addr_TF, row_addr_sep;
   reg [2:0] bit_addr;
   wire [2:0] bit_addr_H, bit_addr_F,bit_addr_C, bit_addr_EN1, bit_addr_EN2, bit_addr_EN3, bit_addr_EN4, bit_addr_TF, bit_addr_sep;
   wire [7:0] font_word;
   wire font_bit, HORA_on, FECHA_on, CRONOMETRO_on, TCRONOFIN_on, ENCABEZADO1_on, ENCABEZADO2_on, ENCABEZADO3_on, ENCABEZADO4_on,separa_on;

	wire [3:0] dig_Dec_Ho, dig_Dec_min, dig_Dec_seg, dig_Dec_mes, dig_Dec_dia, dig_Dec_an, dig_Dec_Ho_Ti, dig_Dec_min_Ti, dig_Dec_seg_Ti;
	wire [3:0] dig_Unit_Ho, dig_Unit_min, dig_Unit_seg, dig_Unit_mes, dig_Unit_dia, dig_Unit_an, dig_Unit_Ho_Ti, dig_Unit_min_Ti, dig_Unit_seg_Ti;
	assign pix_x [0]=0;
	// Instanciación de la ROM
	
	
   font_rom font_unit
      (.Clk(CLK), .addr(rom_addr), .data(font_word));
		
  // instantiate control de digitos 

  control_digitos_1 digitos_1_unit
	(
	.rst(rst), .clk(CLK), .W_R(W_R),
	.dig0_Dec(dig0_Dec),
	.direccion(direccion),
	.cuenta_lectura(cuenta_lectura),
	.dig_Dec_Ho (dig_Dec_Ho), .dig_Dec_min (dig_Dec_min), .dig_Dec_seg (dig_Dec_seg), 
	.dig_Dec_mes (dig_Dec_mes), .dig_Dec_dia(dig_Dec_dia), .dig_Dec_an (dig_Dec_an),
	.dig_Dec_Ho_Ti (dig_Dec_Ho_Ti), .dig_Dec_min_Ti (dig_Dec_min_Ti), .dig_Dec_seg_Ti (dig_Dec_seg_Ti)
	);
	// instantiate control de digitos 2
	control_digitos_2 digitos_2_unit
	(
	.rst(rst), .clk(CLK),.W_R(W_R),
	.dig1_Unit(dig1_Unit),
	.direccion (direccion),
	.cuenta_lectura(cuenta_lectura),
	.dig_Unit_Ho (dig_Unit_Ho), .dig_Unit_min (dig_Unit_min), .dig_Unit_seg (dig_Unit_seg), 
	.dig_Unit_mes (dig_Unit_mes), .dig_Unit_dia (dig_Unit_dia), .dig_Unit_an (dig_Unit_an), 
	.dig_Unit_Ho_Ti (dig_Unit_Ho_Ti), .dig_Unit_min_Ti (dig_Unit_min_Ti), .dig_Unit_seg_Ti (dig_Unit_seg_Ti)
	);

   //-------------------------------------------
   // Region de Encabezado1
   //  - escala  16(x)-a-16(y) de fuente, 640x480=40x15
   //  - line 1, 35 caracteres: "Instituto Tecnologico de Costa Rica"
   //-------------------------------------------
   assign ENCABEZADO1_on = (pix_y[9:4]==0) && (2<=pix_x[9:4]<=36);//los bits sobrantes son lo que tienen que dar 2^5=32
   assign row_addr_EN1 = pix_y[3:0];
   assign bit_addr_EN1 = pix_x[3:1];
   always @*
      case (pix_x[9:4])// 6 bits 2^6=64, tengo que poner un default para los extra
         6'h2: char_addr_EN1 = 7'h49; // I
         6'h3: char_addr_EN1 = 7'h6e; // n
         6'h4: char_addr_EN1 = 7'h73; // s
         6'h5: char_addr_EN1 = 7'h74; // t
         6'h6: char_addr_EN1 = 7'h69; // i
         6'h7: char_addr_EN1 = 7'h74; // t
         6'h8: char_addr_EN1 = 7'h75; // u
         6'h9: char_addr_EN1 = 7'h74; // t
         6'ha: char_addr_EN1 = 7'h6f; // o
         6'hb: char_addr_EN1 = 7'h00; //
         6'hc: char_addr_EN1 = 7'h54; // T
         6'hd: char_addr_EN1 = 7'h65; // e
         6'he: char_addr_EN1 = 7'h63; // c
         6'hf: char_addr_EN1 = 7'h6e; // n
         6'h10: char_addr_EN1 = 7'h6f; // o
         6'h11: char_addr_EN1 = 7'h6c; // l
		  6'h12: char_addr_EN1 = 7'h6f; // o
        6'h13: char_addr_EN1 = 7'h67; // g
        6'h14: char_addr_EN1 = 7'h69; // i
        6'h15: char_addr_EN1 = 7'h63; // c
        6'h16: char_addr_EN1 = 7'h6f; // o
        6'h17: char_addr_EN1 = 7'h00; // 
		  6'h18: char_addr_EN1 = 7'h64; // d 
		  6'h19: char_addr_EN1 = 7'h65; // e
		  6'h1a: char_addr_EN1 = 7'h00; // 
		  6'h1b: char_addr_EN1 = 7'h43; // C
		  6'h1c: char_addr_EN1 = 7'h6f; // o
        6'h1d: char_addr_EN1 = 7'h73; // s
        6'h1e: char_addr_EN1 = 7'h74; // t
		  6'h1f: char_addr_EN1 = 7'h61; // a 
		  6'h20: char_addr_EN1 = 7'h00; // 
		  6'h21: char_addr_EN1 = 7'h52; // R
		  6'h22: char_addr_EN1 = 7'h69; // i
		  6'h23: char_addr_EN1 = 7'h63; // c
		  6'h24: char_addr_EN1 = 7'h61; // a
		  default: char_addr_EN1 = 7'h00; //
      endcase


   //-------------------------------------------
   // Region de Encabezado2
   //  - escala  16(x)-a-16(y) de fuente, 640x480=40x15
   //  - line 2, 36 caracteres: "Escuela de Ingenieria en Electronica"
   //-------------------------------------------
	
   assign ENCABEZADO2_on = (pix_y[9:4]==1) && (2<=pix_x[9:4]<=37);//los bits sobrantes son lo que tienen que dar 2^5=32
   assign row_addr_EN2 = pix_y[3:0];
   assign bit_addr_EN2 = pix_x[3:1];
   always @*
      case (pix_x[9:4])// 6 bits 2^6=64, tengo que poner un default para los extra
         6'h2: char_addr_EN2 = 7'h45; // E
         6'h3: char_addr_EN2 = 7'h73; // s
         6'h4: char_addr_EN2 = 7'h63; // c
         6'h5: char_addr_EN2 = 7'h75; // u
         6'h6: char_addr_EN2 = 7'h65; // e
         6'h7: char_addr_EN2 = 7'h6c; // l
         6'h8: char_addr_EN2 = 7'h61; // a
         6'h9: char_addr_EN2 = 7'h00; // 
         6'ha: char_addr_EN2 = 7'h64; // d
         6'hb: char_addr_EN2 = 7'h65; // e
         6'hc: char_addr_EN2 = 7'h00; // 
         6'hd: char_addr_EN2 = 7'h49; // I
         6'he: char_addr_EN2 = 7'h6e; // n
         6'hf: char_addr_EN2 = 7'h67; // g
         6'h10: char_addr_EN2 = 7'h65; // e
         6'h11: char_addr_EN2 = 7'h6e; // n
		  6'h12: char_addr_EN2 = 7'h69; // i
        6'h13: char_addr_EN2 = 7'h65; // e
        6'h14: char_addr_EN2 = 7'h72; // r
        6'h15: char_addr_EN2 = 7'h69; // i
        6'h16: char_addr_EN2 = 7'h61; // a
        6'h17: char_addr_EN2 = 7'h00; // 
		  6'h18: char_addr_EN2 = 7'h65; // e 
		  6'h19: char_addr_EN2 = 7'h6e; // n
		  6'h1a: char_addr_EN2 = 7'h00; // 
		  6'h1b: char_addr_EN2 = 7'h45; // E
		  6'h1c: char_addr_EN2 = 7'h6c; // l
        6'h1d: char_addr_EN2 = 7'h65; // e
        6'h1e: char_addr_EN2 = 7'h63; // c
		  6'h1f: char_addr_EN2 = 7'h74; // t 
		  6'h20: char_addr_EN2 = 7'h72; // r
		  6'h21: char_addr_EN2 = 7'h6f; // o
		  6'h22: char_addr_EN2 = 7'h6e; // n
		  6'h23: char_addr_EN2 = 7'h69; // i
		  6'h24: char_addr_EN2 = 7'h63; // c
		  6'h25: char_addr_EN2 = 7'h61; // a
		  default: char_addr_EN2 = 7'h00; //
      endcase


   //-------------------------------------------
   // Region de Encabezado3
   //  - escala  16(x)-a-16(y) de fuente, 640x480=40x15
   //  - line 3, 36 caracteres: "Lab. de Diseno de Sistemas Digitales"
   //-------------------------------------------
	
 assign ENCABEZADO3_on = (pix_y[9:4]==2) && (2<=pix_x[9:4]<=37);//los bits sobrantes son lo que tienen que dar 2^5=32
   assign row_addr_EN3 = pix_y[3:0];
   assign bit_addr_EN3 = pix_x[3:1];
   always @*
      case (pix_x[9:4])// 6 bits 2^6=64, tengo que poner un default para los extra
         6'h2: char_addr_EN3 = 7'h4c; // L
         6'h3: char_addr_EN3 = 7'h61; // a
         6'h4: char_addr_EN3 = 7'h62; // b
         6'h5: char_addr_EN3 = 7'h2e; // .
         6'h6: char_addr_EN3 = 7'h00; // 
         6'h7: char_addr_EN3 = 7'h64; // d
         6'h8: char_addr_EN3 = 7'h65; // e
         6'h9: char_addr_EN3 = 7'h00; // 
         6'ha: char_addr_EN3 = 7'h44; // D
         6'hb: char_addr_EN3 = 7'h69; // i
         6'hc: char_addr_EN3 = 7'h73; // s
         6'hd: char_addr_EN3 = 7'h65; // e
         6'he: char_addr_EN3 = 7'h6e; // n
         6'hf: char_addr_EN3 = 7'h6f; // o
         6'h10: char_addr_EN3 = 7'h00; // 
         6'h11: char_addr_EN3 = 7'h64; // d
		  6'h12: char_addr_EN3 = 7'h65; // e
        6'h13: char_addr_EN3 = 7'h00; // 
        6'h14: char_addr_EN3 = 7'h53; // S
        6'h15: char_addr_EN3 = 7'h69; // i
        6'h16: char_addr_EN3 = 7'h73; // s
        6'h17: char_addr_EN3 = 7'h74; // t
		  6'h18: char_addr_EN3 = 7'h65; // e 
		  6'h19: char_addr_EN3 = 7'h6d; // m
		  6'h1a: char_addr_EN3 = 7'h61; // a
		  6'h1b: char_addr_EN3 = 7'h73; // s
		  6'h1c: char_addr_EN3 = 7'h00; // 
        6'h1d: char_addr_EN3 = 7'h44; // D
        6'h1e: char_addr_EN3 = 7'h69; // i
		  6'h1f: char_addr_EN3 = 7'h67; // g 
		  6'h20: char_addr_EN3 = 7'h69; // i
		  6'h21: char_addr_EN3 = 7'h74; // t
		  6'h22: char_addr_EN3 = 7'h61; // a
		  6'h23: char_addr_EN3 = 7'h6c; // l
		  6'h24: char_addr_EN3 = 7'h65; // e
		  6'h25: char_addr_EN3 = 7'h73; // s
		  default: char_addr_EN3 = 7'h00; //
      endcase
   //-------------------------------------------
   // Region de Encabezado4
   //  - escala  16(x)-a-16(y) de fuente, 640x480=40x15
   //  - line 15, 8 caracteres: ">Alarma<"
   //-------------------------------------------		
assign ENCABEZADO4_on = (pix_y[9:4]==14) && (17<=pix_x[9:4]<=24);//los bits sobrantes son lo que tienen que dar 2^5=32
   assign row_addr_EN4 = pix_y[3:0];
   assign bit_addr_EN4 = pix_x[3:1];
   always @*
      case (pix_x[8:4])// 5 bits 2^5=32, tengo que poner un default para los extra
         5'h11: char_addr_EN4 = 7'h10; // >
         5'h12: char_addr_EN4 = 7'h41; // A
         5'h13: char_addr_EN4 = 7'h6c; // l
         5'h14: char_addr_EN4 = 7'h61; // a
         5'h15: char_addr_EN4 = 7'h72; // r
         5'h16: char_addr_EN4 = 7'h6d; // m
         5'h17: char_addr_EN4 = 7'h61; // a
         5'h18: char_addr_EN4 = 7'h11; // <
		  default: char_addr_EN4 = 7'h00; //
      endcase		
   //-------------------------------------------
   // Region de separacion
   //  - escala  16(x)-a-16(y) de fuente, 640x480=10x3.75~4
   //  - line 6, 40 caracteres: "----------"
   //-------------------------------------------

   assign separa_on = (pix_y[9:4]==5) && (0<=pix_x[9:4]<=39);//los bits sobrantes son lo que tienen que dar 2^7=128
   assign row_addr_sep = pix_y[3:0];//4b
   assign bit_addr_sep = pix_x[3:1];//3b
   always @*
      case (pix_x[8:4])// 4 bits 2^4=16, y ocupo 10, tengo que poner un default para los extra
         5'h0: char_addr_sep = 7'h2d; // -
         5'h1: char_addr_sep = 7'h0f; //*
         5'h2: char_addr_sep = 7'h2d; // -
         5'h3: char_addr_sep = 7'h0f; //*
         5'h4: char_addr_sep = 7'h2d; // -
         5'h5: char_addr_sep = 7'h0f; //*
         5'h6: char_addr_sep = 7'h2d; // -
         5'h7: char_addr_sep = 7'h0f; //*
         5'h8: char_addr_sep = 7'h2d; // -
         5'h9: char_addr_sep = 7'h0f; //*
         5'ha: char_addr_sep = 7'h2d; // -
         5'hb: char_addr_sep = 7'h0f; //*
         5'hc: char_addr_sep = 7'h2d; // -
         5'hd: char_addr_sep = 7'h0f; //*
         5'he: char_addr_sep = 7'h2d; // -
         5'hf: char_addr_sep = 7'h0f; //*
         5'h10: char_addr_sep = 7'h2d; // -
         5'h11: char_addr_sep = 7'h0f; //*
         5'h12: char_addr_sep = 7'h2d; // -
         5'h13: char_addr_sep = 7'h0f; //*
         5'h14: char_addr_sep = 7'h2d; // -
         5'h15: char_addr_sep = 7'h0f; //*
         5'h16: char_addr_sep = 7'h2d; // -
         5'h17: char_addr_sep = 7'h0f; //*
         5'h18: char_addr_sep = 7'h2d; // -
         5'h19: char_addr_sep = 7'h0f; //*
         5'h1a: char_addr_sep = 7'h2d; // -
         5'h1b: char_addr_sep = 7'h0f; //*
         5'h1c: char_addr_sep = 7'h2d; // -
         5'h1d: char_addr_sep = 7'h0f; //*
         5'h1e: char_addr_sep = 7'h2d; // -
         5'h1f: char_addr_sep = 7'h0f; //*
         5'h20: char_addr_sep = 7'h2d; // -
         5'h21: char_addr_sep = 7'h0f; //*
         5'h22: char_addr_sep = 7'h2d; // -
         5'h23: char_addr_sep = 7'h0f; //*
         5'h24: char_addr_sep = 7'h2d; // -
         5'h25: char_addr_sep = 7'h0f; //*
         5'h26: char_addr_sep = 7'h2d; // -
         5'h27: char_addr_sep = 7'h0f; //*
			default: char_addr_sep = 7'h0f; //*
		endcase

   //-------------------------------------------
   // Region de Fecha
   //  - escala 16(x)-a-16(y) de fuente, 640x480=40x7.5~8
   //  - line 8, 17 chars: ">Fecha:DD/DD/20DD"
   //-------------------------------------------
   assign FECHA_on = (pix_y[9:4]==7) && (1<=pix_x[9:4]) && (pix_x[9:4]<=17);//los bits sobrantes son lo que tienen que dar 2^4=16
   assign row_addr_F = pix_y[3:0];
   assign bit_addr_F = pix_x[3:1];
   always @*
      case (pix_x[8:4])//UTILIZO 5 BITS PARA GENERAR LAS 17 COMBINACIONES
         5'h1: char_addr_F = 7'h10; // >
         5'h2: char_addr_F = 7'h46; // F
         5'h3: char_addr_F = 7'h65; // e
         5'h4: char_addr_F = 7'h63; // c
         5'h5: char_addr_F = 7'h68; // h
			5'h6: char_addr_F = 7'h61; // a
			5'h7: char_addr_F = 7'h3a; // :
         5'h8: char_addr_F = {3'b011, dig_Dec_dia}; //  dia
          5'h9: char_addr_F = {3'b011, dig_Unit_dia}; //  dia
          5'ha: char_addr_F = 7'h2f; // /
          5'hb: char_addr_F = {3'b011, dig_Dec_mes}; // mes
          5'hc: char_addr_F = {3'b011, dig_Unit_mes}; // mes
          5'hd: char_addr_F = 7'h2f; // /
          5'he: char_addr_F = 7'h32; // 2
          5'hf: char_addr_F = 7'h30; // 0
          5'h10: char_addr_F = {3'b011, dig_Dec_an}; // año
          default char_addr_F = {3'b011, dig_Unit_an}; //   año
      endcase
		


   //-------------------------------------------
   // Region de Cronometro
   //  - escala 16(x)-a-64(y) de fuente, 640x480=40x7.5~8
   //  - line 10, 20 chars: ">Cronometro:DD/DD/DD"
   //-------------------------------------------
   assign CRONOMETRO_on = (pix_y[9:4]==9) && (1<=pix_x[9:4]) && (pix_x[9:4]<=20);//los bits sobrantes son lo que tienen que dar 2^4=16
   assign row_addr_C = pix_y[3:0];
   assign bit_addr_C = pix_x[3:1];
   always @*
      case (pix_x[8:4])//UTILIZO 5 BITS PARA GENERAR LAS 20 COMBINACIONES
         5'h1: char_addr_C = 7'h10; // >
         5'h2: char_addr_C = 7'h43; // C
         5'h3: char_addr_C = 7'h72; // r
         5'h4: char_addr_C = 7'h6f; // o
         5'h5: char_addr_C = 7'h6e; // n
			5'h6: char_addr_C = 7'h6f; // o
			5'h7: char_addr_C = 7'h6d; // m
         5'h8: char_addr_C = 7'h65; // e
          5'h9: char_addr_C = 7'h74; // t
          5'ha: char_addr_C = 7'h72; // r
          5'hb: char_addr_C = 7'h6f; // o
          5'hc: char_addr_C = 7'h3a; // :
          5'hd: char_addr_C = {3'b011, dig_Dec_Ho_Ti}; //Horas
          5'he: char_addr_C = {3'b011, dig_Unit_Ho_Ti}; // Horas
          5'hf: char_addr_C = 7'h3a; // :
          5'h10: char_addr_C = {3'b011, dig_Dec_min_Ti}; // minutos
          5'h11: char_addr_C = {3'b011, dig_Unit_min_Ti}; // minutos
          5'h12: char_addr_C = 7'h3a; // :
          5'h13: char_addr_C = {3'b011, dig_Dec_seg_Ti}; //segundos
          default char_addr_C = {3'b011, dig_Unit_seg_Ti}; // segundos
      endcase
			
   //-------------------------------------------
   // Region de Hora
   //  - escala 16(x)-a-16(y) de fuente, 640x480=40x7.5~8
   //  - line 12, 14 chars: ">Hora:DD/DD/DD"
   //-------------------------------------------
   assign HORA_on = (pix_y[9:4]==11) && (1<=pix_x[9:4]) && (pix_x[9:4]<=14);//los bits sobrantes son lo que tienen que dar 2^4=16
   assign row_addr_H = pix_y[3:0];
   assign bit_addr_H = pix_x[3:1];
   always @*
      case (pix_x[7:4])//UTILIZO 4 BITS PARA GENERAR LAS 14 COMBINACIONES
         4'h1: char_addr_H = 7'h10; // >
         4'h2: char_addr_H = 7'h48; // H
         4'h3: char_addr_H = 7'h6f; // o
         4'h4: char_addr_H = 7'h72; // r
         4'h5: char_addr_H = 7'h61; // a
			4'h6: char_addr_H = 7'h3a; // :
          4'h7: char_addr_H = {3'b011, dig_Dec_Ho}; //  Horas
          4'h8: char_addr_H = {3'b011, dig_Unit_Ho}; // Horas
          4'h9: char_addr_H = 7'h3a; // :
          4'ha: char_addr_H = {3'b011, dig_Dec_min}; //  minutos
          4'hb: char_addr_H = {3'b011, dig_Unit_min}; // minutos
          4'hc: char_addr_H = 7'h3a; // :
          4'hd: char_addr_H = {3'b011, dig_Dec_seg}; //  segundos
          default char_addr_H = {3'b011, dig_Unit_seg}; // segundos
      endcase
 //-------------------------------------------
 // Region de separacion
 //  - escala  64(x)-a-128(y) de fuente, 640x480=10x3.75~4
 //  - line 3, 10 caracter:
 // 
 // 
 //  ******
 // ********
 // ** ** **
 // ********
 // ********
 // **    **
 // ***  ***
 // ********
 // ********
 //  ******
 // 
 // 
 // 
 // 
 //-------------------------------------------

   assign TCRONOFIN_on= (pix_y[9:7]==2) && ((2<=pix_x[9:6])&& (pix_x[9:6]<=8));//los bits sobrantes son lo que tienen que dar 2^7=128
   assign row_addr_TF = pix_y[6:3];//4b
   assign bit_addr_TF = pix_x[5:3];//3b
   always @*
      case (pix_x[8:6])// 4 bits 2^4=16, y ocupo 10, tengo que poner un default para los extra
         3'h2: char_addr_TF = 7'h00; // 
         3'h3: char_addr_TF = 7'h02; // 
         3'h4: char_addr_TF = 7'h00; //
         3'h5: char_addr_TF = 7'h02; // 
         3'h6: char_addr_TF = 7'h00; //
         3'h7: char_addr_TF = 7'h02; //		
         3'h8: char_addr_TF = 7'h00; //				
			default: char_addr_TF = 7'h0f; //*
		endcase
		
	
   //-------------------------------------------
   // Direccion de fuente en ROM y rgb
   //-------------------------------------------
   always @*
   begin
      text_rgb = 3'b000;  // fondo,  negro
      if (ENCABEZADO1_on)
         begin
            char_addr = char_addr_EN1;
            row_addr = row_addr_EN1;
            bit_addr = bit_addr_EN1;
            if (font_bit)
               text_rgb = 3'b001;
				else 
					text_rgb = 3'b111;
         end
      else if (ENCABEZADO2_on)
         begin
            char_addr = char_addr_EN2;
            row_addr = row_addr_EN2;
            bit_addr = bit_addr_EN2;
            if (font_bit)
               text_rgb = 3'b001;
				else 
					text_rgb = 3'b111;
         end
      else if (ENCABEZADO3_on)
         begin
            char_addr = char_addr_EN3;
            row_addr = row_addr_EN3;
            bit_addr = bit_addr_EN3;
            if (font_bit)
               text_rgb = 3'b001;
				else 
					text_rgb = 3'b111;
         end
		else if (separa_on)
         begin
            char_addr = char_addr_sep;
            row_addr = row_addr_sep;
            bit_addr = bit_addr_sep;
            if (font_bit)
               text_rgb = 3'b010;
				else 
					text_rgb = 3'b111;
			end
		else if (HORA_on )
         begin
            char_addr = char_addr_H;
            row_addr = row_addr_H;
            bit_addr = bit_addr_H;
            if (font_bit)
               text_rgb = 3'b001;
				else 
					text_rgb = 3'b111;
			end
		else if (CRONOMETRO_on)
         begin
            char_addr = char_addr_C;
            row_addr = row_addr_C;
            bit_addr = bit_addr_C;
            if (font_bit)
               text_rgb = 3'b001;
				else 
					text_rgb = 3'b111;
			end
		else if (FECHA_on)
         begin
            char_addr = char_addr_F;
            row_addr = row_addr_F;
            bit_addr = bit_addr_F;
            if (font_bit)
               text_rgb = 3'b001;
				else 
					text_rgb = 3'b111;
			end
      else if (ENCABEZADO4_on)
         begin
            char_addr = char_addr_EN4;
            row_addr = row_addr_EN4;
            bit_addr = bit_addr_EN4;
            if (font_bit)
               text_rgb = 3'b010;
				else 
					text_rgb = 3'b111;
         end
		else //TCRONOFIN_on))
         begin
            char_addr = char_addr_TF;
            row_addr = row_addr_TF;
            bit_addr = bit_addr_TF;
            if ((font_bit)&&(off_alarma))
               text_rgb = 3'b010;
				else if ((font_bit)&&(on_alarma)) 
					text_rgb = 3'b100; 
				else 
					text_rgb = 3'b000;
			end
   end

   assign text_on = {ENCABEZADO1_on, ENCABEZADO2_on, ENCABEZADO3_on, separa_on, HORA_on, CRONOMETRO_on, FECHA_on, ENCABEZADO4_on,TCRONOFIN_on};
   //-------------------------------------------
   // font rom interface
   //-------------------------------------------
   assign rom_addr = {char_addr, row_addr};
   assign font_bit = font_word[~bit_addr];
	
endmodule


