verbatimtex
\documentclass{article}
\usepackage{times}
\usepackage{amsmath}
\usepackage{german}
\usepackage{amssymb}
\usepackage{amsfonts}
\usepackage{txfonts}
\begin{document}
etex;

beginfig(1)

numeric u;
u = 10;

z0 = ( 0,  0) * u;
z1 = (12, -5) * u;
z2 = (17,  7) * u;
z3 = ( 5, 12) * u;

z4 = ( 3, -4) * u;
z5 = ( 1,  5) * u;

path p;
p = z0--z1--z2--z3--cycle;
fill p withcolor 0.9;
pickup pencircle scaled 1pt;
draw p;

label.lft(btex $(0, 0)$ etex, z0);
label.bot(btex $(12, -5)$ etex, z1);
label.rt(btex $(17, 7)$ etex, z2);
label.top(btex $(5, 12)$ etex, z3);
label(btex $\text{H"ohe} = 4$ etex, 0.5[z0,z2]);

pickup pencircle scaled 4pt;

draw  z4;
label.lft(btex $(3, -4, 0) = A$ etex, z4);
draw  z5;
label.lft(btex $(1,  5, 2) = B$ etex, z5);

endfig;

beginfig(2)

numeric u;
u = 10;

z0 = ( 0,  0) * u;
z1 = (12, -5) * u;
z2 = (17,  7) * u;
z3 = ( 5, 12) * u;

z4 = ( 3, -4) * u;
z5 = ( 1,  5) * u;

path p;
p = z0--z1--z2--z3--cycle;
fill p withcolor 0.9;
pickup pencircle scaled 1pt;
draw p;

label.lft(btex $(0, 0)$ etex, z0);
label.bot(btex $(12, -5)$ etex, z1);
label.rt(btex $(17, 7)$ etex, z2);
label.top(btex $(5, 12)$ etex, z3);
label.bot(btex $\text{H"ohe} = 4$ etex, 0.5[z0,z2]);

pickup pencircle scaled 1pt;

z6 = (2.92638, 1.631190);

draw ((-1 * u)[z0,z6])--((6.5 * u)[z0,z6]) withcolor blue;

pickup pencircle scaled 4pt;

draw  z4;
label.lft(btex $(3, -4, 0) = A$ etex, z4);
draw  z5;
label.lft(btex $(1,  5, 2) = B$ etex, z5);

endfig;

end
