-- Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
-- Date        : Wed Jul  7 11:45:57 2021
-- Host        : DESKTOP-C3F5G4E running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               e:/ax/ku040/04_PLL/04_PLL.srcs/sources_1/ip/clk_wiz_0_1/clk_wiz_0_sim_netlist.vhdl
-- Design      : clk_wiz_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xcku040-ffva1156-2-i
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity clk_wiz_0_clk_wiz_0_clk_wiz is
  port (
    clk_out1 : out STD_LOGIC;
    reset : in STD_LOGIC;
    locked : out STD_LOGIC;
    clk_in1_p : in STD_LOGIC;
    clk_in1_n : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of clk_wiz_0_clk_wiz_0_clk_wiz : entity is "clk_wiz_0_clk_wiz";
end clk_wiz_0_clk_wiz_0_clk_wiz;

architecture STRUCTURE of clk_wiz_0_clk_wiz_0_clk_wiz is
  signal clk_in1_clk_wiz_0 : STD_LOGIC;
  signal clk_out1_clk_wiz_0 : STD_LOGIC;
  signal NLW_plle3_adv_inst_CLKFBIN_UNCONNECTED : STD_LOGIC;
  signal NLW_plle3_adv_inst_CLKFBOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_plle3_adv_inst_CLKOUT0B_UNCONNECTED : STD_LOGIC;
  signal NLW_plle3_adv_inst_CLKOUT1_UNCONNECTED : STD_LOGIC;
  signal NLW_plle3_adv_inst_CLKOUT1B_UNCONNECTED : STD_LOGIC;
  signal NLW_plle3_adv_inst_CLKOUTPHY_UNCONNECTED : STD_LOGIC;
  signal NLW_plle3_adv_inst_DRDY_UNCONNECTED : STD_LOGIC;
  signal NLW_plle3_adv_inst_DO_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of clkin1_ibufds : label is "PRIMITIVE";
  attribute CAPACITANCE : string;
  attribute CAPACITANCE of clkin1_ibufds : label is "DONT_CARE";
  attribute IBUF_DELAY_VALUE : string;
  attribute IBUF_DELAY_VALUE of clkin1_ibufds : label is "0";
  attribute IFD_DELAY_VALUE : string;
  attribute IFD_DELAY_VALUE of clkin1_ibufds : label is "AUTO";
  attribute BOX_TYPE of clkout1_buf : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of clkout1_buf : label is "BUFG";
  attribute BOX_TYPE of plle3_adv_inst : label is "PRIMITIVE";
begin
clkin1_ibufds: unisim.vcomponents.IBUFDS
    generic map(
      DIFF_TERM => false,
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => clk_in1_p,
      IB => clk_in1_n,
      O => clk_in1_clk_wiz_0
    );
clkout1_buf: unisim.vcomponents.BUFGCE
    generic map(
      CE_TYPE => "ASYNC"
    )
        port map (
      CE => '1',
      I => clk_out1_clk_wiz_0,
      O => clk_out1
    );
plle3_adv_inst: unisim.vcomponents.PLLE3_ADV
    generic map(
      CLKFBOUT_MULT => 3,
      CLKFBOUT_PHASE => 0.000000,
      CLKIN_PERIOD => 5.000000,
      CLKOUT0_DIVIDE => 12,
      CLKOUT0_DUTY_CYCLE => 0.500000,
      CLKOUT0_PHASE => 0.000000,
      CLKOUT1_DIVIDE => 1,
      CLKOUT1_DUTY_CYCLE => 0.500000,
      CLKOUT1_PHASE => 0.000000,
      CLKOUTPHY_MODE => "VCO_2X",
      COMPENSATION => "INTERNAL",
      DIVCLK_DIVIDE => 1,
      IS_CLKFBIN_INVERTED => '0',
      IS_CLKIN_INVERTED => '0',
      IS_PWRDWN_INVERTED => '0',
      IS_RST_INVERTED => '0',
      REF_JITTER => 0.010000,
      STARTUP_WAIT => "FALSE"
    )
        port map (
      CLKFBIN => NLW_plle3_adv_inst_CLKFBIN_UNCONNECTED,
      CLKFBOUT => NLW_plle3_adv_inst_CLKFBOUT_UNCONNECTED,
      CLKIN => clk_in1_clk_wiz_0,
      CLKOUT0 => clk_out1_clk_wiz_0,
      CLKOUT0B => NLW_plle3_adv_inst_CLKOUT0B_UNCONNECTED,
      CLKOUT1 => NLW_plle3_adv_inst_CLKOUT1_UNCONNECTED,
      CLKOUT1B => NLW_plle3_adv_inst_CLKOUT1B_UNCONNECTED,
      CLKOUTPHY => NLW_plle3_adv_inst_CLKOUTPHY_UNCONNECTED,
      CLKOUTPHYEN => '0',
      DADDR(6 downto 0) => B"0000000",
      DCLK => '0',
      DEN => '0',
      DI(15 downto 0) => B"0000000000000000",
      DO(15 downto 0) => NLW_plle3_adv_inst_DO_UNCONNECTED(15 downto 0),
      DRDY => NLW_plle3_adv_inst_DRDY_UNCONNECTED,
      DWE => '0',
      LOCKED => locked,
      PWRDWN => '0',
      RST => reset
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity clk_wiz_0 is
  port (
    clk_out1 : out STD_LOGIC;
    reset : in STD_LOGIC;
    locked : out STD_LOGIC;
    clk_in1_p : in STD_LOGIC;
    clk_in1_n : in STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of clk_wiz_0 : entity is true;
end clk_wiz_0;

architecture STRUCTURE of clk_wiz_0 is
begin
inst: entity work.clk_wiz_0_clk_wiz_0_clk_wiz
     port map (
      clk_in1_n => clk_in1_n,
      clk_in1_p => clk_in1_p,
      clk_out1 => clk_out1,
      locked => locked,
      reset => reset
    );
end STRUCTURE;
