#
# Makefile to build the problem collection
#
# (c) 2013 Prof Dr Andreas Mueller, Hochschule Rapperswil
# $Id$
#
all:	aufgabensammlung.pdf

TEXFILES = aufgabensammlung.tex uebungen.tex \
	1.tex 2.tex 3.tex 4.tex 5.tex 6.tex o.tex

aufgabensammlung.pdf:	$(TEXFILES) aufgabensammlung.ind
	pdflatex aufgabensammlung.tex uebungen.tex

aufgabensammlung.ind:	$(TEXFILES) images
	touch aufgabensammlung.ind
	pdflatex aufgabensammlung.tex
	makeindex aufgabensammlung.idx

clean:
	rm -f *.dvi *.log ?.tex aufgabensammlung.pdf

1.tex:	buildchapter.sh 1/*.tex
	./buildchapter.sh 1 > 1.tex

2.tex:	buildchapter.sh 2/*.tex
	./buildchapter.sh 2 > 2.tex

3.tex:	buildchapter.sh 3/*.tex
	./buildchapter.sh 3 > 3.tex

4.tex:	buildchapter.sh 4/*.tex
	./buildchapter.sh 4 > 4.tex

5.tex:	buildchapter.sh 5/*.tex
	./buildchapter.sh 5 > 5.tex

6.tex:	buildchapter.sh 6/*.tex
	./buildchapter.sh 6 > 6.tex

o.tex:	buildchapter.sh o/*.tex
	./buildchapter.sh o > o.tex

images:
	for d in ?/*; \
	do \
		if test -d $${d}; \
		then \
			echo $${d}; \
			cd $${d}; \
			if [ -r Makefile ]; \
			then \
				make; \
			fi; \
			cd ../..; \
		fi; \
	done
