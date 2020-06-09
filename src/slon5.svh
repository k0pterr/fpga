//------------------------------------------------------------------------------
//  project:       slon5_test
//  package:       slon5_pkg
//
//  description:   slon5 alg
//------------------------------------------------------------------------------

`ifndef MD5_SVH
`define MD5_SVH

`include "cfg_params_generated.svh"

//******************************************************************************
//******************************************************************************
package slon5_pkg;

    //--------------------------------------------------------------------------
    timeunit      1ns;
    timeprecision 1ps;

    //--------------------------------------------------------------------------
    typedef logic [`DNUM_WIDTH-1:0] Dnum_t;
    typedef logic [`DOUT_WIDTH-1:0] Dout_t;

    //--------------------------------------------------------------------------
    localparam WORD_WIDTH  = 32;
    localparam WORD_NUM    = 16;
    localparam STAGE_NUM   = 64;
    localparam SHIFT_WIDTH = $clog2(WORD_WIDTH);
    localparam IDX_WIDTH   = $clog2(WORD_NUM);
    localparam STAGE_WIDTH = $clog2(STAGE_NUM);
    
    //--------------------------------------------------------------------------
    typedef bit     [SHIFT_WIDTH-1:0] Shift_t;
    typedef logic   [STAGE_WIDTH-1:0] StageIdx_t;
    typedef Shift_t                   STable_t[0:STAGE_NUM-1];
    
    //--------------------------------------------------------------------------
    function automatic Shift_t getShift(input StageIdx_t idx);
        localparam int STableSize = 16;
        localparam Shift_t STable[0:STableSize-1] = '{
                                                       7, 12, 17, 22,
                                                       5,  9, 14, 20,
                                                       4, 11, 16, 23,
                                                       6, 10, 15, 21 
                                                     };
        StageIdx_t shortIdx = ((idx >> 4) << 2) | (idx & StageIdx_t'('b11));
        return STable[shortIdx];    
    endfunction

    //--------------------------------------------------------------------------
    function automatic STable_t genSTable;
    STable_t STable;
        for(int i = 0; i < STAGE_NUM; ++i) begin
            STable[i] = getShift(i);
        end
        return STable;
    endfunction
    
    //--------------------------------------------------------------------------
    localparam STable_t STable = genSTable();
    
endpackage : slon5_pkg

`endif // MD5_SVH

