module full_adder #(parameter N=4)(input logic [N-1:0] A,B,
	input logic Cin,
	output logic Cout,overflow,
	output logic[N-1:0] F);
	
	wire Cn;//puenultimo carry
	
	assign {Cout,F} = A + B + Cin;
	assign Cn = (~A[N-1]&~B[N-1]&F[N-1])|(~A[N-1]&B[N-1]&~F[N-1])|(A[N-1]&B[N-1]&F[N-1])|(A[N-1]&~B[N-1]&~F[N-1]); 
	assign overflow = Cn ^ Cout;
			
endmodule