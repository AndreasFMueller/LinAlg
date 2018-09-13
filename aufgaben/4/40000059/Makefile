#
# Makefile
#
# (c) 2018 Prof Dr Andreas Müller, Hochschule Rapperswil
#
all:	pyramid.jpg rotated.jpg

OPTIONS = +A0.1

pyramid.jpg:	pyramid.png
	convert pyramid.png -density 300 -units PixelsPerInch pyramid.jpg

pyramid.png:	pyramid.pov Makefile common.inc
	povray $(OPTIONS) -W1080 -H1080 -Opyramid.png pyramid.pov

rotated.jpg:	rotated.png
	convert rotated.png -density 300 -units PixelsPerInch rotated.jpg

rotated.png:	rotated.pov Makefile common.inc
	povray $(OPTIONS) -W1080 -H1080 -Orotated.png rotated.pov






