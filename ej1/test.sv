module testbench1();
	logic [3:0] A,B,F;
	logic [2:0] H;
	logic Cin;
		alu_ej1 test(A,B,H,Cin,F);
	 initial begin 
		 A=4'b0001;B=4'b0010;Cin=0;
		 H=3'b000;#10;
		 assert(F===4'b0001) else $error("A failed");
		 Cin=1;#10;
		 assert(F===4'b0010) else $error("A+1 failed");
		 H=001; Cin=0;#10;
		 assert(F===4'b0011) else $error("A+B failed");
		 Cin=1;#10;
		 assert(F===4'b0100) else $error("A+B+1 failed");
		 H=010;Cin=0;#10;
		 assert(F===4'b1110) else $error("A+!B failed");
		 Cin=1;#10;
		 assert(F===4'b1111) else $error("A+!B+1 failed");
		 H=011;Cin=0;#10;
		 assert(F===4'b0000) else $error("A-1 failed");
		 Cin=1;#10;
		 assert(F===4'b0001) else $error("A failed");
		 H=100;#10;
		 assert(F===4'b0000) else $error("A and B");
		 H=101;#10;
		 assert(F===4'b0011) else $error("A or B");
		 H=110;#10;
		 assert(F===4'b0011) else $error("A Xor B");
		 H=111;#10;
		 assert(F===4'b1110) else $error(" negado A");
		 
		
	 end
 endmodule
	 