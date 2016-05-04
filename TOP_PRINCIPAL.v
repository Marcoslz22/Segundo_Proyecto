`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:28:40 04/26/2016 
// Design Name: 
// Module Name:    TOP_PRINCIPAL 
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
module TOP_PRINCIPAL(
    input clk,
	 input W_R,
	 input rst,
	 input Subir,
	 input Bajar,
	 input Izquierda,
	 input Derecha,
	 input prog,
	 input [7:0] Chip_out,
    input off_alarma,
	 input on_alarma,
	 //_____SALIDAS____
	 output [7:0] Chip_in,	 
    output hsync,
	 output vsync,
    output [2:0] rgb,
	 output [3:0] Control_Chip,
	 output en,
	 output CLK
	 );
	 
	 wire [7:0] VGA;
    wire [3:0] direccion;
	 wire [3:0] dig1;
	 wire [3:0] dig0; 
	 wire [4:0] cuenta_lectura;
	 wire Derecha_F,Izquierda_F;
	 
	 assign dig0=VGA [7:4];
	 assign dig1=VGA [3:0];
	 assign CLK = clk;
	 
	 Flip_Flop_Derecha F1 (.clk(clk),.rst(rst),.d(Derecha),.qq(Derecha_F));
	 Flip_Flop_Izquierda F2 (.clk(clk),.rst(rst),.d(Izquierda),.qq(Izquierda_F));
	 
	 
	 TOP_RTC unit_1
	 (
    .clk(clk),
	 .W_R(W_R),
	 .rst(rst),
	 .Subir(Subir),
	 .Bajar(Bajar),
	 .Izquierda(Izquierda_F),
	 .Derecha(Derecha_F),
	 .prog(prog),
	 .Chip_out(Chip_out),
	 .VGA(VGA),
	 .Chip_in(Chip_in),
	 .direccion(direccion),
	 .Control_Chip(Control_Chip),
	 .Cuenta_Lectura (cuenta_lectura),
	 .en(en)
    );

	 TOP_VGA unit_2
   (
	 .dig0(dig0), 
	 .dig1(dig1),
	 .direccion(direccion),
	 .cuenta_lectura(cuenta_lectura),
    .clk (clk),
	 .reset(rst), 
	 .W_R(W_R),
	 .off_alarma(off_alarma),
	 .on_alarma(on_alarma),
    .hsync (hsync), 
	 .vsync(vsync),
    .rgb(rgb)
   );
endmodule
