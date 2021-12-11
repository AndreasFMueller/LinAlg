#
# loesung.m -- Losung der Aufgabe 60000028
#
# (c) 2020 Prof Dr Andreas Müller, Hochschule Rapperswil
#
Jupiter = [
   3.001;
  -4.122;
  -0.049
]
Saturn = [
   5.488;
  -8.345;
  -0.071
]
Earth = [
  -0.0057;
   0.9836;
   0.0000
]

D = [
   0.7480707,  0.4363523,  0.4999869;
  -0.4276592, -0.2591271,  0.8660027;
   0.5074425, -0.8616553, -0.0072353
];
d = 10000;
D = round(d * D) / d
D * D'

f = 100000
w = 3600
h = 2400
K = [
	f, 0, w/2;
	0, f, h/2;
	0, 0,  1
]

P = K * D * [ eye(3), -Earth ]

Jupiter_tilde = P * [ Jupiter; 1 ]
Jupiter_b = Jupiter_tilde(1:2,1) / Jupiter_tilde(3,1)

Saturn_tilde = P * [ Saturn; 1 ]
Saturn_b = Saturn_tilde(1:2,1) / Saturn_tilde(3,1)

d = Jupiter_b - Saturn_b
norm(d)
delta = atand(norm(d) / f)

