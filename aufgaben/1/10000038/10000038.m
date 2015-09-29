#
# 10000038.m -- Generator fuer 
#
# (c) 2015 Prof Dr Andreas Mueller, Hochschule Rapperswil
#

gleichungen = 4;
variable = 7;
zahlenbereich = 9;


waehlbar = variable - gleichungen;
m = 2 * zahlenbereich + 1;

# lege die frei waehlbaren Variablen fest
do 
	varperm = randperm(variable);
	wv = sort(varperm(1:waehlbar));
	dv = sort(varperm((waehlbar + 1):variable));
until dv(1) == 1;
printf("frei waehlbar: ")
wv

iterationen = 0;

do
	iterationen += 1;

	# Bestimme zufaellig die Gauss-Operationen.
	# Die Matrix B1 ist eine untere Dreiecksmatrix, die die Gaussoperationen bei
	# der Vorwaerstreduktion enthaelt. Es muss sichergestellt werden, dass B1
	# vollen Rang hat
	do 
		B1 = tril(round(m * rand(gleichungen) - zahlenbereich), 0);
	until (rank(B1) == gleichungen);

	# Die Matrix B2 ist eine obere Dreiecksmatrix mit Einsen auf der Diagonalen,
	# sie beschreibt die Gauss-Operationen beim Rueckwaertseinsetzen
	B2 = (tril(round(m * rand(gleichungen) - zahlenbereich), -1) + eye(gleichungen))';

	# Hilfsfunktion, mit der eine ganze Zufallszahl im Interval
	# [-zahlenbereich, zahlenbereich] erzeugt werden kann
	function retval = r(m) 
		retval = round((2 * m + 1) * rand(1)) - m;
	end;

	# Erzeuge das Schlusstableau
	C = zeros(gleichungen, variable + 1);

	# Fuelle die Pivot-Einsen ein
	for i = 1:gleichungen
		C(i, dv(i)) = 1;
	end;

	# Fuelle die *-Elemente fuer die frei waehlbaren Variablen
	for i = 1:waehlbar
		for j = 1:i
			C(j, wv(i)) = r(zahlenbereich);
		end;
	end;
	# Fuelle die *-Elemente fuer die rechte Seite
	for j = 1:gleichungen
		C(j, variable + 1) = r(zahlenbereich);
	end;

	D = B1 * B2 * C;

	# Wiederholen, bis wir eine Matrix erhalten, wo auch die rref-Funktione
	# das gleiche Resultat zurueckliefert (versursacht durch moegleiche
	# Zeilenumformungen?)

until norm(rref(D) - C) < 0.00001;

iterationen

D

C

# Kontrolle
#rref(D)
