#
# Makefile -- build plan for least squares fit
#
# (c) 2015 Prof Dr Andreas Mueller, Hochschule Rapperswil
#
all:

bild = plan-1.pdf

images:	$(bild)

$(bild): plan.mp
	TEX=latex mpost plan.mp
	for f in plan.?; \
	do \
		mptopdf $${f}; \
	done
