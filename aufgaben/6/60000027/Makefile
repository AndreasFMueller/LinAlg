#
# Makefile
#
# (c) 2020 Prof Dr Andreas Müller, Hochschule Rapperswil
#
all:	graph.pdf vergleich.pdf

paths.tex:	resonanz.m
	octave resonanz.m

graph.pdf:	graph.tex paths.tex
	pdflatex graph.tex

vergleich.pdf:	vergleich.tex paths.tex
	pdflatex vergleich.tex
