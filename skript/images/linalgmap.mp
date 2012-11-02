%
% linalgmap.tex -- map of linear algebra in the spirit of xkcd's map of the
%                  internet
%
% (c) 2012 Prof Dr Andreas Mueller, Hochschule Rapperswil
% $Id$
%
verbatimtex
\documentclass{article}
\usepackage{times}
\usepackage{amsmath}
\usepackage{amssymb}
\usepackage{amsfonts}
\begin{document}
etex;

def pivot(expr p) =
	pickup pencircle scaled 1pt;
	draw p shifted (5,0)
		..p shifted (0,5)
		..p shifted (-5,0)
		..p shifted (0,-5)..cycle;
	fill p shifted (5,0)
		..p shifted (0,5)
		..p shifted (-5,0)
		..p shifted (0,-5)..cycle withcolor white;
enddef;

def bridge(expr p) =
	fill (p shifted (-30,5))
		--(p shifted (30,5))
		--(p shifted (30,-5))
		--(p shifted (-30,-5))--cycle withcolor white;
	pickup pencircle scaled 1pt;
	draw (p shifted (-25,10))
		--(p shifted (-20,5))
		--(p shifted (20,5))
		--(p shifted (25,10));
	draw (p shifted (-25,-10))
		--(p shifted (-20,-5))
		--(p shifted (20,-5))
		--(p shifted (25,-10));
enddef;

def mountain(expr p) =
	draw (p shifted (-5,-5)){dir 70}
		..(p shifted (0,5))
		..{dir -70}(p shifted (5,-5));
enddef;

def bigmountain(expr p) =
	draw (p shifted (-15,-15)){dir 70}
		..(p shifted (0,15))
		..{dir -70}(p shifted (15,-15));
enddef;

def orth(expr p) =
	draw (p shifted (-5,-10))--(p shifted(-5,10))--(p shifted (5,10))--(p shifted(5,-10));
enddef;

beginfig(1)

path p;
p = (-300,200){dir -45}..(-200,0)
	..{right}(-100,-100)..{left}(-100,-90)
	..{right}(-80,-40)
	..{left}(-60,-90)..{right}(-60,-100)
	..{up}(0,-60)
	..{up}(-50,100)..{dir 45}(0,200);

path q;
q = (24,200){dir -135}
%	..(20,180){dir -135}
	..{down}(-30,100)
	..{down}(28,-60)
	..(100,-150)
	..(150,-100)..{dir -45}(300,-200);

pickup pencircle scaled 1pt;

draw p;
draw q;

fill p--q--(-300,-200)--cycle withcolor (0.9,0.9,0.9);

label(btex $\det$-sea etex, (-220, -80));

z4 = (-100,100); % LR-City
z5 = (-70,0);	% LU-City
z6 = (-140,30);	% Triangle-City
z7 = (20,100);	% QR-City
z8 = (60,0);	% San Francis-co
z9 = (200,100); % Choleskygrad
z10 = (240,20);	% SVD
z11 = (-200,150);	% links oben
z12 = (-180,90);	% links unten
z13 = (-110,170);	% rechts oben
z14 = (150,180);	% Angle

draw z4--z5;
draw z4--z6;
draw z5--z6;
draw z5--z8;
draw z4--z7;
draw z7--z9;
draw z14{dir -35}..z9..z10;

draw z7--z8;
draw z8{dir -60}..(100,-80)..(150,-50)..(200,-50)..z10;
draw z6--z12;
draw z12--z4;
draw z11--z13;
draw z13--z4;
draw z12--z11;
draw z11--(-230,200);
draw z13--(-130,200);

drawarrow 0.02[z8,z10]--0.96[z8,z10];
pickup pencircle scaled 2pt;
draw 0.41[z8,z10]--0.7[z8,z10] withcolor white;

% Trail
pickup pencircle scaled 1pt;
draw z14..(110,177)
..(100,169)
..(90,161)
..(100,121)..(100,100)..(100,80)..(110,72)..(110,56)
..(130,40)
..(150,25) dashed evenly;

pickup pencircle scaled 3pt;
draw (150,25);

label.urt(btex characteristic peak etex, (150,22));

pivot(z4);
pivot(z5);
pivot(z6);
pivot(z7);
pivot(z8);
pivot(z9);
pivot(z10);
pivot(z11);
pivot(z12);
pivot(z13);
pivot(z14);

fill (z4 shifted(-20,8))
	--(z4 shifted(20,8))
	--(z4 shifted(20,18))
	--(z4 shifted(-20,18))--cycle withcolor white;
label.top(btex LR-City etex, z4 shifted(0,5));
label.bot(btex LU-City etex, z5 shifted(0,-5));
label.llft(btex Triangle-City etex, z6 shifted(5,-5));
label.top(btex QR-City etex, z7 shifted(0,5));
label.rt(btex Choleskygrad etex, z9 shifted(5,0));
label.bot(btex San Francis-co etex, z8 shifted(0,-5));
label.rt(btex SVD etex, z10 shifted(5,0));
label.rt(btex Los Angles etex, z14 shifted(5,0));
label(btex matrix mountains etex, (0,0)) rotated -60 shifted (165,68);

label.top(btex Eigen-vector etex, (0,-1.5)) rotated 7.5 shifted 0.175[z8,z10];

%point z1;
%point z2;
z1 = (0,0);
z2 = (-40,100);
z3 = (100,100);

bridge(z1); label(btex Householder etex, z1);
bridge(z2); label(btex Gram-Schmidt etex, z2);
bridge(z3); label(btex least squares etex, z3);

orth((-80,180));
orth((-60,185));
orth((-40,180));

orth((-72, 158));
orth((-52, 162));

orth((-62, 132));

orth((30,180));
orth((45,185));
orth((60,180));

orth((10,165));
orth((25,155));
orth((43,163));
orth((40,140));
orth((57,155));

orth((95,183));
%mountain((110,177));

orth((77,175));
%mountain((100,169));
%mountain((120,169));

%mountain((70,161));
%mountain((90,161));
orth((110,161));
orth((130,161));

orth((80,153));
orth((98,153));
mountain((120,153));
mountain((140,153));
mountain((160,153));

mountain((70,145));
%mountain((90,145));
mountain((110,145));
mountain((130,145));
mountain((150,145));

mountain((60,137));
mountain((80,137));
mountain((100,137));
mountain((120,137));
mountain((140,137));

mountain((50,129));
mountain((70,129));
mountain((90,129));
mountain((110,129));
mountain((130,129));

mountain((60,121));
mountain((80,121));
%mountain((100,121));
mountain((120,121));
mountain((140,121));

mountain((90, 113));
mountain((110, 113));

% bridge

mountain((90, 88));
mountain((110, 88));
mountain((130, 88));

mountain((80,80));
%mountain((100,80));
mountain((120,80));
mountain((140,80));

mountain((70,72));
mountain((90,72));
%mountain((110,72));
mountain((130,72));
mountain((150,72));

mountain((80,64));
mountain((100,64));
mountain((120,64));
mountain((140,64));
%mountain((160,64));

mountain((90,56));
%mountain((110,56));
mountain((130,56));
mountain((150,56));

mountain((80,48));
mountain((100,48));
%mountain((120,48));
mountain((140,48));
mountain((160,48));

mountain((90,40));
mountain((110,40));
%mountain((130,40));
mountain((150,40));
mountain((170,40));

mountain((80,32));
mountain((100,32));
mountain((120,32));
%mountain((140,32));
%mountain((160,32));
%mountain((180,32));

mountain((90,24));
mountain((110,24));
mountain((130,24));
%mountain((150,24));
%mountain((170,22));

%mountain((120,16));
%mountain((140,16));
%mountain((160,16));
mountain((180,16));

%mountain((130,8));
%mountain((150,8));
mountain((170,8));
mountain((190,6));

bigmountain((150,10));

%mountain((120,0));
%mountain((140,0));
%mountain((160,0));
mountain((180,0));

mountain((110,-8));
mountain((130,-8));
mountain((150,-8));
mountain((170,-8));
mountain((190,-8));

mountain((100,-16));
mountain((120,-16));
mountain((140,-16));
mountain((160,-16));
mountain((180,-16));
mountain((200,-16));

mountain((110,-24));
mountain((130,-24));
mountain((150,-24));
mountain((170,-24));
mountain((190,-24));
mountain((210,-24));

mountain((100,-32));
mountain((120,-32));
mountain((140,-32));
mountain((160,-32));
mountain((180,-32));
mountain((200,-32));

mountain((90,-40));
mountain((110,-40));
mountain((130,-40));
mountain((150,-40));
%mountain((170,-40));
mountain((190,-40));

mountain((100,-48));
mountain((120,-48));

mountain((90,-56));
mountain((110,-56));
mountain((150,-60));
mountain((170,-60));
mountain((190,-60));
mountain((210,-60));

mountain((100,-64));

mountain((140,-68));
mountain((160,-68));
mountain((180,-68));
mountain((200,-68));

mountain((130,-76));
mountain((150,-76));
mountain((170,-76));
mountain((190,-76));
mountain((210,-76));

mountain((80,-84));
mountain((120,-84));
mountain((140,-84));
mountain((160,-84));
%mountain((180,-84));
mountain((200,-84));

mountain((90,-92));
mountain((110,-92));
mountain((130,-92));

mountain((80,-100));
mountain((100,-100));
mountain((120,-100));

mountain((70,-108));
mountain((90,-108));
mountain((110,-108));

mountain((60,-116));
mountain((80,-116));
mountain((100,-116));
mountain((120,-116));

mountain((70,-124));
mountain((90,-124));
mountain((110,-124));

mountain((80,-132));
mountain((100,-132));

pickup pencircle scaled 0.1pt;

%draw (-300,200)--(300,200);
%draw (-300,100)--(300,100);
%draw (-300,0)--(300,0);
%draw (-300,-100)--(300,-100);
%draw (-300,-200)--(300,-200);

%draw (-300,200)--(-300,-200);
%draw (-200,200)--(-200,-200);
%draw (-100,200)--(-100,-200);
%draw (0,200)--(0,-200);
%draw (100,200)--(100,-200);
%draw (200,200)--(200,-200);
%draw (300,200)--(300,-200);

label(btex $\times$-harbor etex, (-80,-70));
label(btex Rio Scalar etex, (0,0)) rotated 90 shifted (10, -50);

label(btex Eigen- etex, (0,0)) rotated 42 shifted (125,-62);
label(btex valley etex, (0,0)) rotated -3 shifted (170,-44);

label(btex symmetric territories etex, (0,0)) rotated 90 shifted (280,120);

z16 = (20,160);
fill z16 shifted (-45,-5) 
	--z16 shifted (45,-5)
	--z16 shifted (45,5)
	--z16 shifted (-45,5)--cycle withcolor white;
label(btex orthogonal mountains etex, z16);

path pouter;
path pinner;
pinner = (5,-4){dir 80}..(0,8)..{dir -80}(-5,-4);
pouter = (7,-4){dir 80}..(0,10)..{dir -80}(-7,-4);

z15 = 0.36[z8,z10];

pickup pencircle scaled 0.8pt;
draw pinner rotated -82 shifted z15;
draw pouter rotated -82 shifted z15;
path boundary;
boundary = pinner -- reverse pouter --cycle;
fill boundary rotated -82 shifted z15 withcolor white;
for t = 0 step 0.1 until 2.01:
	numeric s, ss;
	s = (t-1)*(t-1)*(t-1) + 1 - t;
	ss = t - 0.1 * s;
	draw point t of pinner rotated -82 shifted z15
		--point ss of pouter rotated -82 shifted z15;
endfor;

pickup pencircle scaled 0.5pt;
fill (210,-120)--(305,-120)--(305,-180)--(210,-180)--cycle withcolor white;
draw (210,-120)--(305,-120)--(305,-180)--(210,-180)--cycle;

label.rt(btex Legend etex, (212, -130));

pickup pencircle scaled 1pt;

draw (215,-142)--(235,-142) dashed evenly;
label.rt(btex trace trail etex, (240,-142));

pivot((230,-154));
label.rt(btex Pivot etex, (240, -154));

drawarrow (215,-166)--(235,-166);
label.rt(btex fast algorithm etex, (240,-166));


label(btex Gauss plains etex, (0,0)) rotated -70 shifted (-150,130);

label(btex regular dunes etex, (0,0)) rotated -65 shifted (-235,120);
label(btex singular beach etex, (0,0)) rotated -70 shifted (-230,60);

draw (-300,0){dir -60}..{right}(-200,-150)..{up}(-80,-70){down}..(100,-170)..{dir -30}(220,-200)
dashed withdots;
% dashpattern(on 3bp off 3bp on 9bp off 3bp)

path titanic;
titanic = (-50,-2)--(50,-2)--(55,7)--(-52,7)--cycle;

fill titanic shifted (-200,-150) withcolor white;
draw titanic shifted (-200,-150);
label(btex $\times$-tanic etex, (-200,-147));

path cabins;
cabins = (-45,7)--(35,7)--(34,11)--(-44,11)--cycle;
fill cabins shifted (-200,-150) withcolor white;
draw cabins shifted (-200,-150);

path chimney;
chimney = (-30,11)--(-26,11)--(-26,18)--(-30,18)--cycle;
fill chimney shifted (-200,-150) withcolor white;
draw chimney shifted (-200,-150);
fill chimney shifted (-184,-150) withcolor white;
draw chimney shifted (-184,-150);
fill chimney shifted (-168,-150) withcolor white;
draw chimney shifted (-168,-150);
fill chimney shifted (-152,-150) withcolor white;
draw chimney shifted (-152,-150);

label(btex Cramer's point etex, (0,0)) rotated -28 shifted (-130,-83);

endfig;

end
