#
# aufgabe.m
#
# (c) 2021 Prof Dr Andreas Müller, OST Ostschweizer Fachhochschule
#
c  = [   0;    0; 12 ]
p1 = [  10; -100; 13 ]
p2 = [ -10; -100; 13 ]
t  = [ -20; -100;  8 ];

a3 = t - c;
b3 = a3 / norm(a3);

e3 = [ 0; 0; 1];
a1 = cross(b3, e3);
b1 = a1 / norm(a1);

b2 = cross(b3, b1);
D = zeros(3,3);
D(:,1) = b1;
D(:,2) = b2;
D(:,3) = b3;
D
D = inverse(D)
d = det(D)

F = eye(3);
F(:,4) = -c;

f = 8000;
m = [ 1920/2; 1080/2 ];
K = [
    f, 0, 0;
    0, f, 0;
    0, 0, 1
];
K(1:2,3) = m;
K

P = K * D * F

P1 = p1; P1(4,1) = 1;
P2 = p2; P2(4,1) = 1;
 
B1 = P * P1
B1 = B1 / B1(3,1);
b1 = round(B1(1:2,1))
B2 = P * P2
B2 = B2 / B2(3,1);
b2 = round(B2(1:2,1))

b = [ 666; 148 ]

G = zeros(2,2);
d = b2 - b1
G(:,1) = d;
e = b - b1
G(:,2) = e;
det(G)
det(G) / norm(b2-b1)

