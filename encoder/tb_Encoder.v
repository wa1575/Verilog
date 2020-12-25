/* else if 문 인코더의 테스트 벤치 */

`timescale 1ns/10ps 

module tb_Encoder;
	reg	[7:0]	d;
            wire		V;
	wire	[2:0]	a;
            
	Encoder tb(d, V, a);

	//여기서부터 waveform을 보기위한 파일을 만드는 코드
	initial
	   begin
	       $dumpfile("test_Encoder_out.vcd"); 
	       $dumpvars(-1,tb);        
                   $monitor("%b", V);
	       $monitor("%b", a);
	    end
		//waveform을 보기위한 코드 끝

	initial begin                                       
	 d = 8'b00000000;
	 #100;   
	 d = 8'b10000000;
	 #50;    
	 d = 8'bx1000000;
	 #50; 
	 d = 8'bxx100000;
	 #50; 
	 d = 8'bxxx10000;
	 #50; 
	 d = 8'bxxxx1000;
	 #50;
	 d = 8'bxxxxx100;
	 #50;  
	 d = 8'bxxxxxx10;
	 #50; 
	 d = 8'bxxxxxxx1;
	 #50; 
	end	  
endmodule