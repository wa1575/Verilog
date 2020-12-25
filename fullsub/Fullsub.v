/*카르노맵을 사용해 논리식을 간소화 시킨 후 Verilog로 표현  */

module Fullsub(x, y, z, D, B);
	input	x, y, z;
	output	D, B;

	assign	D = (~x&~y&z)|(~x&y&~z)|(x&~y&~z)|(x&y&z);
	assign	B = (~x&y)|(~x&z)|(y&z);


endmodule  