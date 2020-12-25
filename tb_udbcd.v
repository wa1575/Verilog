// updown bcd 카운터 테스트 벤치 , 무어 모델

`timescale 1ns/100ps

module tb_udbcd;
	reg	clk;
	reg	rst;
	reg	updown;
	
	wire	[3:0]	c_out;
	
	udbcd tb ( .clk(clk), .rst(rst), .updown(updown), .c_out(c_out));

	//여기서부터 waveform을 보기위한 파일을 만드는 포트
	initial 
	begin
		$dumpfile("test_udbcd_out.vcd"); 
		$dumpvars(-1,tb);    
		$monitor("%b", c_out);
	end
   //waveform을 보기위한 코드 끝

	initial 
		clk = 1'b0;
	always
		#10 clk = ~clk;
	initial
	begin
		rst = 1'b1;  				#10;
		updown=1'b1;				#10;
		rst = 1'b0;				#10;	
		updown=1'b1;	       			#100;
		updown=1'b0;				#100;
		rst = 1'b1;  				#10;
		rst = 1'b0;  				#10;
		updown=1'b1;				#100;
		$finish;	// 시뮬레이션 환경에서 사용, 논리합성 지원 x 		
	end
endmodule