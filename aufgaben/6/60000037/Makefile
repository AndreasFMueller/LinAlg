#
# Makefile
#
# (c) 2023 Prof Dr Andreas Müller
#
all:	earth1.pdf earth2.pdf

images:	earth1.jpg verdreht1.jpg earth2.jpg verdreht2.jpg

commonfiles = common.inc koerper.inc drehung1.inc drehung2.inc

earth1.png:	earth1.pov $(commonfiles)
	povray +A0.1 -W1920 -H1080 -Oearth1.png earth1.pov
earth1.jpg:	earth1.png Makefile
	convert -extract 960x960+482+17 earth1.png earth1.jpg

verdreht1.png:	verdreht1.pov $(commonfiles)
	povray +A0.1 -W1920 -H1080 -Overdreht1.png verdreht1.pov
verdreht1.jpg:	verdreht1.png Makefile
	convert -extract 960x960+482+17 verdreht1.png verdreht1.jpg

earth2.png:	earth2.pov $(commonfiles)
	povray +A0.1 -W1920 -H1080 -Oearth2.png earth2.pov
earth2.jpg:	earth2.png Makefile
	convert -extract 960x1000+482+17 earth2.png earth2.jpg

verdreht2.png:	verdreht2.pov $(commonfiles)
	povray +A0.1 -W1920 -H1080 -Overdreht2.png verdreht2.pov
verdreht2.jpg:	verdreht2.png Makefile
	convert -extract 960x1000+482+17 verdreht2.png verdreht2.jpg

drehung1.inc:	drehung1.m
	octave drehung1.m
drehung2.inc:	drehung2.m
	octave drehung2.m

earth1.pdf:	earth1.tex earth1.jpg verdreht1.jpg
	pdflatex earth1.tex
earth2.pdf:	earth2.tex earth2.jpg verdreht2.jpg
	pdflatex earth2.tex
	cp earth2.pdf ../60000038
