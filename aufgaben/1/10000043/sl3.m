#
# sl3.m -- find element of SL(3,Z)
#
# (c) 2016 Prof Dr Andreas Mueller, Hochschule Rapperswil
#
P = [ 1,0,0;0,1,0;0,0,0 ];
d = 0;
do 
	A = round(20 * rand(3,3) - 10 * ones(3,3));
	d = det(A);
until (d == 1)

A
inverse(A)
det(A)

B = A * P * inverse(A)

B*B
