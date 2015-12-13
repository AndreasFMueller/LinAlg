#
# Makefile -- build image of the solution of u^3+v^3-3uv+1=0
#
# (c) 2015 Prof Dr Andreas Mueller, Hochschule Rapperswil
#
all:	kubisch-1.pdf cubic.jpg

kubisch-1.pdf:	kubisch.mp
	TEX=latex mpost kubisch.mp
	mptopdf kubisch.1

cubic.png:	cubic.pov
	if type povray; \
	then \
		povray -A0.1 -R20 -W3840 -H2160 cubic.pov; \
	else \
		touch cubic.png; \
	fi

cubic.jpg:	cubic.png
	if test 0 -eq `wc --bytes cubic.png` \
	then \
		:; \
	else \
		convert -extract 2136x1824+1008+102 cubic.png -resize 50% \
			-density 300 -units PixelsPerInch cubic.jpg; \
	fi


