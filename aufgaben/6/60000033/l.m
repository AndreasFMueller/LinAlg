#
# l.m -- 
#
# (c) 2021 Prof Dr Andreas Müller, OST Ostschweizer Fachhochschule
#

c = [ 2; -1; 1 ];

t = [ 0; 0; 0 ];

q0 = [ 0; 0; 0; 1 ];
q1 = [ 0; -1; 0 ]; q1(4,1) = 1;
q2 = [ 0;  1; 0 ]; q2(4,1) = 1;

a3 = t - c;
b3 = a3 / norm(a3);

e3 = [ 0; 0; 1 ];
a1 = cross(e3, b3);
b1 = a1 / norm(a1);

b2 = cross(b3, b1);

D = zeros(3,3);
D(:,1) = b1;
D(:,2) = b2;
D(:,3) = b3;
d = det(D)

F = eye(3);
F(:, 4) = -c;
F;

f = 2000;
K = [
	f, 0, 1920/2;
	0, f, 1080/2;
	0, 0, 1
];

inverse(D)
P = K * inverse(D) * F

q0
B0 = P*q0
B0 = B0 / B0(3,1)

q1
B1 = P*q1
B1 = B1 / B1(3,1)

q2
B2 = P*q2
B2 = B2 / B2(3,1)

b1 = round(B1(1:2,1))
b2 = round(B2(1:2,1))

b = b2 - b1
m = [ 1920/2; 1080/2 ];
e = m - b1
F = zeros(2,2);
F(:,1) = b;
F(:,2) = e;
det(F)
norm(b)

abstand = det(F) / norm(b)
