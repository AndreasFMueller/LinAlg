#
# Makefile -- build tube image
#
# (c) 2016 Prof Dr Andreas Mueller, Hochschule Rapperswil
#
width=2048
height=2048

all:	tubes.jpg intersect.jpg

tubes.png:	tubes.pov
	povray +A0.1 +H${height} +W${width} +Otubes.png tubes.pov

intersect.png:	intersect.pov
	povray +A0.1 +H${height} +W${width} +Ointersect.png intersect.pov

tubes.jpg:	tubes.png
	convert tubes.png -resize 50% -density 300 -units PixelsPerInch \
		tubes.jpg; 

intersect.jpg:	intersect.png
	convert intersect.png -resize 50% -density 300 -units PixelsPerInch \
		intersect.jpg; 
