module testbench;
reg clk;reg rst;reg en;
reg count_up;
reg count_down;
wire a,b,c;
updown_counter3bit uut(.clk(clk),.rst(rst),.en(en),.count_up(count_up),.count_down(count_down),.a(a),.b(b),.c(c));
always#5 clk=~clk;
initial begin
$monitor("%0t,%b,%b,%b,%b,%b,%b,%b,%b",$time,clk,rst,en,count_up,count_down,a,b,c);
clk=0;rst=1;en=1;count_up=0;count_down=0;
#10;rst=0;
#10;count_up=1;count_down=1;
#10;count_up=1;count_down=0;
#10;count_up=0;count_down=1;
#10;count_up=0;count_down=0;
$finish;
end
endmodule
