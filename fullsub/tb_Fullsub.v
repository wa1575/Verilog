/* 비트 단위 논리 연산자를 사용하여 전가산기의 테스트 벤치, `는 ~옆에 */

`timescale 1ns/10ps 

module tb_Fullsub;
	reg x, y, z;
	wire D, B;

	Fullsub tb(x, y, z, D, B);

	//여기서부터 waveform을 보기위한 파일을 만드는 코드
	initial
	   begin
	       $dumpfile("test_Subtracter_out.vcd"); 
	       $dumpvars(-1,tb);                    
	       $monitor("%b", D);
	       $monitor("%b", B);
	    end
		//waveform을 보기위한 코드 끝

	initial
	   begin                                       
	       x = 0; y=0; z = 0; #100;      
	       x = 0; y=1; z = 0; #100;
	       x = 1; y=0; z = 0; #100;
	       x = 1; y=1; z = 0; #100;
	       x = 0; y=0; z = 1; #100;
	       x = 0; y=1; z = 1; #100;
	       x = 1; y=0; z = 1; #100;
	       x = 1; y=1; z = 1; #100;
	   end	  

endmodule