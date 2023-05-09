parameter N=5; //cantidad de parametros en el archivo de testeo
module test();
	
	//señales 
	logic clk;
	logic [15:0] control;
	logic [3:0] datain,dataout,adr_out;
	logic [3:0] flags;
	//señales internas simulacion
	logic [19:0] testvector [N-1:0]; 
	integer i;
	logic [3:0]control_init;
	logic [1:0]destino;
	logic we;
	logic [8:0]control_finish;
	
	unidad_procesadora dat(clk,control,datain,flags,dataout,adr_out);
	
	initial begin
		$readmemb("C:\CargaRegistro.txt",testvector);							//extrae datos del archivo .txt
		for(i=0;i<N;i=i+1) begin
			{control_init,destino,we,control_finish,datain} = testvector[i]; 
			control={control_init,destino,we,control_finish};						//simula lo indicado
			clk = 0;
			#10;
			clk = 1;
			#10;
			if (we===1'b1)begin //si no se escribio un registro no se corrobora 
				control={2'b00,destino,12'b000100000000};								//saca el resultado de lo anterior por dataOUT
				clk = 0;
				#10;
				clk = 1;
				#10; 
				assert(dataout===datain) else $error("error operacion",i);		//compara el resultado optenido con lo indicado
			end
		end
	end
	
		
endmodule 



//formato palabra de control archivo .txt
//| reg A | reg B | reg dest | we   | MB   | sel ALU | sel Shifter | MF   | MD   | dataIN |
//| 2bits | 2bits | 2bits    | 1bit | 1bit | 4bits   | 2bits       | 1bit | 1bit | 4bits  |
//
//El espacio de dataIN tambien se utiliza para indicar el resultado esperado.
//colocar el numero de parametros cargados al comienzo del test.