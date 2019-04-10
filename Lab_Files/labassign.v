`timescale 1ns / 1ps

module labassign(
    input [3:0] input_pins,
    input rst,
    output reg [3:0]led_status,
    input clk,
    output reg read 
    );
    // Beware extra bits have been used 
    reg [24:0] counter;
    reg [3:0] state, prev_state, ABCD;
    reg [5:0] state_counter;
    reg [3:0] counter_for_5;
    reg slowclk, clk5sec;
    reg flag;
    localparam [3:0] reset_state = 0, first_digit = 1, second_digit = 2, unlock = 3, secure = 4, alarm = 5; 
 initial 
 begin
    slowclk <= 0;
    counter <= 0;
    state <= 0;
    prev_state <= 0;
    clk5sec <= 0;
    counter_for_5 <= 0;
 end
always @(posedge clk)
begin
    if(counter >= 12500000)
        begin 
        slowclk <= !slowclk;
        counter <= 0;
        end
    else counter <= counter + 1;
end
/*
always @(posedge slowclk)begin
    if(counter_for_5 >= 15)
    begin 
        clk5sec <= !clk5sec;
        counter_for_5 <= 0;
    end
    else counter_for_5 <= counter_for_5 + 1;
end

always @(posedge clk5sec) begin 
ABCD <= input_pins;
read <= !read;
end
 */
always @(posedge slowclk) begin
    case(state)
    reset_state :begin
                    if(state != prev_state) state_counter <= 0;
                    else begin
                         if( state_counter < 8) led_status <= 4'b1111;
                         else led_status <= ((state_counter>>2) & 4'b0001) ? 4'b1000 : 4'b0000; 
                         
                         state_counter <= state_counter + 1;
                    end
                    prev_state <= state;
                    if(input_pins == 4'b1100) state <= first_digit;
                    else state <= reset_state ;
                 end 
    first_digit : begin
                    if( state != prev_state ) state_counter <= 0;
                    else begin 
                        led_status <= ((state_counter>>2) & 4'b0001) ? 4'b1100 : 4'b0000;
                        state_counter <= state_counter + 1;
                        end  
                     prev_state <= state;
                     if(input_pins == 4'b0110) state <= second_digit ;
                     else begin
                         if(state_counter > 40) state <= secure;
                         else state <= first_digit;
                       end
                  end
    second_digit : begin
                      if( state != prev_state ) state_counter <= 0;
                      else 
                      begin 
                        led_status <= ((state_counter>>2) & 4'b0001) ? 4'b1110 : 4'b0000;
                        state_counter <= state_counter + 1;
                      end  
                      prev_state <= state;
                      if(input_pins == 4'b0011) state <= unlock ;
                      else begin
                          if(state_counter > 40) state <= secure;
                          else state <= second_digit;
                        end
                    end
    unlock : begin
                if( state != prev_state ) state_counter <= 0;
                else begin 
                    led_status <= ((state_counter>>1) & 4'b0001) ? 4'b1111 : 4'b0000;
                    state_counter <= state_counter + 1;
                end  
                prev_state <= state;
             end
    secure : begin
             if( state != prev_state ) 
                begin
                state_counter <= 0;
                led_status <= 4'b0001;
                end
             else 
                 begin 
                            //led_status <= ((state_counter>>1) & 4'b0001) ? 4'b1111 : 4'b0000;
                    led_status <= {led_status[2:0],led_status[3]};     
                    state_counter <= state_counter + 1;
                 end
             prev_state <= state;
             if(input_pins == 4'b0101) state <= reset_state;
             else begin
                    if(state_counter > 40) state <= alarm;
                    else state <= secure;
                  end
             end
    alarm : begin
              if( state != prev_state ) state_counter <= 0;
              else 
                  begin 
                     led_status <= ((state_counter>>1) & 4'b0001) ? 4'b0011 : 4'b1100;    
                     state_counter <= state_counter + 1;
                  end
              prev_state <= state;
              end
    endcase
end
endmodule

