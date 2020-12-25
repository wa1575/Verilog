//구조적 모델링을 사용한 패리티 생성기 테스트 벤치

`timescale 1ns/10ps

module tb_paritygenerator;
	reg	[7:0]	data_in;

	wire	[8:0]	data_out;

	integer i;

	ParityGenerator tb(.data_in(data_in), .data_out(data_out));

	//여기서부터 waveform을 보기위한 파일을 만드는 포트
	initial 
	begin
		$dumpfile("test_ParityGenerator_out.vcd"); 
		$dumpvars(-1,tb);    
		$monitor("%b", data_out);
	end
   //waveform을 보기위한 코드 끝

	initial 
	begin
		data_in = 8'b00000000;
		#100
		for ( i = 0 ; i <=7; i = i+1 )
			begin
				#50 data_in = data_in + 1 ;
			end
		#50;
	end

endmodule