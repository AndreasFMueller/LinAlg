#
# Makefile to build linear algebra script
#
# (c) 2009 Prof Dr Andreas Mueller
#
all:	skript.pdf checklist.pdf

TEXFILES = determinanten.tex eigen.tex linsys.tex 			\
	1/chapter.tex							\
	1/gauss.tex							\
	1//glsysteme.tex						\
	1/homin.tex							\
	1/inverse.tex							\
	1/linabh.tex							\
	1/loesungsmenge.tex						\
	1/matrizen.tex							\
	1/rechenaufwand.tex						\
	1/simultan.tex							\
	2/chapter.tex							\
	2/begriff.tex							\
	2/berechnung.tex						\
	2/eindeutigkeit.tex						\
	2/entwicklungssatz.tex						\
	2/inverse.tex							\
	2/kramer.tex							\
	2/produktformel.tex						\
	8/chapter.tex							\
	8/beispiel.tex							\
	8/char.tex							\
	8/diagonal.tex							\
	8/numerisch.tex							\
	8/problem.tex							\
	vektorgeometrie.tex \
	einleitung.tex geometrie.tex zerlegung.tex \
	applications/hauptachse.tex \
	applications/kirchhoff.tex \
	applications/sniping.tex \
	applications/spanning.tex \
	applications/fitting.tex \
	applications/traegheit.tex \
	applications/wavelets.tex \
	applications/google.tex

images:
	cd images; make

skript.pdf:	skript.tex $(TEXFILES) skript.ind 
	pdflatex skript.tex

skript.ind:	images skript.tex $(TEXFILES) images-subdir
	touch skript.ind
	pdflatex skript.tex
	makeindex skript.idx

images-subdir:
	cd images; make

clean:
	rm -f *.synctex.gz *.aux *.idx *.ilg *.ind *.log *.out *.toc *.dvi \
		skript.pdf checklist.pdf

checklist.pdf:	checklist.tex
	pdflatex checklist.tex
