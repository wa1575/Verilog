/*구조적 모델링을 사용한 전가산기 설계 */

module Fulladder_stru(a, b, cin, Sum, Carry);

	input	a, b, cin;
	output	Sum, Carry;

	wire	s0, c0, c1; //모듈 내부에서 하위 모듈간의 내부 연결 신호 
 
          //순서에 의한 포트 맵핑
	Halfadder h0(a, b, s0, c0);
	Halfadder h1(s0, cin, Sum, c1);

         // 이름에 의한 포트 맵핑 14줄
	//Halfadder h0(.x(a), .y(b), .s(s0), .c(c0));
	//Halfadder h1(.x(s0), .y(cin), .s(Sum), .c(c1));


	assign	Carry = c0 | c1; //비트단위 논리 연산자 or -> |

endmodule  