#
# a50.m -- Berechnungen zur Aufgabe 40000050
#
# (c) 2017 Prof Dr Andreas Müller, Hochschule Rapperswil
#
source("kamerageometrie.m")

c1 = [ 100;   0;   0 ];
c2 = [   0; 100;   0 ];

q0 = [ 0; 0; 0 ];

D1 = drehmatrix(q0 - c1, 0)'
P1 = projectionmatrix(D1, c1)

D2 = drehmatrix(q0 - c2, -pi/2)'
P2 = projectionmatrix(D2, c2)

q = [ 10; 20; -5 ]

b1 = project(P1, q)
b2 = project(P2, q)

b1 = [ 37.778; 39.444 ];
b2 = [ 66.250; 57.500 ];

r1 = richtungsvektor(D1, b1)
r2 = richtungsvektor(D2, b2)

A = zeros(6,5);
b = zeros(6,1);
A(1:3,1:3) = eye(3,3);
A(1:3,4) = -r1;
A(4:6,1:3) = eye(3,3);
A(4:6,5) = -r2;

b(1:3,1) = c1;
b(4:6,1) = c2;

A
b
A \ b

