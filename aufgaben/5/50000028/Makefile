#
# Makefile -- Video zur Rohr-Aufgabe
#
# (c) 2019 Prof Dr Andreas Müller, Hochschule Rapperswil
#
all:	kugel.jpg video.timestamp

OPTIONS = +A0.1

kugel.png:	kugel.pov scene.inc
	povray $(OPTIONS) -W1920 -H1080 -Okugel.png kugel.pov
kugel.jpg:	kugel.png
	convert -extract 1156x1040+378+39 kugel.png 			\
		-density 300 -units PixelsPerInch kugel.jpg

video.timestamp:	roll.pov roll.ini scene.inc
	rm -rf images
	mkdir images
	povray $(OPTIONS) -W1920 -H1080 -Oimages/roll roll.ini
	touch video.timestamp
