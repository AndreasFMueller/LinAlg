#
# flaeche.m
#
# (c) 2018 Prof Dr Andreas Müller, Hochschule Rapperswil
#
v = [ 0.3; 3 ];
u1 = [ 2.5; -0.5 ];
u2 = [ 1.5; 2 ];

u = u1 + u2

r = [ 3; -0.3 ];
r = r / norm(r)

lambda = r' * u

lambda * r

