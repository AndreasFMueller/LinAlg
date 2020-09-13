#
# det.m
#
# (c) 2020 Prof Dr Andreas Müller, Hochschule Rapperswil
#

A = eye(4)

do
	A = round(20 * (rand(4, 4) - 0.5 * ones(4, 4)));
until (1 == det(A))

A
inverse(A)
det(A)
