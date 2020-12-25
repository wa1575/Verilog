/* 비트 단위 논리 연산자를 사용하여 전가산기의 테스트 벤치, `는 ~옆에 */

`timescale 1ns/10ps 

module tb_Fulladder2;
	reg x, y, cin;
	wire Sum, Carry;

	Fulladder2 tb(x, y, cin, Sum, Carry);

	//여기서부터 waveform을 보기위한 파일을 만드는 코드
	initial
	   begin
	       $dumpfile("test_Fulladder_out.vcd"); //에러발생 14
	       $dumpvars(-1,tb);                      //에러발생 15
	       $monitor("%b", Sum);
	       $monitor("%b", Carry);
	    end
		//waveform을 보기위한 코드 끝

	initial
	   begin                                           //에러 신택스 22 
	       x = 0; y=0; cin = 0; #100;      //밑에 다 에러 
	       x = 0; y=1; cin = 0; #100;
	       x = 1; y=0; cin = 0; #100;
	       x = 1; y=1; cin = 0; #100;
	       x = 0; y=0; cin = 1; #100;
	       x = 0; y=1; cin = 1; #100;
	       x = 1; y=0; cin = 1; #100;
	       x = 1; y=1; cin = 1; #100;
	   end	  

endmodule