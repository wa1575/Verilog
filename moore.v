//무어 머신 - 클럭 분주회로 설계 
/* 50만번마다 0,1 반복시켜야 함
clkCount라는 변수만들어서, 1들어올 때마다 1씩증가되고, 500,000이 되면 다음상태로 천이하면서 '1'이 나옴
-> clkCount <= 500,000 까지 0 유지하다가,clkCount 0으로 초기화 
(0부터 시작했다면 499,999 까지 )
-> 반대도 S1도 마찬가지
입력클럭이 1,000,000 입력되면 출력 클럭은 0과 1 반복하므로 1,000,000분주가되어 1Hz 클럭 발생 
*/
module moore(clk, rst, i, m, n, y);
	input	clk, rst, i, m, n;
	output	y;
  
	reg	y;
	reg	state;
	reg	next_state;

	parameter S0=1'b0, S1=1'b1;

	integer clkCount = 0;

	always @(posedge clk)//상승엣지에서 작동
	begin
	clkCount <= clkCount + 1'b1;
	if (~rst)	state = S0;
	else	state = next_state;
	end

	always @(i or state)
	case(state)
		S0:
			if(clkCount >= 500000) 
			begin
			next_state = S1; //입력 i가 1이면
			clkCount = 0;
			end
			else next_state = S0;
		S1:
			if(clkCount >= 500000)
			begin 
			next_state = S0;
			clkCount = 0;
			end
			else next_state = S1;

	endcase
	always @(state or m or n ) 
	case (state)
		S0: y = m; // m = 0
		S1: y = n; // n = 1 
	endcase
endmodule 
