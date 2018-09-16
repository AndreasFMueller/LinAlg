#
# solve.m -- Loesung der Aufgabe 40000018
#
# (c) 2018 Prof Dr Andreas Müller, Hochschule Rapperswil
#

A = [
	1,  0,    0;
	1, 10,  100;
	1, 20,  400;
	1, 30,  900;
	1, 40, 1600;
];

b = [
	1.30;
	2.24;
	3.21;
	4.02;
	5.05;
];

A'*A

A'*b

A \ b
