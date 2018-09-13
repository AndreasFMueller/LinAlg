#
# check.m
#
# (c) 2018 Prof Dr Andreas Müller, Hochschule Rapperswil
#
B1 = [
  1, 1/2,       0;
  0, sqrt(3)/2, 0;
  0, 0,         1
]
B2 = [
  0,         0, 1;
  sqrt(3)/2, 0, 0;
  1/2,       1, 0
]
inverse(B1)
R=B2*inverse(B1)

det(R)
R'*R

acosd((trace(R) - 1) / 2)
