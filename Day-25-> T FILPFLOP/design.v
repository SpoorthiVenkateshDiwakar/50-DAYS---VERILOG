//D-FF design
module dff(
    input clk, reset, d,
    output reg Q
    );
    
    always@(posedge clk)
          begin
            if({reset})
            Q<= 1'b0;
            else 
            Q <= d;
            end
endmodule

//JK-FF design
module jkff(
    input j,k,clk,reset,
    output reg Q
    );
    always@(posedge clk)
          begin
            if({reset})
            Q <= 1'b0;
            else
                begin
                case({j,k})
                2'b00:Q<=Q;
                2'b01:Q<=1'b0;
                2'b10:Q<=1'b1;
                2'b11:Q<=~Q;
                endcase
                end          
         end
endmodule

//SR-FF design
module srff(
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

//Importing all flipflops to make T-flipflop
module tffusingsr_jk_d(
    input clk, reset, T,
    output Q_sr, Q_jk, Q_d
    );
    wire w1, w2, w3;   
    assign w1= T & (~Q_sr);
    assign w2= T & Q_sr;
    srff SR(clk, reset, w1, w2, Q_sr);
    jkff JK(T, T, clk, reset, Q_jk);
    assign w3= T ^ Q_d;
    dff D( clk, reset,w3, Q_d);    
endmodule
