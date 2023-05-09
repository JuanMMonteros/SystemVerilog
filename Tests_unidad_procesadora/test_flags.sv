parameter P=5; //cantidad de parametros en el archivo de testeo
module test_flags();
	
	//señales 
	logic clk;
	logic [15:0] control;
	logic [3:0] datain,dataout,adr_out;
	logic [3:0] flags;
	//señales internas simulacion
	logic [19:0] testvector [P-1:0];
   logic [3:0] testvector_flags [P-1:0];	
	integer i;
	logic [3:0]control_init,test_flag;
	logic [1:0]destino;
	logic [7:0]control_med;
	logic WF,control_finish;
	
	unidad_procesadora dat(clk,control,datain,flags,dataout,adr_out);
	
	initial begin
		$readmemb("C:\CargaRegistro.txt",testvector);							//extrae datos del archivo .txt
		$readmemb("C:\StateFlags.txt",testvector_flags);
		for(i=0;i<P;i=i+1) begin
			{control_init,destino,control_med,WF,control_finish,datain} = testvector[i]; 
			test_flag = testvector_flags[i];
			control={control_init,destino,control_med,WF,control_finish};						//simula lo indicado
			clk = 0;
			#10;
			clk = 1;
			#10;
			
			if (WF===1'b0) begin //solo comprueba si trabaja la ALU
				assert(flags===test_flag) else $error("error flags durante operacion",i);
			end
			
			control={2'b00,destino,12'b000100000000};								//saca el resultado de lo anterior por dataOUT
			clk = 0;
			#10;
			clk = 1;
			#10;
			assert(dataout===datain) else $error("error operacion",i);		//compara el resultado optenido con lo indicado
		end
	end
	
		
endmodule 



//formato palabra de control archivo .txt
//| reg A | reg B | reg dest | we   | MB   | sel ALU | sel Shifter | MF   | MD   | dataIN |
//| 2bits | 2bits | 2bits    | 1bit | 1bit | 4bits   | 2bits       | 1bit | 1bit | 4bits  |
//
//El espacio de dataIN tambien se utiliza para indicar el resultado esperado.
//colocar el numero de parametros cargados al comienzo del test.
//
//formato flags archivo .txt
//| overflow | negativo | zero | carry out |
//| 1bit     | 1bit     | 1bit | 1bit      |