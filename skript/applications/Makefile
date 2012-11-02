#
# Makefile -- create the 
#
# (c) 2012 Prof Dr Andreas Mueller, Hochschule Rapperswil
# $Id$
#
all:	kirchhoff signal

KIRCHHOFF_FILES = kirchhoff-1.pdf kirchhoff-2.pdf kirchhoff-3.pdf \
	kirchhoff-4.pdf kirchhoff-5.pdf \
	kirchhoff-6.pdf kirchhoff-7.pdf \
	kirchhoff-8.pdf kirchhoff-9.pdf kirchhoff-10.pdf \
	kirchhoff-11.pdf kirchhoff-12.pdf kirchhoff-13.pdf
kirchhoff:	$(KIRCHHOFF_FILES)
$(KIRCHHOFF_FILES):	kirchhoff.mp Makefile
	TEX=latex mpost kirchhoff.mp
	for i in `seq 1 1 13`; \
	do \
		mptopdf kirchhoff.$${i}; \
		pdf2ps kirchhoff-$${i}.pdf; \
		ps2eps -f kirchhoff-$${i}.ps; \
	done

SIGNAL_FILES = signal-1.pdf signal-2.pdf signal-3.pdf signal-4.pdf
signal: $(SIGNAL_FILES)
$(SIGNAL_FILES):	signal.mp Makefile
	TEX=latex mpost signal.mp
	for i in 1 2 3 4 5; \
	do \
		mptopdf signal.$${i}; \
		pdf2ps signal-$${i}.pdf; \
		ps2eps -f signal-$${i}.ps; \
	done
