module testbench1();
	logic [2:0] A,B,D;
	logic [3:0] Ra,Rb,entrada,salida;
	logic [3:0] register [7:0];
	logic we, clk;
	
	reg_controller test(A,B,D,clk,we,Ra,Rb,entrada,salida);
	
	
	initial begin
		clk = 1'b0;
		forever #5 clk = ~clk;
                for(int i=0;i<8;i++)begin
		  register[i]=i;
                  #10;
	        end
	end
endmodule
	