//-------------------------------------------------------------------------------
//
//     Project: Any
//
//     Purpose: Default testbench file
//
//
//-------------------------------------------------------------------------------

`include "cfg_params_generated.svh"

`timescale 1ns/1ps

module top_tb;

localparam CLK_HALF_PERIOD = `CLK_HALF_PERIOD;
localparam WIDTH           = `WIDTH;
    
logic [WIDTH-1:0] out; 

`ifdef DIFF_REFCLK
logic ref_clk_p;
logic ref_clk_n;
`else
logic ref_clk;
`endif


    
`ifdef DIFF_REFCLK
always begin
    #CLK_HALF_PERIOD
    ref_clk_p = ~ref_clk_p;
    ref_clk_n = ~ref_clk_n;
end
`else
always begin
    #CLK_HALF_PERIOD
     ref_clk = ~ref_clk;
end
`endif


top top_inst
(
`ifdef DIFF_REFCLK
    .ref_clk_p ( ref_clk_p ),
    .ref_clk_n ( ref_clk_n ),
`else                        
    .ref_clk   ( ref_clk   ),
`endif

    .out       ( out       )
);

endmodule
//-------------------------------------------------------------------------------
