// SLA 테스트 벤치 

`timescale 1ns/10ps

module tb_CLA;
	reg [3:0] a, b;
	reg cin;
	
	wire [3:0] sum;
	wire cout;
	
	CLA tb ( .a(a), .b(b), .cin(cin), .sum(sum), .cout(cout) );

	//여기서부터 waveform을 보기위한 파일을 만드는 포트
	initial 
	begin
		$dumpfile("test_cla_out.vcd"); 
		$dumpvars(-1,tb);    
		$monitor("%b", sum);
		$monitor("%b", cout);

	end
   //waveform을 보기위한 코드 끝

	initial 
	begin
		#100
		cin = 0;
		a = 4'b0000;
		b = 4'b0000;
		#100
		a = 4'b0110;
		b = 4'b0010;
		#100
		cin = 1;
		a = 4'b1100;
		b = 4'b0010;
		#100
		cin = 1;
		a = 4'b0011;
		b = 4'b1001;
		#100
		cin = 0;
		a = 4'b0110;
		b = 4'b1111;
		#100
		cin = 1;
		a = 4'b0011;
		b = 4'b1011;
		#100
		cin = 1;
		a = 4'b1001;
		b = 4'b0010;
		#100
		cin = 0;
		a = 4'b0110;
		b = 4'b1111;
		
		
	end
endmodule