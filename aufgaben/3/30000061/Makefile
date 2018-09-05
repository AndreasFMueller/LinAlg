#
# Makefile
#
# (c) 2018 Prof Dr Andreas Müller, Hochschule Rapperswil
#
all:	ebenen.jpg

check.txt:	check.m
	octave check.m > check.txt

ebenen.png:	ebenen.pov
	povray +A0.1 -W1920 -H1080 -Oebenen.png ebenen.pov

ebenen.jpg:	ebenen.png
	convert ebenen.png -density 300 -units PixelsPerInch ebenen.jpg


