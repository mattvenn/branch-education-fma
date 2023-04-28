`default_nettype none
/*
    FMA  = fused multiply accumulate. It multiples 2 inputs and adds a 3rd.
    In this simple demonstration, we use unsigned integer inputs.

    https://en.wikipedia.org/wiki/Multiply%E2%80%93accumulate_operation
*/
module fma #(
    parameter WIDTH = 4
    ) (
    input [WIDTH-1:0] a,
    input [WIDTH-1:0] b,
    input [WIDTH-1:0] c,
    output [2*WIDTH-1:0] out
    );

    // capture debugging info
    initial begin
        $dumpfile ("fma.vcd");
        $dumpvars (0, fma);
        #1;
    end

    // in one cycle
    assign out = a * b + c;

endmodule
