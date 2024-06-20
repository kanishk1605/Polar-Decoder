`timescale 1ns/100ps
`include "../RTL/define.vh"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:       Praveen Bohra 
// 
// Create Date:    18:36:09 04/01/2023
// Design Name: 
// Module Name:    Belief Calc
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

module l_belief(
				input  signed  [`SIZE - 1:0]  x_in,
				input  signed  [`SIZE - 1:0]  y_in,
				output signed  [`SIZE - 1:0]  belief_out
			   );
    
// Data	Type Declaration

wire x_sign = x_in[`SIZE-1];
wire y_sign = y_in[`SIZE-1];
	
wire [`SIZE - 1:0] x_abs = (x_sign)?(~x_in + 1):(x_in);
wire [`SIZE - 1:0] y_abs = (y_sign)?(~y_in + 1):(y_in);

wire [`SIZE - 1:0] min_x_or_y = (x_abs >= y_abs) ? y_abs : x_abs;

assign belief_out = (x_sign ^ y_sign) ? (~min_x_or_y + 1) : min_x_or_y;

endmodule