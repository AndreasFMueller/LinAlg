#
# Makefile -- Abbildungen
#
# (c) 2018 Prof Dr Andreas Müller, Hochschule Rapperswil
#
images:	strahlensatz.pdf brennweite.pdf kamera.pdf kameraprinzip.pdf	\
	lochkamera.pdf abstrakt.pdf homogenekoordinaten.pdf geraden.pdf

strahlensatz.pdf:	strahlensatz.tex
	pdflatex strahlensatz.tex

brennweite.pdf:	brennweite.tex
	pdflatex brennweite.tex

kamera.pdf:	kamera.tex camera.png objektiv.png
	pdflatex kamera.tex

kameraprinzip.pdf:	kameraprinzip.tex
	pdflatex kameraprinzip.tex

lochkamera.pdf:	lochkamera.tex
	pdflatex lochkamera.tex

homogenekoordinaten.pdf:	homogenekoordinaten.tex
	pdflatex homogenekoordinaten.tex

abstrakt.jpg:	abstrakt.png Makefile
	convert -extract 1840x860+30+160 abstrakt.png \
		-density 300 -units PixelsPerInch abstrakt.jpg
abstrakt.png:	abstrakt.pov
	povray +A0.1 -W1920 -H1080 -Oabstrakt.png abstrakt.pov
abstrakt.pdf:	abstrakt.tex abstrakt.jpg
	pdflatex abstrakt.tex

geraden.jpg:	geraden.png Makefile
	convert -extract 1840x860+30+160 geraden.png \
		-density 300 -units PixelsPerInch geraden.jpg
geraden.png:	geraden.pov
	povray +A0.1 -W1920 -H1080 -Ogeraden.png geraden.pov
geraden.pdf:	geraden.tex geraden.jpg
	pdflatex geraden.tex
