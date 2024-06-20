`timescale 1ns/100ps
`include "../RTL/define.vh"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:       Praveen Bohra 
// 
// Create Date:    23:11:45 05/01/2023
// Design Name: 
// Module Name:    G Calc
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

module g_calc(
				input  signed  [`SIZE - 1:0]  r1_in,
				input  signed  [`SIZE - 1:0]  r2_in,
				input                         u_in,
				output signed  [`SIZE - 1:0]  g_out
			   );
    
// Data	Type Declaration

// take r1 2's compliment when u_in is != 0
wire [`SIZE - 1 : 0] r1_2c = (u_in) ? (~r1_in + 1) : (r1_in);

assign g_out[`SIZE - 1 : 0] = r2_in + r1_2c;

endmodule // g_calc