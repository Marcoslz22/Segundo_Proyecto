`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    03:05:41 04/02/2016 
// Design Name: 
// Module Name:    Divisor_de_Clk 
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
module Divisor_de_Clk(
	input Clk, reset,
	output reg DivClk
    );

//Para saber cuanto es la entrada Div, se divide la entrada clk (los 100MHz de la Nexys 3 en este caso) entre la frecuencia deseada, este resultado se divide entre 2 y se le resta 1
//Esto es asi pues, si se divide por 1 bit (osea si Div = 0) esto divide el clk entre 2, es decir si uso una cantidad de 1 bit en Div, divido clk en 2, si uso dos bits (Div = 1) divido clk en 4, si uso 3 bits (Div=2) divido clk en 6
//**Notar que la cuenta de cuantos bits utilizo comienza en 0 y tambien es por ello que se le resta 1
//Asi, si se quiere tener una frecuencia de por ejemplo 10MHz, entonces, 100MHz/10Mhz = 10 (divido la frecuencia 10 veces). Si se que usar 1 bit (Div = 0) equivale a dividir la frecuencia en 2, entonces diviendo 10 veces equivale a utilizar 5 bits (Div = 4), es decir una regla de tres. Div = [(1*10)/2]-1

reg q;//log(2,f_in)-1, NO ES NECESARIO PORQUE EN LA EJECUCION DEL ALGORITMO ESTE NO VAR�A

always@(negedge Clk)
	if(reset)
		begin
		q <= 0;
		DivClk <= 0;
		end
	else 
		case(q)//ALGORITMO IMPORTANTE PARA ELIMINAR LATCHES 
			1'b0:
				DivClk <= ~DivClk;
		default:		
			q <= q + 1;
		endcase
endmodule

