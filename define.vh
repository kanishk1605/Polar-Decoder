//### Select the Design you want to check for errors NxW 4/64/512/1024/2048 ###

// M = Number of message bits/Information Bits 
// F = Number of Frozen Bits

// Deside the block length of the polar Encoder/Decoder
`define BLOCK_LENGTH_8

// Deside the Message length of the polar Encoder/Decoder
// For Block Length of 4 mssage length sub not be greater the 4

//`define MESSAGE_LENGTH_3
`define MESSAGE_LENGTH_4
//`define MESSAGE_LENGTH_5

// Deside the Message length of the polar Encoder/Decoder
`ifdef MESSAGE_LENGTH_1
	`define MESSAGE_LENGTH 1
`elsif MESSAGE_LENGTH_2
	`define MESSAGE_LENGTH 2
`elsif MESSAGE_LENGTH_3
	`define MESSAGE_LENGTH 3
`elsif MESSAGE_LENGTH_4
	`define MESSAGE_LENGTH 4
`elsif MESSAGE_LENGTH_5
	`define MESSAGE_LENGTH 5
`elsif MESSAGE_LENGTH_6
	`define MESSAGE_LENGTH 6
`elsif MESSAGE_LENGTH_7
	`define MESSAGE_LENGTH 7
`else
	`define MESSAGE_LENGTH 8	
`endif

`ifdef BLOCK_LENGTH_8
	 `define SIZE 8
     `define N 8                        // Total number of bits to Encode/Decode
	 `define F (8 - `MESSAGE_LENGTH)    // No of Frozen bits = BLOCK_LENGTH - MESSAGE_LENGTH.
	 `define No_of_LEVELS 3 
`endif
