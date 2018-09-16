verbatimtex
\documentclass{article}
\usepackage{times}
\usepackage{amsmath}
\usepackage{amssymb}
\usepackage{amsfonts}
\usepackage{txfonts}
\begin{document}
etex;

input TEX;

TEXPRE("%&latex" & char(10) & "\documentclass[12pt]{article}\usepackage{times}\usepackage{txfonts}\begin{document}");
TEXPOST("\end{document}");

def punkt(expr z) =
	pickup pencircle scaled 4;
	draw z withcolor white;
	pickup pencircle scaled 3;
	draw z;
	pickup pencircle scaled 2;
	draw z withcolor white;
enddef;

%
% basic barycentric coordinates image
%
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
z5 = z2 shifted (z3 - z1);

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

punkt(z1);
punkt(z2);
punkt(z3);
punkt(z4);
punkt(z5);

label.top(btex $S$ etex, z4);

label.top(btex $w_2=0$ etex, z0) shifted (0,-1) rotated (angle (z3-z1)) shifted (0.5[z1,z3]);
label.top(btex $w_1=0$ etex, z0) shifted (0,-1) rotated (angle (z2-z3)) shifted (0.5[z3,z2]);
label.top(btex $w_3=0$ etex, z0) shifted (0,-1) rotated (angle (z2-z1)) shifted (0.3[z1,z2]);

label.top(btex $w_2=1$ etex, z0) shifted (0,-1) rotated (angle (z3-z1)) shifted (0.5[z1,z3]) shifted (z2-z1);
label.top(btex $w_1=1$ etex, z0) shifted (0,-1) rotated (angle (z2-z3)) shifted (0.5[z3,z2]) shifted (z1-z2);
label.top(btex $w_3=1$ etex, z0) shifted (0,-1) rotated (angle (z2-z1)) shifted (0.5[z1,z2]) shifted (z3-z1);


endfig;

numeric s;
s := 5;

def barybase = 
	z0 = (0,0);

	z10  = (-30,-30) * s;
	z11  = (48,44) * s;
	z12  = (x11,y10);
	z13  = (x10,y11);

	fill z10--z12--z11--z13--cycle withcolor 0.99;

	z1 = ( 4, 1)*s;    % B1
	z2 = (16,-1)*s;   % B2
	z3 = (10,12)*s;   % B3
	z4 = (z1 + z2 + z3)/3;
	z5 = z2 shifted (z3 - z1);
enddef;

def barygrid =
	fill z1--z2--z3--cycle withcolor 0.9;

	label.lft(btex $B_1$ etex, z1 shifted (-1,-4));
	label.rt(btex $B_2$ etex, z2 shifted (2,4));
	label.rt(btex $B_3$ etex, z3 shifted (2,4));

	pickup pencircle scaled 0.7pt;

	path wone;
	wone := ((-3)[z2,z3])--((5)[z2,z3]);
	path wtwo;
	wtwo := ((-5)[z3,z1])--((5)[z3,z1]);
	path wthree;
	wthree := ((-5)[z1,z2])--((5)[z1,z2]);

	for t = -5 step 1 until 4:
		draw wone shifted (t * (z2-z1));
		draw wtwo shifted (t * (z2-z1));
		draw wthree shifted (t * (z3-z1));
	endfor;

	for t = -3 step 1 until 4:
		for s = -3 step 1 until 4:
			punkt(z1 shifted (t * (z2-z1)) shifted (s * (z3-z1)));
		endfor;
	endfor;

	clip currentpicture to z10--z12--z11--z13--cycle;

	path pbottom;
	pbottom = ((-3)[z10,z12])--((4)[z10,z12]);
	path pleft;
	pleft = ((-3)[z10,z13])--((4)[z10,z13]);
	path ptop;
	ptop = ((-3)[z13,z11])--((4)[z13,z11]);

	for t = -5 step 1 until 1:
		label.rt(TEX("$w_1=" & decimal(-t) &"\mathstrut$"), z0)
			rotated (angle (z2-z3))
				shifted ((wone shifted (t * (z2-z1)))
					intersectionpoint pbottom);
	endfor;

	for t = -3 step 1 until 3:
		label.lft(TEX("$w_3=" & decimal(t) & "\mathstrut$"), z0)
			rotated (angle (z2-z1))
				shifted ((wthree shifted (t * (z3-z1)))
					intersectionpoint pleft);
	endfor;

	for t = -4 step 1 until 1:
		label.rt(TEX("$w_2=" & decimal(t) & "\mathstrut$"), z0)
			rotated (angle (z3-z1))
				shifted ((wtwo shifted (t * (z2-z1)))
					intersectionpoint ptop);
	endfor;

enddef;

%
% barycentric coordinates
%
beginfig(2)

barybase;

z21 = z2 shifted (z3-z1);
z22 = z3 shifted (z1-z2);
z23 = z1 shifted (z2-z3);

z31 = z1 shifted (z1-z2);
z32 = z1 shifted (z1-z3);
z33 = z2 shifted (z2-z3);
z34 = z2 shifted (z2-z1);
z35 = z3 shifted (z3-z1);
z36 = z3 shifted (z3-z2);

z41 = z1 shifted (z1-z2+z1-z3);
z42 = z2 shifted (z2-z1+z2-z3);
z43 = z3 shifted (z3-z1+z3-z2);

fill z41--z42--z43--cycle withcolor (0.9,0.9,1);
fill z31--z32--z33--z34--z35--z36--cycle withcolor (1,0.9,0.9);
fill z21--z22--z23--cycle withcolor (1,0.8,0.6);

barygrid;

endfig;

beginfig(3)

barybase;

z21 = z2 shifted (z3-z1);
z22 = z3 shifted (z1-z2);
z23 = z1 shifted (z2-z3);

fill z21--z22--z23--cycle withcolor (1,0.9,0.9);

barygrid;

endfig;

beginfig(4)

barybase;

z31 = z1 shifted (z1-z2);
z32 = z1 shifted (z1-z3);
z33 = z2 shifted (z2-z3);
z34 = z2 shifted (z2-z1);
z35 = z3 shifted (z3-z1);
z36 = z3 shifted (z3-z2);

fill z31--z32--z33--z34--z35--z36--cycle withcolor (1,0.9,0.9);

barygrid;

endfig;

beginfig(5)

barybase;

z41 = z1 shifted (z1-z2+z1-z3);
z42 = z2 shifted (z2-z1+z2-z3);
z43 = z3 shifted (z3-z1+z3-z2);

fill z41--z42--z43--cycle withcolor (1,0.9,0.9);

barygrid;

endfig;

beginfig(6)

barybase;

z51 = z1 shifted (2*(z1-z2));
z52 = z1 shifted (2*(z1-z3));
z53 = z2 shifted (2*(z2-z3));
z54 = z2 shifted (2*(z2-z1));
z55 = z3 shifted (2*(z3-z1));
z56 = z3 shifted (2*(z3-z2));

fill z51--z52--z53--z54--z55--z56--cycle withcolor (1,0.9,0.9);

barygrid;

endfig;

end
