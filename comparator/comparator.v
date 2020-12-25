//2비트 비교기 

module comparator(a, b, Gt, Eq, Lt);
	input	[1:0]	a; 
	input	[1:0]	b; 

	output		Gt;
	output		Eq;
	output		Lt;
                                        //xnor                                  
	assign Gt = ~(a[1] & ~b[1] | ~a[1] & b[1]) & a[0] & ~b[0] | a[1] & ~b[1];
	assign Eq = ~(a[0] & ~b[0] | ~a[0] & b[0]) & ~(a[1] & ~b[1] | ~a[1] & b[1]);
	assign Lt = ~(a[1] & ~b[1] | ~a[1] & b[1]) & ~a[0] & b[0] | ~a[1] & b[1];
            
endmodule

