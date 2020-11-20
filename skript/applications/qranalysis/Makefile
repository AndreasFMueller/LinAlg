#
# Makefile
#
# (c) 2020 Prof Dr Andreas Müller, Hochschule Rapperswil
#
all:	aqr-factored.png aqr-direct.png

aqr.png: aqr.pov
	povray +A0.1 -Oaqr.png -W1920 -H1080 aqr.pov

aqr-factored.png:	aqr-factored.pov aqr-common.inc 3dzerlegung.m
	povray +A0.1 -Oaqr-factored.png -W1920 -H1080 aqr-factored.pov
	
aqr-direct.png:	aqr-direct.pov aqr-common.inc 3dzerlegung.m
	povray +A0.1 -Oaqr-direct.png -W1920 -H1080 aqr-direct.pov

.PHONY:	a b qr
	
a:	a.ini aqr-direct.pov aqr-common.inc 3dzerlegung.m
	povray +A0.1 -Oa/a.png -W1920 -H1080 a.ini
	
b:	b.ini aqr-r.pov aqr-common.inc 3dzerlegung.m
	povray +A0.1 -Ob/b.png -W1920 -H1080 b.ini
	
qr:	qr.ini aqr-factored.pov aqr-common.inc 3dzerlegung.m
	povray +A0.1 -Oqr/qr.png -W1920 -H1080 qr.ini

aqr-video.pdf:  aqr-video.tex
	pdflatex aqr-video.tex

aqr-slides:     aqr-video.pdf
	for i in `seq 1 1 14`;						\
	do                                                              \
		pdfjam --outfile slide.pdf --papersize '{16cm,9cm}'     \
			aqr-video.pdf $${i};                            \
		convert -density 300 slide.pdf -resize 1920x1080        \
			-units PixelsperInch -colorspace rgb		\
			-type truecolor					\
			aqr-slide-$${i}.png;       			\
		convert aqr-slide-$${i}.png +dither -monochrome 	\
			-posterize 2 -negate aqr-mask-$${i}.png;	\
		convert aqr-slide-$${i}.png 				\
			-alpha Off aqr-mask-$${i}.png			\
			-compose CopyOpacity 				\
			-composite aqr-transparent-$${i}.png;		\
	done

