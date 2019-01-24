module mux4to14bit(
    output [3:0]E,
    input [1:0]sel,
    input [3:0]A,
    input [3:0]B,
    input [3:0]C,
    input [3:0]D
);
wire[3:0] w1;
wire[3:0] w2;
mux2to14bit m1(w1,sel[0],A,B);
mux2to14bit m2(w2,sel[0],C,D);

mux2to14bit m3(E,sel[1],w1,w2);
endmodule