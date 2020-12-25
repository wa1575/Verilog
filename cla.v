//Carry Look Ahead 가산기 설계
//모듈 및 컴포넌트를 정의하고 객체 생성하기 

//모듈 1. P, G 발생시키는 컴포넌트 정의
module pg(a, b, p, g);
	input	a, b;
	output	p, g;
  
	assign	p = a ^ b;
	assign	g = a & b;

endmodule

//모듈 2. XOR 연산을 통해 합(sum)을 결정하는 컴포넌트 정의 
module sum(a, b, c_in, s);
	input	a, b, c_in;
	output	s;
    	
	assign 	s=a ^ b ^ c_in;
endmodule


//모듈 3. CLA를 발생시키는 회로를 정의  
module CLA(a, b, cin, sum, cout);
	input	[3:0]	a, b;
	input 		cin;

	output 	[3:0]	sum;
	output 		cout;


	wire	[3:0]	p;
	wire	[3:0]	g;

	pg make0(.a(a[0]), .b(b[0]), .p(p[0]), .g(g[0]));
	pg make1(.a(a[1]), .b(b[1]), .p(p[1]), .g(g[1]));
	pg make2(.a(a[2]), .b(b[2]), .p(p[2]), .g(g[2]));
	pg make3(.a(a[3]), .b(b[3]), .p(p[3]), .g(g[3]));


	wire	[4:0]	c;

	assign 	c[0] = cin;
	assign 	c[1] = g[0]|(c[0]&p[0]);
	assign 	c[2] = g[1]|(p[1]&g[0])|(c[0]&p[1]&p[0]);
	assign 	c[3] = g[2]|(p[2]&g[1])|(p[2]&p[1]&g[0])|(c[0]&p[2]&p[1]&p[0]);
	assign 	cout = g[3]|(p[3]&g[2])|(p[3]&p[2]&g[1])|(p[3]&p[2]&p[1]&g[0])|(c[0]&p[3]&p[2]&p[1]&p[0]);
	assign 	c[4] = cout;

	sum thing0(.a(a[0]), .b(b[0]), .c_in(c[0]), .s(sum[0]));
	sum thing1(.a(a[1]), .b(b[1]), .c_in(c[1]), .s(sum[1]));
	sum thing2(.a(a[2]), .b(b[2]), .c_in(c[2]), .s(sum[2]));
	sum thing3(.a(a[3]), .b(b[3]), .c_in(c[3]), .s(sum[3]));

endmodule
