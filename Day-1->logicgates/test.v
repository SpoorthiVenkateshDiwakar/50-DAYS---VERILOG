module test_bench(y,a,b);
  output reg a,b;
  intput wire y;

  and_gate inst(.a(a),.b(b),.y(y));
  initial begin
    $monitor("Time=%0t a=%0b b=%0b y=%0b",$time,a,b,y);
    #10 a=0; b=0;
    #10 a=0; b=1;
    #10 a=1; b=0;
    #10 a=1; b=1;
    #10
    $finish
  end
endmodule
