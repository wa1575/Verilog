/* case 문 7-세그먼트 테스트 벤치 */

`timescale 1ns/10ps 

module tb_seg;
	reg		clk;
	reg	[3:0]	hex; 
	wire		sega;
	wire		segb;
	wire		segc;
	wire		segd;
	wire		sege;
	wire		segf;
	wire		segg;
	//wire	[6:0]	segment;

	seg tb(clk, hex, sega, segb, segc, segd, sege, segf, segg);


	initial 
		clk = 1'b0;
	always
		#10 clk = ~clk;

  //여기서부터 waveform을 보기위한 파일을 만드는 코드
	initial begin
		$dumpfile("test_seg_out.vcd"); 
		$dumpvars(-1,tb);    
		$monitor("%b", sega);
		$monitor("%b", segb);
		$monitor("%b", segc);
		$monitor("%b", segd);
		$monitor("%b", sege);
		$monitor("%b", segf);
		$monitor("%b", segg);
	end
   //waveform을 보기위한 코드 끝

	initial 
	begin
		#50 hex = 4'h0;    
		#50 hex = 4'h1;      
		#50 hex = 4'h2;    
		#50 hex = 4'h3;     
		#50 hex = 4'h4;   
		#50 hex = 4'h5;   
		#50 hex = 4'h6;   
		#50 hex = 4'h7;   
		#50 hex = 4'h8;   
		#50 hex = 4'h9;   
		#50 hex = 4'ha;  
		#50 hex = 4'hb;     
		#50 hex = 4'hc;    
		#50 hex = 4'hd;   
		#50 hex = 4'he;    
		#50 hex = 4'hf;     
	end

endmodule