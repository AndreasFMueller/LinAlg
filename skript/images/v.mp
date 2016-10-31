%
% v.mp -- Bilder fuer das Kapitel Vektorgeometrie
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
% Vektor OP
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

beginfig(1)

pickup pencircle scaled 3pt;
z0=(0,0);
z1=(100,40);
draw z0--z0;
draw z1--z1;
pickup pencircle scaled 1pt;
drawarrow z0--z1;

label.lft(btex $O$ etex, z0);
label.rt(btex $P$ etex, z1);

endfig;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Multiplikation mit einem Skalar
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

beginfig(2)
z0=(0,0);
z1=(100,40);
z2=1.56[z0,z1];

pickup pencircle scaled 1pt;

drawarrow z0 shifted 1(-0.4,1)--z1 shifted 1(-0.4,1);
drawarrow z0 shifted 1(0.4,-1)--z2 shifted 1(0.4,-1);

label.ulft(btex $\vec a$ etex, 0.5[z0,z1]);
label.lrt(btex $\lambda \vec a$ etex, 0.5[z0,z2]);

endfig;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Vektoraddition
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

beginfig(3)

z0 = (0,0);
z1 = (100,20);
z2 = (40,60);

pickup pencircle scaled 1pt;

drawarrow z0--z1;
drawarrow z1--z2;

drawarrow z0--z2;

label.lrt(btex $\vec a$ etex, 0.5[z0,z1]);
label.urt(btex $\vec b$ etex, 0.5[z1,z2]);
label.ulft(btex $\vec a + \vec b$ etex, 0.5[z0,z2]);

endfig;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Vektordifferenz
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

beginfig(4)

z0 = (0,0);
z1 = (100,40);
z2 = (40,60);

pickup pencircle scaled 3pt;

draw z0--z0; label.lft(btex $O$ etex, z0);
draw z1--z1; label.rt(btex $A$ etex, z1);
draw z2--z2; label.top(btex $B$ etex, z2);

pickup pencircle scaled 1pt;

drawarrow z0--z1; label.lrt(btex $\overrightarrow{OA}$ etex, 0.5[z0,z1]);
drawarrow z0--z2; label.lft(btex $\overrightarrow{OB}$ etex, 0.5[z0,z2]);
drawarrow z1--z2; label.urt(btex $\overrightarrow{OB}-\overrightarrow{OA}$ etex, 0.5[z1,z2]);

endfig;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Koordinatensystem
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

beginfig(5)

z0 = (0,0);
label.ulft(btex $O$ etex, z0);
z1 = (100,0);
z2 = z1 scaled 0.5 rotated 30;
z3 = (0,100);

z4 = (80,18);
z5 = z4 shifted (0,70);
label.urt(btex $x$ etex, z5);

pickup pencircle scaled 1pt;

drawarrow z0--z5;

drawarrow z0--z1; label.urt(btex $\vec e_1$ etex, z1);
drawarrow z0--z2; label.ulft(btex $\vec e_2$ etex, z2 shifted(2,0));
drawarrow z0--z3; label.ulft(btex $\vec e_3$ etex, z3);

pickup pencircle scaled 0.1pt;

draw -0.1[z0,z1]--1.5[z0,z1];
draw -0.1[z0,z2]--1.5[z0,z2];
draw -0.1[z0,z3]--1.2[z0,z3];

draw z4--z5; label.rt(btex $x_3$ etex, 0.5[z4,z5]);

z6 = whatever[z0,z2];
z6 = whatever[z4,z4 shifted(-1,0)];

z7 = whatever[z0,z1];
z7 = whatever[z4,z4 shifted ((1,0) rotated 30)];

draw z4--z6; label.lrt(btex $x_2$ etex, 0.8[z0,z6] shifted (-1,1));
draw z4--z7; label.lrt(btex $x_1$ etex, 0.5[z0,z7]);

endfig;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Gerade y = ax + b
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

beginfig(6)

z0 = (0,0);
z1 = (100,0);
z2 = (0,100);

pickup pencircle scaled 0.1pt;
draw -0.1[z0,z1]--1.1[z0,z1];
draw -0.1[z0,z2]--1.1[z0,z2];
label.llft(btex $O$ etex, z0);

label.bot(btex $x$ etex, z1);
label.lft(btex $y$ etex, z2);

z3 = (0,30);
z4 = (100,80);

pickup pencircle scaled 1pt;

draw z0--z3;
label.rt(btex $b$ etex, 0.5[z0,z3]);

pickup pencircle scaled 1.5pt;

draw (-0.1)[z3,z4] -- 1.1[z3,z4];

label.lrt(btex $y=ax+b$ etex, 0.5[z3,z4]);

pickup pencircle scaled 3pt;

draw z3-z3;

endfig;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Parametrisierung einer Geraden
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

beginfig(7)

z0 = (0,0);
z1 = (20,60);
z2 = (80,-10);
z3 = z1 shifted z2;

label.lft(btex $O$ etex, z0);
label.top(btex $P$ etex, z1);

pickup pencircle scaled 1pt;
drawarrow z0--z1;
drawarrow z1--z3;

label.lft(btex $\vec p$ etex, 0.5[z0,z1]);
label.top(btex $\vec v$ etex, 0.5[z1,z3]);

pickup pencircle scaled 0.1pt;

draw (-0.5)[z1,z3]--(1.5)[z1,z3];

z4 = 1.2[z1,z3];

label.urt(btex $R$ etex, z4);
label.lrt(btex $\vec r(t)=\vec p+t\vec v$ etex, 0.5[z0,z4]);
drawarrow z0--z4;

label.urt(btex $g$ etex, (-0.4)[z1,z3]);

pickup pencircle scaled 3pt;
draw z0--z0;
draw z4--z4;

endfig;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Parametrisierung einer Ebene
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

beginfig(8)

z0 = (0,0);
pickup pencircle scaled 3pt;
draw z0--z0;
label.lft(btex $O$ etex, z0);

z1 = (30,80);

z2 = (100,-30);
z3 = (40,30);

z4 = z1 shifted -0.5 z2 shifted -0.5 z3;
z5 = z1 shifted 1.5 z2 shifted -0.5 z3;
z6 = z1 shifted 1.5 z2 shifted 1.5 z3; 
z7 = z1 shifted -0.5 z2 shifted 1.5 z3;

pickup pencircle scaled 0.1pt;

path plane;
plane := z4--z5--z6--z7--cycle;

fill plane withcolor (0.9,0.9,0.9);
draw plane;

label.ulft(btex $P$ etex, z1);
label.lft(btex $\vec p$ etex, 0.5[z0,z1]);

z8 = whatever[z0,z1] = whatever[z4, z5];

pickup pencircle scaled 1pt;
drawarrow z0--z1 withcolor (0.8,0.8,0.8);
draw z0--z8;

pickup pencircle scaled 3pt;
draw z1--z1;

pickup pencircle scaled 1pt;

drawarrow z1 -- z1 shifted z2; label.urt(btex $\vec v_1$ etex, z1 shifted z2);
drawarrow z1 -- z1 shifted z3; label.ulft(btex $\vec v_2$ etex, z1 shifted z3);

label.lft(btex $\sigma$ etex, z6 shifted(-10,-2));

endfig;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Durchstosspunkt
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

beginfig(9);

z0 = (0,0);
pickup pencircle scaled 3pt;
draw z0--z0;
label.lft(btex $O$ etex, z0);

z1 = (30,80);

z2 = (100,-30);
z3 = (40,30);

z4 = z1 shifted -0.5 z2 shifted -0.5 z3;
z5 = z1 shifted 1.5 z2 shifted -0.5 z3;
z6 = z1 shifted 1.5 z2 shifted 1.5 z3; 
z7 = z1 shifted -0.5 z2 shifted 1.5 z3;

pickup pencircle scaled 0.1pt;

path plane;
plane := z4--z5--z6--z7--cycle;
fill plane withcolor (0.9,0.9,0.9);
draw plane;

label.ulft(btex $P_0$ etex, z1);
label.lft(btex $\vec p_0$ etex, 0.5[z0,z1]);

z8 = whatever[z0,z1] = whatever[z4, z5];

pickup pencircle scaled 1pt;
drawarrow z0--z1 withcolor (0.8,0.8,0.8);
draw z0--z8;

pickup pencircle scaled 3pt;
draw z1--z1;

label.lft(btex $\sigma$ etex, z6 shifted(-10,-2));

z9 = (130,-20);
pickup pencircle scaled 3pt;
draw z9--z9;
label.rt(btex $Q_0$ etex, z9);

z10 = (100, 80);
label.urt(btex $S$ etex, z10);

z11 = whatever[z9,z10] = whatever[z4, z5];

pickup pencircle scaled 0.5pt;
draw (-0.1)[z9,z10]--1.6[z9,z10];
label.urt(btex $g$ etex, 1.5[z9,z10]);

pickup pencircle scaled 0.51pt;
draw z11--z10 withcolor (0.8,0.8,0.8);

pickup pencircle scaled 1pt;
drawarrow z9--0.8[z9,z11];
label.rt(btex $\vec r$ etex, 0.75[z9,z11]);

z12 = whatever[z1,z1 shifted z2] = whatever[z10, z10 shifted z3];
z13 = whatever[z1,z1 shifted z3] = whatever[z10, z10 shifted z2];

pickup pencircle scaled 0.1pt;
draw z12--z10;
draw z13--z10;

label.bot(btex $s\vec u$ etex, 0.9[z1,z12]);
label.ulft(btex $t\vec v$ etex, 0.8[z1,z13]shifted (4,0));

pickup pencircle scaled 1pt;

drawarrow z1 -- z1 shifted z2; label.urt(btex $\vec u$ etex, z1 shifted z2);
drawarrow z1 -- z1 shifted z3; label.ulft(btex $\vec v$ etex, z1 shifted z3);

drawarrow z0--z9;
label.bot(btex $\vec q_0$ etex, 0.5[z0,z9]);

pickup pencircle scaled 3pt;
draw z10--z10;

endfig;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Schnittgerade
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

beginfig(10)

z0 = (0,0);

pickup pencircle scaled 3pt;
draw z0--z0;
label.lft(btex $O$ etex, z0);

z1 = (-20,100);
z2 = (200,-40);
z3 = (80,120);

% erste Ebene: z10--z11--z12--z13
z10 = z1;
z11 = z1 shifted z2;
z12 = z1 shifted z2 shifted z3;
z13 = z1 shifted z3;

pickup pencircle scaled 0.1pt;
fill z10 -- z11 -- z12 -- z13 -- cycle withcolor (0.9,0.9,0.9);
draw z10 -- z11 -- z12 -- z13 -- cycle;

% Schnittpunkte der beiden Seiten
z4 = 0.4[z11,z12]; % rechts
z5 = 0.6[z10,z13]; % links

% zweite Ebene z20--z21--z21--z23
z20 = (40,240); % linke obere Ecke
z6 = (11,1.4); % Richtungsvektor der oberen Kante

z23 = 2.8[z20,z5]; % linke untere Ecke
z21 = whatever[z20,z23] shifted z4 = z20 + (whatever * z6);
z22 = whatever[z21,z4] = z23 + (whatever * z6);

fill z20 -- z21 -- z22 -- z23 -- cycle withcolor (0.6,0.6,0.6);
draw z20 -- z21 -- z22 -- z23 -- cycle;

fill z5--z4--z11--z10--cycle withcolor (0.9,0.9,0.9);

% P0 + u_0 + v_0
z14 = z10 shifted (40,5); label.lft(btex $P_0$ etex, z14);
pickup pencircle scaled 3pt;
draw z14--z14;

pickup pencircle scaled 1pt;
z15 = (z14 + 0.3(z11-z10));
z16 = (z14 + 0.3(z13-z10));
drawarrow z14--z15; label.urt(btex $\vec u_0$ etex, z15);
drawarrow z14--z16; label.ulft(btex $\vec v_0$ etex, z16);

% P1 + u1 + v1
z24 = z20 shifted (30,-10);
pickup pencircle scaled 3pt;
draw z24--z24;
label.lft(btex $P_1$ etex, z24);

pickup pencircle scaled 1pt;
z25 = z24 + 0.3(z21-z20);
z26 = z24 + 0.3(z23-z20);
drawarrow z24--z25; label.top(btex $\vec u_1$ etex, z25);
drawarrow z24--z26; label.lft(btex $\vec v_1$ etex, z26);

pickup pencircle scaled 0.1pt;
draw z5--z4--z11--z10--cycle;

% Schnittgerade
pickup pencircle scaled 0.5pt;
draw (-0.2)[z4,z5]--(1.2)[z4,z5];

pickup pencircle scaled 1pt;
z30 = 0.2[z4,z5];
z31 = 0.4[z4,z5];
drawarrow z30--z31;
label.top(btex $\vec r$ etex, 0.8[z30,z31]);

drawarrow z0--z30 withcolor (0.8,0.8,0.8);
drawarrow z0--z14 withcolor (0.8,0.8,0.8);
z40 = whatever[z0,z30] = whatever[z10,z11];
z41 = whatever[z0,z14] = whatever[z10,z11];
draw z0--z40; label.lrt(btex $\vec q_0$ etex, 0.4[z0,z30]);
draw z0--z41; label.lft(btex $\vec p_0$ etex, 0.3[z0,z14]);

pickup pencircle scaled 3pt;
draw z14--z14;
draw z30--z30;
label.urt(btex $Q_0$ etex, z30);

label.top(btex $g$ etex, (-0.14)[z4,z5]);
label.top(btex $\sigma_0$ etex, z11 shifted (-10,5));
label.llft(btex $\sigma_1$ etex, z21 shifted (-10,-10));

endfig;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Linearität der Projektion
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
beginfig(11)

numeric u;
u := 50;

z0 = (0,0);
z1 = (3 * u, 0);
z2 = (2 * u, 1 * u);
z3 = (1 * u, 1 * u);
z4 = z2 + z3;
z5 = (xpart z2, 0);
z6 = (xpart z4, 0);
z7 = (3.8 * u, 0);

z10 = z0 shifted (0,-10);
z11 = z5 shifted (0,-10);
z12 = z6 shifted (0,-10);

pickup pencircle scaled 0.3pt;

draw z2--z11;
draw z4--z12;
draw z0--z10;

draw (z10--z12) shifted (0,3);

pickup pencircle scaled 1pt;

drawarrow z0--z2;
drawarrow z2--z4;
drawarrow z0--z7;

label.ulft(btex $\vec{v}_1$ etex, 0.5 * z2);
label.ulft(btex $\vec{v}_2$ etex, 0.5[z2,z4]);
label.rt(btex $\vec{u}$ etex, z7);
label.bot(btex $p_{\vec{u}}(\vec{v}_1)$ etex, 0.5[z10,z11]);
label.bot(btex $p_{\vec{u}}(\vec{v}_2)$ etex, 0.5[z11,z12]);

z20 = (4.5 * u, 0);
z21 = (1.4 * u, 1.1 * u);
z22 = z21 shifted z20;
numeric lambda;
lambda = 1.7;
z23 = z21 scaled lambda shifted z20;
z24 = (2.7 * u, 0) shifted z20;
z25 = (xpart z22, 0);
z26 = (xpart z23, 0);
z27 = z20 shifted (0,-10);
z28 = z26 shifted (0,-10);

drawarrow z20--z22;
drawarrow z20--z23;
drawarrow z20--z24;

pickup pencircle scaled 0.3pt;

draw z22--z25;
draw z23--z28;
draw z20--z27;
draw (z27--z28) shifted (0,3);

label.ulft(btex $\vec{v}$ etex, z22);
label.ulft(btex $\lambda\vec{v}$ etex, z23);
label.rt(btex $\vec{u}$ etex, z24);
label.top(btex $p_{\vec{u}}(\vec v)$ etex, 0.5[z20,z25]);
label.bot(btex $p_{\vec{u}}(\lambda\vec{v})=\lambda p_{\vec{u}}(\vec{v})$ etex,
	0.5[z27,z28]);

endfig;


end
