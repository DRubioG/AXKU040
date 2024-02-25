-- Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
-- Date        : Thu Apr 22 10:04:02 2021
-- Host        : DESKTOP-C3F5G4E running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               d:/xilinx_fpga/ku040/sfp_ibert/project_1/project_1.srcs/sources_1/ip/ibert_sfp_12_5g/ibert_sfp_12_5g_stub.vhdl
-- Design      : ibert_sfp_12_5g
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcku040-ffva1156-2-i
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ibert_sfp_12_5g is
  Port ( 
    txn_o : out STD_LOGIC_VECTOR ( 3 downto 0 );
    txp_o : out STD_LOGIC_VECTOR ( 3 downto 0 );
    rxoutclk_o : out STD_LOGIC_VECTOR ( 3 downto 0 );
    rxn_i : in STD_LOGIC_VECTOR ( 3 downto 0 );
    rxp_i : in STD_LOGIC_VECTOR ( 3 downto 0 );
    gtrefclk0_i : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtrefclk1_i : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtnorthrefclk0_i : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtnorthrefclk1_i : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtsouthrefclk0_i : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtsouthrefclk1_i : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtrefclk00_i : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtrefclk10_i : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtrefclk01_i : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtrefclk11_i : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtnorthrefclk00_i : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtnorthrefclk10_i : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtnorthrefclk01_i : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtnorthrefclk11_i : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtsouthrefclk00_i : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtsouthrefclk10_i : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtsouthrefclk01_i : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtsouthrefclk11_i : in STD_LOGIC_VECTOR ( 0 to 0 );
    clk : in STD_LOGIC
  );

end ibert_sfp_12_5g;

architecture stub of ibert_sfp_12_5g is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "txn_o[3:0],txp_o[3:0],rxoutclk_o[3:0],rxn_i[3:0],rxp_i[3:0],gtrefclk0_i[0:0],gtrefclk1_i[0:0],gtnorthrefclk0_i[0:0],gtnorthrefclk1_i[0:0],gtsouthrefclk0_i[0:0],gtsouthrefclk1_i[0:0],gtrefclk00_i[0:0],gtrefclk10_i[0:0],gtrefclk01_i[0:0],gtrefclk11_i[0:0],gtnorthrefclk00_i[0:0],gtnorthrefclk10_i[0:0],gtnorthrefclk01_i[0:0],gtnorthrefclk11_i[0:0],gtsouthrefclk00_i[0:0],gtsouthrefclk10_i[0:0],gtsouthrefclk01_i[0:0],gtsouthrefclk11_i[0:0],clk";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "ibert_ultrascale_gth,Vivado 2017.4";
begin
end;
