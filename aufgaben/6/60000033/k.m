#
# k.m -- Kontrolle der Lösung für 60000033
#
# (c) 2021 Prof Dr Andreas Müller, OST Ostschweizer Fachhochschule
#
D = [
 -0.44721, -0.89443,  0.00000;
 -0.36515,  0.18257,  0.91287;
 -0.81650,  0.40825, -0.40825
]
f = 2000
c = [ 2; -1; 1 ];
p1 = [ 0; -1; 0 ];
p2 = [ 0;  1; 0 ];
f = 2000;
m = [ 1920/2; 1080/2 ]
K = [
	f, 0, 0;
	0, f, 0;
	0, 0, 1
];
K(1:2,3) = m

F = eye(3);
F(:,4) = -c

P1 = p1; P1(4,1) = 1
P2 = p2; P2(4,1) = 1

B1 = K * D * F * P1
B1 = B1 / B1(3,1);
b1 = round(B1(1:2,1))
B2 = K * D * F * P2
B2 = B2 / B2(3,1);
b2 = round(B2(1:2,1))

F = zeros(2,2);
F(:,1) = b2 - b1;
F(:,2) = m - b1;
Flaecheninhalt = det(F)
abstand = det(F) / norm(b2-b1)
