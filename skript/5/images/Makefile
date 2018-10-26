#
# Makefile -- build images for chapter 5
#
# (c) 2018 Prof Dr Andreas Müller, Hochschule Rapperswil
#
all:	flaeche.pdf volumen.pdf vektorprodukt.pdf windschief.pdf \
	abstand.pdf schuhbaendel.pdf dreieck.pdf beispiel.pdf

flaeche.pdf:	flaeche.tex
	pdflatex flaeche.tex

schuhbaendel.pdf:	schuhbaendel.tex
	pdflatex schuhbaendel.tex

dreieck.pdf:	dreieck.tex
	pdflatex dreieck.tex

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

#
# Vektorprodukt
#
vektorprodukt.pdf:	vektorprodukt.tex vektorprodukt.jpg
	pdflatex vektorprodukt.tex

vektorprodukt.jpg:	vektorprodukt.png
	convert -extract 1000x1024+360+10 vektorprodukt.png \
		-density 300 -units PixelsPerInch vektorprodukt.jpg

vektorprodukt.png:	vektorprodukt.pov
	povray +A0.1 -W1920 -H1080 -Ovektorprodukt.png vektorprodukt.pov

#
# Windschief
#
windschief.pdf:	windschief.tex windschief.jpg
	pdflatex windschief.tex

windschief.jpg:	windschief.png
	convert -extract 1420x1080+500+0 windschief.png \
		-density 300 -units PixelsPerInch windschief.jpg

windschief.png:	windschief.pov
	povray +A0.1 -W1920 -H1080 -Owindschief.png windschief.pov

#
# Abstand
#
abstand.pdf:	abstand.tex abstand.jpg
	pdflatex abstand.tex

abstand.jpg:	abstand.png
	convert -extract 1420x700+0+200 abstand.png \
		-density 300 -units PixelsPerInch abstand.jpg

abstand.png:	abstand.pov
	povray +A0.1 -W1920 -H1080 -Oabstand.png abstand.pov

#
# Beispiel in Kapitel 5.1
#
beispiel.pdf:	beispiel.tex beispiel.jpg
	pdflatex beispiel.tex

beispiel.jpg:	beispiel.png Makefile
	convert -extract 1750x780+170+200 beispiel.png \
		-density 300 -units PixelsPerInch beispiel.jpg

beispiel.png:	beispiel.pov
	povray +A0.1 -W1920 -H1080 -Obeispiel.png beispiel.pov

