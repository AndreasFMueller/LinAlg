#
# Makefile -- build bubble chamber problem
#
# (c) 2018 Prof Dr Andreas Müller, Hochschule Rapperswil
#

all:	chamber.jpg capture.jpg

OPTIONS = +A0.1

chamber.jpg:	chamber.png
	convert chamber.png -density 300 -units PixelsPerInch chamber.jpg

chamber.png:	chamber.pov common.inc Makefile
	povray $(OPTIONS) -W1080 -H1080 -Ochamber.png chamber.pov

capture.jpg:	capture.png
	convert capture.png -density 300 -units PixelsPerInch capture.jpg

capture.png:	capture.pov common.inc Makefile
	povray $(OPTIONS) -W1980 -H1080 -Ocapture.png capture.pov

bubble:	bubble.m
	octave bubble.m
