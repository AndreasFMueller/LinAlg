#
# Makefile -- build image for rotation problem
#
# (c) 2018 Prof Dr Andreas Müller, Hochschule Rapperswil
#

all:	left.jpg right.jpg

OPTIONS = +A0.1

left.jpg:	left.png
	convert left.png -density 300 -units PixelsPerInch left.jpg

left.png:	left.pov common.inc Makefile left.inc
	povray $(OPTIONS) -W1080 -H1080 -Oleft.png left.pov

right.jpg:	right.png
	convert right.png -density 300 -units PixelsPerInch right.jpg

right.png:	right.pov common.inc Makefile right.inc
	povray $(OPTIONS) -W1080 -H1080 -Oright.png right.pov

left.inc right.inc:	dekaeder.m
	octave < dekaeder.m
