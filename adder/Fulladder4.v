/*비트 단위 논리 연산자를 사용하여 전가산기 설계 */

module Fulladder4(x, y, cin, Sum, Carry);
	input	x, y, cin;
	output	Sum, Carry;

	wire	s0,c0,c1; //1비트 net형 신호의 wire는 생략가능

	assign	s0 = x ^ y;
	assign	c0 = x & y;
	assign	c1 = s0 & cin;
	assign	Sum = s0 ^ cin;
	assign	Carry = c0 | c1;

endmodule  