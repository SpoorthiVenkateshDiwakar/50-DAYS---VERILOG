//D-ff design
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

//SR-ff design
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

//T-ff design
module tff(
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

//Importing these designs for utilizing them in making JK-ff
module JK_using_SR_D_T(
    input J, K, clk, reset,
    output Q_sr, Q_d, Q_t
    );
    wire w1, w2, w3, w4, w5, w6, w7, w8;
    
    assign w1= J & (~Q_sr);
    assign w2= K & Q_sr;
    srff SR(clk, reset, w1, w2, Q_sr);
    
    assign w3= J & (~Q_d);
    assign w4= (~K) & Q_d;
    assign w5= w3 | w4;
    dff D(w5, clk, reset, Q_d);
    
    assign w6= J & (~Q_t);
    assign w7= K & Q_t;
    assign w8= w6 | w7;
    tff T(w8, clk, reset, Q_t);
    
endmodule
