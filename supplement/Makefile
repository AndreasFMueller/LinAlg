#
# Makefile to build linear algebra script
#
# (c) 2009 Prof Dr Andreas Mueller
#
all:	supplement.pdf

TEXFILES = einleitung.tex \
	endlichekoerper.tex \
	ek-grundlagen.tex ek-gauss.tex ek-gruppen.tex ek-eigenwert.tex \
	hilbertraum.tex \
	homologie.tex \
	lie.tex	\
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

