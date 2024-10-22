`include "design.v"
module full_adder_test(s0,c0,a,b,c_in);
  output reg a,b,c_in;
  input wire s0,c0;

  full_adder inst(.s0(s0), .c0(c0), .a(a), .b(b), .c_in(c_in));

  initial begin
    $monitor("Time=%0t => a=%b b=%b c_in=%b s0=%b c0=%b",$time,a,b,c_in,s0,co);
    #1 a=0;b=0;c_in=0;
    #1 a=0;b=0;c_in=1;
    #1 a=0;b=1;c_in=0;
    #1 a=0;b=1;c_in=1;
    #1 a=1;b=0;c_in=0;
    #1 a=1;b=0;c_in=1;
    #1 a=1;b=1;c_in=0;
    #1 a=1;b=1;c_in=1;
    #1
    $finish;
  end
endmodule
