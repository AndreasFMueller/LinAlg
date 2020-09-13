#
# find.m
#
# (c) 2020 Prof Dr Andreas Müller, Hochschule Rapperswil
#

l = 30;

found = 0;

do
	a0 = round(l * (rand(3,1) - 0.5 * ones(3,1)));
	a1 = round(l * (rand(3,1) - 0.5 * ones(3,1)));
	na0 = norm(a0);
	if (na0 == 0) 
		continue;
	endif
	if (abs(na0 - round(na0)) > 0.001)
		continue;
	else
		a0 = a0 / gcd(num2cell(a0){:});
	endif
	na1 = norm(a1);
	if (na1 == 0)
		continue;
	endif
	if (abs(na1 - round(na1)) > 0.001)
		continue;
	else
		a1 = a1 / gcd(num2cell(a1){:});
	endif
	s = a0' * a1;
	if (abs(s) > 0.001)
		continue;
	else
		a0
		a1
		norm(a0)
		norm(a1)
		a2 = cross(a0,a1)
		a3 = cross(a0,a2)
		a4 = cross(a0,a3)
		a5 = cross(a0,a4)
	endif
	found = found + 1
until (found > 20)

