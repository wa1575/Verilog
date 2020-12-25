// 패리티 체커 테스트 벤치 

`timescale 1ns/10ps

module tb_paritychecker;
	reg	[8:0]	data_in;

	wire		error_out;

	Paritychecker tb(.data_in(data_in), .error_out(error_out));

	//여기서부터 waveform을 보기위한 파일을 만드는 포트
	initial 
	begin
		$dumpfile("test_Paritychecker_out.vcd"); 
		$dumpvars(-1,tb);    
		$monitor("%b", error_out);
	end
   //waveform을 보기위한 코드 끝

	initial 
	begin
		data_in = 9'b000000000;
		#100
			begin
				#50 data_in = 9'b100000011 ;
				#50 data_in = 9'b100100011 ;
				#50 data_in = 9'b010011101 ;
				#50 data_in = 9'b001111101 ;
			end
		#50;
	end

endmodule