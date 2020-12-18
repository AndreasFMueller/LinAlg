#
# Makefile -- create the audio file for mathman
#
# (c) 2020 Prof Dr Andreas Müller, Hochschule Rapperswil
#
all:	mathman constellation

CXXFLAGS = -std=c++11 -g -O2 -Wall

path.o:	path.h path.cpp
	g++ -o path.o $(CXXFLAGS) -c path.cpp

logo.o:	logo.h logo.cpp path.h
	g++ -o logo.o $(CXXFLAGS) -c logo.cpp

au.o:	au.h au.cpp path.h
	g++ -o au.o $(CXXFLAGS) -c au.cpp

raw.o:	raw.h raw.cpp path.h
	g++ -o raw.o $(CXXFLAGS) -c raw.cpp

tikz.o:	tikz.h tikz.cpp path.h
	g++ -o tikz.o $(CXXFLAGS) -c tikz.cpp

text.o:	text.h text.cpp path.h
	g++ -o text.o $(CXXFLAGS) -c text.cpp

hackfile.o:	hackfile.h hackfile.cpp path.h
	g++ -o hackfile.o $(CXXFLAGS) -c hackfile.cpp

libmathman.a:	path.o logo.o au.o tikz.o text.o raw.o hackfile.o
	ar -r libmathman.a path.o logo.o au.o tikz.o text.o raw.o hackfile.o

mathman:	mathman.cpp libmathman.a
	g++ -o mathman $(CXXFLAGS) -L. -lmathman mathman.cpp


test:	mathman
	./mathman -s 10 -t tikz.tex
	pdflatex mathman.tex

audio:	mathman
	./mathman --velocity=7 --sampling=44100 --scale=32000 \
		--repeat=1000 --raw=mathman.pcm

atest:	mathman
	./mathman -s 32000 -a test.au

constellation:	constellation.cpp
	g++ -o constellation $(CXXFLAGS) -L. -lmathman constellation.cpp


ctest:	constellation
	./constellation --au=constellation.au --scale=250 --samples=8000 --time=100

hackfiles:	mathman.hack constellation.hack

mathman.hack:	mathman Makefile
	./mathman --velocity=1 --sampling=44100 --scale=32000		\
		--repeat=1000 --hackfile=mathman.hack

constellation.hack:	constellation Makefile
	./constellation --scale=250 --samples=8000 --time=100		\
		--repeat=10 \
		--hackfile=constellation.hack
