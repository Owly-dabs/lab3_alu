/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

/*
   Parameters:
     SHIFT = 8
*/
module x_bit_left_shifter_17 (
    input [31:0] a,
    input shift,
    output reg [31:0] out
  );
  
  localparam SHIFT = 4'h8;
  
  
  wire [(6'h20+0)-1:0] M_muxes_out;
  reg [(6'h20+0)-1:0] M_muxes_s0;
  reg [(6'h20+0)*2-1:0] M_muxes_in;
  
  genvar GEN_muxes0;
  generate
  for (GEN_muxes0=0;GEN_muxes0<6'h20;GEN_muxes0=GEN_muxes0+1) begin: muxes_gen_0
    mux_2_10 muxes (
      .s0(M_muxes_s0[GEN_muxes0*(1)+(1)-1-:(1)]),
      .in(M_muxes_in[GEN_muxes0*(2'h2)+(2'h2)-1-:(2'h2)]),
      .out(M_muxes_out[GEN_muxes0*(1)+(1)-1-:(1)])
    );
  end
  endgenerate
  
  integer i;
  
  always @* begin
    M_muxes_s0 = shift;
    for (i = 1'h0; i < 6'h20; i = i + 1) begin
      M_muxes_in[(i)*2+0+0-:1] = a[(i)*1+0-:1];
      if (i >= 4'h8) begin
        M_muxes_in[(i)*2+1+0-:1] = a[(i - 4'h8)*1+0-:1];
      end else begin
        M_muxes_in[(i)*2+1+0-:1] = 1'h0;
      end
    end
    out = M_muxes_out;
  end
endmodule
