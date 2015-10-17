%
% kubisch.mp -- solution set of u^3+v^3-3uv+1=0
%
% (c) 2015 Prof Dr Andreas Mueller, Hochschule Rapperswil
%
\verbatimtex
\documentclass{article}
\usepackage{times}
\usepackage{amsmath}
\usepackage{amssymb}
\usepackage{amsfonts}
\usepackage{times}
\usepackage{txfonts}
\begin{document}
etex;

def punkt(expr z) =
	pickup pencircle scaled 5pt;
	draw z withcolor red;
	pickup pencircle scaled 2pt;
	draw z withcolor white;
enddef;

beginfig(1)

numeric u;
u = 50;

z0 = (0,0);
z1 = (u, u);
z2 = (-u, 0);
z3 = (0, -u);

z10 = (-2 * u, 0);
z11 = (1*u, 0);
z12 = (0,-2*u);
z13 = (0,1*u);

pickup pencircle scaled 1pt;

drawarrow (z10 shifted (-10,0))--(z11 shifted (10,0));
drawarrow (z12 shifted (0,-10))--(z13 shifted (0,10));

for x = -2 step 1 until 1:
	draw (x * u,-3)--(x * u,3);
	draw (-3,x * u)--(3, x * u);
endfor;

pickup pencircle scaled 1.5pt;

draw ((-1.1)[z2,z3])--((2.1)[z2,z3]) withcolor red;

punkt(z1);
punkt(z2);
punkt(z3);

label.llft(btex $(1,1)$ etex, z1);
label.urt(btex $(-1,0)$ etex, z2);
label.urt(btex $(0,-1)$ etex, z3);

label.top(btex $u$ etex, z11 shifted (10,0));
label.rt(btex $v$ etex, z13 shifted (0,10));

endfig;

end
