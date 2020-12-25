module seg(clk, hex, sega, segb, segc, segd, sege, segf, segg);
	input		clk;
	input	[3:0]	hex;
	output	reg	sega;
	output	reg	segb;
	output	reg	segc;
	output	reg	segd;
	output	reg	sege;
	output	reg	segf;
	output	reg	segg;
	reg	[6:0]	segment;

	always @ (clk) begin
	case (hex)
	4'b0000 :      	            //Hex 0
	segment = 7'b1111110;
	4'b0001 :    		//Hex 1
	segment = 7'b0110000;
	4'b0010 :  		// Hex 2
	segment = 7'b1101101; 
	4'b0011 : 		// Hex 3
	segment = 7'b1111001;
	4'b0100 :		             // Hex 4
	segment = 7'b0110011;
	4'b0101 :		             // Hex 5
	segment = 7'b1011011;  
	4'b0110 :		             // Hex 6
	segment = 7'b1011111;
	4'b0111 :		             // Hex 7
	segment = 7'b1110000;
	4'b1000 :     		 //Hex 8
	segment = 7'b1111111;
	4'b1001 :    		 //Hex 9
	segment = 7'b1111011;
	4'b1010 :  		 // Hex a
	segment = 7'b1110111; 
	4'b1011 : 		 // Hex b
	segment = 7'b0011111;
	4'b1100 :		             // Hex c
	segment = 7'b1001110;
	4'b1101 :		             // Hex d
	segment = 7'b0111101;
	4'b1110 :		             // Hex e	
	segment = 7'b1001111;
	4'b1111 :		             // Hex f
	segment = 7'b1000111;
	endcase
	
	 sega = segment[6];
	 segb = segment[5];
	 segc = segment[4];
	 segd = segment[3];
	 sege = segment[2];
	 segf = segment[1];
	 segg = segment[0];

            end

endmodule

