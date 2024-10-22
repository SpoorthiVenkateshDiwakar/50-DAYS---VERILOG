module full_adder(output reg s0, c0, input wire a,b,c_in);
  always @* begin
    s0=(a^b)^c_in;
    c0=(a&b)|(c_in&(a^b));
  end
endmodule
