/* 2비교기 테스트 벤치 */

`timescale 1ns/10ps 

module tb_comparator;
	reg	[1:0]	a; 
	reg	[1:0]	b; 

	wire		Gt;
	wire		Eq;
	wire		Lt;


	comparator tb(.a(a), .b(b), .Gt(Gt), .Eq(Eq), .Lt(Lt)); //순서에 의한 매핑

  //여기서부터 waveform을 보기위한 파일을 만드는 코드
	initial 
	 begin
		$dumpfile("test_comparator_out.vcd"); 
		$dumpvars(-1,tb);    
		$monitor("%b", Gt);
		$monitor("%b", Eq);
		$monitor("%b", Lt);
	 end
   //waveform을 보기위한 코드 끝

	initial 
	 begin
		a = 2'b00; b = 2'b00; 
		#50 a = 2'b01; b = 2'b00; 
		#50 a = 2'b01; b = 2'b01; 
		#50 a = 2'b01; b = 2'b10; 
		#50 a = 2'b10; b = 2'b10; 
		#50 a = 2'b11; b = 2'b10; 
		#50 a = 2'b11; b = 2'b11; 
		#50;
	 end

endmodule