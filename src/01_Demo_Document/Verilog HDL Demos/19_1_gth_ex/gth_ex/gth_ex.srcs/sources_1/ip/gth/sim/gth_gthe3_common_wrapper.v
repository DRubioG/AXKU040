//------------------------------------------------------------------------------
//  (c) Copyright 2013-2015 Xilinx, Inc. All rights reserved.
//
//  This file contains confidential and proprietary information
//  of Xilinx, Inc. and is protected under U.S. and
//  international copyright and other intellectual property
//  laws.
//
//  DISCLAIMER
//  This disclaimer is not a license and does not grant any
//  rights to the materials distributed herewith. Except as
//  otherwise provided in a valid license issued to you by
//  Xilinx, and to the maximum extent permitted by applicable
//  law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
//  WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
//  AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
//  BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
//  INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
//  (2) Xilinx shall not be liable (whether in contract or tort,
//  including negligence, or under any other theory of
//  liability) for any loss or damage of any kind or nature
//  related to, arising under or in connection with these
//  materials, including for any direct, or any indirect,
//  special, incidental, or consequential loss or damage
//  (including loss of data, profits, goodwill, or any type of
//  loss or damage suffered as a result of any action brought
//  by a third party) even if such damage or loss was
//  reasonably foreseeable or Xilinx had been advised of the
//  possibility of the same.
//
//  CRITICAL APPLICATIONS
//  Xilinx products are not designed or intended to be fail-
//  safe, or for use in any application requiring fail-safe
//  performance, such as life-support or safety devices or
//  systems, Class III medical devices, nuclear facilities,
//  applications related to the deployment of airbags, or any
//  other applications that could lead to death, personal
//  injury, or severe property or environmental damage
//  (individually and collectively, "Critical
//  Applications"). Customer assumes the sole risk and
//  liability of any use of Xilinx products in Critical
//  Applications, subject only to applicable laws and
//  regulations governing limitations on product liability.
//
//  THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
//  PART OF THIS FILE AT ALL TIMES.
//------------------------------------------------------------------------------

// ***************************
// * DO NOT MODIFY THIS FILE *
// ***************************



`timescale 1ps/1ps
module gth_gthe3_common_wrapper (
  input                                   [0:0] GTHE3_COMMON_BGBYPASSB,
  input                                   [0:0] GTHE3_COMMON_BGMONITORENB,
  input                                   [0:0] GTHE3_COMMON_BGPDB,
  input                                   [4:0] GTHE3_COMMON_BGRCALOVRD,
  input                                   [0:0] GTHE3_COMMON_BGRCALOVRDENB,
  input                                   [8:0] GTHE3_COMMON_DRPADDR,
  input                                   [0:0] GTHE3_COMMON_DRPCLK,
  input                                  [15:0] GTHE3_COMMON_DRPDI,
  input                                   [0:0] GTHE3_COMMON_DRPEN,
  input                                   [0:0] GTHE3_COMMON_DRPWE,
  input                                   [0:0] GTHE3_COMMON_GTGREFCLK0,
  input                                   [0:0] GTHE3_COMMON_GTGREFCLK1,
  input                                   [0:0] GTHE3_COMMON_GTNORTHREFCLK00,
  input                                   [0:0] GTHE3_COMMON_GTNORTHREFCLK01,
  input                                   [0:0] GTHE3_COMMON_GTNORTHREFCLK10,
  input                                   [0:0] GTHE3_COMMON_GTNORTHREFCLK11,
  input                                   [0:0] GTHE3_COMMON_GTREFCLK00,
  input                                   [0:0] GTHE3_COMMON_GTREFCLK01,
  input                                   [0:0] GTHE3_COMMON_GTREFCLK10,
  input                                   [0:0] GTHE3_COMMON_GTREFCLK11,
  input                                   [0:0] GTHE3_COMMON_GTSOUTHREFCLK00,
  input                                   [0:0] GTHE3_COMMON_GTSOUTHREFCLK01,
  input                                   [0:0] GTHE3_COMMON_GTSOUTHREFCLK10,
  input                                   [0:0] GTHE3_COMMON_GTSOUTHREFCLK11,
  input                                   [7:0] GTHE3_COMMON_PMARSVD0,
  input                                   [7:0] GTHE3_COMMON_PMARSVD1,
  input                                   [0:0] GTHE3_COMMON_QPLL0CLKRSVD0,
  input                                   [0:0] GTHE3_COMMON_QPLL0CLKRSVD1,
  input                                   [0:0] GTHE3_COMMON_QPLL0LOCKDETCLK,
  input                                   [0:0] GTHE3_COMMON_QPLL0LOCKEN,
  input                                   [0:0] GTHE3_COMMON_QPLL0PD,
  input                                   [2:0] GTHE3_COMMON_QPLL0REFCLKSEL,
  input                                   [0:0] GTHE3_COMMON_QPLL0RESET,
  input                                   [0:0] GTHE3_COMMON_QPLL1CLKRSVD0,
  input                                   [0:0] GTHE3_COMMON_QPLL1CLKRSVD1,
  input                                   [0:0] GTHE3_COMMON_QPLL1LOCKDETCLK,
  input                                   [0:0] GTHE3_COMMON_QPLL1LOCKEN,
  input                                   [0:0] GTHE3_COMMON_QPLL1PD,
  input                                   [2:0] GTHE3_COMMON_QPLL1REFCLKSEL,
  input                                   [0:0] GTHE3_COMMON_QPLL1RESET,
  input                                   [7:0] GTHE3_COMMON_QPLLRSVD1,
  input                                   [4:0] GTHE3_COMMON_QPLLRSVD2,
  input                                   [4:0] GTHE3_COMMON_QPLLRSVD3,
  input                                   [7:0] GTHE3_COMMON_QPLLRSVD4,
  input                                   [0:0] GTHE3_COMMON_RCALENB,

  output                                 [15:0] GTHE3_COMMON_DRPDO,
  output                                  [0:0] GTHE3_COMMON_DRPRDY,
  output                                  [7:0] GTHE3_COMMON_PMARSVDOUT0,
  output                                  [7:0] GTHE3_COMMON_PMARSVDOUT1,
  output                                  [0:0] GTHE3_COMMON_QPLL0FBCLKLOST,
  output                                  [0:0] GTHE3_COMMON_QPLL0LOCK,
  output                                  [0:0] GTHE3_COMMON_QPLL0OUTCLK,
  output                                  [0:0] GTHE3_COMMON_QPLL0OUTREFCLK,
  output                                  [0:0] GTHE3_COMMON_QPLL0REFCLKLOST,
  output                                  [0:0] GTHE3_COMMON_QPLL1FBCLKLOST,
  output                                  [0:0] GTHE3_COMMON_QPLL1LOCK,
  output                                  [0:0] GTHE3_COMMON_QPLL1OUTCLK,
  output                                  [0:0] GTHE3_COMMON_QPLL1OUTREFCLK,
  output                                  [0:0] GTHE3_COMMON_QPLL1REFCLKLOST,
  output                                  [7:0] GTHE3_COMMON_QPLLDMONITOR0,
  output                                  [7:0] GTHE3_COMMON_QPLLDMONITOR1,
  output                                  [0:0] GTHE3_COMMON_REFCLKOUTMONITOR0,
  output                                  [0:0] GTHE3_COMMON_REFCLKOUTMONITOR1,
  output                                  [1:0] GTHE3_COMMON_RXRECCLK0_SEL,
  output                                  [1:0] GTHE3_COMMON_RXRECCLK1_SEL
);



gtwizard_ultrascale_v1_7_2_gthe3_common #(
  .GTHE3_COMMON_BGBYPASSB_TIE_EN                (1'b1),
  .GTHE3_COMMON_BGBYPASSB_VAL                   (1'b1),
  .GTHE3_COMMON_BGMONITORENB_TIE_EN             (1'b1),
  .GTHE3_COMMON_BGMONITORENB_VAL                (1'b1),
  .GTHE3_COMMON_BGPDB_TIE_EN                    (1'b1),
  .GTHE3_COMMON_BGPDB_VAL                       (1'b1),
  .GTHE3_COMMON_BGRCALOVRDENB_TIE_EN            (1'b1),
  .GTHE3_COMMON_BGRCALOVRDENB_VAL               (1'b1),
  .GTHE3_COMMON_BGRCALOVRD_TIE_EN               (1'b1),
  .GTHE3_COMMON_BGRCALOVRD_VAL                  (5'b11111),
  .GTHE3_COMMON_BIAS_CFG0                       (16'b0000000000000000),
  .GTHE3_COMMON_BIAS_CFG1                       (16'b0000000000000000),
  .GTHE3_COMMON_BIAS_CFG2                       (16'b0000000000000000),
  .GTHE3_COMMON_BIAS_CFG3                       (16'b0000000001000000),
  .GTHE3_COMMON_BIAS_CFG4                       (16'b0000000000000000),
  .GTHE3_COMMON_BIAS_CFG_RSVD                   (10'b0000000000),
  .GTHE3_COMMON_COMMON_CFG0                     (16'b0000000000000000),
  .GTHE3_COMMON_COMMON_CFG1                     (16'b0000000000000000),
  .GTHE3_COMMON_DRPADDR_TIE_EN                  (1'b0),
  .GTHE3_COMMON_DRPADDR_VAL                     (9'b000000000),
  .GTHE3_COMMON_DRPCLK_TIE_EN                   (1'b0),
  .GTHE3_COMMON_DRPCLK_VAL                      (1'b0),
  .GTHE3_COMMON_DRPDI_TIE_EN                    (1'b0),
  .GTHE3_COMMON_DRPDI_VAL                       (16'b0000000000000000),
  .GTHE3_COMMON_DRPEN_TIE_EN                    (1'b0),
  .GTHE3_COMMON_DRPEN_VAL                       (1'b0),
  .GTHE3_COMMON_DRPWE_TIE_EN                    (1'b0),
  .GTHE3_COMMON_DRPWE_VAL                       (1'b0),
  .GTHE3_COMMON_GTGREFCLK0_TIE_EN               (1'b0),
  .GTHE3_COMMON_GTGREFCLK0_VAL                  (1'b0),
  .GTHE3_COMMON_GTGREFCLK1_TIE_EN               (1'b0),
  .GTHE3_COMMON_GTGREFCLK1_VAL                  (1'b0),
  .GTHE3_COMMON_GTNORTHREFCLK00_TIE_EN          (1'b0),
  .GTHE3_COMMON_GTNORTHREFCLK00_VAL             (1'b0),
  .GTHE3_COMMON_GTNORTHREFCLK01_TIE_EN          (1'b0),
  .GTHE3_COMMON_GTNORTHREFCLK01_VAL             (1'b0),
  .GTHE3_COMMON_GTNORTHREFCLK10_TIE_EN          (1'b0),
  .GTHE3_COMMON_GTNORTHREFCLK10_VAL             (1'b0),
  .GTHE3_COMMON_GTNORTHREFCLK11_TIE_EN          (1'b0),
  .GTHE3_COMMON_GTNORTHREFCLK11_VAL             (1'b0),
  .GTHE3_COMMON_GTREFCLK00_TIE_EN               (1'b0),
  .GTHE3_COMMON_GTREFCLK00_VAL                  (1'b0),
  .GTHE3_COMMON_GTREFCLK01_TIE_EN               (1'b0),
  .GTHE3_COMMON_GTREFCLK01_VAL                  (1'b0),
  .GTHE3_COMMON_GTREFCLK10_TIE_EN               (1'b0),
  .GTHE3_COMMON_GTREFCLK10_VAL                  (1'b0),
  .GTHE3_COMMON_GTREFCLK11_TIE_EN               (1'b0),
  .GTHE3_COMMON_GTREFCLK11_VAL                  (1'b0),
  .GTHE3_COMMON_GTSOUTHREFCLK00_TIE_EN          (1'b0),
  .GTHE3_COMMON_GTSOUTHREFCLK00_VAL             (1'b0),
  .GTHE3_COMMON_GTSOUTHREFCLK01_TIE_EN          (1'b0),
  .GTHE3_COMMON_GTSOUTHREFCLK01_VAL             (1'b0),
  .GTHE3_COMMON_GTSOUTHREFCLK10_TIE_EN          (1'b0),
  .GTHE3_COMMON_GTSOUTHREFCLK10_VAL             (1'b0),
  .GTHE3_COMMON_GTSOUTHREFCLK11_TIE_EN          (1'b0),
  .GTHE3_COMMON_GTSOUTHREFCLK11_VAL             (1'b0),
  .GTHE3_COMMON_PMARSVD0_TIE_EN                 (1'b1),
  .GTHE3_COMMON_PMARSVD0_VAL                    (8'b00000000),
  .GTHE3_COMMON_PMARSVD1_TIE_EN                 (1'b1),
  .GTHE3_COMMON_PMARSVD1_VAL                    (8'b00000000),
  .GTHE3_COMMON_POR_CFG                         (16'b0000000000000100),
  .GTHE3_COMMON_QPLL0CLKRSVD0_TIE_EN            (1'b0),
  .GTHE3_COMMON_QPLL0CLKRSVD0_VAL               (1'b0),
  .GTHE3_COMMON_QPLL0CLKRSVD1_TIE_EN            (1'b0),
  .GTHE3_COMMON_QPLL0CLKRSVD1_VAL               (1'b0),
  .GTHE3_COMMON_QPLL0LOCKDETCLK_TIE_EN          (1'b0),
  .GTHE3_COMMON_QPLL0LOCKDETCLK_VAL             (1'b0),
  .GTHE3_COMMON_QPLL0LOCKEN_TIE_EN              (1'b0),
  .GTHE3_COMMON_QPLL0LOCKEN_VAL                 (1'b1),
  .GTHE3_COMMON_QPLL0PD_TIE_EN                  (1'b0),
  .GTHE3_COMMON_QPLL0PD_VAL                     (1'b0),
  .GTHE3_COMMON_QPLL0REFCLKSEL_TIE_EN           (1'b0),
  .GTHE3_COMMON_QPLL0REFCLKSEL_VAL              (3'b001),
  .GTHE3_COMMON_QPLL0RESET_TIE_EN               (1'b0),
  .GTHE3_COMMON_QPLL0RESET_VAL                  (1'b0),
  .GTHE3_COMMON_QPLL0_CFG0                      (16'b0011001000011100),
  .GTHE3_COMMON_QPLL0_CFG1                      (16'b0001000000011000),
  .GTHE3_COMMON_QPLL0_CFG1_G3                   (16'b0001000000011000),
  .GTHE3_COMMON_QPLL0_CFG2                      (16'b0000000001001000),
  .GTHE3_COMMON_QPLL0_CFG2_G3                   (16'b0000000001001000),
  .GTHE3_COMMON_QPLL0_CFG3                      (16'b0000000100100000),
  .GTHE3_COMMON_QPLL0_CFG4                      (16'b0000000000000000),
  .GTHE3_COMMON_QPLL0_CP                        (10'b0111111111),
  .GTHE3_COMMON_QPLL0_CP_G3                     (10'b1111111111),
  .GTHE3_COMMON_QPLL0_FBDIV                     (100),
  .GTHE3_COMMON_QPLL0_FBDIV_G3                  (64),
  .GTHE3_COMMON_QPLL0_INIT_CFG0                 (16'b0000001010110010),
  .GTHE3_COMMON_QPLL0_INIT_CFG1                 (8'b00000000),
  .GTHE3_COMMON_QPLL0_LOCK_CFG                  (16'b0010000111101000),
  .GTHE3_COMMON_QPLL0_LOCK_CFG_G3               (16'b0010000111101000),
  .GTHE3_COMMON_QPLL0_LPF                       (10'b1111111100),
  .GTHE3_COMMON_QPLL0_LPF_G3                    (10'b0000010101),
  .GTHE3_COMMON_QPLL0_REFCLK_DIV                (1),
  .GTHE3_COMMON_QPLL0_SDM_CFG0                  (16'b0000000000000000),
  .GTHE3_COMMON_QPLL0_SDM_CFG1                  (16'b0000000000000000),
  .GTHE3_COMMON_QPLL0_SDM_CFG2                  (16'b0000000000000000),
  .GTHE3_COMMON_QPLL1CLKRSVD0_TIE_EN            (1'b0),
  .GTHE3_COMMON_QPLL1CLKRSVD0_VAL               (1'b0),
  .GTHE3_COMMON_QPLL1CLKRSVD1_TIE_EN            (1'b0),
  .GTHE3_COMMON_QPLL1CLKRSVD1_VAL               (1'b0),
  .GTHE3_COMMON_QPLL1LOCKDETCLK_TIE_EN          (1'b0),
  .GTHE3_COMMON_QPLL1LOCKDETCLK_VAL             (1'b0),
  .GTHE3_COMMON_QPLL1LOCKEN_TIE_EN              (1'b0),
  .GTHE3_COMMON_QPLL1LOCKEN_VAL                 (1'b0),
  .GTHE3_COMMON_QPLL1PD_TIE_EN                  (1'b0),
  .GTHE3_COMMON_QPLL1PD_VAL                     (1'b1),
  .GTHE3_COMMON_QPLL1REFCLKSEL_TIE_EN           (1'b0),
  .GTHE3_COMMON_QPLL1REFCLKSEL_VAL              (3'b001),
  .GTHE3_COMMON_QPLL1RESET_TIE_EN               (1'b0),
  .GTHE3_COMMON_QPLL1RESET_VAL                  (1'b1),
  .GTHE3_COMMON_QPLL1_CFG0                      (16'b0011001000011100),
  .GTHE3_COMMON_QPLL1_CFG1                      (16'b0001000000011000),
  .GTHE3_COMMON_QPLL1_CFG1_G3                   (16'b0001000000011000),
  .GTHE3_COMMON_QPLL1_CFG2                      (16'b0000000001000000),
  .GTHE3_COMMON_QPLL1_CFG2_G3                   (16'b0000000001000000),
  .GTHE3_COMMON_QPLL1_CFG3                      (16'b0000000100100000),
  .GTHE3_COMMON_QPLL1_CFG4                      (16'b0000000000000000),
  .GTHE3_COMMON_QPLL1_CP                        (10'b0001111111),
  .GTHE3_COMMON_QPLL1_CP_G3                     (10'b1111111111),
  .GTHE3_COMMON_QPLL1_FBDIV                     (66),
  .GTHE3_COMMON_QPLL1_FBDIV_G3                  (80),
  .GTHE3_COMMON_QPLL1_INIT_CFG0                 (16'b0000001010110010),
  .GTHE3_COMMON_QPLL1_INIT_CFG1                 (8'b00000000),
  .GTHE3_COMMON_QPLL1_LOCK_CFG                  (16'b0010000111101000),
  .GTHE3_COMMON_QPLL1_LOCK_CFG_G3               (16'b0010000111101000),
  .GTHE3_COMMON_QPLL1_LPF                       (10'b1111111100),
  .GTHE3_COMMON_QPLL1_LPF_G3                    (10'b0000010101),
  .GTHE3_COMMON_QPLL1_REFCLK_DIV                (1),
  .GTHE3_COMMON_QPLL1_SDM_CFG0                  (16'b0000000000000000),
  .GTHE3_COMMON_QPLL1_SDM_CFG1                  (16'b0000000000000000),
  .GTHE3_COMMON_QPLL1_SDM_CFG2                  (16'b0000000000000000),
  .GTHE3_COMMON_QPLLRSVD1_TIE_EN                (1'b0),
  .GTHE3_COMMON_QPLLRSVD1_VAL                   (8'b00000000),
  .GTHE3_COMMON_QPLLRSVD2_TIE_EN                (1'b0),
  .GTHE3_COMMON_QPLLRSVD2_VAL                   (5'b00000),
  .GTHE3_COMMON_QPLLRSVD3_TIE_EN                (1'b0),
  .GTHE3_COMMON_QPLLRSVD3_VAL                   (5'b00000),
  .GTHE3_COMMON_QPLLRSVD4_TIE_EN                (1'b0),
  .GTHE3_COMMON_QPLLRSVD4_VAL                   (8'b00000000),
  .GTHE3_COMMON_RCALENB_TIE_EN                  (1'b1),
  .GTHE3_COMMON_RCALENB_VAL                     (1'b1),
  .GTHE3_COMMON_RSVD_ATTR0                      (16'b0000000000000000),
  .GTHE3_COMMON_RSVD_ATTR1                      (16'b0000000000000000),
  .GTHE3_COMMON_RSVD_ATTR2                      (16'b0000000000000000),
  .GTHE3_COMMON_RSVD_ATTR3                      (16'b0000000000000000),
  .GTHE3_COMMON_RXRECCLKOUT0_SEL                (2'b00),
  .GTHE3_COMMON_RXRECCLKOUT1_SEL                (2'b00),
  .GTHE3_COMMON_SARC_EN                         (1'b1),
  .GTHE3_COMMON_SARC_SEL                        (1'b0),
  .GTHE3_COMMON_SDM0DATA1_0                     (16'b0000000000000000),
  .GTHE3_COMMON_SDM0DATA1_1                     (9'b000000000),
  .GTHE3_COMMON_SDM0INITSEED0_0                 (16'b0000000000000000),
  .GTHE3_COMMON_SDM0INITSEED0_1                 (9'b000000000),
  .GTHE3_COMMON_SDM0_DATA_PIN_SEL               (1'b0),
  .GTHE3_COMMON_SDM0_WIDTH_PIN_SEL              (1'b0),
  .GTHE3_COMMON_SDM1DATA1_0                     (16'b0000000000000000),
  .GTHE3_COMMON_SDM1DATA1_1                     (9'b000000000),
  .GTHE3_COMMON_SDM1INITSEED0_0                 (16'b0000000000000000),
  .GTHE3_COMMON_SDM1INITSEED0_1                 (9'b000000000),
  .GTHE3_COMMON_SDM1_DATA_PIN_SEL               (1'b0),
  .GTHE3_COMMON_SDM1_WIDTH_PIN_SEL              (1'b0),
  .GTHE3_COMMON_SIM_RESET_SPEEDUP               ("TRUE"),
  .GTHE3_COMMON_SIM_VERSION                     (2)
) common_inst (

  // inputs
  .GTHE3_COMMON_BGBYPASSB                       (GTHE3_COMMON_BGBYPASSB),
  .GTHE3_COMMON_BGMONITORENB                    (GTHE3_COMMON_BGMONITORENB),
  .GTHE3_COMMON_BGPDB                           (GTHE3_COMMON_BGPDB),
  .GTHE3_COMMON_BGRCALOVRD                      (GTHE3_COMMON_BGRCALOVRD),
  .GTHE3_COMMON_BGRCALOVRDENB                   (GTHE3_COMMON_BGRCALOVRDENB),
  .GTHE3_COMMON_DRPADDR                         (GTHE3_COMMON_DRPADDR),
  .GTHE3_COMMON_DRPCLK                          (GTHE3_COMMON_DRPCLK),
  .GTHE3_COMMON_DRPDI                           (GTHE3_COMMON_DRPDI),
  .GTHE3_COMMON_DRPEN                           (GTHE3_COMMON_DRPEN),
  .GTHE3_COMMON_DRPWE                           (GTHE3_COMMON_DRPWE),
  .GTHE3_COMMON_GTGREFCLK0                      (GTHE3_COMMON_GTGREFCLK0),
  .GTHE3_COMMON_GTGREFCLK1                      (GTHE3_COMMON_GTGREFCLK1),
  .GTHE3_COMMON_GTNORTHREFCLK00                 (GTHE3_COMMON_GTNORTHREFCLK00),
  .GTHE3_COMMON_GTNORTHREFCLK01                 (GTHE3_COMMON_GTNORTHREFCLK01),
  .GTHE3_COMMON_GTNORTHREFCLK10                 (GTHE3_COMMON_GTNORTHREFCLK10),
  .GTHE3_COMMON_GTNORTHREFCLK11                 (GTHE3_COMMON_GTNORTHREFCLK11),
  .GTHE3_COMMON_GTREFCLK00                      (GTHE3_COMMON_GTREFCLK00),
  .GTHE3_COMMON_GTREFCLK01                      (GTHE3_COMMON_GTREFCLK01),
  .GTHE3_COMMON_GTREFCLK10                      (GTHE3_COMMON_GTREFCLK10),
  .GTHE3_COMMON_GTREFCLK11                      (GTHE3_COMMON_GTREFCLK11),
  .GTHE3_COMMON_GTSOUTHREFCLK00                 (GTHE3_COMMON_GTSOUTHREFCLK00),
  .GTHE3_COMMON_GTSOUTHREFCLK01                 (GTHE3_COMMON_GTSOUTHREFCLK01),
  .GTHE3_COMMON_GTSOUTHREFCLK10                 (GTHE3_COMMON_GTSOUTHREFCLK10),
  .GTHE3_COMMON_GTSOUTHREFCLK11                 (GTHE3_COMMON_GTSOUTHREFCLK11),
  .GTHE3_COMMON_PMARSVD0                        (GTHE3_COMMON_PMARSVD0),
  .GTHE3_COMMON_PMARSVD1                        (GTHE3_COMMON_PMARSVD1),
  .GTHE3_COMMON_QPLL0CLKRSVD0                   (GTHE3_COMMON_QPLL0CLKRSVD0),
  .GTHE3_COMMON_QPLL0CLKRSVD1                   (GTHE3_COMMON_QPLL0CLKRSVD1),
  .GTHE3_COMMON_QPLL0LOCKDETCLK                 (GTHE3_COMMON_QPLL0LOCKDETCLK),
  .GTHE3_COMMON_QPLL0LOCKEN                     (GTHE3_COMMON_QPLL0LOCKEN),
  .GTHE3_COMMON_QPLL0PD                         (GTHE3_COMMON_QPLL0PD),
  .GTHE3_COMMON_QPLL0REFCLKSEL                  (GTHE3_COMMON_QPLL0REFCLKSEL),
  .GTHE3_COMMON_QPLL0RESET                      (GTHE3_COMMON_QPLL0RESET),
  .GTHE3_COMMON_QPLL1CLKRSVD0                   (GTHE3_COMMON_QPLL1CLKRSVD0),
  .GTHE3_COMMON_QPLL1CLKRSVD1                   (GTHE3_COMMON_QPLL1CLKRSVD1),
  .GTHE3_COMMON_QPLL1LOCKDETCLK                 (GTHE3_COMMON_QPLL1LOCKDETCLK),
  .GTHE3_COMMON_QPLL1LOCKEN                     (GTHE3_COMMON_QPLL1LOCKEN),
  .GTHE3_COMMON_QPLL1PD                         (GTHE3_COMMON_QPLL1PD),
  .GTHE3_COMMON_QPLL1REFCLKSEL                  (GTHE3_COMMON_QPLL1REFCLKSEL),
  .GTHE3_COMMON_QPLL1RESET                      (GTHE3_COMMON_QPLL1RESET),
  .GTHE3_COMMON_QPLLRSVD1                       (GTHE3_COMMON_QPLLRSVD1),
  .GTHE3_COMMON_QPLLRSVD2                       (GTHE3_COMMON_QPLLRSVD2),
  .GTHE3_COMMON_QPLLRSVD3                       (GTHE3_COMMON_QPLLRSVD3),
  .GTHE3_COMMON_QPLLRSVD4                       (GTHE3_COMMON_QPLLRSVD4),
  .GTHE3_COMMON_RCALENB                         (GTHE3_COMMON_RCALENB),

  // outputs
  .GTHE3_COMMON_DRPDO                           (GTHE3_COMMON_DRPDO),
  .GTHE3_COMMON_DRPRDY                          (GTHE3_COMMON_DRPRDY),
  .GTHE3_COMMON_PMARSVDOUT0                     (GTHE3_COMMON_PMARSVDOUT0),
  .GTHE3_COMMON_PMARSVDOUT1                     (GTHE3_COMMON_PMARSVDOUT1),
  .GTHE3_COMMON_QPLL0FBCLKLOST                  (GTHE3_COMMON_QPLL0FBCLKLOST),
  .GTHE3_COMMON_QPLL0LOCK                       (GTHE3_COMMON_QPLL0LOCK),
  .GTHE3_COMMON_QPLL0OUTCLK                     (GTHE3_COMMON_QPLL0OUTCLK),
  .GTHE3_COMMON_QPLL0OUTREFCLK                  (GTHE3_COMMON_QPLL0OUTREFCLK),
  .GTHE3_COMMON_QPLL0REFCLKLOST                 (GTHE3_COMMON_QPLL0REFCLKLOST),
  .GTHE3_COMMON_QPLL1FBCLKLOST                  (GTHE3_COMMON_QPLL1FBCLKLOST),
  .GTHE3_COMMON_QPLL1LOCK                       (GTHE3_COMMON_QPLL1LOCK),
  .GTHE3_COMMON_QPLL1OUTCLK                     (GTHE3_COMMON_QPLL1OUTCLK),
  .GTHE3_COMMON_QPLL1OUTREFCLK                  (GTHE3_COMMON_QPLL1OUTREFCLK),
  .GTHE3_COMMON_QPLL1REFCLKLOST                 (GTHE3_COMMON_QPLL1REFCLKLOST),
  .GTHE3_COMMON_QPLLDMONITOR0                   (GTHE3_COMMON_QPLLDMONITOR0),
  .GTHE3_COMMON_QPLLDMONITOR1                   (GTHE3_COMMON_QPLLDMONITOR1),
  .GTHE3_COMMON_REFCLKOUTMONITOR0               (GTHE3_COMMON_REFCLKOUTMONITOR0),
  .GTHE3_COMMON_REFCLKOUTMONITOR1               (GTHE3_COMMON_REFCLKOUTMONITOR1),
  .GTHE3_COMMON_RXRECCLK0_SEL                   (GTHE3_COMMON_RXRECCLK0_SEL),
  .GTHE3_COMMON_RXRECCLK1_SEL                   (GTHE3_COMMON_RXRECCLK1_SEL)
);

endmodule

