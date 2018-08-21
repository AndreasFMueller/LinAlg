#
# Makefile
#
# (c) 2018 Prof Dr Andreas Müller, Hochschule Rapperswil
#
all:	ebene.jpg

algebra:
	maxima -b p.m

OPTIONS = +A0.1

ebene.jpg:	ebene.png
	convert ebene.png -density 300 -units PixelsPerInch ebene.jpg

ebene.png:	ebene.pov Makefile
	povray $(OPTIONS) -W1080 -H1080 -Oebene.png ebene.pov

