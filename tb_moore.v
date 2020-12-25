// 상태도 테스트 벤치 , 무어 밀리 모두 동일

`timescale 1ns/100ps

module tb_moore;
	reg	clk;
	reg	rst;
	reg	i, m, n;
	
	wire	y;
	
	moore tb ( .clk(clk), .rst(rst), .i(i), .m(m), .n(n), .y(y));

	//여기서부터 waveform을 보기위한 파일을 만드는 포트
	initial 
	begin
		$dumpfile("test_moore_out.vcd"); 
		$dumpvars(-1,tb);    
		$monitor("%b", y);
	end
   //waveform을 보기위한 코드 끝

	initial 
		clk = 1'b0;
		//rst = 1'b1;

	always
		#5 clk = ~clk;
	always
		#10 i = ~i;
	
	initial
	begin
		clk = 1'b0;	rst = 1'b1;	#50;
		rst = 1'b0;	     		#50;
		rst = 1'b1; 	i = 1'b0;		m=1'b0;	n=1'b1;	#500000000;
		$finish;	// 시뮬레이션 환경에서 사용, 논리합성 지원 x 		
	end
endmodule