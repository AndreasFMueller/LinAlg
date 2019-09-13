#
# Makefile
#
# (c) 2019 Prof Dr Andreas Müller
#
all:	uhr8.jpg uhr9.jpg view8.jpg view9.jpg

OPTIONS = +A0.1

uhr8.jpg:	uhr8.png
	convert uhr8.png -density 300 -units PixelsPerInch uhr8.jpg

uhr8.png:	uhr8.pov uhr.inc scene.inc common.inc camera.inc
	povray $(OPTIONS) -W1000 -H1000 -Ouhr8.png uhr8.pov

uhr9.jpg:	uhr9.png
	convert uhr9.png -density 300 -units PixelsPerInch uhr9.jpg

uhr9.png:	uhr9.pov uhr.inc scene.inc common.inc camera.inc
	povray $(OPTIONS) -W1000 -H1000 -Ouhr9.png uhr9.pov


view8.jpg:	view8.png
	convert view8.png -density 300 -units PixelsPerInch view8.jpg

view8.png:	view8.pov view.inc scene.inc common.inc 
	povray $(OPTIONS) -W320 -H240 -Oview8.png view8.pov

view9.jpg:	view9.png
	convert view9.png -density 300 -units PixelsPerInch view9.jpg

view9.png:	view9.pov view.inc scene.inc common.inc 
	povray $(OPTIONS) -W320 -H240 -Oview9.png view9.pov

uhrvideo.timestamp:	uhrvideo.ini uhrvideo.pov uhr.inc common.inc
	rm -rf uhr
	mkdir uhr
	povray $(OPTIONS) -W1000 -H1000 -Ouhr/uhr uhrvideo.ini
	for f in uhr/*.png;						\
	do								\
		convert $$f -density 300 -units PixelsPerInch		\
			uhr/`basename $$f .png`.jpg;			\
	done
	touch uhrvideo.timestamp




