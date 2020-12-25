/*카르노맵을 사용해 논리식을 간소화 시킨 후 Verilog로 표현  */

module Fulladder2(x, y, z, S, C);
	input	x, y, z;
	output	S, C;

	assign	S = (~x&~y&z)|(~x&y&~z)|(x&~y&~z)|(x&y&z);
	assign	C = (x&y)|(x&z)|(y&z);


endmodule  