//parameter cantidad de bits unidad 

module unidad_corrimiento_2b #(parameter N=4)( 
 input logic signed [N-1:0] F, //input
 input logic [1:0] H, //sel operacion
 output logic signed [N-1:0] S //salida
 ); 
 
 assign S={F,F}>>(N-H); //rol H veces

	
endmodule
