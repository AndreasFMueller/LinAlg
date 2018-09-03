#
# Makefile -- build images for chapter 5
#
# (c) 2018 Prof Dr Andreas Müller, Hochschule Rapperswil
#
all:	flaeche.pdf volumen.pdf

flaeche.pdf:	flaeche.tex
	pdflatex flaeche.tex

#
# Volumen
#
volumen.pdf:	volumen.tex volumen1.jpg volumen2.jpg
	pdflatex volumen.tex

volumen1.png:	volumen1.pov volumen.inc
	povray +A0.1 -W1920 -H1080 -Ovolumen1.png volumen1.pov
volumen2.png:	volumen2.pov volumen.inc
	povray +A0.1 -W1920 -H1080 -Ovolumen2.png volumen2.pov

volumen1.jpg:	volumen1.png Makefile
	convert -extract 980x1080+515+0 volumen1.png \
		-density 300 -units PixelsPerInch volumen1.jpg
volumen2.jpg:	volumen2.png Makefile
	convert -extract 980x1080+515+0 volumen2.png \
		-density 300 -units PixelsPerInch volumen2.jpg

