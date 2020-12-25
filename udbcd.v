//무어 머신 - 클럭 분주회로 설계 
module udbcd(clk, rst, updown, c_out);
	input	clk, rst, updown;
	output	[3:0]	c_out;
  
	reg	[3:0]	c_out = 0;
	reg	[3:0]	state = 0;
	reg	[3:0]	next_state;

	parameter	[3:0]	S0=4'b0000, S1=4'b0001, S2=4'b0010,
				S3=4'b0011, S4=4'b0100, S5=4'b0101,
				S6=4'b0110, S7=4'b0111, S8=4'b1000, S9=4'b1001; 

	//integer clkCount = 0;

	always @(posedge clk or posedge rst)//상승엣지에서 작동
	begin
	if (rst)	state = S0;
	else	state = next_state;
	
	case(state)
		S0:	begin
			c_out = 4'b0000;
			if(updown == 1)	next_state = S1; 
			else	next_state = S9;
			end
		S1:	begin
			c_out = 4'b0001;
			if(updown == 1)	next_state = S2; 
			else	next_state = S0;
			end
		S2:	begin
			c_out = 4'b0010;
			if(updown == 1)	next_state = S3;
			else	next_state = S1;
			end
		S3:	begin
			c_out = 4'b0011;
			if(updown == 1)	next_state = S4;
			else	next_state = S2;
			end
		S4:	begin
			c_out = 4'b0100;
			if(updown == 1)	next_state = S1; 
			else	next_state = S3;
			end
		S5:	begin
			c_out = 4'b0101;
			if(updown == 1)	next_state = S6; 
			else	next_state = S4;
			end
		S6:	begin
			c_out = 4'b0110;
			if(updown == 1)	next_state = S7; 
			else	next_state = S5;
			end
		S7:	begin
			c_out = 4'b0111;
			if(updown == 1)	next_state = S8; //입력 i가 1이면
			else	next_state = S6;
			end
		S8:	begin
			c_out = 4'b1000;
			if(updown == 1)	next_state = S9; //입력 i가 1이면
			else	next_state = S7;
			end
		S9:	begin
			c_out = 4'b1001;
			if(updown == 1)	next_state = S0; //입력 i가 1이면
			else	next_state = S8;
			end
	endcase
end
endmodule 
