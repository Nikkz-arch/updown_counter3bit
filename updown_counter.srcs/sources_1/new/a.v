module jk_flip_flop(input clk,input rst,input en,input j,input k,output reg q);
always @(posedge clk)begin 
if(rst)
q<=1'b0;
else if (en) begin
case({j,k})
2'b00:q<=q;
2'b01:q<=1'b0;
2'b10:q<=1'b1;
2'b11:q<=~q;
endcase 
end 
end 
endmodule

module updown_counter3bit(input clk,input rst,input en,input count_up,input count_down,output a,output b,output c);
wire w1,w2,w3,w4,w5,w6;
wire j1,k1,j2,k2,j3,k3;
assign j1=1'b1,k1=1'b1;
assign j2=1'b1,k2=1'b1;
assign j3=1'b1,k3=1'b1;
not n1(nota,a);
not n2(notb,b);
and a1(w1,a,count_up);
and a2(w2,nota,count_down);
or o1(w3,w1,w2);
and a3(w4,b,count_up);
and a4(w5,notb,count_down);
or o2(w6,w4,w5);
jk_flip_flop ff1(.clk(clk),.en(en),.rst(rst),.j(j1),.k(k1),.q(a));
jk_flip_flop ff2(.clk(clk),.en(w3),.rst(rst),.j(j2),.k(k2),.q(b));
jk_flip_flop ff3(.clk(clk),.en(w6),.rst(rst),.j(j3),.k(k3),.q(c));
endmodule