verbatimtex
\documentclass{article}
\usepackage{times}
\usepackage{amsmath}
\usepackage{amssymb}
\usepackage{amsfonts}
\usepackage{txfonts}
\begin{document}
etex;

beginfig(1)

numeric u;
u = 20;

def f(expr t) =
	(0.085786 - 2.103553 * cosd(t) + 4.871320 * sind(t))
enddef;

pickup pencircle scaled 0.1pt;

for y = -6 step 1 until 6:
	draw (-5,y * u)--(365,y * u) withcolor 0.9;
endfor;
for x = 0 step 45 until 360:
	draw (x, -6 * u - 5)--(x, 6 * u + 5) withcolor 0.9;
endfor;

label.llft(btex $\frac{\pi}4$ etex, (45, 0));
label.llft(btex $\frac{\pi}2$ etex, (90, 0));
label.llft(btex $\frac{3\pi}4$ etex, (135, 0));
label.llft(btex $\pi$ etex, (180, 0));
label.llft(btex $\frac{5\pi}4$ etex, (225, 0));
label.llft(btex $\frac{6\pi}4$ etex, (270, 0));
label.llft(btex $\frac{7\pi}4$ etex, (315, 0));
label.llft(btex $2\pi$ etex, (360, 0));

pickup pencircle scaled 1.5pt;

draw (0, f(0) * u)
for t = 1 step 1 until 360:
	--(t, f(t) * u)
endfor;

pickup pencircle scaled 1pt;

drawarrow (-10,0)--(370,0);
drawarrow (0,-6*u-11)--(0, 6 * u + 10);

pickup pencircle scaled 0.1pt;
draw (  0,0)--(  0,-2 * u) withcolor red;
draw ( 45,0)--( 45, 2 * u) withcolor red;
draw ( 90,0)--( 90, 5 * u) withcolor red;
draw (135,0)--(135, 5 * u) withcolor red;

pickup pencircle scaled 4pt;
draw (  0,-2 * u) withcolor red;
draw ( 45, 2 * u) withcolor red;
draw ( 90, 5 * u) withcolor red;
draw (135, 5 * u) withcolor red;

pickup pencircle scaled 1pt;
for x = 0 step 45 until 360:
	draw (x,2)--(x,-2);
endfor;

label.ulft(btex $t$ etex, (370,0));
label.lrt(btex $f(t)$ etex, (0,6 * u + 10));

endfig;

end
