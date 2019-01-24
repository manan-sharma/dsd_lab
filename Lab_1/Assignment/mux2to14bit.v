module mux2to14bit(
    output [3:0]C,
    input sel,
    input [3:0]A,
    input [3:0]B
);
wire selnot;
not n0(selnot,sel);

wire a0out, b0out;
and a0(a0out, A[0],selnot);
and b0(b0out, B[0],sel);
or o0(C[0],a0out,b0out);

wire a1out, b1out;
and a1(a1out, A[1],selnot);
and b1(b1out, B[1],sel);
or o1(C[1],a1out,b1out);

wire a2out, b2out;
and a2(a2out, A[2],selnot);
and b2(b2out, B[2],sel);
or o2(C[2],a2out,b2out);

wire a3out, b3out;
and a3(a3out, A[3],selnot);
and b3(b3out, B[3],sel);
or o3(C[3],a3out,b3out);

endmodule