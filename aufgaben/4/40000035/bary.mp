verbatimtex
\documentclass{article}
\usepackage{times}
\usepackage{amsmath}
\usepackage{amssymb}
\usepackage{amsfonts}
\usepackage{txfonts}
\begin{document}
etex;

beginfig(1)

numeric s;
s := 10;

z0  = (0,0);
z10 = (22,0)*s;
z11 = (0,13)*s;
z12 = z10 shifted z11;
z13 = (0,-3)*s;
z14 = z13 shifted z10;

z20 = z13 shifted (-3,-3);
z21 = z14 shifted (3,-3);
z22 = z11 shifted (-3,3);
z23 = z12 shifted (3,3);

z1 = (4, 1)*s;
z2 = (16,-1)*s;
z3 = (10,12)*s;
z4 = (z1 + z2 + z3)/3;

fill z1--z2--z3--cycle withcolor 0.9;

label.lft(btex $B_1$ etex, z1 shifted (-1,-4));
label.rt(btex $B_2$ etex, z2 shifted (2,4));
label.rt(btex $B_3$ etex, z3 shifted (2,4));

pickup pencircle scaled 0.7pt;

draw ((-1)[z1,z2])--((2)[z1,z2]);
draw ((-1)[z2,z3])--((2)[z2,z3]);
draw ((-2)[z3,z1])--((2)[z3,z1]);

draw (((-1)[z1,z2])--((2)[z1,z2])) shifted (z3-z1);
draw (((-1)[z2,z3])--((2)[z2,z3])) shifted (z1-z2);
draw (((-2)[z3,z1])--((2)[z3,z1])) shifted (z2-z3);

clip currentpicture to z20--z21--z23--z22--cycle;

pickup pencircle scaled 1pt;
drawarrow (z0 shifted (-5,0))--(z10 shifted (5,0));
drawarrow (z13 shifted (0,-5))--(z11 shifted (0,5));
label.top(btex $x_1$ etex, z10);
label.rt(btex $x_2$ etex, z11);

def punkt(expr z) =
	pickup pencircle scaled 4;
	draw z withcolor white;
	pickup pencircle scaled 3;
	draw z;
	pickup pencircle scaled 2;
	draw z withcolor white;
enddef;

punkt(z1);
punkt(z2);
punkt(z3);
punkt(z4);

label.top(btex $S$ etex, z4);

label.top(btex $w_2=0$ etex, z0) shifted (0,-1) rotated (angle (z3-z1)) shifted (0.5[z1,z3]);
label.top(btex $w_1=0$ etex, z0) shifted (0,-1) rotated (angle (z2-z3)) shifted (0.5[z3,z2]);
label.top(btex $w_3=0$ etex, z0) shifted (0,-1) rotated (angle (z2-z1)) shifted (0.3[z1,z2]);

label.top(btex $w_2=1$ etex, z0) shifted (0,-1) rotated (angle (z3-z1)) shifted (0.5[z1,z3]) shifted (z2-z1);
label.top(btex $w_1=1$ etex, z0) shifted (0,-1) rotated (angle (z2-z3)) shifted (0.5[z3,z2]) shifted (z1-z2);
label.top(btex $w_3=1$ etex, z0) shifted (0,-1) rotated (angle (z2-z1)) shifted (0.5[z1,z2]) shifted (z3-z1);


endfig;

end
