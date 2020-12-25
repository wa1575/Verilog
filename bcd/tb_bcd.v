//4비트 가감산기 테스트 벤치
`timescale 1ns/10ps

module tb_bcd;
	reg	[3:0]	a;
	reg	[3:0]	b;
	reg		c_in;

	wire		c_out;	
	wire	[3:0]	sum;

	bcd tb(.a(a), .b(b), .c_in(c_in), .c_out(c_out), .sum(sum));

	//여기서부터 waveform을 보기위한 파일을 만드는 포트
	initial 
	begin
		$dumpfile("test_bcd_out.vcd"); 
		$dumpvars(-1,tb);    
		$monitor("%b", sum);
	end
   //waveform을 보기위한 코드 끝

	initial 
	begin
		a = 4'b0000; b = 4'b0000; c_in = 1'b0;
		#50 a = 4'b0011; b = 4'b0001; c_in = 1'b0;
 		#50 a = 4'b0011; b = 4'b0001; c_in = 1'b0;
		#50 a = 4'b1000; b = 4'b0101; c_in = 1'b0; 	
		#50 a = 4'b1000; b = 4'b0101; c_in = 1'b0; 
		#50 a = 4'b1001; b = 4'b1000; c_in = 1'b0; 
		#50 a = 4'b1001; b = 4'b1000; c_in = 1'b0; 
		#50;
	end

endmodule