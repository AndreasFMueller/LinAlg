#
# Makefile to build linear algebra script
#
# (c) 2009 Prof Dr Andreas Mueller
#
all:	skript.pdf

install:	install-skript

TEXFILES = determinanten.tex eigen.tex lingl.tex \
	linsys.tex vektoren.tex vektorgeometrie.tex \
	einleitung.tex geometrie.tex zerlegung.tex \
	applications/hauptachse.tex \
	applications/kirchhoff.tex \
	applications/sniping.tex \
	applications/spanning.tex \
	applications/fitting.tex \
	applications/traegheit.tex \
	applications/wavelets.tex \
	applications/google.tex

skript.pdf:	skript.tex $(TEXFILES) skript.ind
	pdflatex skript.tex

skript.ind:	images skript.tex $(TEXFILES)
	touch skript.ind
	pdflatex skript.tex
	makeindex skript.idx

images:
	cd images; make

clean:
	rm -f skript.dvi skript.pdf


