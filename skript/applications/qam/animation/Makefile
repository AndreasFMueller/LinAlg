#
# Makefile
#
# (c) 2020 Prof Dr Andreas Müller, Hochschule Rapperswil
#
all:	animation.png

sources = parameters.inc signal.inc common.inc scenes.inc

POVRAYOPTIONS = -D +A0.1 -W1920 -H1080
POVRAYOPTIONS = +GD -D +A0.1 -W960 -H540

test.png:	test.pov $(sources)
	povray $(POVRAYOPTIONS) -Otest.png test.pov

video:	animation.pov $(sources)
	rm -rf animation
	mkdir animation
	povray $(POVRAYOPTIONS) +UA -Oanimation/v animation.ini




