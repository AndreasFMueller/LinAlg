#
# Makefile -- Sortierprogramm für Theam-Index bauen
#
mkthemaidx:	mkthemaidx.cpp
	g++ -Wall -g -O -o mkthemaidx mkthemaidx.cpp

test:	mkthemaidx
	./mkthemaidx -d ../aufgaben/thema.tix thema.sorted
