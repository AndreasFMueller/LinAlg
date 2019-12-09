#
# a50.m -- Berechnungen zur Aufgabe 40000050
#
# (c) 2017 Prof Dr Andreas Müller, Hochschule Rapperswil
#
source("kamerageometrie.m")

c = [ 300; 100;   0 ];
q0 = [ -100; 800; 100 ];

format long

D = drehmatrix(q0 - c, 0)'
K
round(1000000*D)/1000000

round(1000000*K*D)/1000000

inverse(K*D)

P = projectionmatrix(D, c)
P * harmonize(q0)
project(P, q0)

q1 = [ 100; 600; -5 ]
q2 = [ -70; 550; 33 ]

P * harmonize(q1)
b1 = project(P, q1)
b2 = project(P, q2)

r2 = richtungsvektor(D, b2)

cross(r2, q2-c)
