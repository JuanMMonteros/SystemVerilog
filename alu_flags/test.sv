module testbench1();
	logic [3:0] A,B,F;
	logic [2:0] H;
	logic Cin;
	logic [3:0] ALUflags;
	
		alu_flags test(A,B,H,Cin,F,ALUflags);
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
		 
		 //pruebas especificas flags
		 A=4'b0000;B=4'b0000;Cin=0;
		 H=3'b001;#10;
		 assert(ALUflags===4'b0010) else $error("zero failed");
		 A=4'b0000;B=4'b0001;Cin=0;
		 H=3'b001;#10;
		 assert(ALUflags===4'b0000) else $error("zero failed");
		 A=4'b1111;B=4'b0010;Cin=0;
		 H=3'b001;#10;
		 assert(ALUflags===4'b0001) else $error("carry failed");
		 A=4'b0001;B=4'b0010;Cin=1;
		 H=3'b010;#10;
		 assert(ALUflags===4'b0100) else $error("negativo failed");
		 A=4'b0111;B=4'b0111;Cin=0;
		 H=3'b001;#10;
		 assert(ALUflags===4'b1100) else $error("overflow add failed");
		 A=4'b1001;B=4'b0111;Cin=1;
		 H=3'b010;#10;
		 assert(ALUflags===4'b1001) else $error("overflow sub failed");
		
	 end
 endmodule
	 