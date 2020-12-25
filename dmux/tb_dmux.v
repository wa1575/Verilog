/* 디멀티플렉스 테스트 벤치 */

`timescale 1ns/10ps 

module tb_dmux;
	reg		i; 
	reg	[1:0]	sel; 

	wire	[3:0]	out;

	dmux tb(i, sel, out); //순서에 의한 매핑

  //여기서부터 waveform을 보기위한 파일을 만드는 코드
	initial 
	begin
		$dumpfile("test_dmux_out.vcd"); 
		$dumpvars(-1,tb);    
		$monitor("%b", out);
	end
   //waveform을 보기위한 코드 끝

	initial 
	begin
		i = 1'b1; 
		sel = 2'b00; #50; 
		sel = 2'b01; #50;
		sel = 2'b10; #50; 
		sel = 2'b11; #50;
		i = 1'b0; 
		sel = 2'b00; #50; 
		sel = 2'b01; #50;
		sel = 2'b10; #50; 
		sel = 2'b11; #50;
	end

endmodule