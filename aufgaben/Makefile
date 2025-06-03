#
# Makefile to build the problem collection
#
# (c) 2013 Prof Dr Andreas Mueller, Hochschule Rapperswil
#
all:
	@echo choose test, sammlung or 'woche(0?|1?)'

test:	test.pdf

sammlung:	aufgabensammlung.pdf

makeindex = makeindex
pdflatex = pdflatex --output-directory=$(workdir)
bibtex = bibtex
touch = touch

TEXFILES = aufgabensammlung.tex						\
	macros/uebungen.tex						\
	macros/packages.tex						\
	macros/front.tex						\
	macros/vorwort.tex						\
	macros/content.tex						\
	$(workdir)/1.tex						\
	$(workdir)/2.tex						\
	$(workdir)/3.tex						\
	$(workdir)/4.tex						\
	$(workdir)/5.tex						\
	$(workdir)/6.tex						\
	$(workdir)/7.tex						\
	$(workdir)/8.tex						\
	$(workdir)/o.tex

topdir := ${PWD}
workdir := work

aufgabensammlung.pdf:	$(workdir)/aufgabensammlung.pdf
	cp $(workdir)/aufgabensammlung.pdf .

$(workdir)/aufgabensammlung.pdf:	$(workdir) $(TEXFILES) \
	$(workdir)/aufgabensammlung.ind $(workdir)/thema.tex gausslabels.tex
	$(pdflatex) aufgabensammlung.tex

$(workdir)/aufgabensammlung.ind: $(workdir) $(workdir)/aufgabensammlung.idx
	cd $(workdir) ; $(makeindex) aufgabensammlung.idx

$(workdir)/aufgabensammlung.idx:	$(workdir) $(TEXFILES) \
	aufgabensammlung.tex
	$(touch) $(workdir)/aufgabensammlung.ind
	$(pdflatex) aufgabensammlung.tex

gausslabels.tex:
	curl --output gausslabels.tex https://linalg.ch/gauss/tableau.php

$(workdir)/thema.tex:	$(workdir)/thema.tix mkthemaidx
	cd $(workdir) ; ../mkthemaidx thema.tix thema.tex

$(workdir)/thema.tix:	$(TEXFILES)
	$(pdflatex) aufgabensammlung.tex

mkthemaidx:	mkthemaidx.cpp
	g++ -std=c++11 -Wall -g -O -o mkthemaidx mkthemaidx.cpp

clean:
	rm -f *.dvi *.log ?.tex aufgabensammlung.pdf

$(workdir)/1.tex:	buildchapter.sh 1/*.tex
	./buildchapter.sh 1 > $(workdir)/1.tex

$(workdir)/2.tex:	buildchapter.sh 2/*.tex
	./buildchapter.sh 2 > $(workdir)/2.tex

$(workdir)/3.tex:	buildchapter.sh 3/*.tex
	./buildchapter.sh 3 > $(workdir)/3.tex

$(workdir)/4.tex:	buildchapter.sh 4/*.tex
	./buildchapter.sh 4 > $(workdir)/4.tex

$(workdir)/5.tex:	buildchapter.sh 5/*.tex
	./buildchapter.sh 5 > $(workdir)/5.tex

$(workdir)/6.tex:	buildchapter.sh 6/*.tex
	./buildchapter.sh 6 > $(workdir)/6.tex

$(workdir)/7.tex:	buildchapter.sh 7/*.tex
	./buildchapter.sh 7 > $(workdir)/7.tex

$(workdir)/8.tex:	buildchapter.sh 8/*.tex
	./buildchapter.sh 8 > $(workdir)/8.tex

$(workdir)/o.tex:	buildchapter.sh o/*.tex
	./buildchapter.sh o > $(workdir)/o.tex

wochen:	woche01 woche02 woche03 woche04 woche05 woche06 woche07 woche08	\
	woche09 woche10 woche11 woche12 woche13 woche14

woche01:	woche01.pdf
woche01.pdf:	$(workdir) $(TEXFILES) woche01.tex
	$(pdflatex) woche01.tex
	cp $(workdir)/woche01.pdf .

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

test.pdf:	test.tex testaufgabe.tex $(TEXFILES)
	pdflatex test.tex

