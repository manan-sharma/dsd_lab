`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.02.2019 02:36:43
// Design Name: 
// Module Name: tic_tac_toe
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tic_tac_toe(
    output out,
    input turn, // turn = 0 for O   turn = 1 for X 
    input[1:0] v11, v12, v13, v21, v22, v23, v31, v32, v33
    );
    wire r1,r2,r3,c1,c2,c3,d1,d2;
    
    check3 cr1(v11,v12,v13,turn,r1);
    check3 cr2(v21,v22,v23,turn,r2);
    check3 cr3(v31,v32,v33,turn,r3);
    
    check3 cc1(v11,v21,v31,turn,c1);
    check3 cc2(v12,v22,v32,turn,c2);
    check3 cc3(v13,v23,v33,turn,c3);
    
    check3 cd1(v11,v22,v33,turn,d1);
    check3 cd2(v13,v22,v31,turn,d2);
    
    assign out = r1 | r2 | r3 | c1 | c2 | c3 | d1 | d2;
endmodule
