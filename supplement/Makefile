#
# Makefile to build linear algebra script
#
# (c) 2009 Prof Dr Andreas Mueller
#
all:	supplement.pdf

TEXFILES = einleitung.tex 						\
	vektorraum/vektorraum.tex					\
	endlichekoerper/endlichekoerper.tex 				\
	endlichekoerper/ek-grundlagen.tex 				\
	endlichekoerper/ek-gauss.tex 					\
	endlichekoerper/ek-gruppen.tex 					\
	endlichekoerper/ek-eigenwert.tex 				\
	dualraum/dualbasis.tex						\
	dualraum/dualraum.tex						\
	dualraum/linearform.tex						\
	dualraum/skalarprodukt.tex					\
	dualraum/transposition.tex					\
	dualraum/unendlich.tex						\
	quotient/dualitaet.tex						\
	quotient/loesbarkeit.tex					\
	quotient/quotient.tex						\
	quotient/unterraum.tex						\
	hilbertraum.tex 						\
	homologie/homologie.tex 					\
	homologie/tetraeder.tex 					\
	homologie/beispiele.tex 					\
	lie.tex								\
	nichtstandardanalysis.tex

images:
	cd images; make

supplement.pdf:	supplement.tex $(TEXFILES) supplement.ind 
	pdflatex supplement.tex

supplement.ind:	images supplement.tex $(TEXFILES) images-subdir
	touch supplement.ind
	pdflatex supplement.tex
	makeindex supplement.idx

images-subdir:
	cd images; make

clean:
	rm -f *.synctex.gz *.aux *.idx *.ilg *.ind *.log *.out *.toc *.dvi \
		supplement.pdf 

