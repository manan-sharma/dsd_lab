module binary_adder_dataflow(
    output[3:0] Sum,
    output C_out,
    input[3:0] A,
    input[3:0] B,
    input C_in
    );
    assign {C_out, Sum} = A + B + C_in;
    endmodule
    