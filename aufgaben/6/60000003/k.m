#
# k.m -- Kamerakilibrierung
#
# (c) 2018 Prof Dr Andreas Müller, Hochschule Rapperswil
#
f = 10;
mx = 90;
my = 60;
K = [
	f, 0, mx;
	0, f, my;
	0, 0,  1
];

p1 = [  1;  2; 10 ]
p2 = [ -2; -1; 12 ]

b1 = K * p1;
b1 = round(b1 / b1(3,1))(1:2,1)

b2 = K * p2;
b2 = round(b2 / b2(3,1))(1:2,1)

A = [
    p1(1,1), p1(3,1),       0;
    p1(2,1),       0, p1(3,1);
    p2(1,1), p2(3,1),       0;
    p2(2,1),       0, p2(3,1);
]
c = [
    p1(3,1) * b1(1,1);
    p1(3,1) * b1(2,1);
    p2(3,1) * b2(1,1);
    p2(3,1) * b2(2,1);
]

A'*A
A'*c

A \ c
