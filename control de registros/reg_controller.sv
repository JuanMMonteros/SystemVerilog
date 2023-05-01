module reg_controller #(parameter N=4,parameter M=8)
	(input logic [2:0]A,B,D,
	input logic clk,
	input logic we,
	inout logic [N-1:0] Ra, Rb, entrada, salida
	);
	logic [N-1:0] register[M-1:0];  
	
	always_ff@(posedge clk)
		begin 
			Ra <= (A===0) ? entrada : register[A];
			Rb <= (B===0) ? entrada : register[B];
			if(we) register[D]<= salida;
		end
	
endmodule 
	