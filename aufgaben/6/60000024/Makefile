#
# Makefile
#
# (c) 2020 Prof Dr Andreas Müller, Hochschule Rapperswil
#
all:

images:	jpg

incfiles:	wtf.inc devil.inc

wtf.inc:	wtf.obj obj2mesh2
	bash obj2mesh2 wtf.obj wtf.inc

devil.inc:	devil.obj obj2mesh2
	bash obj2mesh2 devil.obj devil.inc

jpg:	wtf devil

devil:	devil.jpg devil-rotated.jpg

devil.png:	devil.pov devil.inc devil-common.inc
	povray +A0.1 -W1920 -H1080 -Odevil.png devil.pov
devil.jpg:	devil.png Makefile
	convert -extract 1120x1080+400+0 devil.png \
		-density 300 -units PixelsPerInch devil.jpg

devil-rotated.png:	devil-rotated.pov devil.inc devil-common.inc
	povray +A0.1 -W1920 -H1080 -Odevil-rotated.png devil-rotated.pov
devil-rotated.jpg:	devil-rotated.png Makefile
	convert -extract 1120x1080+400+0 devil-rotated.png \
		-density 300 -units PixelsPerInch devil-rotated.jpg

wtf:	wtf.jpg wtf-rotated.jpg
	cp wtf.jpg wtf-rotated.jpg ../60000025

wtf.png:	wtf.pov wtf.inc wtf-common.inc
	povray +A0.1 -W1920 -H1080 -Owtf.png wtf.pov
wtf.jpg:	wtf.png Makefile
	convert -extract 1120x1080+400+0 wtf.png \
		-density 300 -units PixelsPerInch wtf.jpg

wtf-rotated.png:	wtf-rotated.pov wtf.inc wtf-common.inc
	povray +A0.1 -W1920 -H1080 -Owtf-rotated.png wtf-rotated.pov
wtf-rotated.jpg:	wtf-rotated.png Makefile
	convert -extract 1120x1080+400+0 wtf-rotated.png \
		-density 300 -units PixelsPerInch wtf-rotated.jpg

