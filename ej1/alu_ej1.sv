module alu_ej1 #(parameter N=4)(input logic [N-1:0] A,B,
	input logic[2:0]H,
	input logic Cin,
	output logic[N-1:0] F);
	always_comb
			case(H)
			0: F=A+Cin;
			1: F=A+B+Cin;
			2: F=A+~B+Cin;
			3: F=A+Cin-1;
			4: F=A&B;
			5: F=A|B;
			6: F=A^B;
			7: F=~A;
			default: F=A;
		endcase
	
endmodule