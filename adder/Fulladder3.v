/*회로의 동작을 Verilog 형식으로 표현  */

module FullAdder3(x, y, z, S, C);
	input	x, y, z;
	output	S, C;

	reg	S, C;

	always @(x or y or z)
		{C, S} = x+y+z;

endmodule  