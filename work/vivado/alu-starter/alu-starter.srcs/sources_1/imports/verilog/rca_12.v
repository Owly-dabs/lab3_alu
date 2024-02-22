/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module rca_12 (
    input [31:0] a,
    input [31:0] b,
    input ci,
    output reg [31:0] s
  );
  
  
  
  wire [(6'h20+0)-1:0] M_fa_s;
  wire [(6'h20+0)-1:0] M_fa_co;
  reg [(6'h20+0)-1:0] M_fa_a;
  reg [(6'h20+0)-1:0] M_fa_b;
  reg [(6'h20+0)-1:0] M_fa_ci;
  
  genvar GEN_fa0;
  generate
  for (GEN_fa0=0;GEN_fa0<6'h20;GEN_fa0=GEN_fa0+1) begin: fa_gen_0
    full_adder_15 fa (
      .a(M_fa_a[GEN_fa0*(1)+(1)-1-:(1)]),
      .b(M_fa_b[GEN_fa0*(1)+(1)-1-:(1)]),
      .ci(M_fa_ci[GEN_fa0*(1)+(1)-1-:(1)]),
      .s(M_fa_s[GEN_fa0*(1)+(1)-1-:(1)]),
      .co(M_fa_co[GEN_fa0*(1)+(1)-1-:(1)])
    );
  end
  endgenerate
  
  integer i;
  
  always @* begin
    M_fa_a[0+0-:1] = a[0+0-:1];
    M_fa_b[0+0-:1] = b[0+0-:1];
    M_fa_ci[0+0-:1] = ci;
    for (i = 1'h1; i < 6'h20; i = i + 1) begin
      M_fa_a[(i)*1+0-:1] = a[(i)*1+0-:1];
      M_fa_b[(i)*1+0-:1] = b[(i)*1+0-:1];
      M_fa_ci[(i)*1+0-:1] = M_fa_co[(i - 1'h1)*1+0-:1];
    end
    s = M_fa_s;
  end
endmodule
