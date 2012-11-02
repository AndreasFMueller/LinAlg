%
% d.mp -- Bilder zur Determinante
%
% (c) 2012 Prof Dr Andreas Mueller, Hochschule Rapperswil
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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Addition von Parallelogrammflaechen
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

beginfig(1)

z0 = (0,0);
z1 = (80,-20);
z2 = (10,100);
z3 = z2 shifted z1;

z4 = (140,50);
z5 = z4 shifted (z3-z1);

z9 = (200,0);

z10 = z0 shifted z9;
z11 = z1 shifted z9;
z12 = z2 shifted z9;
z13 = z3 shifted z9;
z14 = z4 shifted z9;
z15 = z5 shifted z9;

pickup pencircle scaled 0.5pt;

fill z0--z1--z3--z2--cycle withcolor (0.9,0.9,0.9);
draw z0--z1--z3--z2--cycle;
fill z1--z4--z5--z3--cycle withcolor (0.9,0.9,0.9);
draw z1--z4--z5--z3--cycle;

pickup pencircle scaled 1pt;
drawarrow z0--z2;
drawarrow z1--z3;
drawarrow z0--z1;
drawarrow z1--z4;
label.lft(btex $\vec v$ etex, 0.5[z0,z2]);
label.lft(btex $\vec v$ etex, 0.5[z1,z3]);
label.bot(btex $\vec u'$ etex, 0.5[z0,z1]);
label.bot(btex $\vec u''$ etex, 0.5[z1,z4]);

pickup pencircle scaled 0.5pt;

fill z10--z14--z15--z12--cycle withcolor(0.9,0.9,0.9);
draw z10--z14--z15--z12--cycle;

pickup pencircle scaled 1pt;
drawarrow z10--z14;
drawarrow z10--z12;
label.bot(btex $\vec u'+\vec u''$ etex, 0.5[z10,z14]);
label.lft(btex $\vec v$ etex, 0.5[z10,z12]);

pickup pencircle scaled 0.1pt;

label(btex $=$ etex, (170,60));

endfig;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Addition von Parallelepipvolumina
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

beginfig(2)

z0 = (0,0);
z1 = (60,-20);
z3 = (10,90);
z2 = z1 shifted z3;
z4 = (30,30);
z5 = z0 shifted z4;
z6 = z1 shifted z4;
z7 = z2 shifted z4;
z8 = z3 shifted z4;
z19 = (70,10);
z9 = z1 shifted z19;
z10 = z2 shifted z19;
z11 = z7 shifted z19;
z12 = z6 shifted z19;

pickup pencircle scaled 0.1pt;
fill z0--z1--z2--z3--cycle withcolor (0.9,0.9,0.9);
draw z0--z1--z2--z3--cycle;

fill z1--z9--z10--z2--cycle withcolor (0.9,0.9,0.9);
draw z1--z9--z10--z2--cycle;

fill z3--z2--z7--z8--cycle withcolor (0.9,0.9,0.9);
draw z3--z2--z7--z8--cycle;

fill z2--z10--z11--z7--cycle withcolor (0.9,0.9,0.9);
draw z2--z10--z11--z7--cycle;

fill z9--z12--z11--z10--cycle withcolor (0.9,0.9,0.9);
draw z9--z12--z11--z10--cycle;

pickup pencircle scaled 1pt;

drawarrow z3--z0; label.lft(btex $\vec b$ etex, 0.5[z3,z0]);
drawarrow z3--z2; label.top(btex $\vec a'$ etex, 0.5[z3,z2]);
drawarrow z3--z8; label.ulft(btex $\vec c$ etex, 0.5[z3,z8]);
drawarrow z2--z7; label.ulft(btex $\vec c$ etex, 0.5[z2,z7]);
drawarrow z2--z1; label.lft(btex $\vec b$ etex, 0.5[z2,z1]);
drawarrow z2--z10; label.top(btex $\vec a''$ etex, 0.5[z2,z10]);

z18 = (210,0);

z20 = z0 shifted z18;
z21 = z1 shifted z18;
z22 = z2 shifted z18;
z23 = z3 shifted z18;
z24 = z4 shifted z18;
z25 = z5 shifted z18;
z26 = z6 shifted z18;
z27 = z7 shifted z18;
z28 = z8 shifted z18;
z29 = z9 shifted z18;
z30 = z10 shifted z18;
z31 = z11 shifted z18;
z32 = z12 shifted z18;

pickup pencircle scaled 0.1pt;

fill z20--z29--z30--z23--cycle withcolor (0.9,0.9,0.9);
draw z20--z29--z30--z23--cycle;
fill z23--z30--z31--z28--cycle withcolor (0.9,0.9,0.9);
draw z23--z30--z31--z28--cycle;
fill z29--z32--z31--z30--cycle withcolor (0.9,0.9,0.9);
draw z29--z32--z31--z30--cycle;

pickup pencircle scaled 1pt;

drawarrow z23--z20; label.lft(btex $\vec b$ etex, 0.5[z23,z20]);
drawarrow z23--z30; label.top(btex $\vec a'+\vec a''$ etex, 0.5[z23,z30]);
drawarrow z23--z28; label.ulft(btex $\vec c$ etex, 0.5[z23,z28]);

label(btex $=$ etex, (185,50));

endfig;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Abstand Punkt-Gerade
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

beginfig(3)

z0 = (0,0);
z1 = (100,20);
z2 = (40,70);
z3 = whatever[z0,z1] = z2 + whatever * ((z1-z0) rotated 90);
z4 = z1 shifted (z2 - z0);
z9 = (80,-30);

z5 = whatever[z0,z1] = whatever[z9,z2];

pickup pencircle scaled 1pt;

drawarrow z9--z2;

fill z0--z1--z4--z2--cycle withcolor (0.9,0.9,0.9);

drawarrow z5--z2 withcolor (0.6,0.6,0.6);
label.rt(btex $\vec a$ etex, 0.3[z9,z2]);

drawarrow z0--z1;
label.bot(btex $\vec r$ etex, 0.9[z0,z1]);
drawarrow z0--z2;
label.ulft(btex $\vec a-\vec p$ etex, 0.5[z0,z2]);
drawarrow z9--z0;
label.bot(btex $\vec p$ etex, 0.5[z9,z0]);
label.rt(btex $O$ etex, z9);

pickup pencircle scaled 0.1pt;
draw z2--z3;
label.lft(btex $d$ etex, 0.5[z2,z3]);

draw z0--z1--z4--z2--cycle;

draw (-0.2)[z0,z1]--(1.5)[z0,z1];
label.top(btex $g$ etex, 1.3[z0,z1]);

pickup pencircle scaled 3pt;
draw z0;
draw z9;

%z6 = z4 shifted (0,-20);
label.rt(btex $F=|(\vec a-\vec p)\times \vec r\,|$ etex, z2 shifted (10,-5));
%pickup pencircle scaled 0.1pt;
%draw z6--z6 shifted (-30,0);

endfig;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Abstand windschiefer Geraden
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

beginfig(4)

z0 = (0,0);
z1 = (100,70);
z2 = z0 shifted (0,80);
z3 = z2 shifted (80,-40);

z10 = (-0.2)[z0,z1];
z11 = (-1)[z0,z1];

z20 = 0.3[z2,z3];
z21 = 1.3[z2,z3];

pickup pencircle scaled 1pt;
drawarrow z10--z11;
label.ulft(btex $\vec r_0$ etex, 0.5[z10,z11]);

pickup pencircle scaled 0.1pt;
draw 1.5[z0,z1]--(-1.5)[z0,z1];

pickup pencircle scaled 7pt
draw (-2)[z2,z3]--(2)[z2,z3] withcolor white;

z22 = 0.5[z20,z21];
z23 = z22 shifted (5,5);
fill z23 shifted (5,0) .. z23 shifted (0,5) .. z23 shifted (-5,0)
	.. z23 shifted (0,-5) .. cycle withcolor white;
label(btex $\vec r_1$ etex, z23);

pickup pencircle scaled 1pt;
drawarrow z20--z21;

pickup pencircle scaled 0.1pt;
draw (-2)[z2,z3]--(2)[z2,z3];

pickup pencircle scaled 3pt;

draw z0;
draw z2;
draw z10; label.ulft(btex $P_0$ etex, z10);
draw z20; label.top(btex $P_1$ etex, z20);

pickup pencircle scaled 1pt;
draw z0--z2;
z5 = 0.6[z0,z2];
label.lft(btex $d\;\|\;\vec n$ etex, z5 shifted (-20,10));

pickup pencircle scaled 0.1pt;
drawarrow z5 shifted(-20,10){right}..{right}z5;

pickup pencircle scaled 7pt;
draw 0.1[z10,z20]--0.9[z10,z20] withcolor white;

pickup pencircle scaled 1pt;
drawarrow z10--z20;

z4 = 0.2[z10,z20];
label.lft(btex $\vec p_1-\vec p_0$ etex, z4 shifted (-20,10));

pickup pencircle scaled 0.1pt;
drawarrow z4 shifted (-20,10){right}..{right}z4;

z12 = (-0.1)[z2,z3];
draw z12{down}..{z3-z2}z2 shifted (0,-10);

z24 = (0.1)[z0,z1];
draw z24{up}..{z0-z1}z0 shifted (0,10);

label.ulft(btex $g_0$ etex, 1.3[z0,z1]);
label.urt(btex $g_1$ etex, (-1.2)[z2,z3]);

endfig;

end
