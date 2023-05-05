// __________________________________________
//|  selección  |  carry     |   operacion   |
//|  h2 h1  h0  |    Cin     |               |
//|  0  0   0   |     0      |    F=A        |
//|  0  0   0   |     1      |    F=A+1      |
//|  0  0   1   |     0      |    F=A+B      |
//|  0  0   1   |     1      |    F=A+B+1    | 
//|  0  1   0   |     0      |    F=A+~B     |
//|  0  1   0   |     1      |    F=A+~B+1   |
//|  0  1   1   |     0      |    F=A-1      |
//|  0  1   1   |     1      |    F=A        |
//|  1  0   0   |     x      |    F=A&B      |
//|  1  0   1   |     x      |    F=A|B      |
//|  1  1   0   |     x      |    F=A^B      |
//|  1  1   1   |     x      |    F=~A       | 



module alu_flags #(parameter N=4)(input logic [N-1:0] A,B, //A B entradas
	input logic[2:0]H, //H seleccion
	input logic Cin, //carry entrada
	output logic[N-1:0] F, //salida señal
	output logic [3:0]ALUflags); //flags
	
	wire cout,neg,zero,overflow,cout_t,over_t; 
	wire [N-1:0] Y,sum;
	
	assign Y = H[1] ? (H[0] ? 
										{N {1'b1}}
                                       : ~B )
														: (H[0] ? B 
																		: {N {1'b0}} );
																		
	  full_adder sumador(A,Y,Cin,cout_t,over_t,sum);
	  
	always_comb
			case(H)
			4: F=A&B;
			5: F=A|B;
			6: F=A^B;
			7: F=~A;
			default: F=sum;
		endcase
	
	assign neg = F[N-1];
   assign zero = (F == {N {1'b0}});
   assign cout = ~H[2] & cout_t;
	assign overflow = ~H[2] & over_t;

   assign ALUflags = {overflow, neg, zero,cout };
	

endmodule

