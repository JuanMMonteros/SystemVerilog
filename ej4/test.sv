parameter N=6;
module test();

	logic clk;
	logic [15:0] control;
	logic [3:0] datain,dataout,adr_out;
	logic [3:0] flags;
	logic [19:0] testvector [N-1:0]; 
	integer i;
	
	unidad_procesadora dat(clk,control,datain,flags,dataout,adr_out);
	
	initial begin
		$readmemb("D:/CargaRegistro.txt",testvector);
		for(i=0;i<N;i=i+1) begin
			{control,datain} = testvector[i];
			clk = 0;
			#10;
			clk = 1;
			#10;
		end
	end
	
		
endmodule 