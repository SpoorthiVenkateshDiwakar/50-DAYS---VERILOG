//JK flipflop design
module jk_flipflop(
    input j,k,clk,reset,
    output reg q
    );
    always@(posedge clk)
          begin
            if({reset})
            q <= 1'b0;
            else
                begin
                case({j,k})
                2'b00:q<=q;
                2'b01:q<=1'b0;
                2'b10:q<=1'b1;
                2'b11:q<=~q;
                endcase
                end          
         end
endmodule

//SR flipflop design
module sr_flipflop(
    input clk,reset,S,R, 
    output reg Q);
    
    always@(posedge clk)
          begin
            if(reset)
            Q <= 1'b0;
            else
                begin
                case({S,R})
                2'b00:Q<=Q;
                2'b01:Q<=1'b0;
                2'b10:Q<=1'b1;
                default: Q<= 2'bxx;
                endcase
                end          
         end
endmodule

//T flipflop design
module t_flipflop(
    input t,clk,reset,
    output reg Q
    );
    always@(posedge clk)
          begin
            if(reset)
               Q <= 1'b0;
            else
                begin
                   if(t)
                    Q<= ~Q;
                   else
                    Q<= Q;                     
                end
          end
endmodule

// Importing above flipflops to make D Flipflop
module dff_using_sr_jk_t(input clk, reset, d, output q_sr,q_jk,q_t );
  wire w;
  sr_flipflop sr(clk, reset, d, ~d, q_sr);
  jk_flipflop jk(d, ~d, clk, reset, q_jk);
  assign w= d^q_t;
  t_flipflop t(w,clk,reset,q_t);  
endmodule
