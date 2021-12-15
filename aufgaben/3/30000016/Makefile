#
# Makefile -- build bary for least squares fit
#
# (c) 2015 Prof Dr Andreas Mueller, Hochschule Rapperswil
#
all:

bild = bary-1.pdf bary-2.pdf

images:	$(bild)

$(bild): bary.mp
	TEX=latex mpost bary.mp
	for f in bary.?; \
	do \
		mptopdf $${f}; \
	done
