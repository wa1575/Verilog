//구조적 비교기_2비트

module comparator_2(Gt_I,Eq_I,Lt_I, a, b, Gt, Eq, Lt);
	input	[1:0]	a; 
	input	[1:0]	b; 
	input		Gt_I;
	input		Eq_I;
	input		Lt_I;

	output		Gt;
	output		Eq;
	output		Lt;
                                     //xnor                                  
	 assign Gt = ~(a[1] & ~b[1] | ~a[1] & b[1]) & a[0] & ~b[0] | a[1] & ~b[1];
	 assign Eq = ~(a[0] & ~b[0] | ~a[0] & b[0]) & ~(a[1] & ~b[1] | ~a[1] & b[1]);
	 assign Lt = ~(a[1] & ~b[1] | ~a[1] & b[1]) & ~a[0] & b[0] | ~a[1] & b[1];
            
endmodule




//구조적 비교기  4비트 
module comparator_4(Gt_I, Eq_I, Lt_I, a, b, Gt, Eq, Lt);
	input	[3:0]	a; 
	input	[3:0]	b; 
            input		Gt_I;
            input		Eq_I;
            input		Lt_I;

	output		Gt;
	output		Eq;
	output		Lt;

	wire		Gt1, Eq1, Lt1, Gt2, Eq2, Lt2 ; 

            comparator_2 u1(Gt_I, Eq_I, Lt_I, a[3:2], b[3:2], Gt2, Eq2, Lt2);
	comparator_2 u2(Gt_I, Eq_I, Lt_I, a[1:0], b[1:0], Gt1, Eq1, Lt1);                            

endmodule