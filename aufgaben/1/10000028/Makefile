#
# Makefile -- build Morley triangle image
#
# (c) 2015 Prof Dr Andreas Mueller, Hochschule Rapperswil
#
all:

images:	octahedron-1.pdf

octahedron-1.pdf:	octahedron.mp
	TEX=latex mpost octahedron.mp
	for f in octahedron.[0-9]; \
	do \
		mptopdf $${f}; \
	done
