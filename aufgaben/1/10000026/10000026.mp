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

z0 = (0,0);
z1 = (-50, 50);
z2 = ( 50, 50);
z3 = (-50,-50);
z4 = ( 50,-50);

pickup pencircle scaled 1.5pt;
draw z1--z2;
draw z2--z4;
draw z3--z4;
draw z1--z3;

draw z1--z4;
pickup pencircle scaled 4pt;
draw z2--z3 withcolor(1,1,1); 
pickup pencircle scaled 1.5pt;
draw z2--z3;

% draw nodes
pickup pencircle scaled 15pt;
draw z1;
draw z2;
draw z3;
draw z4;
pickup pencircle scaled 13pt;
draw z1 withcolor(1,1,1);
draw z2 withcolor(1,1,1);
draw z3 withcolor(1,1,1);
draw z4 withcolor(1,1,1);

label(btex 1 etex, z1);
label(btex 2 etex, z2);
label(btex 3 etex, z3);
label(btex 4 etex, z4);

label.top(btex 1 etex, 0.5[z1,z2]);
label.lft(btex 2 etex, 0.5[z1,z3]);
label.urt(btex 3 etex, 0.3[z1,z4]);
label.ulft(btex 4 etex, 0.3[z2,z3]);
label.rt(btex 5 etex, 0.5[z2,z4]);
label.bot(btex 6 etex, 0.5[z3,z4]);

endfig;

beginfig(2)

z0 = (0,0);
z1 = (-50, 50);
z2 = ( 50, 50);
z3 = (-50,-50);
z4 = ( 50,-50);

pickup pencircle scaled 1.5pt;
draw z1--z2 withcolor red;
draw z2--z4;
draw z3--z4;
draw z1--z3 withcolor red;

draw z1--z4;
pickup pencircle scaled 4pt;
draw z2--z3 withcolor(1,1,1); 
pickup pencircle scaled 1.5pt;
draw z2--z3 withcolor red;

% draw nodes
pickup pencircle scaled 15pt;
draw z1;
draw z2;
draw z3;
draw z4;
pickup pencircle scaled 13pt;
draw z1 withcolor(1,1,1);
draw z2 withcolor(1,1,1);
draw z3 withcolor(1,1,1);
draw z4 withcolor(1,1,1);

label(btex 1 etex, z1);
label(btex 2 etex, z2);
label(btex 3 etex, z3);
label(btex 4 etex, z4);

label.top(btex 1 etex, 0.5[z1,z2]);
label.lft(btex 2 etex, 0.5[z1,z3]);
label.urt(btex 3 etex, 0.3[z1,z4]);
label.ulft(btex 4 etex, 0.3[z2,z3]);
label.rt(btex 5 etex, 0.5[z2,z4]);
label.bot(btex 6 etex, 0.5[z3,z4]);

endfig;

beginfig(3)

z0 = (0,0);
z1 = (-50, 50);
z2 = ( 50, 50);
z3 = (-50,-50);
z4 = ( 50,-50);

pickup pencircle scaled 1.5pt;
draw z1--z2 withcolor red;
draw z2--z4 withcolor red;
draw z3--z4;
draw z1--z3;

draw z1--z4 withcolor red;
pickup pencircle scaled 4pt;
draw z2--z3 withcolor(1,1,1); 
pickup pencircle scaled 1.5pt;
draw z2--z3;

% draw nodes
pickup pencircle scaled 15pt;
draw z1;
draw z2;
draw z3;
draw z4;
pickup pencircle scaled 13pt;
draw z1 withcolor(1,1,1);
draw z2 withcolor(1,1,1);
draw z3 withcolor(1,1,1);
draw z4 withcolor(1,1,1);

label(btex 1 etex, z1);
label(btex 2 etex, z2);
label(btex 3 etex, z3);
label(btex 4 etex, z4);

label.top(btex 1 etex, 0.5[z1,z2]);
label.lft(btex 2 etex, 0.5[z1,z3]);
label.urt(btex 3 etex, 0.3[z1,z4]);
label.ulft(btex 4 etex, 0.3[z2,z3]);
label.rt(btex 5 etex, 0.5[z2,z4]);
label.bot(btex 6 etex, 0.5[z3,z4]);

endfig;

beginfig(4)

z0 = (0,0);
z1 = (-50, 50);
z2 = ( 50, 50);
z3 = (-50,-50);
z4 = ( 50,-50);

pickup pencircle scaled 1.5pt;
draw z1--z2;
draw z2--z4;
draw z3--z4 withcolor red;
draw z1--z3 withcolor red;

draw z1--z4 withcolor red;
pickup pencircle scaled 4pt;
draw z2--z3 withcolor(1,1,1); 
pickup pencircle scaled 1.5pt;
draw z2--z3;

% draw nodes
pickup pencircle scaled 15pt;
draw z1;
draw z2;
draw z3;
draw z4;
pickup pencircle scaled 13pt;
draw z1 withcolor(1,1,1);
draw z2 withcolor(1,1,1);
draw z3 withcolor(1,1,1);
draw z4 withcolor(1,1,1);

label(btex 1 etex, z1);
label(btex 2 etex, z2);
label(btex 3 etex, z3);
label(btex 4 etex, z4);

label.top(btex 1 etex, 0.5[z1,z2]);
label.lft(btex 2 etex, 0.5[z1,z3]);
label.urt(btex 3 etex, 0.3[z1,z4]);
label.ulft(btex 4 etex, 0.3[z2,z3]);
label.rt(btex 5 etex, 0.5[z2,z4]);
label.bot(btex 6 etex, 0.5[z3,z4]);

endfig;

end
