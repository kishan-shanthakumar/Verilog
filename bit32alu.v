module fa(
input a,b,c,
output s,cout
);
wire w1,w2,w3;
xor(s,a,b,c);
and(w1,a,b);
xor(w2,a,b);
and(w3,w2,c);
or(cout,w3,w1);
endmodule

module fabit4(a,b,cin,sum,cout);
input[3:0] a,b;
input cin;
output [3:0] sum;
output cout;
wire p0,p1,p2,p3,g0,g1,g2,g3,c1,c2,c3,c4;
assign p0=(a[0]^b[0]),
p1=(a[1]^b[1]),
p2=(a[2]^b[2]),
p3=(a[3]^b[3]);
assign g0=(a[0]&b[0]),
g1=(a[1]&b[1]),
g2=(a[2]&b[2]),
g3=(a[3]&b[3]);
assign c0=cin,
c1=g0|(p0&cin),
c2=g1|(p1&g0)|(p1&p0&cin),
c3=g2|(p2&g1)|(p2&p1&g0)|(p1&p1&p0&cin),
c4=g3|(p3&g2)|(p3&p2&g1)|(p3&p2&p1&g0)|(p3&p2&p1&p0&cin);
assign sum[0]=p0^c0,
sum[1]=p1^c1,
sum[2]=p2^c2,
sum[3]=p3^c3;
assign cout=c4;
endmodule

module bit4(
input [3:0] inp1,
input [3:0] inp2,
output [7:0] outp
);
wire w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12,w13,w14,w15;
wire d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,d11,d12,d13,d14,d15,d16,d17,d18;
and a1(outp[0],inp1[0],inp2[0]);
and a2(w15,inp1[1],inp2[0]);
and(w14,inp1[2],inp2[0]);
and(w13,inp1[3],inp2[0]);
and(w12,inp1[0],inp2[1]);
and(w11,inp1[1],inp2[1]);
and(w10,inp1[2],inp2[1]);
and(w9,inp1[3],inp2[1]);
and(w8,inp1[0],inp2[2]);
and(w7,inp1[1],inp2[2]);
and(w6,inp1[2],inp2[2]);
and(w5,inp1[3],inp2[2]);
and(w4,inp1[0],inp2[3]);
and(w3,inp1[1],inp2[3]);
and(w2,inp1[2],inp2[3]);
and(w1,inp1[3],inp2[3]);
fa fa1(w15,w12,0,outp[1],d1);
fa fa2(w14,w11,d1,d2,d3);
fa fa3(d2,w8,0,outp[2],d4);
fa fa4(d3,d4,0,d5,d6);
fa fa5(d5,w13,w10,d7,d8);
fa fa6(d7,w7,w4,outp[3],d9);
fa fa7(d6,d8,d9,d10,d11);
fa fa8(w9,w6,w3,d12,d13);
fa fa9(d10,d12,0,outp[4],d15);
fa fa10(d15,d13,d11,d16,d17);
fa fa11(d16,w5,w2,outp[5],d18);
fa fa12(d17,d18,w1,outp[6],outp[7]);
endmodule

module fabit8(
input [7:0] inp1,
input [7:0] inp2,
input cin,
output [7:0] outp,
output cout
);
wire w1;
fabit4 fa1(inp1[3:0],inp2[3:0],cin,outp[3:0],w1);
fabit4 fa2(inp1[7:4],inp2[7:4],w1,outp[7:4],cout);
endmodule

module fabit16(
input [15:0] inp1,
input [15:0] inp2,
input cin,
output [15:0] outp,
output cout
);
wire w1;
fabit8 fa1(inp1[7:0],inp2[7:0],cin,outp[7:0],w1);
fabit8 fa2(inp1[15:8],inp2[15:8],w1,outp[15:8],cout);
endmodule

module fabit32(a,b,cin,sum,cout);
input[31:0] a,b;
input cin;
output [31:0] sum;
output cout;
wire p[31:0];
wire g[31:0];
wire c[32:0];
assign p[0]=(a[0]^b[0]),
p[1]=(a[1]^b[1]),
p[2]=(a[2]^b[2]),
p[3]=(a[3]^b[3]),
p[4]=(a[4]^b[4]),
p[5]=(a[5]^b[5]),
p[6]=(a[6]^b[6]),
p[7]=(a[7]^b[7]),
p[8]=(a[8]^b[8]),
p[9]=(a[9]^b[9]),
p[10]=(a[10]^b[10]),
p[11]=(a[11]^b[11]),
p[12]=(a[12]^b[12]),
p[13]=(a[13]^b[13]),
p[14]=(a[14]^b[14]),
p[15]=(a[15]^b[15]),
p[16]=(a[16]^b[16]),
p[17]=(a[17]^b[17]),
p[18]=(a[18]^b[18]),
p[19]=(a[19]^b[19]),
p[20]=(a[20]^b[20]),
p[21]=(a[21]^b[21]),
p[22]=(a[22]^b[22]),
p[23]=(a[23]^b[23]),
p[24]=(a[24]^b[24]),
p[25]=(a[25]^b[25]),
p[26]=(a[26]^b[26]),
p[27]=(a[27]^b[27]),
p[28]=(a[28]^b[28]),
p[29]=(a[29]^b[29]),
p[30]=(a[30]^b[30]),
p[31]=(a[31]^b[31]);
assign g[0]=(a[0]&b[0]),
g[1]=(a[1]&b[1]),
g[2]=(a[2]&b[2]),
g[3]=(a[3]&b[3]),
g[4]=(a[4]&b[4]),
g[5]=(a[5]&b[5]),
g[6]=(a[6]&b[6]),
g[7]=(a[7]&b[7]),
g[8]=(a[8]&b[8]),
g[9]=(a[9]&b[9]),
g[10]=(a[10]&b[10]),
g[11]=(a[11]&b[11]),
g[12]=(a[12]&b[12]),
g[13]=(a[13]&b[13]),
g[14]=(a[14]&b[14]),
g[15]=(a[15]&b[15]),
g[16]=(a[16]&b[16]),
g[17]=(a[17]&b[17]),
g[18]=(a[18]&b[18]),
g[19]=(a[19]&b[19]),
g[20]=(a[20]&b[20]),
g[21]=(a[21]&b[21]),
g[22]=(a[22]&b[22]),
g[23]=(a[23]&b[23]),
g[24]=(a[24]&b[24]),
g[25]=(a[25]&b[25]),
g[26]=(a[26]&b[26]),
g[27]=(a[27]&b[27]),
g[28]=(a[28]&b[28]),
g[29]=(a[29]&b[29]),
g[30]=(a[30]&b[30]),
g[31]=(a[31]&b[31]);
assign c[0]=cin,
c[1]=(g[0]|(p[0]&c[0])),
c[2]=(g[1]|(p[1]&(g[0]|(p[0]&c[0])))),
c[3]=(g[2]|(p[2]&(g[1]|(p[1]&(g[0]|(p[0]&c[0])))))),
c[4]=(g[3]|(p[3]&(g[2]|(p[2]&(g[1]|(p[1]&(g[0]|(p[0]&c[0])))))))),
c[5]=(g[4]|(p[4]&(g[3]|(p[3]&(g[2]|(p[2]&(g[1]|(p[1]&(g[0]|(p[0]&c[0])))))))))),
c[6]=(g[5]|(p[5]&(g[4]|(p[4]&(g[3]|(p[3]&(g[2]|(p[2]&(g[1]|(p[1]&(g[0]|(p[0]&c[0])))))))))))),
c[7]=(g[6]|(p[6]&(g[5]|(p[5]&(g[4]|(p[4]&(g[3]|(p[3]&(g[2]|(p[2]&(g[1]|(p[1]&(g[0]|(p[0]&c[0])))))))))))))),
c[8]=(g[7]|(p[7]&(g[6]|(p[6]&(g[5]|(p[5]&(g[4]|(p[4]&(g[3]|(p[3]&(g[2]|(p[2]&(g[1]|(p[1]&(g[0]|(p[0]&c[0])))))))))))))))),
c[9]=(g[8]|(p[8]&(g[7]|(p[7]&(g[6]|(p[6]&(g[5]|(p[5]&(g[4]|(p[4]&(g[3]|(p[3]&(g[2]|(p[2]&(g[1]|(p[1]&(g[0]|(p[0]&c[0])))))))))))))))))),
c[10]=(g[9]|(p[9]&(g[8]|(p[8]&(g[7]|(p[7]&(g[6]|(p[6]&(g[5]|(p[5]&(g[4]|(p[4]&(g[3]|(p[3]&(g[2]|(p[2]&(g[1]|(p[1]&(g[0]|(p[0]&c[0])))))))))))))))))))),
c[11]=(g[10]|(p[10]&(g[9]|(p[9]&(g[8]|(p[8]&(g[7]|(p[7]&(g[6]|(p[6]&(g[5]|(p[5]&(g[4]|(p[4]&(g[3]|(p[3]&(g[2]|(p[2]&(g[1]|(p[1]&(g[0]|(p[0]&c[0])))))))))))))))))))))),
c[12]=(g[11]|(p[11]&(g[10]|(p[10]&(g[9]|(p[9]&(g[8]|(p[8]&(g[7]|(p[7]&(g[6]|(p[6]&(g[5]|(p[5]&(g[4]|(p[4]&(g[3]|(p[3]&(g[2]|(p[2]&(g[1]|(p[1]&(g[0]|(p[0]&c[0])))))))))))))))))))))))),
c[13]=(g[12]|(p[12]&(g[11]|(p[11]&(g[10]|(p[10]&(g[9]|(p[9]&(g[8]|(p[8]&(g[7]|(p[7]&(g[6]|(p[6]&(g[5]|(p[5]&(g[4]|(p[4]&(g[3]|(p[3]&(g[2]|(p[2]&(g[1]|(p[1]&(g[0]|(p[0]&c[0])))))))))))))))))))))))))),
c[14]=(g[13]|(p[13]&(g[12]|(p[12]&(g[11]|(p[11]&(g[10]|(p[10]&(g[9]|(p[9]&(g[8]|(p[8]&(g[7]|(p[7]&(g[6]|(p[6]&(g[5]|(p[5]&(g[4]|(p[4]&(g[3]|(p[3]&(g[2]|(p[2]&(g[1]|(p[1]&(g[0]|(p[0]&c[0])))))))))))))))))))))))))))),
c[15]=(g[14]|(p[14]&(g[13]|(p[13]&(g[12]|(p[12]&(g[11]|(p[11]&(g[10]|(p[10]&(g[9]|(p[9]&(g[8]|(p[8]&(g[7]|(p[7]&(g[6]|(p[6]&(g[5]|(p[5]&(g[4]|(p[4]&(g[3]|(p[3]&(g[2]|(p[2]&(g[1]|(p[1]&(g[0]|(p[0]&c[0])))))))))))))))))))))))))))))),
c[16]=(g[15]|(p[15]&(g[14]|(p[14]&(g[13]|(p[13]&(g[12]|(p[12]&(g[11]|(p[11]&(g[10]|(p[10]&(g[9]|(p[9]&(g[8]|(p[8]&(g[7]|(p[7]&(g[6]|(p[6]&(g[5]|(p[5]&(g[4]|(p[4]&(g[3]|(p[3]&(g[2]|(p[2]&(g[1]|(p[1]&(g[0]|(p[0]&c[0])))))))))))))))))))))))))))))))),
c[17]=(g[16]|(p[16]&(g[15]|(p[15]&(g[14]|(p[14]&(g[13]|(p[13]&(g[12]|(p[12]&(g[11]|(p[11]&(g[10]|(p[10]&(g[9]|(p[9]&(g[8]|(p[8]&(g[7]|(p[7]&(g[6]|(p[6]&(g[5]|(p[5]&(g[4]|(p[4]&(g[3]|(p[3]&(g[2]|(p[2]&(g[1]|(p[1]&(g[0]|(p[0]&c[0])))))))))))))))))))))))))))))))))),
c[18]=(g[17]|(p[17]&(g[16]|(p[16]&(g[15]|(p[15]&(g[14]|(p[14]&(g[13]|(p[13]&(g[12]|(p[12]&(g[11]|(p[11]&(g[10]|(p[10]&(g[9]|(p[9]&(g[8]|(p[8]&(g[7]|(p[7]&(g[6]|(p[6]&(g[5]|(p[5]&(g[4]|(p[4]&(g[3]|(p[3]&(g[2]|(p[2]&(g[1]|(p[1]&(g[0]|(p[0]&c[0])))))))))))))))))))))))))))))))))))),
c[19]=(g[18]|(p[18]&(g[17]|(p[17]&(g[16]|(p[16]&(g[15]|(p[15]&(g[14]|(p[14]&(g[13]|(p[13]&(g[12]|(p[12]&(g[11]|(p[11]&(g[10]|(p[10]&(g[9]|(p[9]&(g[8]|(p[8]&(g[7]|(p[7]&(g[6]|(p[6]&(g[5]|(p[5]&(g[4]|(p[4]&(g[3]|(p[3]&(g[2]|(p[2]&(g[1]|(p[1]&(g[0]|(p[0]&c[0])))))))))))))))))))))))))))))))))))))),
c[20]=(g[19]|(p[19]&(g[18]|(p[18]&(g[17]|(p[17]&(g[16]|(p[16]&(g[15]|(p[15]&(g[14]|(p[14]&(g[13]|(p[13]&(g[12]|(p[12]&(g[11]|(p[11]&(g[10]|(p[10]&(g[9]|(p[9]&(g[8]|(p[8]&(g[7]|(p[7]&(g[6]|(p[6]&(g[5]|(p[5]&(g[4]|(p[4]&(g[3]|(p[3]&(g[2]|(p[2]&(g[1]|(p[1]&(g[0]|(p[0]&c[0])))))))))))))))))))))))))))))))))))))))),
c[21]=(g[20]|(p[20]&(g[19]|(p[19]&(g[18]|(p[18]&(g[17]|(p[17]&(g[16]|(p[16]&(g[15]|(p[15]&(g[14]|(p[14]&(g[13]|(p[13]&(g[12]|(p[12]&(g[11]|(p[11]&(g[10]|(p[10]&(g[9]|(p[9]&(g[8]|(p[8]&(g[7]|(p[7]&(g[6]|(p[6]&(g[5]|(p[5]&(g[4]|(p[4]&(g[3]|(p[3]&(g[2]|(p[2]&(g[1]|(p[1]&(g[0]|(p[0]&c[0])))))))))))))))))))))))))))))))))))))))))),
c[22]=(g[21]|(p[21]&(g[20]|(p[20]&(g[19]|(p[19]&(g[18]|(p[18]&(g[17]|(p[17]&(g[16]|(p[16]&(g[15]|(p[15]&(g[14]|(p[14]&(g[13]|(p[13]&(g[12]|(p[12]&(g[11]|(p[11]&(g[10]|(p[10]&(g[9]|(p[9]&(g[8]|(p[8]&(g[7]|(p[7]&(g[6]|(p[6]&(g[5]|(p[5]&(g[4]|(p[4]&(g[3]|(p[3]&(g[2]|(p[2]&(g[1]|(p[1]&(g[0]|(p[0]&c[0])))))))))))))))))))))))))))))))))))))))))))),
c[23]=(g[22]|(p[22]&(g[21]|(p[21]&(g[20]|(p[20]&(g[19]|(p[19]&(g[18]|(p[18]&(g[17]|(p[17]&(g[16]|(p[16]&(g[15]|(p[15]&(g[14]|(p[14]&(g[13]|(p[13]&(g[12]|(p[12]&(g[11]|(p[11]&(g[10]|(p[10]&(g[9]|(p[9]&(g[8]|(p[8]&(g[7]|(p[7]&(g[6]|(p[6]&(g[5]|(p[5]&(g[4]|(p[4]&(g[3]|(p[3]&(g[2]|(p[2]&(g[1]|(p[1]&(g[0]|(p[0]&c[0])))))))))))))))))))))))))))))))))))))))))))))),
c[24]=(g[23]|(p[23]&(g[22]|(p[22]&(g[21]|(p[21]&(g[20]|(p[20]&(g[19]|(p[19]&(g[18]|(p[18]&(g[17]|(p[17]&(g[16]|(p[16]&(g[15]|(p[15]&(g[14]|(p[14]&(g[13]|(p[13]&(g[12]|(p[12]&(g[11]|(p[11]&(g[10]|(p[10]&(g[9]|(p[9]&(g[8]|(p[8]&(g[7]|(p[7]&(g[6]|(p[6]&(g[5]|(p[5]&(g[4]|(p[4]&(g[3]|(p[3]&(g[2]|(p[2]&(g[1]|(p[1]&(g[0]|(p[0]&c[0])))))))))))))))))))))))))))))))))))))))))))))))),
c[25]=(g[24]|(p[24]&(g[23]|(p[23]&(g[22]|(p[22]&(g[21]|(p[21]&(g[20]|(p[20]&(g[19]|(p[19]&(g[18]|(p[18]&(g[17]|(p[17]&(g[16]|(p[16]&(g[15]|(p[15]&(g[14]|(p[14]&(g[13]|(p[13]&(g[12]|(p[12]&(g[11]|(p[11]&(g[10]|(p[10]&(g[9]|(p[9]&(g[8]|(p[8]&(g[7]|(p[7]&(g[6]|(p[6]&(g[5]|(p[5]&(g[4]|(p[4]&(g[3]|(p[3]&(g[2]|(p[2]&(g[1]|(p[1]&(g[0]|(p[0]&c[0])))))))))))))))))))))))))))))))))))))))))))))))))),
c[26]=(g[25]|(p[25]&(g[24]|(p[24]&(g[23]|(p[23]&(g[22]|(p[22]&(g[21]|(p[21]&(g[20]|(p[20]&(g[19]|(p[19]&(g[18]|(p[18]&(g[17]|(p[17]&(g[16]|(p[16]&(g[15]|(p[15]&(g[14]|(p[14]&(g[13]|(p[13]&(g[12]|(p[12]&(g[11]|(p[11]&(g[10]|(p[10]&(g[9]|(p[9]&(g[8]|(p[8]&(g[7]|(p[7]&(g[6]|(p[6]&(g[5]|(p[5]&(g[4]|(p[4]&(g[3]|(p[3]&(g[2]|(p[2]&(g[1]|(p[1]&(g[0]|(p[0]&c[0])))))))))))))))))))))))))))))))))))))))))))))))))))),
c[27]=(g[26]|(p[26]&(g[25]|(p[25]&(g[24]|(p[24]&(g[23]|(p[23]&(g[22]|(p[22]&(g[21]|(p[21]&(g[20]|(p[20]&(g[19]|(p[19]&(g[18]|(p[18]&(g[17]|(p[17]&(g[16]|(p[16]&(g[15]|(p[15]&(g[14]|(p[14]&(g[13]|(p[13]&(g[12]|(p[12]&(g[11]|(p[11]&(g[10]|(p[10]&(g[9]|(p[9]&(g[8]|(p[8]&(g[7]|(p[7]&(g[6]|(p[6]&(g[5]|(p[5]&(g[4]|(p[4]&(g[3]|(p[3]&(g[2]|(p[2]&(g[1]|(p[1]&(g[0]|(p[0]&c[0])))))))))))))))))))))))))))))))))))))))))))))))))))))),
c[28]=(g[27]|(p[27]&(g[26]|(p[26]&(g[25]|(p[25]&(g[24]|(p[24]&(g[23]|(p[23]&(g[22]|(p[22]&(g[21]|(p[21]&(g[20]|(p[20]&(g[19]|(p[19]&(g[18]|(p[18]&(g[17]|(p[17]&(g[16]|(p[16]&(g[15]|(p[15]&(g[14]|(p[14]&(g[13]|(p[13]&(g[12]|(p[12]&(g[11]|(p[11]&(g[10]|(p[10]&(g[9]|(p[9]&(g[8]|(p[8]&(g[7]|(p[7]&(g[6]|(p[6]&(g[5]|(p[5]&(g[4]|(p[4]&(g[3]|(p[3]&(g[2]|(p[2]&(g[1]|(p[1]&(g[0]|(p[0]&c[0])))))))))))))))))))))))))))))))))))))))))))))))))))))))),
c[29]=(g[28]|(p[28]&(g[27]|(p[27]&(g[26]|(p[26]&(g[25]|(p[25]&(g[24]|(p[24]&(g[23]|(p[23]&(g[22]|(p[22]&(g[21]|(p[21]&(g[20]|(p[20]&(g[19]|(p[19]&(g[18]|(p[18]&(g[17]|(p[17]&(g[16]|(p[16]&(g[15]|(p[15]&(g[14]|(p[14]&(g[13]|(p[13]&(g[12]|(p[12]&(g[11]|(p[11]&(g[10]|(p[10]&(g[9]|(p[9]&(g[8]|(p[8]&(g[7]|(p[7]&(g[6]|(p[6]&(g[5]|(p[5]&(g[4]|(p[4]&(g[3]|(p[3]&(g[2]|(p[2]&(g[1]|(p[1]&(g[0]|(p[0]&c[0])))))))))))))))))))))))))))))))))))))))))))))))))))))))))),
c[30]=(g[29]|(p[29]&(g[28]|(p[28]&(g[27]|(p[27]&(g[26]|(p[26]&(g[25]|(p[25]&(g[24]|(p[24]&(g[23]|(p[23]&(g[22]|(p[22]&(g[21]|(p[21]&(g[20]|(p[20]&(g[19]|(p[19]&(g[18]|(p[18]&(g[17]|(p[17]&(g[16]|(p[16]&(g[15]|(p[15]&(g[14]|(p[14]&(g[13]|(p[13]&(g[12]|(p[12]&(g[11]|(p[11]&(g[10]|(p[10]&(g[9]|(p[9]&(g[8]|(p[8]&(g[7]|(p[7]&(g[6]|(p[6]&(g[5]|(p[5]&(g[4]|(p[4]&(g[3]|(p[3]&(g[2]|(p[2]&(g[1]|(p[1]&(g[0]|(p[0]&c[0])))))))))))))))))))))))))))))))))))))))))))))))))))))))))))),
c[31]=(g[30]|(p[30]&(g[29]|(p[29]&(g[28]|(p[28]&(g[27]|(p[27]&(g[26]|(p[26]&(g[25]|(p[25]&(g[24]|(p[24]&(g[23]|(p[23]&(g[22]|(p[22]&(g[21]|(p[21]&(g[20]|(p[20]&(g[19]|(p[19]&(g[18]|(p[18]&(g[17]|(p[17]&(g[16]|(p[16]&(g[15]|(p[15]&(g[14]|(p[14]&(g[13]|(p[13]&(g[12]|(p[12]&(g[11]|(p[11]&(g[10]|(p[10]&(g[9]|(p[9]&(g[8]|(p[8]&(g[7]|(p[7]&(g[6]|(p[6]&(g[5]|(p[5]&(g[4]|(p[4]&(g[3]|(p[3]&(g[2]|(p[2]&(g[1]|(p[1]&(g[0]|(p[0]&c[0])))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))),
c[32]=(g[31]|(p[31]&(g[30]|(p[30]&(g[29]|(p[29]&(g[28]|(p[28]&(g[27]|(p[27]&(g[26]|(p[26]&(g[25]|(p[25]&(g[24]|(p[24]&(g[23]|(p[23]&(g[22]|(p[22]&(g[21]|(p[21]&(g[20]|(p[20]&(g[19]|(p[19]&(g[18]|(p[18]&(g[17]|(p[17]&(g[16]|(p[16]&(g[15]|(p[15]&(g[14]|(p[14]&(g[13]|(p[13]&(g[12]|(p[12]&(g[11]|(p[11]&(g[10]|(p[10]&(g[9]|(p[9]&(g[8]|(p[8]&(g[7]|(p[7]&(g[6]|(p[6]&(g[5]|(p[5]&(g[4]|(p[4]&(g[3]|(p[3]&(g[2]|(p[2]&(g[1]|(p[1]&(g[0]|(p[0]&c[0]))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))));
assign cout = c[32];
assign sum[0]=(p[0]^c[0]),
sum[1]=(p[1]^c[1]),
sum[2]=(p[2]^c[2]),
sum[3]=(p[3]^c[3]),
sum[4]=(p[4]^c[4]),
sum[5]=(p[5]^c[5]),
sum[6]=(p[6]^c[6]),
sum[7]=(p[7]^c[7]),
sum[8]=(p[8]^c[8]),
sum[9]=(p[9]^c[9]),
sum[10]=(p[10]^c[10]),
sum[11]=(p[11]^c[11]),
sum[12]=(p[12]^c[12]),
sum[13]=(p[13]^c[13]),
sum[14]=(p[14]^c[14]),
sum[15]=(p[15]^c[15]),
sum[16]=(p[16]^c[16]),
sum[17]=(p[17]^c[17]),
sum[18]=(p[18]^c[18]),
sum[19]=(p[19]^c[19]),
sum[20]=(p[20]^c[20]),
sum[21]=(p[21]^c[21]),
sum[22]=(p[22]^c[22]),
sum[23]=(p[23]^c[23]),
sum[24]=(p[24]^c[24]),
sum[25]=(p[25]^c[25]),
sum[26]=(p[26]^c[26]),
sum[27]=(p[27]^c[27]),
sum[28]=(p[28]^c[28]),
sum[29]=(p[29]^c[29]),
sum[30]=(p[30]^c[30]),
sum[31]=(p[31]^c[31]);
endmodule

module bit8(
input [7:0] inp1,
input [7:0] inp2,
output [15:0] outp
);
wire [7:0] w1;
wire [7:0] w2;
wire [7:0] w3;
wire [7:0] w4;
wire [7:0] w5;
wire [7:0] w6;
wire [7:0] w7;
wire w8,w9,w10,w11,w12;
bit4 mul1(inp1[3:0],inp2[3:0],w1);
bit4 mul2(inp1[3:0],inp2[7:4],w2);
bit4 mul3(inp1[7:4],inp2[3:0],w3);
bit4 mul4(inp1[7:4],inp2[7:4],w4);
assign outp[3:0] = w1[3:0];
fabit8 fa1(w3[7:0],w2[7:0],0,w5[7:0],w8);
fabit8 fa2(w5[7:0],{w4[3:0],w1[7:4]},0,outp[11:4],w9);
fa fa3(w8,w9,0,w10,w11);
wire [3:0] w13 = {2'b0,w11,w10};
fabit4 fa4(w4[7:4],w13,0,outp[15:12],w12);
endmodule

module bit16(
input [15:0] inp1,
input [15:0] inp2,
output [31:0] outp
);
wire [15:0] w1;
wire [15:0] w2;
wire [15:0] w3;
wire [15:0] w4;
wire [15:0] w5;
wire [15:0] w6;
wire [15:0] w7;
wire w8,w9,w10,w11,w12;
bit8 mul1(inp1[7:0],inp2[7:0],w1);
bit8 mul2(inp1[7:0],inp2[15:8],w2);
bit8 mul3(inp1[15:8],inp2[7:0],w3);
bit8 mul4(inp1[15:8],inp2[15:8],w4);
assign outp[7:0] = w1[7:0];
fabit16 fa1(w3[15:0],w2[15:0],0,w5[15:0],w8);
fabit16 fa2(w5[15:0],{w4[7:0],w1[15:8]},0,outp[23:8],w9);
fa fa3(w8,w9,0,w10,w11);
wire [7:0] w13 = {6'b0,w11,w10};
fabit16 fa4(w4[15:8],w13,0,outp[31:24],w12);
endmodule

module bit32(
input [31:0] inp1,
input [31:0] inp2,
output [63:0] outp
);
wire [31:0] w1;
wire [31:0] w2;
wire [31:0] w3;
wire [31:0] w4;
wire [31:0] w5;
wire [31:0] w6;
wire [31:0] w7;
wire w8,w9,w10,w11,w12;
bit16 mul1(inp1[15:0],inp2[15:0],w1);
bit16 mul2(inp1[15:0],inp2[31:16],w2);
bit16 mul3(inp1[31:16],inp2[15:0],w3);
bit16 mul4(inp1[31:16],inp2[31:16],w4);
assign outp[15:0] = w1[15:0];
fabit32 fa1(w3[31:0],w2[31:0],0,w5[31:0],w8);
fabit32 fa2(w5[31:0],{w4[15:0],w1[31:16]},0,outp[47:16],w9);
fa fa3(w8,w9,0,w10,w11);
wire [15:0] w13 = {14'b0,w11,w10};
fabit32 fa4(w4[31:16],w13,0,outp[63:48],w12);
endmodule

module bit32comp(a,b,l,g,e);
input [31:0] a;
input [31:0] b;
output reg l;
output reg g;
output reg e;
always @(a or b)
begin
if(a > b)
begin
g=1;
l=0;
e=0;
end
else if(a < b)
begin
l=1;
g=0;
e=0;
end
else
begin
e=1;
g=0;l=0;
end
end
endmodule

module mux16(s,a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,out);
input [3:0] s;
input [31:0] a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p;
output [31:0] out;
wire w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12,w13,w14,w15,w16;
bufif1 b1(out, a, ((~s[0]) & (~s[1]) & (~s[2]) & (~s[3])));
bufif1 b2(out, b, ((s[0]) & (~s[1]) & (~s[2]) & (~s[3])));
bufif1 b3(out, c, ((~s[0]) & (s[1]) & (~s[2]) & (~s[3])));
bufif1 b4(out, d, ((s[0]) & (s[1]) & (~s[2]) & (~s[3])));
bufif1 b5(out, e, ((~s[0]) & (~s[1]) & (s[2]) & (~s[3])));
bufif1 b6(out, f, ((s[0]) & (~s[1]) & (s[2]) & (~s[3])));
bufif1 b7(out, g, ((~s[0]) & (s[1]) & (s[2]) & (~s[3])));
bufif1 b8(out, h, ((s[0]) & (s[1]) & (s[2]) & (~s[3])));
bufif1 b9(out, i, ((~s[0]) & (~s[1]) & (~s[2]) & (s[3])));
bufif1 b10(out, j, ((s[0]) & (~s[1]) & (~s[2]) & (s[3])));
bufif1 b11(out, k, ((~s[0]) & (s[1]) & (~s[2]) & (s[3])));
bufif1 b12(out, l, ((s[0]) & (s[1]) & (~s[2]) & (s[3])));
bufif1 b13(out, m, ((~s[0]) & (~s[1]) & (s[2]) & (s[3])));
bufif1 b14(out, n, ((s[0]) & (~s[1]) & (s[2]) & (s[3])));
bufif1 b15(out, o, ((~s[0]) & (s[1]) & (s[2]) & (s[3])));
bufif1 b16(out, p, ((s[0]) & (s[1]) & (s[2]) & (s[3])));
endmodule

module bit32alu(a,b,s,en,acc,mulh,flag);
input [31:0] a;
input [31:0] b;
input [3:0] s;
input en;
output reg [31:0] acc;
output reg [31:0] mulh;
output reg [7:0] flag;
wire fl1,fl2,fl3,fl4,muh,op;
wire zeros = {32'b0};
wire ones = {32'b1};
wire ands;
and(ands,a,b);
wire ors;
or(aors,a,b);
wire nota;
not(nota,a);
wire inca;
fabit32 u1(a,{32'b0},1,inca,fl1);
wire lshift = {a[30:0],0};
wire deca;
fabit32 u3(a,{32'b1},0,deca,fl2);
wire rshift = {0,a[31:1]};
wire add;
fabit32 u5(a,b,0,add,fl3);
wire sub;
wire temp;
not(temp,b);
fabit32 u6(a,temp,1,sub,fl4);
wire aa = a[31:0];
wire lrotate = {a[30:0],a[31]};
wire rrotate = {a[0],a[31:1]};
wire mul;
bit32 u7(a,b,{muh,mul});
wire l,g,e;
bit32comp u8(a,b,l,g,e);
wire comp = {29'b0,l,g,e};
mux16 u9(s,zeros,ones,ands,ors,nota,inca,lshift,deca,rshift,add,sub,aa,lrotate,rrotate,mul,comp,op);
always @(en)
begin
acc = op;
flag[0] = fl1;
flag[1] = a[31];
flag[2] = fl2;
flag[3] = a[0];
flag[4] = fl3;
flag[5] = fl4;
flag[6] = ~| acc;
flag[7] = ~^ acc;
mulh = muh;
end
endmodule
