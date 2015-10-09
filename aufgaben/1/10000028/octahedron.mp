%
% octahedron.mp -- Octahedron graph
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

beginfig(1)

numeric u;
u = 100;

z0 = (0,0);
z1 = 0.5 * (cosd(-138), sind(-138)) * u;
z2 = (cosd(-7), sind(-7)) * u;
z3 = (0,1) * u;

z11 = ( 0 * z1 + 0 * z2 + 1 * z3);
z12 = ( 1 * z1 + 0 * z2 + 0 * z3);
z13 = ( 0 * z1 + 1 * z2 + 0 * z3);
z14 = (-1 * z1 + 0 * z2 + 0 * z3) shifted (-5,-5);
z15 = ( 0 * z1 - 1 * z2 + 0 * z3);
z16 = ( 0 * z1 + 0 * z2 - 1 * z3);

def line(expr p) =
	pickup pencircle scaled 3pt;
	draw p withcolor white;
	pickup pencircle scaled 1.5pt;
	draw p;
enddef;

line(z11--z14);
line(z13--z14);
line(z14--z15);
line(z14--z16);

line(z11--z13);
line(z11--z15);
line(z13--z16);
line(z15--z16);

line(z15--z12);
line(z12--z16);
line(z12--z13);
line(z11--z12);

pickup pencircle scaled 1.5pt;
draw z15--z16;

def punkt(expr a, d) =
	pickup pencircle scaled (d + 2pt);
	draw a;
	pickup pencircle scaled d;
	draw a withcolor white;
enddef;

punkt(z11, 11pt);
punkt(z12, 13pt);
punkt(z13, 12pt);
punkt(z14,  9pt);
punkt(z15, 10pt);
punkt(z16, 11pt);

label(btex $1$ etex, z11);
label(btex $2$ etex, z12);
label(btex $3$ etex, z13);
label(btex $4$ etex, z14);
label(btex $5$ etex, z15);
label(btex $6$ etex, z16);

label.ulft(btex  $1$ etex, (0.4[z11,z12]) shifted (1,-1));
label.urt(btex  $2$ etex, (0.5[z11,z13]));
label.llft(btex  $3$ etex, (0.5[z11,z14]) shifted (1,1));
label.ulft(btex  $4$ etex, (0.5[z11,z15]) shifted (1,-1));

label.urt(btex  $5$ etex, (0.55[z12,z13]));
label.llft(btex  $6$ etex, (0.5[z13,z14]));
label.llft(btex $7$ etex, (0.55[z14,z15]) shifted (0,-1));
label.urt(btex  $8$ etex, (0.5[z12,z15]) shifted (-1,-1));

label.urt(btex  $9$ etex, (0.5[z12,z16]));
label.lrt(btex  $10$ etex, (0.5[z13,z16]) shifted (-1,1));
label.lrt(btex $11$ etex, (0.55[z14,z16]) shifted (-1,1));
label.llft(btex $12$ etex, (0.5[z15,z16]) shifted (1,1));

endfig;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Zyklus z_1
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
beginfig(2)

numeric u;
u = 50;

z0 = (0,0);
z1 = 0.5 * (cosd(-138), sind(-138)) * u;
z2 = (cosd(-7), sind(-7)) * u;
z3 = (0,1) * u;

z11 = ( 0 * z1 + 0 * z2 + 1 * z3);
z12 = ( 1 * z1 + 0 * z2 + 0 * z3);
z13 = ( 0 * z1 + 1 * z2 + 0 * z3);
z14 = (-1 * z1 + 0 * z2 + 0 * z3) shifted (-5,-5);
z15 = ( 0 * z1 - 1 * z2 + 0 * z3);
z16 = ( 0 * z1 + 0 * z2 - 1 * z3);

def line(expr p) =
	pickup pencircle scaled 3pt;
	draw p withcolor white;
	pickup pencircle scaled 1.5pt;
	draw p;
enddef;

line(z11--z14);
line(z13--z14);
line(z14--z15);
line(z14--z16);

line(z11--z13);
line(z11--z15);
line(z13--z16);
line(z15--z16);

line(z15--z12);
line(z12--z16);
line(z12--z13);
line(z11--z12);

%pickup pencircle scaled 1.5pt;
%draw z15--z16;

def punkt(expr a, d) =
	pickup pencircle scaled (d + 2pt);
	draw a;
	pickup pencircle scaled d;
	draw a withcolor white;
enddef;

punkt(z14, 4pt);

pickup pencircle scaled 1.6pt;
fill z12--z11--z13--cycle withcolor (1.0,0.9,0.9);
draw z12--z11--z13--cycle withcolor red;
draw z12--z13 withcolor green;

punkt(z11, 4pt);
punkt(z12, 4pt);
punkt(z13, 4pt);
%punkt(z14, 4pt);
punkt(z15, 4pt);
punkt(z16, 4pt);

endfig;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Zyklus z_2
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
beginfig(3)

numeric u;
u = 50;

z0 = (0,0);
z1 = 0.5 * (cosd(-138), sind(-138)) * u;
z2 = (cosd(-7), sind(-7)) * u;
z3 = (0,1) * u;

z11 = ( 0 * z1 + 0 * z2 + 1 * z3);
z12 = ( 1 * z1 + 0 * z2 + 0 * z3);
z13 = ( 0 * z1 + 1 * z2 + 0 * z3);
z14 = (-1 * z1 + 0 * z2 + 0 * z3) shifted (-5,-5);
z15 = ( 0 * z1 - 1 * z2 + 0 * z3);
z16 = ( 0 * z1 + 0 * z2 - 1 * z3);

def line(expr p) =
	pickup pencircle scaled 3pt;
	draw p withcolor white;
	pickup pencircle scaled 1.5pt;
	draw p;
enddef;

line(z11--z14);
line(z13--z14);
line(z14--z15);
line(z14--z16);

line(z11--z13);
line(z11--z15);
line(z13--z16);
line(z15--z16);

line(z15--z12);
line(z12--z16);
line(z12--z13);
line(z11--z12);

pickup pencircle scaled 1.6pt;
fill z14--z11--z13--cycle withcolor (1.0,0.9,0.9);
draw z14--z11--z13--cycle withcolor red;
draw z13--z14 withcolor green;

%pickup pencircle scaled 1.5pt;
%draw z15--z16;

def punkt(expr a, d) =
	pickup pencircle scaled (d + 2pt);
	draw a;
	pickup pencircle scaled d;
	draw a withcolor white;
enddef;

punkt(z11, 4pt);
punkt(z12, 4pt);
punkt(z13, 4pt);
punkt(z14, 4pt);
punkt(z15, 4pt);
punkt(z16, 4pt);

endfig;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Zyklus z_3
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
beginfig(4)

numeric u;
u = 50;

z0 = (0,0);
z1 = 0.5 * (cosd(-138), sind(-138)) * u;
z2 = (cosd(-7), sind(-7)) * u;
z3 = (0,1) * u;

z11 = ( 0 * z1 + 0 * z2 + 1 * z3);
z12 = ( 1 * z1 + 0 * z2 + 0 * z3);
z13 = ( 0 * z1 + 1 * z2 + 0 * z3);
z14 = (-1 * z1 + 0 * z2 + 0 * z3) shifted (-5,-5);
z15 = ( 0 * z1 - 1 * z2 + 0 * z3);
z16 = ( 0 * z1 + 0 * z2 - 1 * z3);


def line(expr p) =
	pickup pencircle scaled 3pt;
	draw p withcolor white;
	pickup pencircle scaled 1.5pt;
	draw p;
enddef;

line(z11--z14);
line(z13--z14);
line(z14--z15);
pickup pencircle scaled 1.6pt;
line(z14--z16);


line(z11--z13);
line(z11--z15);
pickup pencircle scaled 1.6pt;
fill z14--z11--z15--cycle withcolor (1.0,0.9,0.9);
draw z14--z11--z15--cycle withcolor red;
draw z14--z15 withcolor green;
line(z13--z16);
line(z15--z16);

line(z15--z12);
line(z12--z16);
line(z12--z13);
line(z11--z12);

%pickup pencircle scaled 1.5pt;
%draw z15--z16;

def punkt(expr a, d) =
	pickup pencircle scaled (d + 2pt);
	draw a;
	pickup pencircle scaled d;
	draw a withcolor white;
enddef;

punkt(z11, 4pt);
punkt(z12, 4pt);
punkt(z13, 4pt);
punkt(z14, 4pt);
punkt(z15, 4pt);
punkt(z16, 4pt);


endfig;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Zyklus z_4
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
beginfig(5)

numeric u;
u = 50;

z0 = (0,0);
z1 = 0.5 * (cosd(-138), sind(-138)) * u;
z2 = (cosd(-7), sind(-7)) * u;
z3 = (0,1) * u;

z11 = ( 0 * z1 + 0 * z2 + 1 * z3);
z12 = ( 1 * z1 + 0 * z2 + 0 * z3);
z13 = ( 0 * z1 + 1 * z2 + 0 * z3);
z14 = (-1 * z1 + 0 * z2 + 0 * z3) shifted (-5,-5);
z15 = ( 0 * z1 - 1 * z2 + 0 * z3);
z16 = ( 0 * z1 + 0 * z2 - 1 * z3);


def line(expr p) =
	pickup pencircle scaled 3pt;
	draw p withcolor white;
	pickup pencircle scaled 1.5pt;
	draw p;
enddef;

line(z11--z14);
line(z13--z14);
line(z14--z15);
line(z14--z16);



line(z11--z13);
line(z11--z15);

line(z13--z16);
line(z15--z16);

line(z15--z12);
line(z11--z12);
fill z12--z11--z15--cycle withcolor (1.0,0.9,0.9);

pickup pencircle scaled 1.6pt;
draw z12--z11--z15--cycle withcolor red;
draw z12--z15 withcolor green;

line(z12--z16);
line(z12--z13);

%pickup pencircle scaled 1.5pt;
%draw z15--z16;

def punkt(expr a, d) =
	pickup pencircle scaled (d + 2pt);
	draw a;
	pickup pencircle scaled d;
	draw a withcolor white;
enddef;

punkt(z11, 4pt);
punkt(z12, 4pt);
punkt(z13, 4pt);
punkt(z14, 4pt);
punkt(z15, 4pt);
punkt(z16, 4pt);


endfig;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Zyklus z_5
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
beginfig(6)

numeric u;
u = 50;

z0 = (0,0);
z1 = 0.5 * (cosd(-138), sind(-138)) * u;
z2 = (cosd(-7), sind(-7)) * u;
z3 = (0,1) * u;

z11 = ( 0 * z1 + 0 * z2 + 1 * z3);
z12 = ( 1 * z1 + 0 * z2 + 0 * z3);
z13 = ( 0 * z1 + 1 * z2 + 0 * z3);
z14 = (-1 * z1 + 0 * z2 + 0 * z3) shifted (-5,-5);
z15 = ( 0 * z1 - 1 * z2 + 0 * z3);
z16 = ( 0 * z1 + 0 * z2 - 1 * z3);


def line(expr p) =
	pickup pencircle scaled 3pt;
	draw p withcolor white;
	pickup pencircle scaled 1.5pt;
	draw p;
enddef;

line(z11--z14);
line(z13--z14);
line(z14--z15);
line(z14--z16);



line(z11--z13);
line(z11--z15);

line(z13--z16);
line(z15--z16);

line(z15--z12);
line(z11--z12);
line(z12--z13);
line(z12--z16);

fill z12--z11--z13--z16--cycle withcolor (1.0,0.9,0.9);

pickup pencircle scaled 1.6pt;
draw z12--z11--z13--z16--cycle withcolor red;
draw z13--z16 withcolor green;
pickup pencircle scaled 0.5pt;
draw z12--z13 withcolor red;


%pickup pencircle scaled 1.5pt;
%draw z15--z16;

def punkt(expr a, d) =
	pickup pencircle scaled (d + 2pt);
	draw a;
	pickup pencircle scaled d;
	draw a withcolor white;
enddef;

punkt(z11, 4pt);
punkt(z12, 4pt);
punkt(z13, 4pt);
%punkt(z14, 4pt);
punkt(z15, 4pt);
punkt(z16, 4pt);


endfig;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Zyklus z_6
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
beginfig(7)

numeric u;
u = 50;

z0 = (0,0);
z1 = 0.5 * (cosd(-138), sind(-138)) * u;
z2 = (cosd(-7), sind(-7)) * u;
z3 = (0,1) * u;

z11 = ( 0 * z1 + 0 * z2 + 1 * z3);
z12 = ( 1 * z1 + 0 * z2 + 0 * z3);
z13 = ( 0 * z1 + 1 * z2 + 0 * z3);
z14 = (-1 * z1 + 0 * z2 + 0 * z3) shifted (-5,-5);
z15 = ( 0 * z1 - 1 * z2 + 0 * z3);
z16 = ( 0 * z1 + 0 * z2 - 1 * z3);


def line(expr p) =
	pickup pencircle scaled 3pt;
	draw p withcolor white;
	pickup pencircle scaled 1.5pt;
	draw p;
enddef;

line(z11--z14);
line(z13--z14);
line(z14--z15);
line(z14--z16);

line(z11--z13);
line(z11--z15);

line(z13--z16);
line(z15--z16);

line(z15--z12);
line(z11--z12);
line(z12--z16);

fill z12--z11--z14--z16--cycle withcolor (1.0,0.9,0.9);

pickup pencircle scaled 1.6pt;
draw z12--z11--z14--z16--cycle withcolor red;
draw z14--z16 withcolor green;
pickup pencircle scaled 0.5pt;

line(z12--z13);

%pickup pencircle scaled 1.5pt;
%draw z15--z16;

def punkt(expr a, d) =
	pickup pencircle scaled (d + 2pt);
	draw a;
	pickup pencircle scaled d;
	draw a withcolor white;
enddef;

punkt(z11, 4pt);
punkt(z12, 4pt);
punkt(z13, 4pt);
punkt(z14, 4pt);
punkt(z15, 4pt);
punkt(z16, 4pt);


endfig;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Zyklus z_7
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
beginfig(8)

numeric u;
u = 50;

z0 = (0,0);
z1 = 0.5 * (cosd(-138), sind(-138)) * u;
z2 = (cosd(-7), sind(-7)) * u;
z3 = (0,1) * u;

z11 = ( 0 * z1 + 0 * z2 + 1 * z3);
z12 = ( 1 * z1 + 0 * z2 + 0 * z3);
z13 = ( 0 * z1 + 1 * z2 + 0 * z3);
z14 = (-1 * z1 + 0 * z2 + 0 * z3) shifted (-5,-5);
z15 = ( 0 * z1 - 1 * z2 + 0 * z3);
z16 = ( 0 * z1 + 0 * z2 - 1 * z3);


def line(expr p) =
	pickup pencircle scaled 3pt;
	draw p withcolor white;
	pickup pencircle scaled 1.5pt;
	draw p;
enddef;

line(z11--z14);
line(z13--z14);
line(z14--z15);
line(z14--z16);

line(z11--z13);
line(z11--z15);

line(z13--z16);
line(z15--z16);

line(z15--z12);
line(z11--z12);
line(z12--z16);

fill z12--z11--z15--z16--cycle withcolor (1.0,0.9,0.9);

pickup pencircle scaled 1.6pt;
draw z12--z11--z15--z16--cycle withcolor red;
draw z15--z16 withcolor green;
pickup pencircle scaled 0.5pt;
draw z12--z15 withcolor red;

line(z12--z13);

%pickup pencircle scaled 1.5pt;
%draw z15--z16;

def punkt(expr a, d) =
	pickup pencircle scaled (d + 2pt);
	draw a;
	pickup pencircle scaled d;
	draw a withcolor white;
enddef;

punkt(z11, 4pt);
punkt(z12, 4pt);
punkt(z13, 4pt);
punkt(z14, 4pt);
punkt(z15, 4pt);
punkt(z16, 4pt);


endfig;

end
