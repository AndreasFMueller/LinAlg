%
% s.mp -- Bilder fuer das Skalarprodukt
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
% Orthogonalprojektion
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

beginfig(1)

z0 = (0,0);
z1 = (150,0);
z2 = (60,100);
z4 = (0,-1);
z3 = whatever[z0,z1] = z2 + whatever * z4;

pickup pencircle scaled 1pt;

drawarrow z0--z1; label.rt(btex $\vec u$ etex, z1);
drawarrow z0--z2; label.lft(btex $\vec v$ etex, z2);

pickup pencircle scaled 0.1pt;
draw z3--z2;
label.bot(btex $p_{\vec u}(\vec v)$ etex, 0.5[z0,z3] shifted (0,-10));

draw z3 shifted (0,10){left}..{down}z3 shifted (-10,0);

pickup pencircle scaled 0.1pt;
draw z0--z0 shifted (0,-15);
draw z3--z3 shifted (0,-15);

draw z0 shifted (0,-10) -- z3 shifted (0,-10);

pickup pencircle scaled 3pt;
draw z0--z0;
label.lft(btex $O$ etex, z0);

draw z3 shifted (-4,4);

endfig;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Skalarprodukt
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

beginfig(2)

z0 = (0,0);
z1 = (150,0);
z2 = (100,0);

z3 = z1 rotated 20;
z4 = z2 rotated 75;

pickup pencircle scaled 1pt;
drawarrow z0--z3;
drawarrow z0--z4;

label.top(btex $\vec u$ etex, 0.6[z0,z3]);
label.lft(btex $\vec v$ etex, 0.6[z0,z4]);

z5 = whatever[z0,z3] = z4 + whatever * (z2 rotated 110);

pickup pencircle scaled 0.4pt;
draw z2 scaled 0.3 rotated 20{dir 110} .. {dir 165}z2 scaled 0.3 rotated 75;
label(btex $\alpha$ etex, z2 scaled 0.2 rotated 47.5);

draw z5--z4;
draw z5 shifted ((0,10) rotated 20){dir 200} .. {dir 290}(z5 shifted ((-10,0) rotated 20));

pickup pencircle scaled 3pt;
draw z0;
draw z5 shifted ((-4,4) rotated 20);

pickup pencircle scaled 0.1pt;
draw z0 -- z0 shifted ((0,-15) rotated 20);
draw z5 -- z5 shifted ((0,-15) rotated 20);

z6 = z0 shifted ((0,-10) rotated 20);
z7 = z5 shifted ((0,-10) rotated 20);
draw z6--z7;
label.bot(btex $\vec u\cdot \vec v$ etex, (0,0))rotated 20 shifted 0.5[z6,z7] ;

endfig;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Ebene in Normalendarstellung
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

beginfig(3)

z0=(0,0);
pickup pencircle scaled 3pt;
draw z0;
label.lft(btex $O$ etex, z0);

z1 = (40,100);
z2 = (150,-20);
z3 = (60,80);

z10 = z1 shifted -0.5 z2 shifted -0.5 z3;
z11 = z1 shifted 1.2 z2 shifted -0.5 z3;
z12 = z1 shifted 1.2 z2 shifted 1.5 z3;
z13 = z1 shifted -0.5 z2 shifted 1.5 z3;

fill z10--z11--z12--z13--cycle withcolor (0.9,0.9,0.9);

pickup pencircle scaled 1pt;


drawarrow z0--z1 withcolor (0.8,0.8,0.8);
z5 = whatever[z10, z11] = whatever[z0,z1];
draw z0--z5;
z6 = z1 shifted (160,40);
label.top(btex $\vec r-\vec p$ etex, 0.5[z1,z6]);
drawarrow z0--z6 withcolor (0.8,0.8,0.8);
drawarrow z1--z6;
z7 = whatever[z10,z11] = whatever[z0,z6];
draw z0--z7;

drawarrow z1--z1 shifted z2 withcolor (0.5,0.5,0.5);
label.top(btex $\vec u$ etex, z1 shifted 0.8 z2) withcolor(0.5,0.5,0.5);
drawarrow z1--z1 shifted z3 withcolor (0.5,0.5,0.5);
label.lft(btex $\vec v$ etex, z1 shifted 0.8 z3) withcolor(0.5,0.5,0.5);

pickup pencircle scaled 0.5pt;
draw z10--z11--z12--z13--cycle;

pickup pencircle scaled 1pt;
z4 = z1 shifted (5,100);
drawarrow z1--z4; label.lft(btex $\vec n$ etex, z4);

pickup pencircle scaled 0.1pt;

draw 0.12[z1,z1 shifted z2]{z4-z1}..{-z2}0.2[z1,z4];
draw 0.15[z1,z1 shifted z3]{z4-z1}..{-z3}0.2[z1,z4];

draw 0.12[z1,z6]{z4-z1}..{z1-z6}0.2[z1,z4];

pickup pencircle scaled 3pt;
draw z1;
label.lft(btex $P$ etex, z1);
draw z6;
label.rt(btex $Q$ etex, z6);

label.lft(btex $\vec p$ etex, 0.4[z0,z1]);
label.lrt(btex $\vec r$ etex, 0.3[z0,z6]);

endfig;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Spiegelung
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

beginfig(4)

z0 = (0,0);

z1 = (60,0);
z2 = (-20,0);
z3 = (0,60);
z4 = (0,-60);

z5 = (80,60);
z6 = whatever[z0,z3] = z5 + whatever * z2;
z7 = 2[z5,z6];
z8 = whatever[z0,z1] = z5 + whatever * z3;

pickup pencircle scaled 1pt;
draw z3--z4;
drawarrow z0 shifted (0,-40)--z1 shifted (0,-40);
label.top(btex $\vec n$ etex, z1 scaled 0.8 shifted (0,-40));

drawarrow z0--z8; label.bot(btex $\vec v_{\perp}$ etex, 0.5[z0,z8]);
drawarrow z8--z5; label.rt(btex $\vec v_{\|}$ etex, 0.5[z5,z8]);

z9 = -z8;
drawarrow z0--z9; label.bot(btex $-\vec v_{\perp}$ etex, 0.5[z0,z9]);
drawarrow z9--z7; label.lft(btex $\vec v_{\|}$ etex, 0.5[z9,z7]);

drawarrow z0--z5;
label.ulft(btex $\vec v$ etex, 0.5[z0,z5]);
drawarrow z0--z7;
label.urt(btex $\vec v'$ etex, 0.5[z0,z7]);

label.rt(btex $\sigma$ etex, z3 shifted (0,-3));

endfig;


end
