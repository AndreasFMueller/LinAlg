#
# Makefile
#
# (c) 2018 Prof Dr Andreas Müller, Hochschule Rapperswil
#
all:	dodekaeder.jpg

OPTIONS = +A0.1 

dodekaeder.jpg:	dodekaeder.png
	convert dodekaeder.png -density 300 -units PixelsPerInch dodekaeder.jpg

dodekaeder.png:	dodekaeder.pov Makefile
	../../../common/povray $(OPTIONS) -W1080 -H1080 -Ododekaeder.png \
		dodekaeder.pov
