//------------------------------------------------------------------------------
//  project:       slon5_test
//  module:        slon5_m
//
//  description:   slon5 alg
//------------------------------------------------------------------------------

`include "common.pkg"
`include "slon5.svh"    
`include "slon5_generated.svh"

//******************************************************************************
//******************************************************************************
module slon5_m import slon5_pkg::*, slon5_generated_pkg::*;
(
    input  logic  clk,
                                 
    input  Dnum_t sw,

    output Dout_t dout,
    output Dnum_t dnum
);

//==============================================================================
//    Settings
//==============================================================================

//==============================================================================
//    Types
//==============================================================================

//==============================================================================
//    Functions and Tasks
//==============================================================================

//------------------------------------------------------------------------------
function automatic Dnum_t dnumOut(input Dnum_t dnumIn, input bit polarity = 1);
    return (polarity) ? dnumIn : ~dnumIn;
endfunction

//------------------------------------------------------------------------------
function automatic Dout_t getTableElem(input StageIdx_t idx, int tableId = 0);
    case (tableId)
        0: return KTable[idx][`DOUT_WIDTH-1:0];
        1: return STable[idx][`DOUT_WIDTH-1:0];
        default return 'x;
    endcase
endfunction
                                              
//==============================================================================
//    Objects
//==============================================================================

//------------------------------------------------------------------------------
//     test & debug
//------------------------------------------------------------------------------

StageIdx_t idx; 

//==============================================================================
//     Logic
//==============================================================================

//------------------------------------------------------------------------------
//     test & debug
//------------------------------------------------------------------------------

initial begin
    $write("TABLE_ID:      %1d\n", `TABLE_ID);
    $write("DNUM_POLARITY: %1d\n", `DNUM_POLARITY);
end

always_comb begin
    dnum = dnumOut(sw, `DNUM_POLARITY);
    idx  = { '0, sw };
    dout = getTableElem(idx, `TABLE_ID);
end

//==============================================================================
//    Instances
//==============================================================================

endmodule : slon5_m

