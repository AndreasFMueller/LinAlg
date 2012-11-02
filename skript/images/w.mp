beginfig(1)
\verbatimtex
\documentclass{article}
\usepackage{times}
\usepackage{amsmath}
\usepackage{amssymb}
\usepackage{amsfonts}
\begin{document}
etex;
% phi_0,0

pickup pencircle scaled 0.5pt;
draw (-5,0)..(261,0);
draw (0,-5)..(0,105);

fill (0,0)--(0,100)--(256,100)--(256,0)--cycle withcolor (0.9,0.9,0.9);

pickup pencircle scaled 2pt;
draw (0,100)..(256,100);
pickup pencircle scaled 0.1pt;
draw (0,0)..(0,100);
draw (256,0)..(256,100);


endfig;

beginfig(2)
% phi_1,0

pickup pencircle scaled 0.5pt;
draw (-5,0)..(261,0);
draw (0,-5)..(0,105);

fill (0,0)--(0,100)--(128,100)--(128,0)--cycle withcolor (0.9,0.9,0.9);

pickup pencircle scaled 2pt;
draw (0,100)..(128,100);
draw (128,0)..(256,0);
pickup pencircle scaled 0.1pt;
draw (0,0)..(0,100);
draw (128,0)..(128,100);

endfig;

beginfig(3)
% phi_1,1

pickup pencircle scaled 0.5pt;
draw (-5,0)..(261,0);
draw (0,-5)..(0,105);

fill (256,0)--(256,100)--(128,100)--(128,0)--cycle withcolor (0.9,0.9,0.9);

pickup pencircle scaled 2pt;
draw (0,0)..(128,0);
draw (128,100)..(256,100);
pickup pencircle scaled 0.1pt;
draw (128,0)..(128,100);
draw (256,0)..(256,100);

endfig;

beginfig(4)
% psi_1,0

pickup pencircle scaled 0.5pt;
draw (-5,0)..(261,0);
draw (0,-5)..(0,105);

fill (0,0)--(0,100)--(64,100)--(64,0)--cycle withcolor (0.9,0.9,0.9);

pickup pencircle scaled 2pt;
draw (0,100)..(64,100);
draw (64,0)..(256,0);
pickup pencircle scaled 0.1pt;
draw (0,0)..(0,100);
draw (64,0)..(64,100);

endfig;

beginfig(5)

pickup pencircle scaled 0.5pt;
draw (-5,0)..(261,0);
draw (0,-5)..(0,105);

fill (64,0)--(64,100)--(128,100)--(128,0)--cycle withcolor (0.9,0.9,0.9);

pickup pencircle scaled 2pt;
draw (0,0)..(64,0);
draw (64,100)..(128,100);
draw (128,0)..(256,0);
pickup pencircle scaled 0.1pt;
draw (64,0)..(64,100);
draw (128,0)..(128,100);

endfig;

beginfig(6)

pickup pencircle scaled 0.5pt;
draw (-5,0)..(261,0);
draw (0,-5)..(0,105);

fill (128,0)--(128,100)--(192,100)--(192,0)--cycle withcolor (0.9,0.9,0.9);

pickup pencircle scaled 2pt;
draw (0,0)..(128,0);
draw (128,100)..(192,100);
draw (192,0)..(256,0);
pickup pencircle scaled 0.1pt;
draw (128,0)..(128,100);
draw (192,0)..(192,100);

endfig;

beginfig(7)

pickup pencircle scaled 0.5pt;
draw (-5,0)..(261,0);
draw (0,-5)..(0,105);

fill (192,0)--(192,100)--(256,100)--(256,0)--cycle withcolor (0.9,0.9,0.9);

pickup pencircle scaled 2pt;
draw (0,0)..(192,0);
draw (192,100)..(256,100);
pickup pencircle scaled 0.1pt;
draw (192,0)..(192,100);
draw (256,0)..(256,100);

endfig;

beginfig(8)
% psi_1,0

pickup pencircle scaled 0.5pt;
draw (-5,0)..(261,0);
draw (0,-105)..(0,105);

fill (0,0)--(0,100)--(128,100)--(128,0)--cycle withcolor (0.9,0.9,0.9);
fill (256,0)--(256,-100)--(128,-100)--(128,0)--cycle withcolor (0.9,0.9,0.9);

pickup pencircle scaled 2pt;
draw (0,100)..(128,100);
draw (128,-100)..(256,-100);
pickup pencircle scaled 0.1pt;
draw (0,0)..(0,100);
draw (128,100)..(128,-100);
draw (256,0)..(256,-100);

endfig;

beginfig(9)
% psi_2,0
pickup pencircle scaled 0.5pt;
draw (-5,0)..(261,0);
draw (0,-150)..(0,150);
fill (0,0)--(0,141.42)--(64,141.42)--(64,0)--cycle withcolor (0.9,0.9,0.9);
fill (128,0)--(128,-141.42)--(64,-141.42)--(64,0)--cycle withcolor (0.9,0.9,0.9);
pickup pencircle scaled 2pt;
draw (0,141.42)..(64,141.42);
draw (64,-141.42)..(128,-141.42);
draw (128,0)..(256,0);
pickup pencircle scaled 0.1pt
draw (0,0)..(0,141.42);
draw (64,141.42)..(64,-141.42);
draw (128,-141.42)..(128,0);
endfig;

beginfig(10)
% psi_2,1
pickup pencircle scaled 0.5pt;
draw (-5,0)..(261,0);
draw (0,-150)..(0,150);
fill (128,0)--(128,141.42)--(192,141.42)--(192,0)--cycle withcolor(0.9,0.9,0.9);
fill (256,0)--(256,-141.42)--(192,-141.42)--(192,0)--cycle withcolor(0.9,0.9,0.9);
pickup pencircle scaled 2pt;
draw (0,0)..(128,0);
draw (128,141.42)..(192,141.42);
draw (192,-141.42)..(256,-141.42);
pickup pencircle scaled 0.1pt
draw (128,0)..(128,141.42);
draw (192,141.42)..(192,-141.42);
draw (256,-141.42)..(256,0);
endfig;

beginfig(11)
pickup pencircle scaled 0.5pt;
draw (-5,0)..(261,0);
draw (0,-205)..(0,205);
fill (0,0)--(0,200)--(32,200)--(32,0)--cycle withcolor(0.9,0.9,0.9);
fill (64,0)--(64,-200)--(32,-200)--(32,0)--cycle withcolor(0.9,0.9,0.9);
pickup pencircle scaled 2pt;
draw (0,200)..(32,200);
draw (32,-200)..(64,-200);
draw (64,0)..(256,0);
pickup pencircle scaled 0.1pt
draw (0,0)..(0,200);
draw (32,200)..(32,-200);
draw (64,-200)..(64,0);
endfig;

beginfig(12)
pickup pencircle scaled 0.5pt;
draw (-5,0)..(261,0);
draw (0,-205)..(0,205);
fill (64,0)--(64,200)--(96,200)--(96,0)--cycle withcolor(0.9,0.9,0.9);
fill (128,0)--(128,-200)--(96,-200)--(96,0)--cycle withcolor(0.9,0.9,0.9);
pickup pencircle scaled 2pt;
draw (0,0)..(64,0);
draw (64,200)..(96,200);
draw (96,-200)..(128,-200);
draw (128,0)..(256,0);
pickup pencircle scaled 0.1pt
draw (64,0)..(64,200);
draw (96,200)..(96,-200);
draw (128,-200)..(128,0);
endfig;

beginfig(13)
pickup pencircle scaled 0.5pt;
draw (-5,0)..(261,0);
draw (0,-205)..(0,205);
fill (128,0)--(128,200)--(160,200)--(160,0)--cycle withcolor(0.9,0.9,0.9);
fill (192,0)--(192,-200)--(160,-200)--(160,0)--cycle withcolor(0.9,0.9,0.9);
pickup pencircle scaled 2pt;
draw (0,0)..(128,0);
draw (128,200)..(160,200);
draw (160,-200)..(192,-200);
draw (192,0)..(256,0);
pickup pencircle scaled 0.1pt
draw (128,0)..(128,200);
draw (160,200)..(160,-200);
draw (192,-200)..(192,0);
endfig;

beginfig(14)
pickup pencircle scaled 0.5pt;
draw (-5,0)..(261,0);
draw (0,-205)..(0,205);
fill (192,0)--(192,200)--(224,200)--(224,0)--cycle withcolor(0.9,0.9,0.9);
fill (256,0)--(256,-200)--(224,-200)--(224,0)--cycle withcolor(0.9,0.9,0.9);
pickup pencircle scaled 2pt;
draw (0,0)..(192,0);
draw (192,200)..(224,200);
draw (224,-200)..(256,-200);
pickup pencircle scaled 0.1pt
draw (192,0)..(192,200);
draw (224,200)..(224,-200);
draw (256,-200)..(256,0);
endfig;

end
