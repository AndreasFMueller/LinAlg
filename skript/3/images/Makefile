#
# Makefile -- images for chapter 3
#
# (c) 2018 Prof Dr Andreas Müller, Hochschule Rappers
#
all:	coordsystem.pdf ebene.pdf schnittgerade.pdf durchstosspunkt.pdf

#
# Coordinate system
#
coordsystem.pdf:	coordsystem.tex coordsystem.jpg
	pdflatex coordsystem.tex

coordsystem.jpg:	coordsystem.png Makefile
	convert -extract 1800x1080+0+0 coordsystem.png \
		-density 300 -units PixelsPerInch coordsystem.jpg

coordsystem.png:	coordsystem.pov
	povray +A0.1 -W1920 -H1080 -Ocoordsystem.png coordsystem.pov

#
# Ebene
#
ebene.pdf:	ebene.tex ebene.jpg
	pdflatex ebene.tex

ebene.jpg:	ebene.png Makefile
	convert -extract 1900x860+20+220 ebene.png \
		-density 300 -units PixelsPerInch ebene.jpg

ebene.png:	ebene.pov
	povray +A0.1 -W1920 -H1080 -Oebene.png ebene.pov

#
# Schnittgerade
#
schnittgerade.pdf:	schnittgerade.tex schnittgerade.jpg
	pdflatex schnittgerade.tex

schnittgerade.jpg:	schnittgerade.png Makefile
	convert -extract 1880x1080+4+0 schnittgerade.png \
		-density 300 -units PixelsPerInch schnittgerade.jpg

schnittgerade.png:	schnittgerade.pov
	povray +A0.1 -W1920 -H1080 -Oschnittgerade.png schnittgerade.pov

#
# Durchstosspunkt
#
durchstosspunkt.pdf:	durchstosspunkt.tex durchstosspunkt.jpg
	pdflatex durchstosspunkt.tex

durchstosspunkt.jpg:	durchstosspunkt.png Makefile
	convert -extract 1464x1080+180+0 durchstosspunkt.png \
		-density 300 -units PixelsPerInch durchstosspunkt.jpg

durchstosspunkt.png:	durchstosspunkt.pov
	povray +A0.1 -W1920 -H1080 -Odurchstosspunkt.png durchstosspunkt.pov

