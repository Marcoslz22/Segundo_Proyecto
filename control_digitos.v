`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:24:41 04/15/2016 
// Design Name:    Alejandro Morales
// Module Name:    control_digitos 
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
module control_digitos_1
	(
	input rst, clk, W_R, [4:0]cuenta_lectura,
	input wire [3:0] dig0_Dec,
	input [3:0] direccion,
	output reg [3:0] dig_Dec_Ho, dig_Dec_min, dig_Dec_seg, dig_Dec_mes, dig_Dec_dia, dig_Dec_an, dig_Dec_Ho_Ti, dig_Dec_min_Ti, dig_Dec_seg_Ti
	);
	
	always @(posedge clk or negedge clk)
	if (rst)
		begin
			dig_Dec_Ho<=0;
			dig_Dec_min<=0;
			dig_Dec_seg<=0;
			dig_Dec_mes<=0;
			dig_Dec_dia<=0;
			dig_Dec_an<=0;
			dig_Dec_Ho_Ti<=0;
			dig_Dec_min_Ti<=0;
			dig_Dec_seg_Ti<=0;
		end
	else
		begin
		if (~W_R)
		begin
			case (direccion)
		4'b0000://horas
					//0
			if (dig0_Dec==4'b0000)
				dig_Dec_Ho<=0;
					//1
			else if (dig0_Dec==4'b0001)
				dig_Dec_Ho<=4'b0001;
					//2
			else if (dig0_Dec==4'b0010)
				dig_Dec_Ho<=4'b0010;
					//3
			else if (dig0_Dec==4'b0011)
				dig_Dec_Ho<=4'b0011;
					//4
			else if (dig0_Dec==4'b0100)
				dig_Dec_Ho<=4'b0100;	
					//5
			else if (dig0_Dec==4'b0101)
				dig_Dec_Ho<=4'b0101;	
					//6
			else if (dig0_Dec==4'b0110)
				dig_Dec_Ho<=4'b0110;	
					//7
			else if (dig0_Dec==4'b0111)
				dig_Dec_Ho<=4'b0111;
					//8
			else if (dig0_Dec==4'b1000)
				dig_Dec_Ho<=4'b1000;
					//9
			else if (dig0_Dec==4'b1001)
				dig_Dec_Ho<=4'b1001;
			else 
				dig_Dec_Ho<=dig_Dec_Ho;		
				
		4'b0001://minutos
					//0
			if (dig0_Dec==4'b0000)
				dig_Dec_min<=0;
					//1
			else if (dig0_Dec==4'b0001)
				dig_Dec_min<=4'b0001;
					//2
			else if (dig0_Dec==4'b0010)
				dig_Dec_min<=4'b0010;
					//3
			else if (dig0_Dec==4'b0011)
				dig_Dec_min<=4'b0011;
					//4
			else if (dig0_Dec==4'b0100)
				dig_Dec_min<=4'b0100;	
					//5
			else if (dig0_Dec==4'b0101)
				dig_Dec_min<=4'b0101;	
					//6
			else if (dig0_Dec==4'b0110)
				dig_Dec_min<=4'b0110;	
					//7
			else if (dig0_Dec==4'b0111)
				dig_Dec_min<=4'b0111;
					//8
			else if (dig0_Dec==4'b1000)
				dig_Dec_min<=4'b1000;
					//9
			else if (dig0_Dec==4'b1001)
				dig_Dec_min<=4'b1001;
			else 
				dig_Dec_min<=dig_Dec_min;	

		4'b0010://segundos
					//0
			if (dig0_Dec==4'b0000)
				dig_Dec_seg<=0;
					//1
			else if (dig0_Dec==4'b0001)
				dig_Dec_seg<=4'b0001;
					//2
			else if (dig0_Dec==4'b0010)
				dig_Dec_seg<=4'b0010;
					//3
			else if (dig0_Dec==4'b0011)
				dig_Dec_seg<=4'b0011;
					//4
			else if (dig0_Dec==4'b0100)
				dig_Dec_seg<=4'b0100;	
					//5
			else if (dig0_Dec==4'b0101)
				dig_Dec_seg<=4'b0101;	
					//6
			else if (dig0_Dec==4'b0110)
				dig_Dec_seg<=4'b0110;	
					//7
			else if (dig0_Dec==4'b0111)
				dig_Dec_seg<=4'b0111;
					//8
			else if (dig0_Dec==4'b1000)
				dig_Dec_seg<=4'b1000;
					//9
			else if (dig0_Dec==4'b1001)
				dig_Dec_seg<=4'b1001;
			else 
				dig_Dec_seg<=dig_Dec_seg;		

		4'b0011://meses
					//0
			if (dig0_Dec==4'b0000)
				dig_Dec_mes<=0;
					//1
			else if (dig0_Dec==4'b0001)
				dig_Dec_mes<=4'b0001;
					//2
			else if (dig0_Dec==4'b0010)
				dig_Dec_mes<=4'b0010;
					//3
			else if (dig0_Dec==4'b0011)
				dig_Dec_mes<=4'b0011;
					//4
			else if (dig0_Dec==4'b0100)
				dig_Dec_mes<=4'b0100;	
					//5
			else if (dig0_Dec==4'b0101)
				dig_Dec_mes<=4'b0101;	
					//6
			else if (dig0_Dec==4'b0110)
				dig_Dec_mes<=4'b0110;	
					//7
			else if (dig0_Dec==4'b0111)
				dig_Dec_mes<=4'b0111;
					//8
			else if (dig0_Dec==4'b1000)
				dig_Dec_mes<=4'b1000;
					//9
			else if (dig0_Dec==4'b1001)
				dig_Dec_mes<=4'b1001;
			else 
				dig_Dec_mes<=dig_Dec_mes;		

		4'b0100://dias
					//0
			if (dig0_Dec==4'b0000)
				dig_Dec_dia<=0;
					//1
			else if (dig0_Dec==4'b0001)
				dig_Dec_dia<=4'b0001;
					//2
			else if (dig0_Dec==4'b0010)
				dig_Dec_dia<=4'b0010;
					//3
			else if (dig0_Dec==4'b0011)
				dig_Dec_dia<=4'b0011;
					//4
			else if (dig0_Dec==4'b0100)
				dig_Dec_dia<=4'b0100;	
					//5
			else if (dig0_Dec==4'b0101)
				dig_Dec_dia<=4'b0101;	
					//6
			else if (dig0_Dec==4'b0110)
				dig_Dec_dia<=4'b0110;	
					//7
			else if (dig0_Dec==4'b0111)
				dig_Dec_dia<=4'b0111;
					//8
			else if (dig0_Dec==4'b1000)
				dig_Dec_dia<=4'b1000;
					//9
			else if (dig0_Dec==4'b1001)
				dig_Dec_dia<=4'b1001;
			else 
				dig_Dec_dia<=dig_Dec_dia;	

		4'b0101://años
					//0
			if (dig0_Dec==4'b0000)
				dig_Dec_an<=0;
					//1
			else if (dig0_Dec==4'b0001)
				dig_Dec_an<=4'b0001;
					//2
			else if (dig0_Dec==4'b0010)
				dig_Dec_an<=4'b0010;
					//3
			else if (dig0_Dec==4'b0011)
				dig_Dec_an<=4'b0011;
					//4
			else if (dig0_Dec==4'b0100)
				dig_Dec_an<=4'b0100;	
					//5
			else if (dig0_Dec==4'b0101)
				dig_Dec_an<=4'b0101;	
					//6
			else if (dig0_Dec==4'b0110)
				dig_Dec_an<=4'b0110;	
					//7
			else if (dig0_Dec==4'b0111)
				dig_Dec_an<=4'b0111;
					//8
			else if (dig0_Dec==4'b1000)
				dig_Dec_an<=4'b1000;
					//9
			else if (dig0_Dec==4'b1001)
				dig_Dec_an<=4'b1001;
			else 
				dig_Dec_an<=dig_Dec_an;	

		4'b0110://Horas timer
					//0
			if (dig0_Dec==4'b0000)
				dig_Dec_Ho_Ti<=0;
					//1
			else if (dig0_Dec==4'b0001)
				dig_Dec_Ho_Ti<=4'b0001;
					//2
			else if (dig0_Dec==4'b0010)
				dig_Dec_Ho_Ti<=4'b0010;
					//3
			else if (dig0_Dec==4'b0011)
				dig_Dec_Ho_Ti<=4'b0011;
					//4
			else if (dig0_Dec==4'b0100)
				dig_Dec_Ho_Ti<=4'b0100;	
					//5
			else if (dig0_Dec==4'b0101)
				dig_Dec_Ho_Ti<=4'b0101;	
					//6
			else if (dig0_Dec==4'b0110)
				dig_Dec_Ho_Ti<=4'b0110;	
					//7
			else if (dig0_Dec==4'b0111)
				dig_Dec_Ho_Ti<=4'b0111;
					//8
			else if (dig0_Dec==4'b1000)
				dig_Dec_Ho_Ti<=4'b1000;
					//9
			else if (dig0_Dec==4'b1001)
				dig_Dec_Ho_Ti<=4'b1001;
			else 
				dig_Dec_Ho_Ti<=dig_Dec_Ho_Ti;	
		4'b0111://minutos timer
					//0
			if (dig0_Dec==4'b0000)
				dig_Dec_min_Ti<=0;
					//1
			else if (dig0_Dec==4'b0001)
				dig_Dec_min_Ti<=4'b0001;
					//2
			else if (dig0_Dec==4'b0010)
				dig_Dec_min_Ti<=4'b0010;
					//3
			else if (dig0_Dec==4'b0011)
				dig_Dec_min_Ti<=4'b0011;
					//4
			else if (dig0_Dec==4'b0100)
				dig_Dec_min_Ti<=4'b0100;	
					//5
			else if (dig0_Dec==4'b0101)
				dig_Dec_min_Ti<=4'b0101;	
					//6
			else if (dig0_Dec==4'b0110)
				dig_Dec_min_Ti<=4'b0110;	
					//7
			else if (dig0_Dec==4'b0111)
				dig_Dec_min_Ti<=4'b0111;
					//8
			else if (dig0_Dec==4'b1000)
				dig_Dec_min_Ti<=4'b1000;
					//9
			else if (dig0_Dec==4'b1001)
				dig_Dec_min_Ti<=4'b1001;
			else 
				dig_Dec_min_Ti<=dig_Dec_min_Ti;					
		default://segundos timer
					//0
			if (dig0_Dec==4'b0000)
				dig_Dec_seg_Ti<=0;
					//1
			else if (dig0_Dec==4'b0001)
				dig_Dec_seg_Ti<=4'b0001;
					//2
			else if (dig0_Dec==4'b0010)
				dig_Dec_seg_Ti<=4'b0010;
					//3
			else if (dig0_Dec==4'b0011)
				dig_Dec_seg_Ti<=4'b0011;
					//4
			else if (dig0_Dec==4'b0100)
				dig_Dec_seg_Ti<=4'b0100;	
					//5
			else if (dig0_Dec==4'b0101)
				dig_Dec_seg_Ti<=4'b0101;	
					//6
			else if (dig0_Dec==4'b0110)
				dig_Dec_seg_Ti<=4'b0110;	
					//7
			else if (dig0_Dec==4'b0111)
				dig_Dec_seg_Ti<=4'b0111;
					//8
			else if (dig0_Dec==4'b1000)
				dig_Dec_seg_Ti<=4'b1000;
					//9
			else if (dig0_Dec==4'b1001)
				dig_Dec_seg_Ti<=4'b1001;
			else 
				dig_Dec_seg_Ti<=dig_Dec_seg_Ti;					
	endcase
		end
		
		else
		begin
			case (cuenta_lectura)
		5'b00110://horas
					//0
			if (dig0_Dec==4'b0000)
				dig_Dec_Ho<=0;
					//1
			else if (dig0_Dec==4'b0001)
				dig_Dec_Ho<=4'b0001;
					//2
			else if (dig0_Dec==4'b0010)
				dig_Dec_Ho<=4'b0010;
					//3
			else if (dig0_Dec==4'b0011)
				dig_Dec_Ho<=4'b0011;
					//4
			else if (dig0_Dec==4'b0100)
				dig_Dec_Ho<=4'b0100;	
					//5
			else if (dig0_Dec==4'b0101)
				dig_Dec_Ho<=4'b0101;	
					//6
			else if (dig0_Dec==4'b0110)
				dig_Dec_Ho<=4'b0110;	
					//7
			else if (dig0_Dec==4'b0111)
				dig_Dec_Ho<=4'b0111;
					//8
			else if (dig0_Dec==4'b1000)
				dig_Dec_Ho<=4'b1000;
					//9
			else if (dig0_Dec==4'b1001)
				dig_Dec_Ho<=4'b1001;
			else 
				dig_Dec_Ho<=dig_Dec_Ho;		
				
		5'b00100://minutos
					//0
			if (dig0_Dec==4'b0000)
				dig_Dec_min<=0;
					//1
			else if (dig0_Dec==4'b0001)
				dig_Dec_min<=4'b0001;
					//2
			else if (dig0_Dec==4'b0010)
				dig_Dec_min<=4'b0010;
					//3
			else if (dig0_Dec==4'b0011)
				dig_Dec_min<=4'b0011;
					//4
			else if (dig0_Dec==4'b0100)
				dig_Dec_min<=4'b0100;	
					//5
			else if (dig0_Dec==4'b0101)
				dig_Dec_min<=4'b0101;	
					//6
			else if (dig0_Dec==4'b0110)
				dig_Dec_min<=4'b0110;	
					//7
			else if (dig0_Dec==4'b0111)
				dig_Dec_min<=4'b0111;
					//8
			else if (dig0_Dec==4'b1000)
				dig_Dec_min<=4'b1000;
					//9
			else if (dig0_Dec==4'b1001)
				dig_Dec_min<=4'b1001;
			else 
				dig_Dec_min<=dig_Dec_min;	

		5'b00010://segundos
					//0
			if (dig0_Dec==4'b0000)
				dig_Dec_seg<=0;
					//1
			else if (dig0_Dec==4'b0001)
				dig_Dec_seg<=4'b0001;
					//2
			else if (dig0_Dec==4'b0010)
				dig_Dec_seg<=4'b0010;
					//3
			else if (dig0_Dec==4'b0011)
				dig_Dec_seg<=4'b0011;
					//4
			else if (dig0_Dec==4'b0100)
				dig_Dec_seg<=4'b0100;	
					//5
			else if (dig0_Dec==4'b0101)
				dig_Dec_seg<=4'b0101;	
					//6
			else if (dig0_Dec==4'b0110)
				dig_Dec_seg<=4'b0110;	
					//7
			else if (dig0_Dec==4'b0111)
				dig_Dec_seg<=4'b0111;
					//8
			else if (dig0_Dec==4'b1000)
				dig_Dec_seg<=4'b1000;
					//9
			else if (dig0_Dec==4'b1001)
				dig_Dec_seg<=4'b1001;
			else 
				dig_Dec_seg<=dig_Dec_seg;		

		5'b01010://meses
					//0
			if (dig0_Dec==4'b0000)
				dig_Dec_mes<=0;
					//1
			else if (dig0_Dec==4'b0001)
				dig_Dec_mes<=4'b0001;
					//2
			else if (dig0_Dec==4'b0010)
				dig_Dec_mes<=4'b0010;
					//3
			else if (dig0_Dec==4'b0011)
				dig_Dec_mes<=4'b0011;
					//4
			else if (dig0_Dec==4'b0100)
				dig_Dec_mes<=4'b0100;	
					//5
			else if (dig0_Dec==4'b0101)
				dig_Dec_mes<=4'b0101;	
					//6
			else if (dig0_Dec==4'b0110)
				dig_Dec_mes<=4'b0110;	
					//7
			else if (dig0_Dec==4'b0111)
				dig_Dec_mes<=4'b0111;
					//8
			else if (dig0_Dec==4'b1000)
				dig_Dec_mes<=4'b1000;
					//9
			else if (dig0_Dec==4'b1001)
				dig_Dec_mes<=4'b1001;
			else 
				dig_Dec_mes<=dig_Dec_mes;		

		5'b01000://dias
					//0
			if (dig0_Dec==4'b0000)
				dig_Dec_dia<=0;
					//1
			else if (dig0_Dec==4'b0001)
				dig_Dec_dia<=4'b0001;
					//2
			else if (dig0_Dec==4'b0010)
				dig_Dec_dia<=4'b0010;
					//3
			else if (dig0_Dec==4'b0011)
				dig_Dec_dia<=4'b0011;
					//4
			else if (dig0_Dec==4'b0100)
				dig_Dec_dia<=4'b0100;	
					//5
			else if (dig0_Dec==4'b0101)
				dig_Dec_dia<=4'b0101;	
					//6
			else if (dig0_Dec==4'b0110)
				dig_Dec_dia<=4'b0110;	
					//7
			else if (dig0_Dec==4'b0111)
				dig_Dec_dia<=4'b0111;
					//8
			else if (dig0_Dec==4'b1000)
				dig_Dec_dia<=4'b1000;
					//9
			else if (dig0_Dec==4'b1001)
				dig_Dec_dia<=4'b1001;
			else 
				dig_Dec_dia<=dig_Dec_dia;	

		5'b01100://años
					//0
			if (dig0_Dec==4'b0000)
				dig_Dec_an<=0;
					//1
			else if (dig0_Dec==4'b0001)
				dig_Dec_an<=4'b0001;
					//2
			else if (dig0_Dec==4'b0010)
				dig_Dec_an<=4'b0010;
					//3
			else if (dig0_Dec==4'b0011)
				dig_Dec_an<=4'b0011;
					//4
			else if (dig0_Dec==4'b0100)
				dig_Dec_an<=4'b0100;	
					//5
			else if (dig0_Dec==4'b0101)
				dig_Dec_an<=4'b0101;	
					//6
			else if (dig0_Dec==4'b0110)
				dig_Dec_an<=4'b0110;	
					//7
			else if (dig0_Dec==4'b0111)
				dig_Dec_an<=4'b0111;
					//8
			else if (dig0_Dec==4'b1000)
				dig_Dec_an<=4'b1000;
					//9
			else if (dig0_Dec==4'b1001)
				dig_Dec_an<=4'b1001;
			else 
				dig_Dec_an<=dig_Dec_an;	

		5'b00000://Horas timer
					//0
			if (dig0_Dec==4'b0000)
				dig_Dec_Ho_Ti<=0;
					//1
			else if (dig0_Dec==4'b0001)
				dig_Dec_Ho_Ti<=4'b0001;
					//2
			else if (dig0_Dec==4'b0010)
				dig_Dec_Ho_Ti<=4'b0010;
					//3
			else if (dig0_Dec==4'b0011)
				dig_Dec_Ho_Ti<=4'b0011;
					//4
			else if (dig0_Dec==4'b0100)
				dig_Dec_Ho_Ti<=4'b0100;	
					//5
			else if (dig0_Dec==4'b0101)
				dig_Dec_Ho_Ti<=4'b0101;	
					//6
			else if (dig0_Dec==4'b0110)
				dig_Dec_Ho_Ti<=4'b0110;	
					//7
			else if (dig0_Dec==4'b0111)
				dig_Dec_Ho_Ti<=4'b0111;
					//8
			else if (dig0_Dec==4'b1000)
				dig_Dec_Ho_Ti<=4'b1000;
					//9
			else if (dig0_Dec==4'b1001)
				dig_Dec_Ho_Ti<=4'b1001;
			else 
				dig_Dec_Ho_Ti<=dig_Dec_Ho_Ti;	
		5'b10000://minutos timer
					//0
			if (dig0_Dec==4'b0000)
				dig_Dec_min_Ti<=0;
					//1
			else if (dig0_Dec==4'b0001)
				dig_Dec_min_Ti<=4'b0001;
					//2
			else if (dig0_Dec==4'b0010)
				dig_Dec_min_Ti<=4'b0010;
					//3
			else if (dig0_Dec==4'b0011)
				dig_Dec_min_Ti<=4'b0011;
					//4
			else if (dig0_Dec==4'b0100)
				dig_Dec_min_Ti<=4'b0100;	
					//5
			else if (dig0_Dec==4'b0101)
				dig_Dec_min_Ti<=4'b0101;	
					//6
			else if (dig0_Dec==4'b0110)
				dig_Dec_min_Ti<=4'b0110;	
					//7
			else if (dig0_Dec==4'b0111)
				dig_Dec_min_Ti<=4'b0111;
					//8
			else if (dig0_Dec==4'b1000)
				dig_Dec_min_Ti<=4'b1000;
					//9
			else if (dig0_Dec==4'b1001)
				dig_Dec_min_Ti<=4'b1001;
			else 
				dig_Dec_min_Ti<=dig_Dec_min_Ti;					
		5'b01110://segundos timer
					//0
			if (dig0_Dec==4'b0000)
				dig_Dec_seg_Ti<=0;
					//1
			else if (dig0_Dec==4'b0001)
				dig_Dec_seg_Ti<=4'b0001;
					//2
			else if (dig0_Dec==4'b0010)
				dig_Dec_seg_Ti<=4'b0010;
					//3
			else if (dig0_Dec==4'b0011)
				dig_Dec_seg_Ti<=4'b0011;
					//4
			else if (dig0_Dec==4'b0100)
				dig_Dec_seg_Ti<=4'b0100;	
					//5
			else if (dig0_Dec==4'b0101)
				dig_Dec_seg_Ti<=4'b0101;	
					//6
			else if (dig0_Dec==4'b0110)
				dig_Dec_seg_Ti<=4'b0110;	
					//7
			else if (dig0_Dec==4'b0111)
				dig_Dec_seg_Ti<=4'b0111;
					//8
			else if (dig0_Dec==4'b1000)
				dig_Dec_seg_Ti<=4'b1000;
					//9
			else if (dig0_Dec==4'b1001)
				dig_Dec_seg_Ti<=4'b1001;
			else 
				dig_Dec_seg_Ti<=dig_Dec_seg_Ti;
		default://segundos timer	
				dig_Dec_seg_Ti<=dig_Dec_seg;		
	endcase
		end

		end
		
endmodule
