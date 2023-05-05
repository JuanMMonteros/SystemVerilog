module unidad_corrimiento_2a #(parameter N=4)( 
 input logic signed [N-1:0] F, //input
 input logic [1:0] H, //sel operacion
 output logic signed [N-1:0] S //salida
 ); 
 
 always_comb  
	case(H)
	 3'b01: S=F<<1; //shl
	 3'b10: S=F>>1; //shr
	 3'b11: S=N[1'b0]; //todo 0
	 default: S=F; //transferencia
   endcase
	
endmodule
