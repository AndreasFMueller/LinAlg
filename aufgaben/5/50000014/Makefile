#
# Makefile -- build tube image
#
# (c) 2016 Prof Dr Andreas Mueller, Hochschule Rapperswil
#
width=2048
height=2048

all:	tubes.jpg intersect.jpg inside.jpg

tubes.png:	tubes.pov common.inc
	povray +A0.1 +H${height} +W${width} +Otubes.png tubes.pov

intersect.png:	intersect.pov common.inc
	povray +A0.1 +H${height} +W${width} +Ointersect.png intersect.pov

inside.png:	inside.pov common.inc
	povray +A0.1 +H${height} +W${width} +Oinside.png inside.pov

tubes.jpg:	tubes.png
	convert tubes.png -resize 50% -density 300 -units PixelsPerInch \
		tubes.jpg; 

intersect.jpg:	intersect.png
	convert intersect.png -resize 50% -density 300 -units PixelsPerInch \
		intersect.jpg; 

inside.jpg:	inside.png
	convert inside.png -resize 50% -density 300 -units PixelsPerInch \
		inside.jpg; 
