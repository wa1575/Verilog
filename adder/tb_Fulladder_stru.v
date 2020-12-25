/* 구조적 모델링을 사용한 전가산기의 테스트 벤치  */

`timescale 1ns/10ps 

module tb_Fulladder_stru;
	reg	x, y, cin;
	wire	Sum, Carry;

	Fulladder_stru tb(.x(a), .y(b), .cin(cin), .Sum(Sum), .Carry(Carry));

	//여기서부터 waveform을 보기위한 파일을 만드는 코드
	initial
	   begin
	   	$dumpfile("test_Fulladder_stru_out.vcd"); 
	   	$dumpvars(-1,tb);                             
	            $monitor("%b", Sum);
	            $monitor("%b", Carry);
	    end
		//waveform을 보기위한 코드 끝

	initial
	   begin                                          
	      x = 0; y=0; cin = 0; #100;      
	      x = 0; y=1; cin = 0; #100;
	      x = 1; y=0; cin = 0; #100;
	      x = 1; y=1; cin = 0; #100;
	      x = 0; y=0; cin = 1; #100;
	      x = 0; y=1; cin = 1; #100;
	      x = 1; y=0; cin = 1; #100;
	      x = 1; y=1; cin = 1; #100;
	    end	

endmodule