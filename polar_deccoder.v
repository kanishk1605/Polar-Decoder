`timescale 1ns/100ps
`include "../RTL/define.vh"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:       Praveen Bohra 
// 
// Create Date:    
// Design Name: 
// Module Name:    Polar Decoder
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

module polar_deccoder(
					  input  signed  [`SIZE - 1:0]  x1_in,
				      input  signed  [`SIZE - 1:0]  x2_in,
					  input  signed  [`SIZE - 1:0]  x3_in,
				      input  signed  [`SIZE - 1:0]  x4_in,
					  input  signed  [`SIZE - 1:0]  x5_in,
				      input  signed  [`SIZE - 1:0]  x6_in,
					  input  signed  [`SIZE - 1:0]  x7_in,
				      input  signed  [`SIZE - 1:0]  x8_in,					  
				      output                        u1_hat_out,
				      output                        u2_hat_out,
				      output                        u3_hat_out,
				      output                        u4_hat_out,
				      output                        u5_hat_out,
				      output                        u6_hat_out,
				      output                        u7_hat_out,
				      output                        u8_hat_out					  
			         );
    
// Data	Type Declaration
wire signed [`SIZE -1 :0] l1_3_0,l2_3_0,l3_3_0,l4_3_0,l1_2_0,l2_2_0,l1_1_0;
wire signed [`SIZE -1 :0] l1_1_1,g1_2_1,g2_2_1,l1_0_2,l1_1_3,l1_2_2,l2_2_2;
wire signed [`SIZE -1 :0] g1_3_1,g2_3_1,g3_3_1,g4_3_1,l1_1_4,l1_1_5,g1_2_3;
wire signed [`SIZE -1 :0] g2_2_3,l1_0_6,l1_1_7;
// Code Starts 

// Calculating beliefs to level 2 left child 

l_belief L1_3_0(.x_in(x1_in) , .y_in(x5_in) , .belief_out(l1_3_0));
l_belief L2_3_0(.x_in(x2_in) , .y_in(x6_in) , .belief_out(l2_3_0));
l_belief L3_3_0(.x_in(x3_in) , .y_in(x7_in) , .belief_out(l3_3_0));
l_belief L4_3_0(.x_in(x4_in) , .y_in(x8_in) , .belief_out(l4_3_0));

// Calculating beliefs to level 1 left child 

l_belief L1_2_0(.x_in(l1_3_0) , .y_in(l3_3_0) , .belief_out(l1_2_0));
l_belief L2_2_0(.x_in(l2_3_0) , .y_in(l4_3_0) , .belief_out(l2_2_0));

// Calculating beliefs to level 0 left child 

l_belief L1_1_0(.x_in(l1_2_0) , .y_in(l2_2_0) , .belief_out(l1_1_0));
u_conclusion U1_CONCLU(.belief_in(l1_1_0), .u_hat_out(u1_hat_out));

// Calulating G , to level 1 2 livel 0 node 1

g_calc G1_1_1(.r1_in(l1_2_0), .r2_in(l2_2_0), .u_in(u1_hat_out), .g_out(l1_1_1));
u_conclusion U2_CONCLU(.belief_in(l1_1_1), .u_hat_out(u2_hat_out));

wire [1:0] x1 = {u1_hat_out ^ u2_hat_out,u2_hat_out};


// Calulating G , to level 2 2 level 1 node 2

g_calc G1_2_1(.r1_in(l1_3_0), .r2_in(l3_3_0), .u_in(x1[1]), .g_out(g1_2_1));
g_calc G2_2_1(.r1_in(l2_3_0), .r2_in(l4_3_0), .u_in(x1[0]), .g_out(g2_2_1));

// Calculating beliefs to node 2 left child 

l_belief L1_0_2(.x_in(g1_2_1) , .y_in(g2_2_1) , .belief_out(l1_0_2));
u_conclusion U3_CONCLU(.belief_in(l1_0_2), .u_hat_out(u3_hat_out));

// Calulating G , to level 1 2 livel 0 node 3
g_calc G1_1_3(.r1_in(g1_2_1), .r2_in(g2_2_1), .u_in(u3_hat_out), .g_out(l1_1_3));
u_conclusion U4_CONCLU(.belief_in(l1_1_3), .u_hat_out(u4_hat_out));

wire [1:0]x2 = {u3_hat_out ^ u4_hat_out,u4_hat_out};
wire [3:0]x3 = {x1 ^ x2,x2};

// Calulating G , to level 3 2 livel 2 node 1
g_calc G1_3_1(.r1_in(x1_in), .r2_in(x5_in), .u_in(x3[3]), .g_out(g1_3_1));
g_calc G2_3_1(.r1_in(x2_in), .r2_in(x6_in), .u_in(x3[2]), .g_out(g2_3_1));
g_calc G3_3_1(.r1_in(x3_in), .r2_in(x7_in), .u_in(x3[1]), .g_out(g3_3_1));
g_calc G4_3_1(.r1_in(x4_in), .r2_in(x8_in), .u_in(x3[0]), .g_out(g4_3_1));

// Calculating beliefs to level 1 left child 
l_belief L1_2_2(.x_in(g1_3_1) , .y_in(g3_3_1) , .belief_out(l1_2_2));
l_belief L2_2_2(.x_in(g2_3_1) , .y_in(g4_3_1) , .belief_out(l2_2_2));

// Calculating beliefs to level 0 left child 
l_belief L1_1_4(.x_in(l1_2_2) , .y_in(l2_2_2) , .belief_out(l1_1_4));
u_conclusion U5_CONCLU(.belief_in(l1_1_4), .u_hat_out(u5_hat_out));

// Calulating G , to level 1 2 livel 0 node 5
g_calc G1_1_5(.r1_in(l1_2_2), .r2_in(l2_2_2), .u_in(u5_hat_out), .g_out(l1_1_5));
u_conclusion U6_CONCLU(.belief_in(l1_1_5), .u_hat_out(u6_hat_out));

wire [1:0]x4 = {u5_hat_out ^ u6_hat_out,u6_hat_out};

// Calulating G , to level 2 2 level 1 node 3

g_calc G1_2_3(.r1_in(g1_3_1), .r2_in(g3_3_1), .u_in(x4[1]), .g_out(g1_2_3));
g_calc G2_2_3(.r1_in(g2_3_1), .r2_in(g4_3_1), .u_in(x4[0]), .g_out(g2_2_3));

// Calculating beliefs to node 2 left child 

l_belief L1_0_6(.x_in(g1_2_3) , .y_in(g2_2_3) , .belief_out(l1_0_6));
u_conclusion U7_CONCLU(.belief_in(l1_0_6), .u_hat_out(u7_hat_out));

// Calulating G , to level 1 2 livel 0 node 7
g_calc G1_1_7(.r1_in(g1_2_3), .r2_in(g2_2_3), .u_in(u7_hat_out), .g_out(l1_1_7));
u_conclusion U8_CONCLU(.belief_in(l1_1_7), .u_hat_out(u8_hat_out));

endmodule //polar_deccoder