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

def punkt(expr z) =
	pickup pencircle scaled 4pt;
	draw z withcolor white;
	pickup pencircle scaled 3pt;
	draw z;
	pickup pencircle scaled 2pt;
	draw z withcolor white;
enddef;

beginfig(1)

numeric u;
u = 100;

z0 = ( 0,  0) * u;	% A
z1 = ( 1,  0) * u;	% B
z2 = ( 0, 4/3) * u;	% C
z3 = ( 0,  1) * u;	% D
z4 = (arclength(z0--z1)/arclength(z1--z3)) [z1, z3];		% E
z5 = (0, ypart z4);	% F
z6 = z5 + z1;		% G

path p;
p = z0--z1--z4--z6--z2--cycle;

fill p withcolor (1,0.9,0.9);

pickup pencircle scaled 1pt;

draw z0--z1;
draw z0--z2;
draw z1--z3;
draw z5--z6;
draw z2--z6;

label.bot(btex $A$ etex, z0);
label.bot(btex $B$ etex, z1);
label.lft(btex $C$ etex, z2);
label.lft(btex $D$ etex, z3);
label.llft(btex $E$ etex, z4);
label.lft(btex $F$ etex, z5);
label.rt(btex $G$ etex, z6);

punkt(z0);
punkt(z1);
punkt(z2);
punkt(z3);
punkt(z4);
punkt(z5);
punkt(z6);

endfig;

end
