//case문을 이용한 4x1 설계 

module mux(a,b,c,d, sel, out);
	input	[3:0]	a, b, c, d; //4비트 입력 중 한개를 고르게 되잇음 
	input	[1:0]	sel; 
	output	[3:0]	out;

	reg	[3:0]	out;

	always @ (sel or a	or b or c or d) 
	begin : MUX
	 case (sel)
	    2'b00 : out = a;     
	    2'b01 : out = b; 
	    2'b10 : out = c; 
                2'b11 : out = d; 
	 endcase
            end
endmodule

