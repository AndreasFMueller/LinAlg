%
% morley.mp -- Morley triangle graph
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
	pickup pencircle scaled 4pt;
	draw z;
	pickup pencircle scaled 2pt;
	draw z withcolor white;
enddef;

beginfig(1)

z0 = (0,0);
z1 = (260, 30);
z2 = (100, 180);

numeric alpha, beta, gamma;
alpha = angle(z2) - angle(z1);
beta = -angle(z1 - z2) + angle(z1);
gamma = 180 - alpha - beta;
show alpha;
show beta;
show gamma;

z3 = (z1 - z0) rotated (alpha/3);

path aone, atwo;
aone := z0--((z1 - z0) rotated (alpha/3) shifted z0);
atwo := z0--((z1 - z0) rotated (2 * alpha/3) shifted z0);

path bone, btwo;
bone := z1--((z2 - z1) rotated (beta/3) shifted z1);
btwo := z1--((z2 - z1) rotated (2 * beta/3) shifted z1);

path cone, ctwo;
cone := z2--((z0 - z2) rotated (gamma/3) shifted z2);
ctwo := z2--((z0 - z2) rotated (2 * gamma/3) shifted z2);

z10 = aone intersectionpoint btwo;
z11 = bone intersectionpoint ctwo;
z12 = cone intersectionpoint atwo;


pickup pencircle scaled 1pt;

draw z0--z1--z2--cycle;

fill z10--z11--z12--cycle withcolor (1,0.8,0.8);
draw z10--z11--z12--cycle;

pickup pencircle scaled 0.7pt;

draw z0--z10;
draw z0--z12;
draw z1--z10;
draw z1--z11;
draw z2--z11;
draw z2--z12;

punkt(z0);
punkt(z1);
punkt(z2);

punkt(z10);
punkt(z11);
punkt(z12);

label.lft(btex $A\mathstrut$ etex, z0);
label.rt(btex $B\mathstrut$ etex, z1);
label.top(btex $C\mathstrut$ etex, z2);

label.urt(btex $E\mathstrut$ etex, z11);
label.ulft(btex $F\mathstrut$ etex, z12);
label.bot(btex $G\mathstrut$ etex, z10);

label.ulft(btex $\delta_1\mathstrut$ etex, z11) shifted (-1,-1);
label.urt(btex $\delta_2\mathstrut$ etex, z12) shifted (0.5,1);
label.bot(btex $\delta_3\mathstrut$ etex, z12) shifted (0,-1);
label.lft(btex $\delta_4\mathstrut$ etex, z10) shifted (-1.5,2.5);
label.urt(btex $\delta_5\mathstrut$ etex, z10) shifted (1.5,-2.5);
label.bot(btex $\delta_6\mathstrut$ etex, z11) shifted (3,0);

label(btex $\triangle_A$ etex, (z0 + z10 + z12)/3);
label(btex $\triangle_B$ etex, (z1 + z11 + z10)/3);
label(btex $\triangle_C$ etex, (z2 + z12 + z11)/3);

label(btex $\frac{\alpha}3$ etex, (0.15 * (z1 - z0) rotated (alpha/6) shifted z0));
label(btex $\frac{\alpha}3$ etex, (0.15 * (z1 - z0) rotated (3 * alpha/6) shifted z0));
label(btex $\frac{\alpha}3$ etex, (0.15 * (z1 - z0) rotated (5 * alpha/6) shifted z0));

label(btex $\frac{\beta}3$ etex, (0.25 * (z2 - z1) rotated (beta/6) shifted z1));
label(btex $\frac{\beta}3$ etex, (0.25 * (z2 - z1) rotated (3 * beta/6) shifted z1));
label(btex $\frac{\beta}3$ etex, (0.25 * (z2 - z1) rotated (5 * beta/6) shifted z1));

label(btex $\frac{\gamma}3$ etex, (0.15 * (z0 - z2) rotated (gamma/6) shifted z2));
label(btex $\frac{\gamma}3$ etex, (0.15 * (z0 - z2) rotated (3 * gamma/6) shifted z2));
label(btex $\frac{\gamma}3$ etex, (0.15 * (z0 - z2) rotated (5 * gamma/6) shifted z2));

endfig;

end
