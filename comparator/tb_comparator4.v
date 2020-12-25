/* 2비교기 테스트 벤치 */

`timescale 1ns/10ps 

module tb_comparator;
	reg	[1:0]	a; 
	reg	[1:0]	b; 
	reg		Gt_I;
	reg		Eq_I;
	reg		Lt_I;

	wire		Gt;
	wire		Eq;
	wire		Lt;

	//이름에 의한 매핑
	comparator_2 tb(.Gt_I(Gt_I), .Eq_I(Eq_I), .Lt_I(Lt_I), .a(a), .b(b), .Gt(Gt), .Eq(Eq), .Lt(Lt)); 

  //여기서부터 waveform을 보기위한 파일을 만드는 코드
	initial 
	begin
		$dumpfile("test_comparator4_out.vcd"); 
		$dumpvars(-1,tb);    
		$monitor("%b", Gt);
		$monitor("%b", Eq);
		$monitor("%b", Lt);
	end
   //waveform을 보기위한 코드 끝

	initial 

	begin
		Gt_I = 0;	Eq_I = 1;	Lt_I = 0;
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