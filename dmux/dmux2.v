//if~else문을 이용한 1x4 dmux 설계 

module dmux(i, sel, out);
	input		i; 
	input	[1:0]	sel; 
	output	[3:0]	out;

	reg	[3:0]	out;

	always @ (sel or i) 
	begin : dMUX
	 if ( sel == 2'b00 )
		begin
		out[0] = i;
                        out[1] = 1'b0;
                        out[2] = 1'b0;
                        out[3] = 1'b0;
                        end   
	else if ( sel == 2'b01 )	     
		begin
		out[0] = 1'b0;
                        out[1] = i;
                        out[2] = 1'b0;
                        out[3] = 1'b0;
                        end   
	 else if ( sel == 2'b10 )
		begin
		out[0] = 1'b0;
                        out[1] = 1'b0;
                        out[2] = i;
                        out[3] = 1'b0;
                        end   
	else
		begin
		out[0] = 1'b0;
                        out[1] = 1'b0;
                        out[2] = 1'b0;
                        out[3] = i;
                        end   
            end
endmodule

