// 8비트 비동기 레지스터 테스트벤치

`timescale 1ns/10ps

module tb_srg;
	reg		clk;
	reg		rst;
	reg		load;
	reg	[7:0]	data_in;
	
	wire	s_out;
	
	srg tb ( .clk(clk), .rst(rst), .load(load), .data_in(data_in), .s_out(s_out));

	//여기서부터 waveform을 보기위한 파일을 만드는 포트
	initial 
	begin
		$dumpfile("test_srg_out.vcd"); 
		$dumpvars(-1,tb);    
		$monitor("%b", s_out);
	end
   //waveform을 보기위한 코드 끝

	initial 
		clk = 1'b0;

	always
		#5 clk = ~clk;
	initial
	begin
		rst = 1'b0;	load = 1'b0;	data_in = 8'b10111011; 	#20;
		rst = 1'b1;						#20
		rst = 1'b0;	load = 1'b1;				#20;
		load=1'b0;						#200;

		
		

		$finish;	// 시뮬레이션 환경에서 사용, 논리합성 지원 x 		
	end
endmodule