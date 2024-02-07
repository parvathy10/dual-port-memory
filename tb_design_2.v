`timescale 1ns / 1ps

module tb_design_2_wrapper;
  reg clka, clkb;
  reg [31:0] addra, addrb, dina, dinb;
  reg ena, enb, rsta, rstb;
  reg [3:0] wea, web;
  wire [31:0] douta, doutb;

  // Instantiate the design_2_wrapper module
  design_2_wrapper design_2_wrapper_inst (
    .addra(addra),
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
    .web(web)
  );

  // Clock generation
  initial begin
    clka = 1'b0;
    clkb = 1'b0;
    forever #5 clka = ~clka;
    forever #10 clkb = ~clkb;
  end

  // Test stimulus
  initial begin
    // Initial values
    addra = 32'd0;
    addrb = 32'd0;
    dina = 32'b0;
    dinb = 32'b0;
    ena = 0;
    enb = 0;
    rsta = 0;
    rstb = 0;
    wea = 4'b0000;
    web = 4'b0000;

    // Apply reset
    #100;
    rsta = 1;
    rstb = 1;
    #100;
    rsta = 0;
    rstb = 0;

    // Perform successive writes to 100 locations through port A
    repeat (100) begin
      @(posedge clka);
      addra = addra + 1;
      dina = $random;
      wea = 4'b1111;
      ena = 1;
      @(posedge clka);
      ena = 0;
    end

    // Leave an interval of 20 cycles
    #200;

    // Read each location successively after leaving an interval of 20 cycles through port B
    repeat (100) begin
      @(posedge clkb);
      addrb = addrb + 1;
      web = 4'b1111;
      enb = 1;
      @(posedge clkb);
      enb = 0;
    end

    // Finish simulation
    #100;
    $finish;
  end
endmodule

