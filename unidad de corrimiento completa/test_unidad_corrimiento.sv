module test_unidad_corrimiento();

parameter N=4;

logic [N-1:0] F, s; //input
logic [2:0] H; //sel operacion
logic [(N-1)/2:0]D; //cantidad de desplasamientos por ves 

unidad_corrimiento test(F,H,D, s); //respeta el orden del modulo creado

initial begin //ejecuta linea a linea
//transferencia
F=4'b1100;
H=3'b000;
D=2'b01;
#50;
assert(s===4'b1100) else $error("transferencia failed");

//todo cero
H=3'b011;
#50;
assert(s===4'b0000) else $error("puesta cero failed");

//shl
H=3'b001;
D=2'b01;
#50;
assert(s===4'b1000) else $error("shl 1 failed");
D=2'b10;
#50;
assert(s===4'b0000) else $error("shl 2 failed");
D=2'b11;
#50;
assert(s===4'b0000) else $error("shl 3 failed");

//shr
H=3'b010;
D=2'b01;
#50;
assert(s===4'b0110) else $error("shr 1 failed");
D=2'b10;
#50;
assert(s===4'b0011) else $error("shr 2 failed");
D=2'b11;
#50;
assert(s===4'b0001) else $error("shr 3 failed");

//rol
H=3'b100;
D=2'b01;
#50;
assert(s===4'b1001) else $error("rol 1 failed");
D=2'b10;
#50;
assert(s===4'b0011) else $error("rol 2 failed");
D=2'b11;
#50;
assert(s===4'b0110) else $error("rol 3 failed");

//ror
H=3'b101;
D=2'b01;
#50;
assert(s===4'b0110) else $error("ror 1 failed");
D=2'b10;
#50;
assert(s===4'b0011) else $error("ror 2 failed");
D=2'b11;
#50;
assert(s===4'b1001) else $error("ror 3 failed");

//asl
H=3'b110;
D=2'b01;
#50;
assert(s===4'b1000) else $error("asl 1 failed");
D=2'b10;
#50;
assert(s===4'b0000) else $error("asl 2 failed");
D=2'b11;
#50;
assert(s===4'b0000) else $error("asl 3 failed");

//asr
H=3'b111;
D=2'b01;
#50;
assert(s===4'b1110) else $error("asr 1a failed");
D=2'b10;
#50;
assert(s===4'b1111) else $error("asr 2a failed");
D=2'b11;
#50;
assert(s===4'b1111) else $error("asr 3a failed");


F=4'b0110;//otro F

//asr
H=3'b111;
D=2'b01;
#50;
assert(s===4'b0011) else $error("asr 1b failed");
D=2'b10;
#50;
assert(s===4'b0001) else $error("asr 2b failed");
D=2'b11;
#50;
assert(s===4'b0000) else $error("asr 3b failed");

end
endmodule