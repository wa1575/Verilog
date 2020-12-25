//병렬-직렬 변환회로, 행위기반으로 설계 
module srg(clk, rst, load, data_in, s_out);
	parameter n = 8;
	input	clk, rst, load;
	input	[n-1:0]	data_in;
	output	s_out;

	reg	s_out;

	reg	[n-1:0]	shift_reg = 0;

	always @(posedge clk)//상승엣지에서 작동
	begin
		if(rst)	shift_reg = 0;	//rst ==1 은 리셋 
		else if(load)	
			shift_reg = data_in;
		else begin
			s_out = shift_reg[n-1];
			shift_reg = { shift_reg[n-2:0], 1'b0 };
		end
	end
endmodule 
