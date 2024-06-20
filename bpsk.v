`timescale 1ns/100ps
`include "../RTL/define.vh"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:       Praveen Bohra 
// 
// Create Date:    
// Design Name: 
// Module Name:    BPSK
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

module bpsk(
				input          [0 : `N - 1 ]     bpsk_in,
				output signed  [`SIZE - 1:0]     x1_bpsk_out,
				output signed  [`SIZE - 1:0]     x2_bpsk_out,
				output signed  [`SIZE - 1:0]     x3_bpsk_out,
				output signed  [`SIZE - 1:0]     x4_bpsk_out
				`ifdef BLOCK_LENGTH_8
				,
				output signed  [`SIZE - 1:0]     x5_bpsk_out,
				output signed  [`SIZE - 1:0]     x6_bpsk_out,
				output signed  [`SIZE - 1:0]     x7_bpsk_out,
				output signed  [`SIZE - 1:0]     x8_bpsk_out
				`endif
			   );
    
// Data	Type Declaration

// BPSK 0 --> 1, 1 --> -1
assign  x1_bpsk_out[`SIZE - 1 : 0] = (bpsk_in[0]) ? -`SIZE'd1 : `SIZE'd1;
assign  x2_bpsk_out[`SIZE - 1 : 0] = (bpsk_in[1]) ? -`SIZE'd1 : `SIZE'd1;
assign  x3_bpsk_out[`SIZE - 1 : 0] = (bpsk_in[2]) ? -`SIZE'd1 : `SIZE'd1;
assign  x4_bpsk_out[`SIZE - 1 : 0] = (bpsk_in[3]) ? -`SIZE'd1 : `SIZE'd1;
`ifdef BLOCK_LENGTH_8
assign  x5_bpsk_out[`SIZE - 1 : 0] = (bpsk_in[4]) ? -`SIZE'd1 : `SIZE'd1;
assign  x6_bpsk_out[`SIZE - 1 : 0] = (bpsk_in[5]) ? -`SIZE'd1 : `SIZE'd1;
assign  x7_bpsk_out[`SIZE - 1 : 0] = (bpsk_in[6]) ? -`SIZE'd1 : `SIZE'd1;
assign  x8_bpsk_out[`SIZE - 1 : 0] = (bpsk_in[7]) ? -`SIZE'd1 : `SIZE'd1;
`endif

endmodule // g_calc