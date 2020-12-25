/* 멀티플렉스 테스트 벤치 */

`timescale 1ns/10ps 

module tb_mux;
	reg		clk;
	reg	[3:0]	a, b, c, d; 
	reg	[1:0]	sel; 

	wire	[3:0]	out;

	mux tb(a, b, c, d, sel, out); //순서에 의한 매핑
         //mux tb(.a(a), .b(b), .c(c), .d(d), .sel(sel), .out(out)); //이름에 의한 매핑


  //여기서부터 waveform을 보기위한 파일을 만드는 코드
	initial 
	begin
		$dumpfile("test_mux_out.vcd"); 
		$dumpvars(-1,tb);    
		$monitor("%b", out);
	end
   //waveform을 보기위한 코드 끝

	initial 
	begin
		a = 4'b0000; b = 4'b0001; c = 4'b0010; d = 4'b0011; sel = 2'b00; #50; 
		a = 4'b0000; b = 4'b0001; c = 4'b0010; d = 4'b0011; sel = 2'b01; #50; 
		a = 4'b0000; b = 4'b0001; c = 4'b0010; d = 4'b0011; sel = 2'b10; #50; 
		a = 4'b0000; b = 4'b0001; c = 4'b0010; d = 4'b0011; sel = 2'b11; #50;   
	end

endmodule