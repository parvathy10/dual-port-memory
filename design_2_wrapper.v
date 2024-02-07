//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
//Date        : Sun Feb  4 14:27:44 2024
//Host        : kiwi running 64-bit major release  (build 9200)
//Command     : generate_target design_2_wrapper.bd
//Design      : design_2_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_2_wrapper
   (addra,
    addrb,
    clka,
    clkb,
    dina,
    dinb,
    douta,
    doutb,
    ena,
    enb,
    rsta,
    rstb,
    wea,
    web);
  input [31:0]addra;
  input [31:0]addrb;
  input clka;
  input clkb;
  input [31:0]dina;
  input [31:0]dinb;
  output [31:0]douta;
  output [31:0]doutb;
  input ena;
  input enb;
  input rsta;
  input rstb;
  input [3:0]wea;
  input [3:0]web;

  wire [31:0]addra;
  wire [31:0]addrb;
  wire clka;
  wire clkb;
  wire [31:0]dina;
  wire [31:0]dinb;
  wire [31:0]douta;
  wire [31:0]doutb;
  wire ena;
  wire enb;
  wire rsta;
  wire rstb;
  wire [3:0]wea;
  wire [3:0]web;

  design_2 design_2_i
       (.addra(addra),
        .addrb(addrb),
        .clka(clka),
        .clkb(clkb),
        .dina(dina),
        .dinb(dinb),
        .douta(douta),
        .doutb(doutb),
        .ena(ena),
        .enb(enb),
        .rsta(rsta),
        .rstb(rstb),
        .wea(wea),
        .web(web));
endmodule
