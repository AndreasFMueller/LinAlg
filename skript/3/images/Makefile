#
# Makefile -- images for chapter 3
#
# (c) 2018 Prof Dr Andreas Müller, Hochschule Rappers
#
all:	3dimages tikzimages

3dimages:	coordsystem.pdf ebene.pdf schnittgerade.pdf \
		durchstosspunkt.pdf ebene3punkte.pdf abb.pdf \
		basis.pdf

# 
# basis oder nicht
#
basis.pdf:	basis.tex basis.jpg basis2.jpg basis3.jpg
	pdflatex basis.tex

basis.png:	basis.pov basis.inc
	povray +A0.1 -W1920 -H1080 -Obasis.png basis.pov
basis.jpg:	basis.png Makefile
	convert -extract 700x780+280+300 basis.png \
		-density 300 -units PixelsPerInch basis.jpg

basis2.png:	basis2.pov basis.inc
	povray +A0.1 -W1920 -H1080 -Obasis2.png basis2.pov
basis2.jpg:	basis2.png Makefile
	convert -extract 700x780+280+300 basis2.png \
		-density 300 -units PixelsPerInch basis2.jpg

basis3.png:	basis3.pov basis.inc
	povray +A0.1 -W1920 -H1080 -Obasis3.png basis3.pov
basis3.jpg:	basis3.png Makefile
	convert -extract 700x780+280+300 basis3.png \
		-density 300 -units PixelsPerInch basis3.jpg

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

#
# Ebene durch 3 Punkte
#
ebene3punkte.pdf:	ebene3punkte.tex ebene3punkte.jpg
	pdflatex ebene3punkte.tex

ebene3punkte.jpg:	ebene3punkte.png Makefile
	convert -extract 1200x780+200+200 ebene3punkte.png \
		-density 300 -units PixelsPerInch ebene3punkte.jpg

ebene3punkte.png:	ebene3punkte.pov
	povray +A0.1 -W1920 -H1080 -Oebene3punkte.png ebene3punkte.pov

#
# Ebene als Bild einer linearen Abbildung
#
standardebene.jpg:	standardebene.png Makefile
	convert -extract 640x640+370+400 standardebene.png \
		-density 300 -units PixelsPerInch standardebene.jpg
standardebene.png:	standardebene.pov
	povray +A0.1 -W1920 -H1080 -Ostandardebene.png standardebene.pov

abbebene.jpg:	abbebene.png Makefile
	convert -extract 1010x640+450+400 abbebene.png \
		-density 300 -units PixelsPerInch abbebene.jpg
abbebene.png:	abbebene.pov
	povray +A0.1 -W1920 -H1080 -Oabbebene.png abbebene.pov

abb.pdf:	abb.tex standardebene.jpg abbebene.jpg
	pdflatex abb.tex

#
# TikZ-Images
#

tikzimages:	parallelogramm.pdf strahlensatz.pdf addition.pdf coord2d.pdf \
	spiegelung.pdf drehung.pdf schnittpunkttableau.pdf geradeabb.pdf \
	vektor.pdf durchstosspunkttableau.pdf schnittgeradetableau.pdf \
	geradeaxb.pdf punktrichtung.pdf schnittpunkt.pdf geradeloesung.pdf \
	streckenvergleich.pdf streckenvervielfachung.pdf

#
# Vektorkonstruktionen
#
parallelogramm.pdf:	parallelogramm.tex
	pdflatex parallelogramm.tex

strahlensatz.pdf:	strahlensatz.tex
	pdflatex strahlensatz.tex

addition.pdf:	addition.tex
	pdflatex addition.tex

coord2d.pdf:	coord2d.tex
	pdflatex coord2d.tex

spiegelung.pdf:	spiegelung.tex
	pdflatex spiegelung.tex

drehung.pdf:	drehung.tex
	pdflatex drehung.tex

schnittpunkttableau.pdf:	schnittpunkttableau.tex
	pdflatex schnittpunkttableau.tex

durchstosspunkttableau.pdf:	durchstosspunkttableau.tex
	pdflatex durchstosspunkttableau.tex

schnittgeradetableau.pdf:	schnittgeradetableau.tex
	pdflatex schnittgeradetableau.tex

geradeabb.pdf:	geradeabb.tex
	pdflatex geradeabb.tex

vektor.pdf:	vektor.tex
	pdflatex vektor.tex

geradeaxb.pdf:	geradeaxb.tex
	pdflatex geradeaxb.tex

punktrichtung.pdf:	punktrichtung.tex
	pdflatex punktrichtung.tex

schnittpunkt.pdf:	schnittpunkt.tex
	pdflatex schnittpunkt.tex

geradeloesung.pdf:	geradeloesung.tex
	pdflatex geradeloesung.tex

streckenvergleich.pdf:	streckenvergleich.tex
	pdflatex streckenvergleich.tex

streckenvervielfachung.pdf:	streckenvervielfachung.tex
	pdflatex streckenvervielfachung.tex
