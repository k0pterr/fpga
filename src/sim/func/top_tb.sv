//-------------------------------------------------------------------------------
//
//     Project: Any
//
//     Purpose: Default testbench file
//
//
//-------------------------------------------------------------------------------

`timescale 1ns/1ps

module top_tb;

logic test = 1;
logic res;

initial begin
    for(int i = 0; i < 100; i++) begin
        #10ns
        test = ~test;
    end

    #100ns
    $stop();
end

top top_inst
(
    .in  ( test ),
    .out ( res  )
);

endmodule
//-------------------------------------------------------------------------------
