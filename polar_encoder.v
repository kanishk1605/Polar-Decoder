`include "../RTL/define.vh"
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:       Praveen Bohra 
// 
// Create Date:    
// Design Name: 
// Module Name:    POLAR ENCOdER
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
 
module polar_encoder(infor_i,encoded_o);

// Port Declaration  
  input  [0 : `MESSAGE_LENGTH -1] infor_i;
  output [0 : `N -1] encoded_o;
 
// internal variables
wire [0 : `N -1] polar_trans;
wire [0 : `N -1] x;

wire [0:1] polar_trans_0_0,polar_trans_0_1,polar_trans_0_2,polar_trans_0_3;
wire [0:3] polar_trans_1_0,polar_trans_1_1;
wire [0:7] polar_trans_2_0;


// Code Starts 
assign x[0] = `F>0 ? 1'b0 : infor_i[`MESSAGE_LENGTH - 8];
assign x[1] = `F>1 ? 1'b0 : infor_i[`MESSAGE_LENGTH - 7];
assign x[2] = `F>2 ? 1'b0 : infor_i[`MESSAGE_LENGTH - 6];
assign x[4] = `F>3 ? 1'b0 : infor_i[`MESSAGE_LENGTH - 5];
assign x[3] = `F>4 ? 1'b0 : infor_i[`MESSAGE_LENGTH - 4];
assign x[5] = `F>5 ? 1'b0 : infor_i[`MESSAGE_LENGTH - 3];
assign x[6] = `F>6 ? 1'b0 : infor_i[`MESSAGE_LENGTH - 2];
assign x[7] = `F>7 ? 1'b0 : infor_i[`MESSAGE_LENGTH - 1];

assign polar_trans_0_0 [0:1] = {x[0] ^ x[1],x[1]}; 
assign polar_trans_0_1 [0:1] = {x[2] ^ x[3],x[3]};
assign polar_trans_0_2 [0:1] = {x[4] ^ x[5],x[5]};
assign polar_trans_0_3 [0:1] = {x[6] ^ x[7],x[7]};

assign polar_trans_1_0 [0:3] = {polar_trans_0_0 ^ polar_trans_0_1,polar_trans_0_1}; 
assign polar_trans_1_1 [0:3] = {polar_trans_0_2 ^ polar_trans_0_3,polar_trans_0_3}; 

assign polar_trans_2_0 [0:7] = {polar_trans_1_0 ^ polar_trans_1_1,polar_trans_1_1}; 

assign encoded_o = polar_trans_2_0;

endmodule // polar_encoder




