#
# Makefile to build linear algebra script
#
# (c) 2009 Prof Dr Andreas Mueller
#
all:	skript.pdf checklist.pdf

TEXFILES = linsys.tex 							\
	einleitung.tex 							\
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
	2/entwicklungssatzneu.tex					\
	2/inverse.tex							\
	2/kramer.tex							\
	2/produktformel.tex						\
	3/chapter.tex							\
	3/koordinaten.tex						\
	3/abbildungen.tex						\
	3/ebene.tex							\
	3/gerade.tex							\
	4/chapter.tex							\
	4/kreis.tex							\
	4/skalar.tex							\
	4/skalarprodukt.tex						\
	4/ueberbestimmt.tex						\
	4/abbildungen.tex						\
	5/chapter.tex							\
	5/orientierung.tex						\
	5/vektorprodukt.tex						\
	5/abbildungen.tex						\
	6/chapter.tex							\
	7/chapter.tex							\
	7/cholesky.tex							\
	7/dreieck.tex							\
	7/lr.tex							\
	7/qr.tex							\
	7/svd.tex							\
	8/chapter.tex							\
	8/beispiele.tex							\
	8/char.tex							\
	8/diagonal.tex							\
	8/numerisch.tex							\
	8/problem.tex							\
	applications/hauptachse.tex					\
	applications/kirchhoff.tex					\
	applications/sniping.tex					\
	applications/spanning.tex					\
	applications/fitting.tex					\
	applications/traegheit.tex					\
	applications/wavelets.tex					\
	applications/google.tex						\
	applications/kamera.tex						\
	applications/kamera/brennweite.tex				\
	applications/kamera/drehung.tex					\
	applications/kamera/funktion.tex				\
	applications/kamera/homogen.tex					\
	applications/kamera/kamera.tex					\
	applications/kamera/kmatrix.tex					\
	applications/kamera/strahlensatz.tex				\
	applications/matrixoptik.tex					\
	applications/matrixoptik/brechungsgesetz.tex			\
	applications/matrixoptik/transfer.tex				\
	applications/matrixoptik/linse.tex				\
	applications/matrixoptik/achromat.tex				\
	applications/qam.tex						\
	applications/qam/amplitudenmodulation.tex			\
	applications/qam/zweidimensional.tex				\
	applications/qam/modulation.tex					\
	applications/qam/demodulation.tex				\
	applications/qam/beispiele.tex

images:
	cd images; make

skript.pdf:	skript.tex $(TEXFILES) skript.ind 
	pdflatex skript.tex

skript.ind:	images skript.tex $(TEXFILES)
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

sdr.pdf:	skript.pdf Makefile
	pdfjam --outfile sdr.pdf skript.pdf 223-240
