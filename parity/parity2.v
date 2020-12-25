//패리티 발생기 
module ParityGenerator(data_in, parity_out)

	input	[7:0]	data_in;
	output		parity_out

	//중간신호 wire
	wire	x1, x2,x3,x4,x5,x6,x7;
	
	xor U1(x1, data in[0], data_in[1]);
	xor U2(x2, x1, data_in[2]);
	xor U3(x3, x2, data_in[3]);
	xor U4(x4, x3, data_in[4]);
	xor U5(x5, x4, data_in[5]);
	xor U6(x6, x5, data_in[6]);
	xor U7(x7, x6, data_in[7]);

	assign parity_out = x7;
endmodule


module ParityDataOut(din, dout);
	input	[7:0]	din;
	output	[8:0]	dout;

	wire p1;

	parityGenerator U1(.data_in(din), .parity_out(p1));

	assign dout = {din, p1};

endmodule