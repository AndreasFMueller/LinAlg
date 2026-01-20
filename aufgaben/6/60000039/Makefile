#
# Makefile -- create images of Shamizen
#
# (c) 2023 Prof Dr Andreas Müller
#
all:	shamizen.pdf

images:	liegend.jpg spielend.jpg

shamizen.mesh:	shamizen.obj obj2mesh2
	bash obj2mesh2 shamizen.obj shamizen.mesh

commonfiles = shamizen.mesh common.inc

liegend.png:	liegend.pov $(commonfiles)
	povray +A0.1 -W1920 -H1080 -Oliegend.png liegend.pov
liegend.jpg:	liegend.png Makefile
	convert -extract 1350x1080+344+0 liegend.png liegend.jpg
spielend.png:	spielend.pov $(commonfiles)
	povray +A0.1 -W1920 -H1080 -Ospielend.png spielend.pov
spielend.jpg:	spielend.png Makefile
	convert -extract 1350x1080+344+0 spielend.png spielend.jpg

shamizen.pdf:	shamizen.tex liegend.jpg spielend.jpg
	pdflatex shamizen.tex
