`timescale 1ns/100ps
`include "../RTL/define.vh"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:       Praveen Bohra 
// 
// Create Date:    01:07:18 28/12/2022
// Design Name: 
// Module Name:    TESTBENCH Polar Decoder
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

module tb_polar_decoder();
    
// data type declaration
reg 				        clk;
reg signed [`SIZE - 1 : 0]  X1_IN,X2_IN,X3_IN,X4_IN,X5_IN,X6_IN,X7_IN,X8_IN;
wire 					    U1_HAT,U2_HAT,U3_HAT,U4_HAT,U5_HAT,U6_HAT,U7_HAT,U8_HAT;

wire signed [`SIZE - 1 : 0] BELIEF_OUT;

// Instansiation of DUT
polar_deccoder POLAR_DEC(
						.x1_in           (X1_IN),
				        .x2_in           (X2_IN),
					    .x3_in           (X3_IN),
				        .x4_in           (X4_IN),
					    .x5_in           (X5_IN),
				        .x6_in           (X6_IN),
					    .x7_in           (X7_IN),
				        .x8_in           (X8_IN),					  
				        .u1_hat_out      (U1_HAT),
				        .u2_hat_out      (U2_HAT),
				        .u3_hat_out      (U3_HAT),
				        .u4_hat_out      (U4_HAT),
				        .u5_hat_out      (U5_HAT),
				        .u6_hat_out      (U6_HAT),
				        .u7_hat_out      (U7_HAT),
				        .u8_hat_out		 (U8_HAT)  
			            );

always
#10 clk = ~clk;

initial
begin
	 clk = 1'b0; X1_IN = 8'd1; X2_IN = 8'd1; X3_IN = -8'd1; X4_IN = -8'd1; X5_IN = 8'd1; X6_IN = 8'd1; X7_IN = -8'd1; X8_IN = -8'd1; 
#10              X1_IN = 8'd1; X2_IN = 8'd1; X3_IN = -8'd1; X4_IN = -8'd1; X5_IN = 8'd1; X6_IN = 8'd1; X7_IN = -8'd1; X8_IN = -8'd1; 	 

#50 $stop;
end
endmodule