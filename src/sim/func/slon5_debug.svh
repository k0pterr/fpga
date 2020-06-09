//------------------------------------------------------------------------------
// project:       slon5_test                                                    
// package:       slon5_debug_pkg                                         
//                                                                              
// description:   slon5 alg                                                   
//------------------------------------------------------------------------------

`ifndef SLON5_DEBUG_SVH
`define SLON5_DEBUG_SVH

//******************************************************************************
//******************************************************************************

`include "slon5.svh"
`include "slon5_generated.svh"

package slon5_debug_pkg;

    //--------------------------------------------------------------------------
    import slon5_pkg::*;
    import slon5_generated_pkg::*;

    //--------------------------------------------------------------------------
    localparam KTable_t RefKTable = '{
                                      'hd76aa478, 'he8c7b756, 'h242070db, 'hc1bdceee,
                                      'hf57c0faf, 'h4787c62a, 'ha8304613, 'hfd469501, 
                                      'h698098d8, 'h8b44f7af, 'hffff5bb1, 'h895cd7be, 
                                      'h6b901122, 'hfd987193, 'ha679438e, 'h49b40821, 
                                      'hf61e2562, 'hc040b340, 'h265e5a51, 'he9b6c7aa, 
                                      'hd62f105d, 'h02441453, 'hd8a1e681, 'he7d3fbc8, 
                                      'h21e1cde6, 'hc33707d6, 'hf4d50d87, 'h455a14ed, 
                                      'ha9e3e905, 'hfcefa3f8, 'h676f02d9, 'h8d2a4c8a, 
                                      'hfffa3942, 'h8771f681, 'h6d9d6122, 'hfde5380c, 
                                      'ha4beea44, 'h4bdecfa9, 'hf6bb4b60, 'hbebfbc70, 
                                      'h289b7ec6, 'heaa127fa, 'hd4ef3085, 'h04881d05, 
                                      'hd9d4d039, 'he6db99e5, 'h1fa27cf8, 'hc4ac5665, 
                                      'hf4292244, 'h432aff97, 'hab9423a7, 'hfc93a039, 
                                      'h655b59c3, 'h8f0ccc92, 'hffeff47d, 'h85845dd1, 
                                      'h6fa87e4f, 'hfe2ce6e0, 'ha3014314, 'h4e0811a1, 
                                      'hf7537e82, 'hbd3af235, 'h2ad7d2bb, 'heb86d391 
                                     };

    //--------------------------------------------------------------------------
    function automatic bit checkKTable(input KTable_t testTable, input KTable_t refTable);
		bit isOk = 1;
		for(int i = 0; i < STAGE_NUM; ++i) begin
			if((testTable[i] - refTable[i]) != 0) begin
				isOk = 0;
				$warning("KTable mismatch at index %2d: RefValue = 0x%08x, Value = 0x%08x", i, refTable[i], testTable[i]);
				break;
			end
		end
		return isOk;
	endfunction

    //--------------------------------------------------------------------------
    function automatic void printKTable(input KTable_t KTable, input int lineSize = 4);
		$write("----------------------------------------------------------------\n");
		$write("KTable\n");
		$write("----------------------------------------------------------------\n");
		for(int i = 0; i < STAGE_NUM; ++i) begin
			$write(" 0x%08x", KTable[i]);
			if(i != (STAGE_NUM - 1)) begin
				$write(",");
			end
			if(((i+1) % lineSize) == 0) begin
				$write("\n");
			end
		end
		$write("\n");
	endfunction

    //--------------------------------------------------------------------------
    function automatic void printSTable(input int lineSize = 16);
		$write("----------------------------------------------------------------\n");
		$write("STable\n");
		$write("----------------------------------------------------------------\n");
		for(int i = 0; i < STAGE_NUM; ++i) begin
			$write(" %2d", getShift(i));
			if(i != (STAGE_NUM - 1)) begin
				$write(",");
			end
			if(((i+1) % lineSize) == 0) begin
				$write("\n");
			end
		end
		$write("\n");
	endfunction
    
endpackage : slon5_debug_pkg

`endif //SLON5_DEBUG_SVH
