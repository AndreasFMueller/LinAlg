#
# randoperator.m -- Berechnet die Randmatrix aus einer Polyeder-Beschreibung
#
# (c) 2014 Prof Dr Andreas Mueller, Hochschule Rapperswil
#

function d = rand(kanten)
	eckenzahl = max(max(kanten));
	kantenzahl = size(kanten)(1);
	d = zeros(eckenzahl, kantenzahl);
	for k = 1 : kantenzahl
		d(kanten(k, 1), k) = -1;
		d(kanten(k, 2), k) = 1;
	endfor
endfunction

function z = zyklen(d) 
	kantenzahl = size(d)(2)
	anzahlberechnet = rank(d)
	zyklenzahl = kantenzahl - anzahlberechnet
	z = zeros(zyklenzahl, size(d)(1));
	r = rref(d)
	berechnet = zeros(anzahlberechnet, 1);
	for i = 1 : anzahlberechnet
		b = 1;
		while (r(i, b) == 0)
			b = b + 1;
		endwhile
		berechnet(i) = b;
	endfor
	waehlbar = setdiff((1:size(d)(2))', berechnet);
	for zyklus = 1 : zyklenzahl
		z(zyklus, waehlbar(zyklus)) = 1;
		for i = 1 : anzahlberechnet
			z(zyklus, berechnet(i)) = r(i, waehlbar(zyklus));
		endfor
	endfor
endfunction

function [A, b] = kirchhoff(z, R, d)
	r = z * R;
	A = zeros(size(r)(2));
	for row = 1 : size(r)(1)
		for column = 1 : size(r)(2)
			A(row, column) = r(row, column);
		endfor
	endfor
	for row = size(r)(1) + 1 : size(r)(2)
		for column = 1 : size(r)(2)
			A(row, column) = d(row - size(r)(1), column);
		endfor
	endfor
	b = zeros(size(r)(2), 1);
	b(size(z)(1)) = 1;
	b = R * b;
endfunction
