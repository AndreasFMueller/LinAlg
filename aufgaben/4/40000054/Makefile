#
# Makefile
#
# (c) 2018 Prof Dr Andreas Müller, Hochschule Rapperswil
#
all:	tetraeder.jpg

OPTIONS = +A0.1 

tetraeder.jpg:	tetraeder.png
	convert tetraeder.png -density 300 -units PixelsPerInch tetraeder.jpg

tetraeder.png:	tetraeder.pov Makefile
	../../../common/povray $(OPTIONS) -W1080 -H1080 -Otetraeder.png \
		tetraeder.pov
