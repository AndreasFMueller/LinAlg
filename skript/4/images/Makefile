#
# Makefile -- TikZ images for chapter 4
#
# (c) 2018 Prof Dr Andreas Müller, Hochschule Rapperswil
#

all:	projektion.pdf linearitaet.pdf skalarprodukt.pdf spiegelung.pdf \
	tangente.pdf thales.pdf tangentepunkt.pdf \
	normalenform.pdf linreg.pdf kreis.pdf bewegung.pdf

projektion.pdf:	projektion.tex
	pdflatex projektion.tex

linearitaet.pdf:	linearitaet.tex
	pdflatex linearitaet.tex

skalarprodukt.pdf:	skalarprodukt.tex
	pdflatex skalarprodukt.tex

spiegelung.pdf:	spiegelung.tex
	pdflatex spiegelung.tex

tangente.pdf:	tangente.tex
	pdflatex tangente.tex

thales.pdf:	thales.tex
	pdflatex thales.tex

normalenform.png:	normalenform.pov
	povray +A0.1 -W1920 -H1080 -Onormalenform.png normalenform.pov

normalenform.jpg:	normalenform.png Makefile
	convert -extract 1792x774+15+206 normalenform.png \
		-density 300 -units PixelsPerInch normalenform.jpg

normalenform.pdf:	normalenform.tex normalenform.jpg
	pdflatex normalenform.tex

tangentepunkt.pdf:	tangentepunkt.tex
	pdflatex tangentepunkt.tex

linreg.pdf:	linreg.tex linreg.pkt
	pdflatex linreg.tex
linreg.pkt:	linreg.m
	octave linreg.m

kreis.pdf:	kreis.tex kreis.pkt
	pdflatex kreis.tex
kreis.pkt:	kreis.m
	octave kreis.m

bewegung.pdf:	bewegung.tex bewegung.pkt
	pdflatex bewegung.tex
bewegung.pkt:	bewegung.m
	octave bewegung.m

