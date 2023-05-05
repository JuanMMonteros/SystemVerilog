//parameter cantidad de bits unidad 

module unidad_corrimiento_3a #(parameter N=4)( 
 input logic signed [N-1:0] F, //input
 input logic [2:0] H, //sel operacion
 output logic signed [N-1:0] S //salida
 ); 
 
 always_comb  
	case(H)
	 3'b001: S=F<<1; //shl
	 3'b010: S=F>>1; //shr
	 3'b011: S=N[1'b0]; //todo 0
	 3'b101: S={F,F}>>(N-1); //rol
	 3'b111: S={F,F}>>1; //ror
	 default: S=F; //transferencia
   endcase
	
endmodule
