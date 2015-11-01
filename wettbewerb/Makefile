#
# Makefile -- aufgabenstellung für Wettbewerb
#
# (c) 2015 Prof Dr Andreas Mueller, Hochschule Rapperswil
#
aufgabe.pdf:	aufgabe.tex kubooktaeder.jpg realization.jpg \
			vereinfachung.jpg vereinfachung2.jpg
	pdflatex aufgabe.tex

vereinfachung.png:	vereinfachung.pov
	povray -A0.1 -R20 -W4096 -H4096 -Overeinfachung.png vereinfachung.pov

vereinfachung.jpg:	vereinfachung.png
	convert vereinfachung.png -resize 25% \
		-density 300 -units PixelsPerInch vereinfachung.jpg

vereinfachung2.png:	vereinfachung2.pov
	povray -A0.1 -R20 -W4096 -H4096 -Overeinfachung2.png vereinfachung2.pov

vereinfachung2.jpg:	vereinfachung2.png
	convert vereinfachung2.png -resize 25% \
		-density 300 -units PixelsPerInch vereinfachung2.jpg

h=4096
w=4096

oktaeder.png:	oktaeder.pov
	povray -A0.1 -R20 -W${w} -H${h} -Ooktaeder.png oktaeder.pov

oktaeder.jpg:	oktaeder.png
	convert oktaeder.png -resize 25% \
		-density 300 -units PixelsPerInch oktaeder.jpg

oktaeder2.png:	oktaeder2.pov
	povray -A0.1 -R20 -W${w} -H${h} -Ooktaeder2.png oktaeder2.pov

oktaeder2.jpg:	oktaeder2.png
	convert oktaeder2.png -resize 25% \
		-density 300 -units PixelsPerInch oktaeder2.jpg

kubooktaeder.png:	kubooktaeder.pov
	povray -A0.1 -R20 -W3840 -H2160 -Okubooktaeder.png kubooktaeder.pov

kubooktaeder.jpg:	kubooktaeder.png
	convert -extract 3717x1743+123+204 kubooktaeder.png -resize 50% \
		-density 300 -units PixelsPerInch kubooktaeder.jpg

# 3840
# 2160
