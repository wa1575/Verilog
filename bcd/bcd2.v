//bcd adder 
module bcd(a, b, c_in, c_out, sum);
	input	[3:0]	a, b;
	input		c_in;
	output		c_out;
	output	[3:0]	sum;
	
	reg[4:0]	z; //always문은 reg사용
	assign sum = z[3:0];
	assign c_out = z[4];

	always @(a or b or c_in)
	begin
	  z = a + b;
   	 if (z > 9)
    	 begin
        	  z = z + 6;
    	 end
	end
endmodule