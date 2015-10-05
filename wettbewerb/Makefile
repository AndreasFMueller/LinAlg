#
# Makefile -- aufgabenstellung für Wettbewerb
#
# (c) 2015 Prof Dr Andreas Mueller, Hochschule Rapperswil
#
aufgabe.pdf:	aufgabe.tex kubooktaeder.jpg realization.jpg
	pdflatex aufgabe.tex

kubooktaeder.png:	kubooktaeder.pov
	povray -A0.1 -R20 -W3840 -H2160 kubooktaeder.pov

kubooktaeder.jpg:	kubooktaeder.png
	convert -extract 3717x1743+123+204 kubooktaeder.png -resize 50% \
		-density 300 -units PixelsPerInch kubooktaeder.jpg

# 3840
# 2160
