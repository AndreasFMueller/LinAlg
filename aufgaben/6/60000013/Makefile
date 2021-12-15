#
# Makefile -- build graph for least squares fit
#
# (c) 2015 Prof Dr Andreas Mueller, Hochschule Rapperswil
#
all:

bild = graph-1.pdf

images:	$(bild)

$(bild): graph.mp
	TEX=latex mpost graph.mp
	for f in graph.?; \
	do \
		mptopdf $${f}; \
	done
