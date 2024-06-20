`timescale 1ns/100ps
`include "../RTL/define.vh"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:       Praveen Bohra 
// 
// Create Date:    20:01:16 06/01/2023
// Design Name: 
// Module Name:    TESTBENCH Polar Encoder
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

module tb_polar_encoder();
    
// data type declaration
reg 				            clk;
reg    [0 : `MESSAGE_LENGTH -1] INFORMATION_IN;
wire   [0 : `N -1]              ENCODED_OUT;

wire signed [`SIZE - 1 : 0]     X1_BPSK_OUT,X2_BPSK_OUT,X3_BPSK_OUT,X4_BPSK_OUT;

wire 					        U1_HAT,U2_HAT,U3_HAT,U4_HAT;

`ifdef BLOCK_LENGTH_8
wire signed [`SIZE - 1 : 0]  	X5_BPSK_OUT,X6_BPSK_OUT,X7_BPSK_OUT,X8_BPSK_OUT;

wire                            U5_HAT,U6_HAT,U7_HAT,U8_HAT;								
`endif



								
// Instansiation of POLAR ENCODER
`ifdef BLOCK_LENGTH_8
polar_encoder POLAR_ENC(
                        .infor_i		(INFORMATION_IN),
						.encoded_o      (ENCODED_OUT)
					   );
`endif					   

// Instansiation of BPSK
bpsk BPSK(
		 .bpsk_in		(ENCODED_OUT),
		 .x1_bpsk_out	(X1_BPSK_OUT),
		 .x2_bpsk_out	(X2_BPSK_OUT),
		 .x3_bpsk_out	(X3_BPSK_OUT),
		 .x4_bpsk_out	(X4_BPSK_OUT)
		 `ifdef BLOCK_LENGTH_8
		 ,
		 .x5_bpsk_out	(X5_BPSK_OUT),
		 .x6_bpsk_out	(X6_BPSK_OUT),
		 .x7_bpsk_out	(X7_BPSK_OUT),
		 .x8_bpsk_out	(X8_BPSK_OUT)
		 `endif
	    );
		
// Instansiation of POLAR DECODER
`ifdef BLOCK_LENGTH_8

polar_deccoder POLAR_DEC(
						.x1_in           (X1_BPSK_OUT),
				        .x2_in           (X2_BPSK_OUT),
					    .x3_in           (X3_BPSK_OUT),
				        .x4_in           (X4_BPSK_OUT),
					    .x5_in           (X5_BPSK_OUT),
				        .x6_in           (X6_BPSK_OUT),
					    .x7_in           (X7_BPSK_OUT),
				        .x8_in           (X8_BPSK_OUT),					  
				        .u1_hat_out      (U1_HAT),
				        .u2_hat_out      (U2_HAT),
				        .u3_hat_out      (U3_HAT),
				        .u4_hat_out      (U4_HAT),
				        .u5_hat_out      (U5_HAT),
				        .u6_hat_out      (U6_HAT),
				        .u7_hat_out      (U7_HAT),
				        .u8_hat_out		 (U8_HAT)  
			            );
						
`endif

always
#10 clk = ~clk;

initial
begin
clk = 1'b0; 

`ifdef MESSAGE_LENGTH_1
   	             INFORMATION_IN = 1'b0; 
#10				 INFORMATION_IN = 1'b1;
`elsif MESSAGE_LENGTH_2
   	             INFORMATION_IN = 2'b00; 
#10				 INFORMATION_IN = 2'b01;
#10				 INFORMATION_IN = 2'b10;
#10				 INFORMATION_IN = 2'b11;
`elsif MESSAGE_LENGTH_3
   	             INFORMATION_IN = 3'b110; 
#10				 INFORMATION_IN = 3'b011;
#10				 INFORMATION_IN = 3'b000;
#10				 INFORMATION_IN = 3'b010;
#10				 INFORMATION_IN = 3'b111;
#10				 INFORMATION_IN = 3'b001;
#10				 INFORMATION_IN = 3'b011;
#10				 INFORMATION_IN = 3'b110;	                 
`elsif MESSAGE_LENGTH_4
   	             INFORMATION_IN = 4'b0000; 
#10				 INFORMATION_IN = 4'b0001;
#10				 INFORMATION_IN = 4'b0010;
#10				 INFORMATION_IN = 4'b0011;
#10				 INFORMATION_IN = 4'b0100;
#10				 INFORMATION_IN = 4'b0101;
#10				 INFORMATION_IN = 4'b0110;
#10				 INFORMATION_IN = 4'b0111;	
#10				 INFORMATION_IN = 4'b1000;
#10				 INFORMATION_IN = 4'b1001;
#10				 INFORMATION_IN = 4'b1010;
#10				 INFORMATION_IN = 4'b1011;
#10				 INFORMATION_IN = 4'b1100;
#10				 INFORMATION_IN = 4'b1101;
#10				 INFORMATION_IN = 4'b1110;
#10				 INFORMATION_IN = 4'b1111;
`endif

#50 $stop;
end
endmodule