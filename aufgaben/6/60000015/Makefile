#
# Makefile
#
# (c) 2018 Prof Dr Andreas Müller, Hochschule Rapperswil
#
all:	inside.jpg box.jpg

OPTIONS = +A0.1 

box.jpg:	box.png
	convert box.png -density 300 -units PixelsPerInch box.jpg

inside.jpg:	inside.png
	convert inside.png -density 300 -units PixelsPerInch inside.jpg

box.png:	box.pov common.inc Makefile
	povray $(OPTIONS) -W1080 -H1080 -Obox.png box.pov

inside.png:	inside.pov common.inc Makefile
	povray $(OPTIONS) -W1920 -H1080 -Oinside.png inside.pov

