//패리티 발생기 - 함수 사용 

module ParityGenerator(data_in, parity_out)

	parameter n = 8;

	input	[n-1:0]	data_in;
	output	[n:0]	data_out;
	//함수안에서는 reg만 가능, wire등 설정 불가
	function		parity;
		input	[n-1:0] data;

		begin
			parity = data[0] ^ data[1] ^ data[2] ^ data[3] ^ data[4] ^ data[5] ^data[6] ^ data[7] ; 
			//parity = ^data;
		end
	endfunction

	assign data_out = {data_in, parity(data_in)};

endmodule  
