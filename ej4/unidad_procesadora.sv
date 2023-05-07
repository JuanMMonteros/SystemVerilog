module unidad_procesadora #(parameter N=4)
								(input logic clk, 
								input logic [15:0] ctrl_word,
								input logic [N-1:0] DATA_IN,
								output logic [3:0] stateBits,
								output logic [N-1:0] DATA_out,Address_out);
			logic we, B_sel, MF_sel, MD_sel;
			logic [1:0] A,B,D,H;
			logic [3:0] G;
			//Distribuimos la palabra de control
			assign A= ctrl_word[15:14];
			assign B= ctrl_word[13:12];
			assign D= ctrl_word[11:10];
			assign we=ctrl_word[9];
			assign B_sel=ctrl_word[8];
			assign G=ctrl_word[7:4];
			assign H=ctrl_word[3:2];
			assign MF_sel=ctrl_word[1];
			assign MD_sel=ctrl_word[0];
			//Variables Intermedias
			logic [N-1:0] Ra,Rb,ALU_out,SHIFTTER_out,Y,F1,F2;
			logic [3:0] flags;
			logic [3:0] Constant_IN;
			assign Constant_IN=4'b1111;
			
			reg_controller REG_FILE(clk,we,A,B,D,Ra,Rb,F2);
			
			assign Y= B_sel ? Constant_IN : Rb;
			
			assign DATA_out = Y;
			assign Address_out = Ra;
			
			alu_flags alu(Ra,Y,G[3:1],G[0],ALU_out,flags);
			
			shiffter SHIFTER_unit(Y,H,SHIFTTER_out);
			
			assign F1 = MF_sel ? SHIFTTER_out : ALU_out;
			
			assign F2 =  MD_sel ? DATA_IN :F1;
			
			always_ff @(posedge clk)
			  stateBits <= flags;
			
			
			
			
			
			
			
			
			
endmodule
								