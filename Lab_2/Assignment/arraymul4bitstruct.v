`timescale 1ns / 1ps
//using structure level coding with full and half adders

module arraymul4bitstruct(
    input [3:0] a,
    input [3:0] b,
    output [7:0] d
    );
    and a1(d[0], a[0], b[0]);
    
    wire w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12,w13,w14,w15;
    wire c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11;
    wire s1,s2,s3,s4,s5,s6;
    
    and a2(w5,a[0],b[1]);
    and a3(w6,a[1],b[0]);
    halfadder h1(d[1],c1,w5,w6);
    
    and a4(w3,a[2],b[0]);
    and a5(w4,a[1],b[1]);
    fulladder f1(s1,c2,w3,w4,c1);
    and a6(w7,a[0],b[2]);
    halfadder h2(d[2],c6,s1,w7);
    
    and a16(w1,a[2],b[1]);
    and a7(w2,a[3],b[0]);
    fulladder f2(s2,c3,w1,w2,c2);
    and a8(w8,a[1],b[2]);
    fulladder f3(s3,c5,c6,s2,w8);
    and a9(w10,a[0],b[3]);
    halfadder h3(d[3],c7,s3,w10);
    
    and a10(w9,a[3],b[1]);
    fulladder f4(s4,c4,c5,w9,c3);
    and a11(w11,a[2],b[2]);
    fulladder f5(s6,c8,w11,s4,c7);
    and a12(w13,a[1],b[3]);
    halfadder h4(d[4],c10,w13,s6);
    
    and a13(w12,a[3],b[2]);
    fulladder f6(s5,c9,c8,w12,c4);
    and a14(w14,a[2],b[3]);
    fulladder f7(d[5],c11,s5,w14,c10);
    
    and a15(w15,a[3],b[3]);
    fulladder f8(d[6],d[7],c9,w15,c11);
endmodule
