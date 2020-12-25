//홀수 패리티 검사기 - 9비트 task 사용 

module Paritychecker(data_in, error_out);

	parameter n = 9; //패리티까지 총 9비트

	input	[n-1:0]	data_in;
	output	reg	error_out;

	integer i = 0;
	integer count = 0; 

	//function 함수안에서는 reg만 가능, wire등 설정 불가
	//task는 다 가능하지만, 받아 올 변수 정확히 입력 
	task		error_check;
		input	[n-1:0] data;
		output	error_code; //error_code = data; 홀수 패리티 정상이 0이 나와야함 

		begin
			count = 0;
			for( i = 0 ; i <= n-1 ; i = i+1)
			begin 
				if(data[i] == 1) count = count +1;
			end
			if(count%2==0) //홀수패리티인데 1의 갯수가 짝수이다? => 에러 1출력 
			error_code = 1;
			else
			error_code = 0;  //홀수면 정상  		
		end
	endtask

	always @ (data_in) begin
	error_check(data_in, error_out);
	end

endmodule  
