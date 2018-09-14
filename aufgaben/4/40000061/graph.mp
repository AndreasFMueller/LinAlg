verbatimtex
\documentclass[12pt]{article}
\usepackage{times}
\usepackage{amsmath}
\usepackage{german}
\usepackage{amssymb}
\usepackage{amsfonts}
\usepackage{txfonts}
\begin{document}
etex;

beginfig(1)

def punkt(expr z) =
	pickup pencircle scaled 5pt;
	draw z withcolor white;
	pickup pencircle scaled 4pt;
	draw z;
	pickup pencircle scaled 2.3pt;
	draw z withcolor white;
enddef;

numeric u;
u = 20;

z0 = ( 1,  2) * u;
z1 = (11,  2) * u;
z2 = ( 7, 10) * u;

z3 = ( 6,  2) * u;
z4 = ( 9,  6) * u;
z5 = ( 4,  6) * u;

z6 = ( 0,  1) * u;
z7 = ( 2,  1) * u;
z8 = ( 4, -3) * u;

z9 = ( 6,4.5) * u;

pickup pencircle scaled 0.5pt;

draw (z3 shifted (-10 * z6))--(z3 shifted (10 * z6)) withcolor 0.8;
draw (z4 shifted (-10 * z7))--(z4 shifted (10 * z7)) withcolor 0.8;
draw (z5 shifted (-10 * z8))--(z5 shifted (10 * z8)) withcolor 0.8;

clip currentpicture to (0,u)--(12*u,u)--(12*u,11*u)--(0,11*u)--cycle;

pickup pencircle scaled 1pt;

numeric delta;
delta = 0.0;

draw ((-delta)[z0,z1])--((1+delta)[z0,z1]);
draw ((-delta)[z1,z2])--((1+delta)[z1,z2]);
draw ((-delta)[z2,z0])--((1+delta)[z2,z0]);

pickup pencircle scaled 0.7pt;

numeric t, s;
t := -1.5;
s :=  0.5;

drawarrow z3--(z3 shifted z6);
drawarrow z4--(z4 shifted z7);
drawarrow z4--(z4 shifted (t * z7)) withcolor red;
drawarrow z5--(z5 shifted z8);
drawarrow z5--(z5 shifted (s * z8)) withcolor red;

punkt(z0);
punkt(z1);
punkt(z2);

punkt(z3);
punkt(z4);
punkt(z5);

punkt(z9);

label.top(btex $A$ etex, z0 shifted (-2,0));
label.urt(btex $B$ etex, z1);
label.rt(btex $C$ etex, z2);

label.bot(btex $M_{AB}$ etex, z3);
label.rt(btex $M_{BC}$ etex, z4 shifted (2,-3));
label.lft(btex $M_{AC}$ etex, z5);

label.bot(btex $M$ etex, z9 shifted (-1,-2));

label.lft(btex $\vec{v}_{AB}$ etex, z3 shifted z6 shifted (0,0));
label.urt(btex $\vec{v}_{AC}$ etex, z5 shifted (z8 shifted (-2,-2)));
label.ulft(btex $\vec{v}_{BC}$ etex, z4 shifted z7 shifted (2,-2));

endfig;

end
