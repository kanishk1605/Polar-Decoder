`timescale 1ns/100ps
`include "../RTL/define.vh"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:       Praveen Bohra 
// 
// Create Date:    
// Design Name: 
// Module Name:    u_conclusion 
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

module u_conclusion(
				input  signed  [`SIZE - 1:0]  belief_in,
				output                        u_hat_out
			   );
    
// Data	Type Declaration

// take r1 2's compliment when u_in is != 0
assign u_hat_out = (belief_in >= 0) ? 1'b0 : 1'b1;

endmodule // u_conclusion