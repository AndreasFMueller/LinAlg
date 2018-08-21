#
# Makefile to build the problem collection
#
# (c) 2013 Prof Dr Andreas Mueller, Hochschule Rapperswil
#
all:	aufgabensammlung.pdf

TEXFILES = aufgabensammlung.tex uebungen.tex \
	1.tex 2.tex 3.tex 4.tex 5.tex 6.tex o.tex

aufgabensammlung.pdf:	$(TEXFILES) aufgabensammlung.ind thema.tex
	pdflatex aufgabensammlung.tex

thema.tex:	thema.tix mkthemaidx
	iconv -f ISO-8859-1 -t UTF-8 thema.tix > thema.tix2
	./mkthemaidx thema.tix2 thema.tex

thema.tix:	$(TEXFILES)
	pdflatex aufgabensammlung.tex

aufgabensammlung.ind:	$(TEXFILES) images
	touch aufgabensammlung.ind
	pdflatex aufgabensammlung.tex
	makeindex aufgabensammlung.idx

mkthemaidx:	mkthemaidx.cpp
	g++ -std=c++11 -Wall -g -O -o mkthemaidx mkthemaidx.cpp

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
		if [ -d $${d} -a -r $${d}/Makefile ]; \
		then \
			echo $${d}; \
			cd $${d}; \
			make || exit 1; \
			cd ../..; \
		fi; \
	done
