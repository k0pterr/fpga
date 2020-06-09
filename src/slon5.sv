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
    input  logic  rst,
                                 
    input  Dnum_t sw,

    output Dout_t dout,
    output Dnum_t dnum
);

//==============================================================================
//    Settings
//==============================================================================

localparam PRESCALER_W = clog2(100_000_000);

localparam DATA_W       = 16;
localparam BUF_CAPACITY = 1024;


//==============================================================================
//    Types
//==============================================================================

typedef struct
{
    logic                           flush;
    logic [            DATA_W-1:0]  head;
    logic [            DATA_W-1:0]  tail;
    logic                           push;
    logic                           pop;
    logic                           full;
    logic                           empty;
    logic [bits(BUF_CAPACITY)-1:0]  count;
}
fifo_16_t;

typedef enum bit [0:0]
{
    srcIDLE,
    srcPUSH
}
srcfsm_t;

typedef enum bit [0:0]
{
    dstIDLE,
    dstPOP
}
dstfsm_t;

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

fifo_16_t buf1024x16;

srcfsm_t srcfsm;
dstfsm_t dstfsm;

//------------------------------------------------------------------------------
//     test & debug
//------------------------------------------------------------------------------

StageIdx_t idx; 

logic [PRESCALER_W-1:0] prescaler;

logic [15:0] bufout;

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
//------------------------------------------------------------------------------
always_comb begin
    //dnum = dnumOut(sw, `DNUM_POLARITY);
    idx  = { '0, sw };
    dout = getTableElem(idx, `TABLE_ID);
    
    //dnum = prescaler[PRESCALER_W - 1:PRESCALER_W-1-`DNUM_WIDTH];
    //dnum = buf1024x16.head[DATA_W - 1:DATA_W-1-`DNUM_WIDTH];
end
//------------------------------------------------------------------------------
always_ff @(posedge clk) begin
    if(rst) begin
        prescaler <= 0; 
    end
    else begin
        prescaler <= prescaler + 1;
    end
end
//------------------------------------------------------------------------------

`ifdef SIMULATOR
assign buf1024x16.tail = prescaler;
`else
assign buf1024x16.tail = prescaler[PRESCALER_W - 1:PRESCALER_W-1-DATA_W];
`endif

//------------------------------------------------------------------------------
always_ff @(posedge clk) begin
    if(rst) begin
        srcfsm <= srcIDLE;
    end
    else begin
        case(srcfsm)
            //----------------------------------------
            srcIDLE: begin
                if(prescaler[4:0] == 8) begin
                    srcfsm <= srcPUSH;
                end
            end
            //----------------------------------------
            srcPUSH: begin
                if(prescaler[4:0] == 28) begin
                    srcfsm <= srcIDLE;
                end
            end
            //----------------------------------------
        endcase
    end
end

assign buf1024x16.push = srcfsm == srcPUSH;
//------------------------------------------------------------------------------
always_ff @(posedge clk) begin
    if(rst) begin
        dstfsm <= dstIDLE;
    end
    else begin
        case(dstfsm)
            //----------------------------------------
            dstIDLE: begin
                if(buf1024x16.count > 10) begin
                    dstfsm <= dstPOP;
                end
            end
            //----------------------------------------
            dstPOP: begin
                if(buf1024x16.empty) begin
                    dstfsm <= dstIDLE;
                end
            end
            //----------------------------------------
        endcase
    end
end

assign buf1024x16.pop = dstfsm == dstPOP;
//------------------------------------------------------------------------------

//==============================================================================
//    Instances
//==============================================================================
fifo_1024x16 slonbuf
(
    .clk         (  clk              ),    // input wire clk
    .srst        (  rst              ),    // input wire srst
    .din         (  buf1024x16.tail  ),    // input wire [15 : 0] din
    .wr_en       (  buf1024x16.push  ),    // input wire wr_en
    .rd_en       (  buf1024x16.pop   ),    // input wire rd_en
    .dout        (  buf1024x16.head  ),    // output wire [15 : 0] dout
    .full        (  buf1024x16.full  ),    // output wire full
    .empty       (  buf1024x16.empty ),    // output wire empty
    .data_count  (  buf1024x16.count )     // output wire [10 : 0] data_count
);

ram_16x8 ram_buf 
(
    .clka  ( clk  ),                                  // input wire clka
    .ena   ( 1'b1 ),                                  // input wire ena
    .wea   ( 1'b0 ),                                  // input wire  [0 : 0] wea
    .addra ( buf1024x16.head[DATA_W-1:DATA_W-1-3] ),  // input wire  [3 : 0] addra
    .dina  ( 8'b0 ),                                  // input wire  [7 : 0] dina
    .douta ( dnum )                                   // output wire [7 : 0] douta
);


endmodule : slon5_m

