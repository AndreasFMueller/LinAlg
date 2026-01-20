#
# Makefile -- generiere EV Aufgaben
#
# (c) 2023 Prof Dr Andreas Müller
#
ev = ev2024.tex ev2025.tex ev2026.tex ev2027.tex

all:	$(ev)

$(ev):	l.m
	octave l.m

install:	$(ev)
	cp ev2024.tex ../80000042.tex
	cp ev2025.tex ../80000043.tex
	cp ev2026.tex ../80000044.tex
	cp ev2027.tex ../80000045.tex
