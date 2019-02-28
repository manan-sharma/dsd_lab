`timescale 1ns / 1ps
// Auxilary Function for Q6
module boxValue(
    input[1:0] value, 
    input turn,
    output isPresent, isBlank
    );
    wire isX,isZero;
    
    assign isX = (value[1] & value[0]);         // Box is marked X if both bits are 1
    assign isZero = ~(value[1] | value[0]);     // Box is marked O if both bits are 0
    
    assign isPresent = (turn & isX) | (~turn & isZero);  // Box is marked if its the given player's turn and if thier mark is present
    assign isBlank = ~(isX | isZero); // Blank if no mark present
endmodule
