`timescale 1ns / 1ps
//Q7 Register Unit. Performs operations on bidirectional 8 bit bus.
module registerunit(
    inout [7:0] io_bus, //Bidirectional bus
    input [2:0] mode_input, //Mode Input
    input clk,
    input reset,        //Active low asynchronus reset
    input output_control //1 bit output control
    );
    
    reg[7:0] a,b; //Internal registers used for 
    assign io_bus = output_control?b:8'bZZZZZZZZ; //assigns the output depending on output_control value
    always @(posedge clk, negedge reset)
    begin
    if(reset==0) //used to reset a and b
        begin
        a <= 8'b00000000;
        b <= 8'b00000000;
        end
    else
        case(mode_input)
        3'b000: b = a; //Do nothing. Holding the previous value
        3'b001: begin //Right shift by 1 value
                a = {a[0],a[7:1]}; 
                b = a; 
                end
        3'b010: begin //Left shift by 1 value
                a = {a[6:0],a[7]}; 
                b = a;
                end
        3'b011:  //8 bit Gray code upcount by 1
                begin
                a = a+1;
                b = {a[7],a[7]^a[6],a[6]^a[5],a[5]^a[4],a[4]^a[3],a[3]^a[2],a[2]^a[1],a[1]^a[0]};
                end  
        3'b100: //8 bit Gray code downcount by 1
                begin
                a = a-1;
                b = {a[7],a[7]^a[6],a[6]^a[5],a[5]^a[4],a[4]^a[3],a[3]^a[2],a[2]^a[1],a[1]^a[0]};
                end  
        3'b101: begin //Bitwise NOT the register contents
                a = ~a;
                b = a;
                end 
        3'b110: begin // Swapping right and left 4 bits
                a = {a[3:0],a[7:4]};
                b = a; 
                end
        3'b111: begin //parallel load to register
                a = io_bus;
                b = a;
                end
        endcase
    end 
endmodule
