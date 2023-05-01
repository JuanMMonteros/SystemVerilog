module testbench1();
	logic [3:0] A,B,F;
	logic Cin,Cout,overflow;
	
		full_adder test(A,B,Cin,Cout,overflow,F);
		
	 initial begin 
		 A=4'b0001;B=4'b0010;Cin=1'b0;  #10;
		 assert(F===4'b0011) else $error("error result code 000");
		 assert(Cout===1'b0) else $error("error Cout code 000");
		 assert(overflow===1'b0) else $error("error overflow code 000");
		 Cin=1'b1;  #10;
		 assert(F===4'b0100) else $error("error result code 001");
		 assert(Cout===1'b0) else $error("error Cout code 001");
		 assert(overflow===1'b0) else $error("error overflow code 001");
		 A=4'b1111;B=4'b0001;Cin=1'b0;  #10; 
		 assert(F===4'b0000) else $error("error result code 002");
		 assert(Cout===1'b1) else $error("error Cout code 002");
		 assert(overflow===1'b0) else $error("error overflow code 002");
		 A=4'b0111;B=4'b0001;Cin=1'b0;  #10; 
		 assert(F===4'b1000) else $error("error result code 003");
		 assert(Cout===1'b0) else $error("error Cout code 003");
		 assert(overflow===1'b1) else $error("error overflow code 003");
		 A=4'b0111;B=4'b0001;Cin=1'b1;  #10; 
		 assert(F===4'b1001) else $error("error result code 004");
		 assert(Cout===1'b0) else $error("error Cout code 004");
		 assert(overflow===1'b1) else $error("error overflow code 004");
		 
		
	 end
 endmodule
	 