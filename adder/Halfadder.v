/*비트 단위 논리 연산자를 사용하여 반가산기 설계 */

module Halfadder(x, y, s, c);

	input	x, y;
	output	s, c;

	assign	s = x ^ y;
	assign	c = x & y;

endmodule  