#
# loesung.m -- Losung der Aufgabe 60000028
#
# (c) 2020 Prof Dr Andreas Müller, Hochschule Rapperswil
#
d = 1000;
Venus = [
   0.2791451;
   0.6649495;
  -0.0071054
];
Venus = round(d * Venus) / d
Uranus = [
   20.02283;
    1.41626;
   -0.25430
];
Uranus = round(d * Uranus) / d
Earth = [
  -0.7651496374;
   0.6229320851;
  -0.0000013872
];
Earth = round(d * 10 * Earth) / (10 * d)

D = [
  -0.03823   0.99927   0.00000
   0.01195   0.00046   0.99993
   0.99920   0.03823  -0.01196
];
d = 1000;
D = round(d * D) / d
D * D'

f = 50000
w = 3600
h = 2400
K = [
	f, 0, w/2;
	0, f, h/2;
	0, 0,  1
]

P = K * D * [ eye(3), -Earth ]

Venus_tilde = P * [ Venus; 1 ]
Venus_b = Venus_tilde(1:2,1) / Venus_tilde(3,1)

Uranus_tilde = P * [ Uranus; 1 ]
Uranus_b = Uranus_tilde(1:2,1) / Uranus_tilde(3,1)

d = Venus_b - Uranus_b
norm(d)
norm(d) / f
delta = atand(norm(d) / f)

