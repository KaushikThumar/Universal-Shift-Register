module shiftuni(clk,i1,i2,s,o);
input [3:0]i1;
input clk,i2;
input [1:0]s;
output reg [3:0]o;
wire [3:0]t1;
mux4_1 a({o[3],i2,o[2],i1[3]},s,t1[3]);
mux4_1 b({o[2],o[3],o[1],i1[2]},s,t1[2]);
mux4_1 c({o[1],o[2],o[0],i1[1]},s,t1[1]);
mux4_1 d({o[0],o[1],o[3],i1[0]},s,t1[0]);
always @(negedge clk)
begin
o[0]<=t1[0];
end
always @(negedge clk)
begin
o[1]<=t1[1];
end
always @(negedge clk)
begin
o[2]<=t1[2];
end
always @(negedge clk)
begin
o[3]<=t1[3];
end
endmodule

module mux4_1(i,s,o);
input [3:0]i;
input [1:0]s;
output reg o;
always@ (i,s,o)
begin
case (s)
2'b00:o=i[0];
2'b01:o=i[1];
2'b10:o=i[2];
2'b11:o=i[3];
endcase
end
endmodule