#
# Makefile
#
# (c) 2021 Prof Dr Andreas Müller, OST Ostschweizer Fachhochschule
#
all: plane.pdf

images:	jpg

jpg:	plane1.jpg plane2.jpg plane3.jpg

plane.inc:	plane.obj obj2mesh2
	bash obj2mesh2 plane.obj plane.inc

AUSSCHNITT=1400x1040+246+0

plane1.png:	plane1.pov common.inc plane-common.inc plane.inc
	povray +A0.1 -W1920 -H1080 -Oplane1.png plane1.pov

plane1.jpg:	plane1.png Makefile
	convert -extract $(AUSSCHNITT)  plane1.png \
		-density 300 -units PixelsPerInch \
		plane1.jpg

plane2.png:	plane2.pov common.inc plane-common.inc plane.inc matrix2.inc
	povray +A0.1 -W1920 -H1080 -Oplane2.png plane2.pov

plane2.jpg:	plane2.png Makefile
	convert -extract $(AUSSCHNITT)  plane2.png \
		-density 300 -units PixelsPerInch \
		plane2.jpg

plane3.png:	plane3.pov common.inc plane-common.inc plane.inc matrix3.inc
	povray +A0.1 -W1920 -H1080 -Oplane3.png plane3.pov

plane3.jpg:	plane3.png Makefile
	convert -extract $(AUSSCHNITT)  plane3.png \
		-density 300 -units PixelsPerInch \
		plane3.jpg

matrix2.inc matrix3.inc:	r.m
	octave r.m

plane.pdf:	plane.tex plane1.jpg plane2.jpg
	pdflatex plane.tex
