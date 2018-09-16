#
# Makefile
#
# (c) 2018 Prof Dr Andreas Müller, Hochschule Rapperswil
#
all:	oktaeder.jpg

OPTIONS = +A0.1 

oktaeder.jpg:	oktaeder.png
	convert oktaeder.png -density 300 -units PixelsPerInch oktaeder.jpg

oktaeder.png:	oktaeder.pov Makefile
	../../../common/povray $(OPTIONS) -W1080 -H1080 -Ooktaeder.png \
		oktaeder.pov
