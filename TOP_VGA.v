`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:16:47 04/05/2016 
// Design Name: 
// Module Name:    TOP_VGA 
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
module TOP_VGA
   (
	 input wire [3:0] dig0, dig1,
	 input wire [3:0] direccion,
	 input [4:0]cuenta_lectura,
    input wire clk, reset, off_alarma,on_alarma, W_R,
    output wire hsync, vsync,
    output wire [2:0] rgb
   );

   // signal declaration
   //reg [1:0] state_reg, state_next;
   wire [9:0] pixel_x, pixel_y;
   wire video_on, pixel_tick;
   wire [8:0] text_on;
   wire [2:0] text_rgb;
   reg [2:0] rgb_reg, rgb_next;
	
	//wire [3:0] dig_Dec_Ho, dig_Dec_min, dig_Dec_seg, dig_Dec_mes, dig_Dec_dia, dig_Dec_an, dig_Dec_Ho_Ti, dig_Dec_min_Ti, dig_Dec_seg_Ti;
	//wire [3:0] dig_Unit_Ho, dig_Unit_min, dig_Unit_seg, dig_Unit_mes, dig_Unit_dia, dig_Unit_an, dig_Unit_Ho_Ti, dig_Unit_min_Ti, dig_Unit_seg_Ti;
   //=======================================================
   // instantiation
   //=======================================================
   // instantiate video synchronization unit
   vga_sync vsync_unit
   (
    .Clk(DivClk), .reset(reset),
    .hsync(hsync), .vsync(vsync), .video_on(video_on), .p_tick(pixel_tick),
    .pixel_x(pixel_x), .pixel_y(pixel_y)
   );
   // instantiate text module
   VGA_text text_unit
   (
    .CLK(DivClk), .off_alarma(off_alarma), 
	 .on_alarma(on_alarma), .direccion(direccion), 
	 .rst(reset), .W_R(W_R), .cuenta_lectura(cuenta_lectura),
	 .dig0_Dec(dig0), .dig1_Unit(dig1),
    .pix_x(pixel_x), .pix_y(pixel_y),
    .text_on(text_on),
    .text_rgb(text_rgb)
   );
	
	//clk Divider
	Divisor_de_Clk DivCLK_unit 
	(.Clk(clk), .reset(reset), .DivClk(DivClk));


	//contador
	 //=======================================================
   // FSMD
   //=======================================================
   // FSMD state & data registers
    always @(posedge clk, posedge reset)
       if (reset)
          begin
             rgb_reg <= 0;
          end
       else	
			if (pixel_tick)
				rgb_reg <= rgb_next;
  //=======================================================
   // rgb multiplexing circuit
   //=======================================================
   always @*
      if (~video_on)
         rgb_next = "000"; // blank the edge/retrace
      else
			case(direccion)
				4'b0000:
					if ((text_on[0])|| (text_on[1])|| (text_on[2])|| (text_on[3])|| (text_on[4])|| (text_on[5])|| (text_on[6])||(text_on[7])||(text_on[8]))
						rgb_next = text_rgb;
					else
						rgb_next = 3'b111; // yellow background
				4'b0001:
					if ((text_on[0])|| (text_on[1])|| (text_on[2])|| (text_on[3])|| (text_on[4])|| (text_on[5])|| (text_on[6])||(text_on[7])||(text_on[8]))
						rgb_next = text_rgb;
					else
						rgb_next = 3'b111; // yellow background
				4'b0010:
					if ((text_on[0])|| (text_on[1])|| (text_on[2])|| (text_on[3])|| (text_on[4])|| (text_on[5])|| (text_on[6])||(text_on[7])||(text_on[8]))
						rgb_next = text_rgb;
					else
						rgb_next = 3'b111; // yellow background
				4'b0011:
					if ((text_on[0])|| (text_on[1])|| (text_on[2])|| (text_on[3])|| (text_on[4])|| (text_on[5])|| (text_on[6])||(text_on[7])||(text_on[8]))
						rgb_next = text_rgb;
					else
						rgb_next = 3'b111; // yellow background
				4'b0100:
					if ((text_on[0])|| (text_on[1])|| (text_on[2])|| (text_on[3])|| (text_on[4])|| (text_on[5])|| (text_on[6])||(text_on[7])||(text_on[8]))
						rgb_next = text_rgb;
					else
						rgb_next = 3'b111; // yellow background
				4'b0101:
					if ((text_on[0])|| (text_on[1])|| (text_on[2])|| (text_on[3])|| (text_on[4])|| (text_on[5])|| (text_on[6])||(text_on[7])||(text_on[8]))
						rgb_next = text_rgb;
					else
						rgb_next = 3'b111; // yellow background
				4'b0110:
					if ((text_on[0])|| (text_on[1])|| (text_on[2])|| (text_on[3])|| (text_on[4])|| (text_on[5])|| (text_on[6])||(text_on[7])||(text_on[8]))
						rgb_next = text_rgb;
					else
						rgb_next = 3'b111; // yellow background				
				4'b0111:
					if ((text_on[0])|| (text_on[1])|| (text_on[2])|| (text_on[3])|| (text_on[4])|| (text_on[5])|| (text_on[6])||(text_on[7])||(text_on[8]))
						rgb_next = text_rgb;
					else
						rgb_next = 3'b111; // yellow background
				default:
					if ((text_on[0])|| (text_on[1])|| (text_on[2])|| (text_on[3])|| (text_on[4])|| (text_on[5])|| (text_on[6])||(text_on[7])||(text_on[8]))
						rgb_next = text_rgb;
					else
						rgb_next = 3'b111; // yellow background
			endcase
   // output
   assign rgb = rgb_reg;
endmodule

	