config cfg_xilinx;
design wlib.slon5_tb;
default liblist unifast_ver unisims_ver;
//Use fast PLL for all PLL blocks in design
cell PLLE2_ADV use unifast_ver.PLLE2_ADV;
//use fast DSP48E1for only this specific instance in the design
//instance testbench.inst.O1 use unifast_ver.DSP48E1;
//If using ModelSim or Questa, add in the genblk to the name
//(instance testbench.genblk1.inst.genblk1.O1 use unifast_ver.DSP48E1)
//instance slon5_tb.genblk1.slon5.genblk1.pll_inst use unifast_ver.PLLE2_ADV
endconfig

//library unifast_ver /opt/ssd/cad/xilinx/Vivado/2018.1/data/verilog/src/unifast/*.v