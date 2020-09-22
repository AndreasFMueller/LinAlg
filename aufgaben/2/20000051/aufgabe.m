#
# aufgabe.m
#
# (c) 2020 Prof Dr Andreas Müller, Hochschule Rapperswil
#
n = 4
A = eye(n)
found = 0;

do
	A = round(20 * (rand(n,n) - 0.5 * ones(n,n)));
	A(3,3) = 0;
	A(3,4) = 0;
	if (det(A) == 2020) 
		A
		found = 1
	endif
until (found > 0)
