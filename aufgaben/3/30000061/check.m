#
# check.m
#
# (c) 2018 Prof Dr Andreas Müller, Hochschule Rapperswil
#
r = [ 1; 1; 1 ]

v1 = [ 2; 3; 5 ]
v2 = cross(r, v1)

a = [ -1; -2; -3 ]
b = a + v1
c = [ -2; 3; -4 ]
d = c + v2
e = [ 12; 9; 1 ]
f = e + 7 * r - 3 * v1 - 2 * v2

# Loesung
b-a
d-c
n = cross(b-a, d-c)
n'*e
n'*n
n'*(f-e)/norm(n)

